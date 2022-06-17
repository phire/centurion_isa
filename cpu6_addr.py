from cpu6_regs import Reg8Ref, Reg16Ref, PostIncRef, PreDecRef, Ref
from cpu6_ops import *

class DirectRef(Ref):
    def __init__(self, addr, pc):
        self.addr = LiteralRef(addr, 2, pc)

    def getValue(self, memory, **kwargs):
        return self.addr.getValue(memory)

    def to_string(self, memory, **kwargs):
        if label := memory.get_label(self.addr):
            return f"[{label}|{self.addr:#06x}]"
        return f"[{self.addr.to_string(memory, forceLabel=True)}]"

    def getNode(self, cpu):
        return cpu.getMem(self.addr.getNode(cpu))

class ComplexRef(Ref):
    def __init__(self, base, index=None, disp=None):
        self.base = base
        if isinstance(base, DirectRef): # unwrap
            self.base = base.addr
        self.index = index
        self.disp = disp

    def to_string(self, memory, **kwargs):
        ret = f"[{self.base.to_string(memory, forceLabel=True)}"
        if self.disp:
            return f"{ret} + {self.disp.to_string(memory)}]"
        return ret + "]"

    def getNode(self, cpu):
        node = self.base.getNode(cpu)
        if self.index:
            node = node.Add(self.index)
        if self.disp:
            node = node.Add(self.disp)
        return cpu.getMem(node)

class LiteralRef(Ref):
    def __init__(self, val, size, pc=None):
        self.val = val
        self.size = size
        self.pc = pc

    def to_string(self, memory, **kwargs):
        # Only label literals if they have been fixed up (or forced)
        if (self.pc and memory.is_fixup(self.pc)) or "forceLabel" in kwargs:
            if label := memory.get_label(self.val):
                if "supressAlt" in kwargs:
                    return label
                return f"{label}|{self.val:#0{self.size*2+2}x}"
        return f"{self.val:#0{self.size*2+2}x}"

    def getValue(self, memory, **kwargs):
        return self.val

    def getNode(self, cpu):
        if self.pc:
            return cpu.readMem(LiteralValue(self.pc, 16), self.size * 8)
        return LiteralValue(self.val, self.size * 8)

class SmallLiteralRef(Ref):
    def __init__(self, val):
        self.val = val

    def __str__(self):
        return f"#{self.val:d}"

    def getNode(self, cpu):
        return LiteralValue(self.val, 4)

class PcDisplacementRef(Ref):
    def __init__(self, pc, disp):
        self.pc = pc
        self.disp = disp
        self.ref = LiteralRef(pc + disp, 2)

    def __str__(self):
        return f"[pc + {self.disp:#04x}]"

    def getValue(self, memory):
        return self.pc + self.disp

    def to_string(self, memory, **kwargs):
        return f"[{self.ref.to_string(memory, forceLabel=True)}|{self.disp:+#04x}]"

    def getNode(self, cpu):
        return cpu.getMem(LiteralValue(self.pc, 16), self.size * 8)

class IndirectRef(Ref):
    def __init__(self, ref):
        self.ref = ref

    def __str__(self):
        return f"@{self.ref}"

    def to_string(self, memory, **kwargs):
        return f"@{self.ref.to_string(memory, **kwargs)}"

    def getNode(self, cpu):
        return cpu.getMem(self.ref)

# A short 2bit address mode, which will consume more bytes from PC
def Cpu6AddrMode(mode, pc, mem, prev=None, size = 1):
    match mode:
        case 0: # direct
            ref = DirectRef(mem.get_be16(pc), pc)
            pc += 2
            return ref, pc
        case 1: # complex
            regs = mem[pc]
            pc += 1

            reg_a = Reg16Ref(regs >> 4)
            reg_b = Reg16Ref(regs & 0xf)
            if reg_b.reg == 0:
                reg_b = None

            if regs & 0x10 == 0:
                imm = LiteralRef(mem.get_i8(pc), 1, pc)
                pc += 1
            else:
                imm = LiteralRef(mem.get_be16(pc), 1, pc)
                pc += 2

            # todo: This mode also does PC-relative addressing?
            return ComplexRef(reg_a, reg_b, imm), pc
        case 2: # indexed
            if getattr(prev, 'only_upper', False):
                # Not confirmed
                # There is a special case which packs two indexed references into one byte
                reg = mem[pc-1] & 0xf
                upper = False
            elif prev is not None:
                reg = mem[pc] & 0xf
                upper = False
                pc += 1
            else:
                reg = mem[pc] >> 4
                pc += 1
                upper = True
            ref = ComplexRef(Reg16Ref(reg))
            ref.only_upper = upper
            return ref, pc
        case 3: # literal
            ref = LiteralRef(int.from_bytes(mem[pc:pc+size], 'big'), size, pc)
            pc += size
            return ref, pc

