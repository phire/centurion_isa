from .cpu6_ops import *
from common.ref import Ref, RegRef

RegNames16 = [
    "A", "B", "X", "Y", "Z", "S", "C", "P",
]

# P and H are likely illegal for byte access, but let's have them in the table just in case
RegNames8 = [
    "AH", "AL", "BH", "BL", "XH", "XL", "YH", "YL", "ZH", "ZL", "SH", "SL", "CH", "CL", "PH", "PL",
]


class Reg16Ref(RegRef):
    def __init__(self, reg):
        self.reg = reg >> 1

    def to_string(self, mem, **kwargs):
        return RegNames16[self.reg]

    def getNode(self, cpu):
        return cpu.getReg(self.reg, 16)

class Reg8Ref(RegRef):
    def __init__(self, reg):
        self.reg = reg

    def to_string(self, mem, **kwargs):
        return RegNames8[self.reg]

    def getNode(self, cpu):
        return cpu.getReg(self.reg, 8)

class PostIncRef(Ref):
    def __init__(self, ref):
        self.ref = ref

    def to_string(self, mem, **kwargs):
        return f"{self.ref.to_string(mem, **kwargs)}++"

    def getNode(self, cpu):
        node = self.ref.getNode(cpu)
        cpu.sideEffect(node.Add(node.width / 8))
        return node

class PreDecRef(Ref):
    def __init__(self, ref):
        self.ref = ref

    def to_string(self, mem, **kwargs):
        return f"--{self.ref.to_string(mem, **kwargs)}"

    def getNode(self, cpu):
        node = Add(self.ref.getNode(cpu), node.width / 8)
        cpu.sideEffect(node.Add(node.width / 8))
        return node

class MultiRegRef(Ref):
    def __init__(self, start, count):
        self.start = start
        self.count = count + 1

    def to_string(self, mem, **kwargs):
        i = self.start
        end = self.start + self.count
        regs = []
        if i & 1 == 1:
            regs.append(RegNames8[i])
            i += 1
        while i+1 < end:
            regs.append(RegNames16[i>>1])
            i += 2
        if i < end:
            regs.append(RegNames8[i])

        return f"{{{', '.join(regs)}}}"

    def __len__(self):
        return 1

class LvlRegRef(Ref):
    # For instructions that can touch registers in other interrupt levels

    def __init__(self, level, reg):
        self.level = level
        assert isinstance(reg, RegRef)
        self.reg = reg

    def to_string(self, mem, **kwargs):
        return f"IL{self.level}({self.reg.to_string(mem, **kwargs)})"

    def __len__(self):
        return 1
