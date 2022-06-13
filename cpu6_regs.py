

RegNames16 = [
    "A", "B", "X", "Y", "Z", "S", "C", "P",
]

# P and H are likely illegal for byte access, but let's have them in the table just in case
RegNames8 = [
    "AH", "AL", "BH", "BL", "XH", "XL", "YH", "YL", "ZH", "ZL", "SH", "SL", "CH", "CL", "PH", "PL",
]

class Ref:
    def to_string(self, memory, **kwargs):
        return str(self)

class RegRef(Ref):
    pass

class Reg16Ref(RegRef):
    def __init__(self, reg):
        self.reg = reg >> 1

    def __str__(self):
        return RegNames16[self.reg]

class Reg8Ref(RegRef):
    def __init__(self, reg):
        self.reg = reg

    def __str__(self):
        return RegNames8[self.reg]

class PostIncRef(Ref):
    def __init__(self, reg):
        self.reg = reg

    def __str__(self):
        return f"{self.reg}++"

class PreDecRef(Ref):
    def __init__(self, reg):
        self.reg = reg

    def __str__(self):
        return f"--{self.reg}"

class MultiRegRef(Ref):
    def __init__(self, start, count):
        self.start = start
        self.count = count + 1

    def __str__(self):
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

class LvlRegRef(Ref):
    # For instructions that can touch registers in other interrupt levels

    def __init__(self, level, reg):
        self.level = level
        assert isinstance(reg, RegRef)
        self.reg = reg

    def __str__(self):
        return f"IL{self.level}({self.reg})"
