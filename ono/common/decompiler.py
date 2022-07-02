#!/usr/bin/env python3

from cpu6 import *
from disassemble import disassembleAllEntries, main, printListing
from cpu6.cpu6_regs import RegNames16, RegNames8
from cpu6.cpu6_ops import *
from copy import copy

class FakeValue(Value):
    # intercepts all .Eq calls and redirects back to cpu object

    def __init__(self, width, name, cpu, r, val=None):
        super().__init__(width, name)
        self.cpu = cpu
        self.r = r
        self.val = val

    def Eq(self, val):
        #print(f"  {self.name}={val}")
        return self.cpu._setReg(self.r, self.width, val)

class FakeMem():
    def __init__(self, name):
        self.addr = name

    def Eq(self, val):
        print(f"  {self}={val}")
        return Value(val.width, str(self)).Eq(val)

    def __str__(self) -> str:
        return f"[{self.addr}]"

class Cpu:
    def __init__(self, mem):
        self.mem = mem
        #self.regs8 = [None] * 16
        #self.regs16 = [None] * 8
        self.regs = [FakeValue(16, RegNames16[i], self, i) for i in range(8)]

    def getReg(self, r, width):
        #print(f"getReg({r}, {width})")
        if width == 8:
            reg = self.regs[r >> 1]
            if r & 1:
                reg = And(reg, LiteralValue(0xff, 8), width=8)
            else:
                reg = ShiftRight(reg, LiteralValue(8, 8), width=8)
            return FakeValue(width, RegNames8[r], self, r, reg)

        return self.regs[r]

    def _setReg(self, r, width, val):
        #print(f"setReg({r}, {width}, {val})")
        if width == 16:
            valwrap = FakeValue(width, RegNames16[r], self, r, val)
            self.regs[r] = valwrap
        elif width == 8:
            valwrap = FakeValue(width, RegNames8[r], self, r, val)
            shift = (r & 1) * 8
            val16 = Insert(self.regs[r >> 1], val, shift, 8)
            self.regs[r >> 1] = val16
        return valwrap

    def getMem(self, addr):
        name = addr.to_string(self.mem)
        return FakeMem(name)

def optimise_recursive(val):
    if isinstance(val, Flags):
        # remove Flags
        return optimise_recursive(val.a)
    if isinstance(val, Value):
        if val.val:
            # remove Value wrappers, if they have a value
            return optimise_recursive(val.val)
    if isinstance(val, Op):
        # optimize args
        val.a = optimise_recursive(val.a)
        if not isinstance(val, Op):
            val.b = optimise_recursive(val.b)
    return val

def optimise(value):
    value.val = optimise_recursive(value.val)
    return value

def decompiler_test(mem):
    addr = 0x03df
    cpu = Cpu(mem)
    print(f"decompiling {addr:#06x}")
    while True:
        info = mem.read_only_info(addr)
        if info.label:
            print(f"{info.label}:")

        print(info.instruction.to_string(mem))

        tree = info.instruction.instruction.to_tree(cpu)
        if not tree:
            break
        print(f"tree: {tree}")
        tree = optimise(tree)
        print(f"optimised: {tree}")

        addr += len(info.instruction.bytes)
    print("Done")


if __name__ == "__main__":
    mem = main()
    disassembleAllEntries(mem)
    decompiler_test(mem)