# The traditional ee200 addressing mode used by most load/store. Plus jmp/call
def Cpu4AddrMode(mode, word, pc, mem):
    orig_pc = pc
    match mode:
        case 0: # Literal
            if word:
                return LiteralRef(mem.get_be16(pc), 2, pc), pc + 2
            return LiteralRef(mem[pc], 1, pc), pc + 1
        case 1: # Direct
            return DirectRef(mem.get_be16(pc), pc), pc + 2
        case 2: # Indirect
            return IndirectRef(DirectRef(mem.get_be16(pc), pc)), pc + 2
        case 3: # Displaced
            return PcDisplacementRef(pc+1, mem.get_i8(pc)), pc + 1
        case 4: # Displaced Indirect
            return IndirectRef(PcDisplacementRef(pc+1, mem.get_i8(pc))), pc + 1
        case 5: # Indexed
            disp = 0
            ref = Reg16Ref(mem[pc] >> 4)
            modifier = mem[pc] & 0xf
            pc += 1

            match modifier & 0x3:
                case 1: # PostIncrement
                    ref = PostIncRef(ref)
                case 2: # PreDecrement
                    ref = PreDecRef(ref)
                case 3:
                    return None, orig_pc

            if modifier & 8 == 8: # Displacement
                disp = LiteralRef(mem.get_i8(pc), 1, pc)
                pc += 1

            ref = ComplexRef(ref, None, disp)
            if modifier & 4 == 4: # Indirect
                return IndirectRef(ref), pc
            return ref, pc # Direct

        case 6 | 7:
            return None, pc
        case mode: # One byte indexed mode
            reg = (mode & 7) << 1
            return ComplexRef(Reg16Ref(reg)), pc

# Handles all the addressing modes in alu instructions
# returns (dst, src1, src2, newpc)
def AluAddrMode(mode, inst, pc, mem):
    # Small literal used in 20/30 instrutions
    # Shifts, rotates and increments effectively add 1 to 'imm' value
    imm = SmallLiteralRef((mode & 0xf) + (0 if inst in [0x22, 0x23, 0x32, 0x33] else 1))

    match inst & 0x70:
        case 0x20:
            return Reg8Ref(mode >> 4), imm, None, pc
        case 0x30 if mode & 0x10 == 0:
            return Reg16Ref(mode >> 4), imm, None, pc
        case 0x30:
            # lower nibble set means we use a special address mode
            addr = mem.get_be16(pc)
            pc += 2
            match (mode >> 4) & 0xe:
                case 0: # Direct
                    return DirectRef(addr, pc-2), imm, None, pc
                case reg: # Indexed
                    return ComplexRef(Reg16Ref(reg), LiteralRef(addr, pc)), imm, None, pc
        case 0x40:
            return Reg8Ref(mode & 0xf), Reg8Ref(mode >> 4), None, pc
        #case 0x50 if mode & 0x11 == 0: # neither lower nibble set
        case 0x50 | 0x70:
            dst_reg = Reg16Ref(mode & 0xe)
            src_reg = Reg16Ref((mode >> 4) & 0xe)
            match mode & 0x11:
                case 0x00: # neither lower nibble set, normal reg, reg
                    return dst_reg, src_reg, None, pc
                case 0x01: # dest <- src (direct)
                    return dst_reg, src_reg, DirectRef(mem.get_be16(pc), pc), pc + 2
                case 0x10: # dest <- src op literal
                    return dst_reg, src_reg, LiteralRef(mem.get_be16(pc), 2, pc), pc + 2
                case 0x11: # dest <- src op reg
                    index = src_reg
                    base = LiteralRef(mem.get_be16(pc), 2, pc)
                    return Reg16Ref(mode & 0xe), ComplexRef(index, base), None, pc + 2

def D6Mode(mode, pc, mem):
    a = (mode >> 4) & 0xe
    b = mode & 0x0e
    unk = mem[pc+1] & 0x10

    addr = mem.get_be16(pc)
    ref = DirectRef(addr, pc)
    pc += 2

    if a != b:
        if addr == 0:
            return Reg16Ref(a), ComplexRef(Reg16Ref(b)), pc
        ref = ComplexRef(ref, Reg16Ref(b))
    return Reg16Ref(a), ref, pc

