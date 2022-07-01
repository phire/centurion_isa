#!/usr/bin/env python3

from enum import IntFlag

class Depend(IntFlag):
    Nothing = 0
    Memory = 1
    Reg = 2
    Carry = 4
    Fault = 8
    Minus = 16
    Zero  = 32
    State = 64

class Op:
    def __init__(self, a, b, width=16):
        self.a = a
        self.b = b
        self.mask = (1 << width) - 1
        self.width = width

    def getValue(self, cpu):
        raise NotImplemented

    def getCarry(self, cpu):
        return 0

    def getZero(self, cpu):
        return self.getValue(cpu) == 0

    def getMinus(self, cpu):
        return self.getValue(cpu) >= (1 << (width -1))

    def depends(self):
        return self.a.depends() | self.b.depends()

    def __str__(self):
        return f"{type(self).__name__}{self.width}({self.a}, {self.b})"

    def __getattr__(self, name: str):
        # allows things like Value.Add(1)
        return ApplyOp(AllOps[name], self)


class Nop(Op):
    def __init__(self):
        pass

    def apply(self, cpu):
        pass

    def depends(self):
        return Depend.Nothing

class UniOp(Op):
    def __init__(self, a, width=16):
        super().__init__(a, Nop(), width)

    def depends(self):
        return self.a.depends()

    def __str__(self):
        return f"{type(self).__name__}{self.width}({self.a})"

class Add(Op):
    def getValue(self, cpu):
        return self.mask & (self.a.getValue(cpu) + self.b.getValue(cpu))

    def getCarry(self, cpu):
        return (self.a.getValue(cpu) + self.b.getValue(cpu)) >> self.width

class Sub(Op):
    def getValue(self, cpu):
        return self.mask & (self.a.getValue(cpu) - self.b.getValue(cpu))

    def getCarry(self, cpu):
        return (self.a.getValue(cpu) + self.b.getValue(cpu)) >> self.width

class Or(Op):
    def getValue(self, cpu):
        return self.mask & (self.a.getValue(cpu) | self.b.getValue(cpu))

class And(Op):
    def getValue(self, cpu):
        return self.mask & (self.a.getValue(cpu) & self.b.getValue(cpu))

class Xor(Op):
    def getValue(self, cpu):
        return self.mask & (self.a.getValue(cpu) ^ self.b.getValue(cpu))

class ShiftLeft(Op):
    def getValue(self, cpu):
        return self.mask & (self.a.getValue(cpu) << self.b.getValue(cpu))

class ShiftRight(Op):
    def getValue(self, cpu):
        return self.mask & (self.a.getValue(cpu) >> self.b.getValue(cpu))

class Cat(Op):
    def __init__(self, a, b):
        width = a.width + b.width
        super().__init__(a, b, width)

    def getValue(self, cpu):
        return (self.b.getValue(cpu) << self.a.width) | self.b.getValue(cpu)

class Extract(Op):
    def __init__(self, a, shift, width):
        super().__init__(a, Nop, width)
        self.shift = shift

    def getValue(self, cpu):
        return self.mask & (self.a.getValue(cpu) >> self.shift)

    def __str__(self):
        return f"Extract({self.a}, {self.shift}, {self.width})"

class Insert(Op):
    def __init__(self, a, b, shift, width):
        total_width = a.width
        super().__init__(a, b, total_width)
        self.shift = shift
        self.insert_mask = ((1 << width) - 1) << shift
        self.clear_mask = self.mask & (~self.insert_mask)

    def getValue(self, cpu):
        return (self.a.getValue(cpu) & self.clear_mask) | ((self.b.getValue & self.insert_mask) << self.shift)

    def __str__(self):
        return f"Insert({self.a}, {self.b}, {self.shift}, {self.width})"

class Flags(UniOp):
    def __str__(self):
        return f"F({self.a})"


class RotateLeft(Op):
    def getValue(self, cpu):
        shift = self.b.getValue(cpu)
        a = self.a.getValue(cpu) << 1 | cpu.getCarry()
        return a << (shift - 1) | a >> (self.shift)

    def getCarry(self, cpu):
        shift = self.b.getValue(cpu)
        return self.a.getValue(cpu) >> (self.width - shift)

    def depends(self):
        return super.depends() | Depend.Carry

class RotateRight(Op):
    def getValue(self, cpu):
        shift = self.b.getValue(cpu)
        a = self.a.getValue(cpu) << 1 | cpu.getCarry()
        return a << (shift - 1) | a >> (self.shift)

    def getCarry(self, cpu):
        shift = self.b.getValue(cpu)

    def depends(self):
        return super.depends() | Depend.Carry

class Not(UniOp):
    def getValue(self, cpu):
        return self.mask & (~self.a.getValue(cpu))

class SignExtend(UniOp):
    # only supports extend to 16
    def getValue(self, cpu):
        val = self.a.getValue(cpu)
        if val > 0x80:
            val = (~val + 1)
        return val

AllOps = {op.__name__: op for op in Op.__subclasses__() if op not in [UniOp, Nop]}

class LiteralValue:
    def __init__(self, val, width):
        self.val = val
        self.width = width

    def getValue(self, cpu):
        return self.val

    def __str__(self):
        w = self.width // 4 + 2
        return f"{self.val:#0{w}x}"

class ApplyOp:
    # This is an adapter that allows Value.Add(1) to work with any op
    def __init__(self, Op, Dest):
        self.op = Op
        self.dest = Dest

    def __call__(self, val):
        # Auto-wrap raw ints
        if isinstance(val, int):
            val = LiteralValue(val, self.dest.width)

        return self.op(self.dest.val, val, width=self.dest.width)



class Value():
    def __init__(self, width, name):
        self.width = width
        self.val = None # undefined
        self.name = name

    def Eq(self, val):
         # Auto-wrap raw ints
        if isinstance(val, int):
            val = LiteralValue(val, self.width)

        self.val = val
        return self

    def __getattr__(self, name: str):
        # allows things like Value.Add(1)
        return ApplyOp(AllOps[name], self)

    def __str__(self):
        if self.val == None:
            return f"<{self.name}>"
        return f"<Value{self.width} {self.name}={self.val}>"

    def to_string(self, mem):
        if self.val:
            return self.val.to_string(mem)
        return self.name

    def getValue(self, cpu):
        if self.val == None:
            return None
        return self.val.getValue(cpu)

class Value8(Value):
    def __init__(self, name):
        super().__init__(8, name)


class Value16(Value):
    def __init__(self, name):
        super().__init__(16, name)

def test():
    A = Value16("A").Eq(2)
    B = Value16("B")
    A.Add(55)
    A.And(0xf)
    print(A)
    print(A.getValue(None))
    A.Add(B)
    print(A)


if __name__ == "__main__":
    test()