from cpu6_regs import Reg8Ref, Reg16Ref, PostIncRef, PreDecRef, Ref

class DirectRef(Ref):
    def __init__(self, addr):
        self.addr = addr

    def __str__(self):
        return f"[{self.addr:#06x}]"

    def getValue(self):
        return self.addr

    def to_string(self, memory, **kwargs):
        if label := memory.get_label(self.addr):
            return f"[{label}|{self.addr:#06x}]"
        return str(self)

class IndexedRef(Ref):
    def __init__(self, base, disp=0):
        self.base = base
        self.disp = disp

    def __str__(self):
        if self.disp == 0:
            return f"[{self.base}]"
        return f"[{self.base} + {self.disp:#06x}]"


class ComplexRef(Ref):
    def __init__(self, base, index, disp=0):
        self.base = base
        self.index = index
        self.disp = disp

    def __str__(self):
        if self.disp == 0:
            return f"[{self.base} + {self.index}]"
        return f"[{self.base} + {self.index} + {self.disp:#06x}]"

class LiteralRef(Ref):
    def __init__(self, val, size, pc=None):
        self.val = val
        self.size = size
        self.pc = pc

    def __str__(self):
        return f"#{self.val:#0{self.size*2+2}x}"

    def to_string(self, memory, **kwargs):
        # Only label literals if they have been fixed up
        if self.pc and memory.is_fixup(self.pc):
            if label := memory.get_label(self.val):
                return f"{label}|{self}"
        return str(self)

class SmallLiteralRef(Ref):
    def __init__(self, val):
        self.val = val

    def __str__(self):
        return f"#{self.val:d}"

class PcDisplacementRef(Ref):
    def __init__(self, pc, disp):
        self.pc = pc
        self.disp = disp

    def __str__(self):
        return f"[pc + {self.disp:#04x}]"

    def getValue(self):
        return self.pc + self.disp

    def to_string(self, memory, **kwargs):
        if label := memory.get_label(self.pc + self.disp):
            return f"[{label}|{self.disp:+#04x}]"
        return str(self)

class IndirectRef(Ref):
    def __init__(self, ref):
        self.ref = ref

    def __str__(self):
        return f"@{self.ref}"

    def to_string(self, memory, **kwargs):
        return f"@{self.ref.to_string(memory, **kwargs)}"

# A short 2bit address mode, which will consume more bytes from PC
def Cpu6AddrMode(mode, pc, mem, prev=None, size = 1):
    match mode:
        case 0: # direct
            addr = mem.get_be16(pc)
            pc += 2
            return DirectRef(addr), pc
        case 1: # complex
            regs = mem[pc]
            pc += 1

            reg_a = Reg16Ref(regs >> 4)
            reg_b = Reg16Ref(regs & 0xf)

            if regs & 0x10 == 0:
                imm = mem.get_i8(pc)
                pc += 1
            else:
                imm = mem.get_be16(pc)
                pc += 2

            if reg_b.reg == 0:
                return IndexedRef(reg_a, imm), pc
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
            ref = IndexedRef(Reg16Ref(reg), 0)
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
            return DirectRef(mem.get_be16(pc)), pc + 2
        case 2: # Indirect
            return IndirectRef(DirectRef(mem.get_be16(pc))), pc + 2
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
                disp = mem.get_i8(pc)
                pc += 1

            ref = IndexedRef(ref, disp)
            if modifier & 4 == 4: # Indirect
                return IndirectRef(ref), pc
            return ref, pc # Direct

        case 6 | 7:
            return None, pc
        case mode: # One byte indexed mode
            reg = (mode & 7) << 1
            return IndexedRef(Reg16Ref(reg)), pc

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
            ref = DirectRef(mem.get_be16(pc))
            pc += 2
            match (mode >> 4) & 0xe:
                case 0: # Direct
                    return ref, imm, None, pc
                case reg: # Indexed
                    return ComplexRef(Reg16Ref(reg), ref), imm, None, pc
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
                    return dst_reg, src_reg, DirectRef(mem.get_be16(pc)), pc + 2
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
    ref = DirectRef(addr)
    pc += 2

    if a != b:
        if addr == 0:
            return Reg16Ref(a), IndexedRef(Reg16Ref(b)), pc
        ref = ComplexRef(ref, Reg16Ref(b))
    return Reg16Ref(a), ref, pc

