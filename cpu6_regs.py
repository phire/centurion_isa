

RegNames16 = [
    "A", "B", "X", "Y", "Z", "S", "C", "P",
]

# P and H are likely illegal for byte access, but let's have them in the table just in case
RegNames8 = [
    "AH", "AL", "BH", "BL", "XH", "XL", "YH", "YL", "ZH", "ZL", "SH", "SL", "CH", "CL", "PH", "PL",
]

class Reg16Ref():
    def __init__(self, reg):
        self.reg = reg >> 1

    def __str__(self):
        return RegNames16[self.reg]

class Reg8Ref():
    def __init__(self, reg):
        self.reg = reg

    def __str__(self):
        return RegNames8[self.reg]

class PostIncRef:
    def __init__(self, reg):
        self.reg = reg

    def __str__(self):
        return f"{self.reg}++"

class PreDecRef:
    def __init__(self, reg):
        self.reg = reg

    def __str__(self):
        return f"--{self.reg}"