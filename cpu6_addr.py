from cpu6_regs import Reg16Ref, PostIncRef, PreDecRef
from generic import get_be16, get_signed_8

class AddrRef:
    pass

class DirectRef(AddrRef):
    def __init__(self, addr):
        self.addr = addr

    def __str__(self):
        return f"[{self.addr:#06x}]"

class IndexedRef(AddrRef):
    def __init__(self, base, disp=0):
        self.base = base
        self.disp = disp

    def __str__(self):
        if self.disp == 0:
            return f"[{self.base}]"
        return f"[{self.base} + {self.disp:#06x}]"

class ComplexRef(AddrRef):
    def __init__(self, base, index, disp):
        self.base = base
        self.index = index
        self.disp = disp

    def __str__(self):
        if self.disp == 0:
            return f"[{self.base} + {self.index}]"
        return f"[{self.base} + {self.index} + {self.disp:#06x}]"

class LiteralRef(AddrRef):
    def __init__(self, val, size, pc=None):
        self.val = val
        self.size = size
        self.pc = pc

    def __str__(self):
        if self.size == 1:
            return f"#{self.val:#04x}"
        return f"#{self.val:#06x}"

class PcDisplacementRef(AddrRef):
    def __init__(self, pc, disp):
        self.pc = pc
        self.disp = disp

    def __str__(self):
        return f"[pc + {self.disp:#04x}]"

class IndirectRef(AddrRef):
    def __init__(self, ref):
        self.ref = ref

    def __str__(self):
        return f"@{self.ref}"


# A short 2bit address mode, which will consume more bytes from PC
def Cpu6AddrMode(mode, pc, memory, prev=None):
    match mode:
        case 0: # direct
            addr = get_be16(memory, pc)
            pc += 2
            return DirectRef(addr), pc
        case 1: # complex
            imm8 = get_signed_8(memory, pc)
            regs = memory[pc + 1]
            reg_a = Reg16Ref(regs >> 4)
            reg_b = Reg16Ref(regs & 0xf)
            pc += 2

            if reg_b == 0:
                return IndexedRef(reg_a, imm8), pc
            # todo: This mode also does PC-relative addressing?
            return ComplexRef(reg_a, reg_b, imm8), pc
        case 2: # indexed
            if getattr(prev, 'only_upper', False):
                # Not confirmed
                # There is a special case which packs two indexed references into one byte
                reg = memory[pc-1] & 0xf
                upper = False
            else:
                reg = memory[pc] >> 4
                pc += 1
                upper = True
            ref = IndexedRef(Reg16Ref(reg), 0)
            ref.only_upper = upper
            return ref, pc
        case 3: # literalByte
            return LiteralRef(memory[pc], 1), pc + 1

def Cpu4AddrMode(mode, word, pc, memory):
    orig_pc = pc
    match mode:
        case 0: # Literal
            if word:
                return LiteralRef(get_be16(memory, pc), 2, pc), pc + 2
            return LiteralRef(memory[pc], 1, pc), pc + 1
        case 1: # Direct
            return DirectRef(get_be16(memory, pc)), pc + 2
        case 2: # Indirect
            return IndirectRef(DirectRef(get_be16(memory, pc))), pc + 2
        case 3: # Displaced
            return PcDisplacementRef(pc+1, get_signed_8(memory, pc)), pc + 1
        case 4: # Displaced Indirect
            return IndirectRef(PcDisplacementRef(pc+1, get_signed_8(memory, pc))), pc + 1
        case 5: # Indexed
            disp = 0
            ref = Reg16Ref(memory[pc] >> 4)
            modifier = memory[pc] & 0xf
            pc += 1

            match modifier & 0x3:
                case 1: # PostIncrement
                    ref = PostIncRef(ref)
                case 2: # PreDecrement
                    ref = PreDecRef(ref)
                case 3:
                    return None, orig_pc

            if modifier & 8 == 8: # Displacement
                disp = get_signed_8(memory, pc)
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
