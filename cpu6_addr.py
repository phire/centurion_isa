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
        if self.index:
            ret += f" + {self.index.to_string(memory)}"
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
    def __init__(self, val, size, pc=None, signed=False):
        self.val = val
        self.size = size
        self.pc = pc
        self.signed = signed

    def to_string(self, memory, **kwargs):
        val = self.getValue(memory)

        # Only label literals if they have been fixed up (or forced)
        if (self.pc and memory.is_fixup(self.pc)) or "forceLabel" in kwargs:
            if label := memory.get_label(val):
                if "supressAlt" in kwargs:
                    return label
                return f"{label}|{val:#0{self.size*2+2}x}"
        return f"{val:#0{self.size*2+2}x}"

    def getValue(self, memory, **kwargs):
        if self.pc:
            return memory.get(self.pc, self.size, self.signed)
        return self.val

    def getNode(self, cpu):
        if self.pc:
            val = cpu.readMem(LiteralValue(self.pc, 16), self.size * 8)
            if self.signed:
                assert self.size == 1
                return SignExtend(val)
            return val
        return LiteralValue(self.val, self.size * 8)

class SmallLiteralRef(Ref):
    def __init__(self, val):
        self.val = val

    def __str__(self):
        return f"#{self.val:d}"

    def getNode(self, cpu):
        return LiteralValue(self.val, 4)

class PcDisplacementRef(Ref):
    def __init__(self, pc, disp, size=2):
        self.pc = pc
        self.disp = disp # disp is a literal ref
        self.size = size

    def __str__(self):
        return f"[pc + {self.disp}]"

    def getAddr(self, memory):
         # disp is a literal ref, just incase self-modifying code patches it
        return self.pc + self.disp.getValue(memory)

    def getLiteralRef(self, memory):
        addr = self.getAddr(memory)
        addr_ref = LiteralRef(addr, 2)
        lit_ref = LiteralRef(None, self.size, addr)
        return lit_ref, addr_ref

    def getValue(self, memory):
        ref, _ = self.getLiteralRef(memory)
        return ref.getValue(memory)

    def to_string(self, memory, **kwargs):
        ref, addr_ref = self.getLiteralRef(memory)
        return f"[{addr_ref.to_string(memory, forceLabel=True)}]"

    def to_string_indirect(self, memory, supressAlt=False, **kwargs):
        addr = self.getAddr(memory)
        try:
            owner_addr, info = memory.owned(addr)
            if info.instruction and owner_addr < addr:
                inst = info.instruction.instruction
                memref = None
                if inst.mnemonic in ["ld", "st"]:
                    memref = inst.srcs[0]
                if inst.mnemonic in ["call"]:
                    memref = inst.src

                if isinstance(memref, DirectRef):
                    # This is a common optimization that makes it hard to follow code
                    ref, addr_ref = self.getLiteralRef(memory)
                    string = f"{ref.to_string(memory, supressAlt=supressAlt, forceLabel=True)}(via {self.disp.to_string(memory)})"
                    if inst.mnemonic in ["call"]:
                        return string
                    return "[" + string + "]"
        except:
            return "@" + self.to_string(memory)

    def getNode(self, cpu):
        return cpu.getMem(LiteralValue(self.pc, 16).Add(self.disp), self.size * 8)

class IndirectRef(Ref):
    def __init__(self, ref):
        self.ref = ref

    def __str__(self):
        return f"@{self.ref}"

    def to_string(self, memory, **kwargs):
        try:
            return self.ref.to_string_indirect(memory, **kwargs)
        except AttributeError:
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
                imm = signedOffset(pc, mem)
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
            ref = LiteralRef(None, size, pc)
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
            return PcDisplacementRef(pc+1, signedOffset(pc, mem), 1 + word), pc + 1
        case 4: # Displaced Indirect
            return IndirectRef(PcDisplacementRef(pc+1, signedOffset(pc, mem))), pc + 1
        case 5: # Indexed
            disp = None
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
                disp = signedOffset(pc, mem)
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

def TwoRegExtendedMode(mode, pc, mem):
    dst_reg = Reg16Ref(mode & 0xe)
    src_reg = Reg16Ref((mode >> 4) & 0xe)
    match mode & 0x11:
        case 0x00: # neither lower bit set, normal reg, reg
            return dst_reg, src_reg, None, pc
        case 0x01: # dest <- src (direct)
            return dst_reg, src_reg, DirectRef(mem.get_be16(pc), pc), pc + 2
        case 0x10: # dest <- src op literal
            return dst_reg, src_reg, LiteralRef(mem.get_be16(pc), 2, pc), pc + 2
        case 0x11: # dest <- src(index) op dest
            disp = LiteralRef(mem.get_be16(pc), 2, pc)
            return dst_reg, ComplexRef(src_reg, None, disp), dst_reg, pc + 2


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
                    return ComplexRef(Reg16Ref(reg), LiteralRef(addr, 2, pc)), imm, None, pc
        case 0x40:
            return Reg8Ref(mode & 0xf), Reg8Ref(mode >> 4), None, pc
        #case 0x50 if mode & 0x11 == 0: # neither lower nibble set
        case 0x50 | 0x70:
            return TwoRegExtendedMode(mode, pc, mem)

def D6Mode(mode, pc, mem):
    # almost the same as TwoRegExtendedMode above, bur with src and dst switched up
    dst_reg = Reg16Ref(mode & 0xe)
    src_reg = Reg16Ref((mode >> 4) & 0xe)
    match mode & 0x11:
        case 0x00: # neither lower nibble set, normal reg, reg
            return dst_reg, src_reg, pc
        case 0x01: # dest <- src (direct)
            return DirectRef(mem.get_be16(pc), pc), src_reg, pc + 2
        case 0x10: # dest <- src op literal
            return LiteralRef(mem.get_be16(pc), 2, pc), src_reg, pc + 2
        case 0x11: # dest <- src op reg
            disp = LiteralRef(mem.get_be16(pc), 2, pc)
            return ComplexRef(dst_reg, None, disp), src_reg, pc + 2

