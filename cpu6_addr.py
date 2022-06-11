from cpu6_regs import RegNames8, RegNames16
from generic import get_be16, get_signed_8

class AddrRef:
    pass

class DirectRef(AddrRef):
    def __init__(self, addr):
        self.addr = addr

    def __str__(self):
        return f"[{self.addr:#06x}]"

class IndexedRef(AddrRef):
    def __init__(self, base, disp):
        self.base = base >> 1
        self.disp = disp

    def __str__(self):
        if self.disp == 0:
            return f"[{RegNames16[self.base]}]"
        return f"[{RegNames16[self.base]} + {self.disp:#06x}]"

class ComplexRef(AddrRef):
    def __init__(self, base, index, disp):
        self.base = base >> 1
        self.index = index >> 1
        self.disp = disp

    def __str__(self):
        if self.disp == 0:
            return f"[{RegNames16[self.base]} + {RegNames16[self.index]}]"
        return f"[{RegNames16[self.base]} + {RegNames16[self.index]} + {self.disp:#06x}]"

class LiteralRef(AddrRef):
    def __init__(self, val):
        self.val = val

    def __str__(self):
        return f"#{self.val:#06x}"

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
            reg_a = regs >> 4
            reg_b = regs & 0xf
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
            ref = IndexedRef(reg, 0)
            ref.only_upper = upper
            return ref, pc
        case 3: # literalByte
            return LiteralRef(memory[pc]), pc + 1

