from .generic import *
from .cpu6_regs import Reg16Ref, Reg8Ref, MultiRegRef, LvlRegRef
from .cpu6_addr import *
from .cpu6_ops import *
from common.memory import InstructionMatch as Match
from .inst import BasicCpu6Inst, SyscallInst, ControlFlowInst


def AluMatch(pc, mem):
    orig_pc = pc
    inst = mem[pc]
    pc += 1

    implicit = inst & 0x08 != 0
    op = inst & 0x07

    if inst >= 0x40:
        op += 8
    if (inst & 0xf) >= 0xe or op >= 14:
        return None

    OPs = [
        # Small Literal:
        ("inc", lambda a, b: a.Add(b)),
        ("dec", lambda a, b: a.Sub(b)),
        ("clr", lambda a, b: b),
        ("not", lambda a, b: a.Not().Add(b)),
        ("srl", lambda a, b: a.ShiftRight(b)),
        ("sll", lambda a, b: a.ShiftLeft(b)),
        ("rrc", lambda a, b: a.RotateRight(b)),
        ("rlc", lambda a, b: a.RotateLeft(b)),
        # Two Arg:
        ("add", lambda a, b: a.Add(b)),
        ("sub", lambda a, b: a.Sub(b)),
        ("and", lambda a, b: a.And(b)),
        ("or",  lambda a, b: a.Or(b)),
        ("xor", lambda a, b: a.Xor(b)),
        ("mov", lambda a, b: b)
    ]
    mnemonic, fn = OPs[op]

    if implicit:
        # Shifts, rotates and increments effectively add 1 to 'imm' value
        imm = 0 if inst in [0x2a, 0x2b, 0x3a, 0x3b] else 1

        match inst & 0x70:
            case 0x20:
                dst = Reg8Ref(1)
                src = SmallLiteralRef(imm)
            case 0x30:
                dst = Reg16Ref(0)
                src = SmallLiteralRef(imm)
            case 0x40:
                dst = Reg8Ref(3)
                src = Reg8Ref(1)
            case 0x50:
                dst = Reg16Ref(2)
                src = Reg16Ref(0)
        src2 = None
    else:
        mode = mem[pc]
        pc += 1
        dst, src, src2, pc = AluAddrMode(mode, inst, pc, mem)

        # if we have two sources, mov ignores the source that isn't mem
        if op == 13 and src2 != None:
            if isinstance(src2, (Reg16Ref, Reg8Ref)):
                src2 = None
            elif isinstance(src, (Reg16Ref, Reg8Ref)):
                src, src2 = src2, None

    return Match(orig_pc, pc, BasicCpu6Inst(mnemonic, dst, src, src2, fn=fn))

def Match2e(pc, mem):
    orig_pc = pc

    op = mem[pc+1] >> 4
    a_mode = (mem[pc+1] >> 2) & 0x3
    b_mode = mem[pc+1] & 0x3
    pc += 2

    ops = ["wpf", "rpf", "wpf1", "rpf1", "wpf32", "rpf32", "illegal6", "illegal7"
           "unk2e_8", "unk2e_9", "unk2e_A", "unk2e_B", "unk2e_C", "unk2e_D", "unk2e_E", "unk2e_F"]
    a_ref, pc = Cpu6AddrMode(a_mode, pc, mem)
    b_ref, pc = Cpu6AddrMode(b_mode, pc, mem, a_ref)

    return Match(orig_pc, pc, BasicCpu6Inst(f"{ops[op]}", a_ref, b_ref))

def Match2f(pc, mem):
    reg = mem[pc+1] >> 4
    op = mem[pc+1] & 0x0f

    mnemonic = "ld_" if op & 1 == 0 else "st_"

    match op >> 1:
        case 0:
            mnemonic += "dma_addr"
        case 1:
            mnemonic += "dma_count"
        case 2:
            mnemonic = "dma_mode"
            if op & 1 == 1:
                reg_ref = Reg8Ref(reg)
            else:
                mnemonic += f" {reg}"
                reg_ref = None
            return Match(pc, pc+2, BasicCpu6Inst(mnemonic, reg_ref))
        case 3:
            if reg == 0 and op & 1 == 0:
                mnemonic = "enable_dma" if (op & 1 == 0) else "disable_dma"
                return Match(pc, pc+2, BasicCpu6Inst(mnemonic))
            if reg != 0: # Illegal if reg != 0
                return None
        case 4:
            mnemonic += "isr"

    return Match(pc, pc+2, BasicCpu6Inst(mnemonic, Reg16Ref(reg)))

# Implements the 46 "bignum" instructions
def Match46(pc, mem):
    orig_pc = pc

    a_size = mem[pc+1] >> 4
    b_size = mem[pc+1] & 0x0f
    a_mode = (mem[pc+2] >> 2) & 0x3
    b_mode = mem[pc+2] & 0x3

    op = mem[pc+2] >> 4
    ops = [
        "addbig", "subbig", "unkbig2", "unkbig3", "unkbig4", "unkbig5",
        "unkbig6", "unkbig7", "unkbig8", "baseconv", "unkbigA", "unkbigB",
        "unkbigC", "unkbigD", "unkbigE", "unkbigF"
    ]

    pc += 3
    a_ref, pc = Cpu6AddrMode(a_mode, pc, mem)
    b_ref, pc = Cpu6AddrMode(b_mode, pc, mem, a_ref)

    bytes = mem[orig_pc:pc]
    return Match(orig_pc, pc, BasicCpu6Inst(f"{ops[op]}({a_size:x}, {b_size:x})", a_ref, b_ref))

# Implements 47 and 67 "block" instructions
def MatchBlock(pc, mem):
    orig_pc = pc

    inst = mem[pc]
    op = mem[pc+1] >> 4
    a_mode = (mem[pc+1] >> 2) & 0x3
    b_mode = mem[pc+1] & 0x3
    pc += 2

    ops = ["unkblk0", "unkblk1", "memchr", "unkblk3", "memcpy", "unkblk5", "unkblk6", "unkblk7",
        "memcmp", "memset", "unkblkA", "unkblkB", "unkblkC", "unkblkD", "unkblkE", "unkblkF"]

    blk_len = 1
    args = []
    if op != 0:
        if inst == 0x47: # 47 gets it's length as a byte immediate
            blk_len = mem[pc] + 1
            args += [LiteralRef(blk_len, 1)]
            pc += 1
        elif inst == 0x67:  # 67 gets it's length from implicit AL
            args += [Reg8Ref(1)]

    if op == 2:
        if inst == 0x47: # 47 gets it's char as a byte immediate
            args += [LiteralRef(mem[pc], 1)]
            pc += 1
        elif inst == 0x67:  # 67 gets it's length from somewhere else. BL?
            args +=  [Reg8Ref(3)] # complete guess

    src_len = blk_len
    if op == 9: # memset
        src_len = 1
    if op == 0xb:
        # unknown. The only example of this is a small bit of junk code at the end of bootstrap
        # which looks like it was left over from the previous code that the programmer assembled
        src_len = 1

    a_ref, pc = Cpu6AddrMode(a_mode, pc, mem, None, src_len)
    b_ref, pc = Cpu6AddrMode(b_mode, pc, mem, a_ref, blk_len)
    args += [a_ref, b_ref]

    return Match(orig_pc, pc, BasicCpu6Inst(f"{ops[op]}", *args))

# These might be multiple/divide
# Order is not confirmed
def MatchMul(pc, mem):
    orig_pc = pc
    inst = mem[pc]
    mode = mem[pc+1]
    pc += 2

    dst, src, src2, pc = AluAddrMode(mode, inst, pc, mem)

    mnemonic = "mul" if inst == 0x78 else "div"
    return Match(orig_pc, pc, BasicCpu6Inst(mnemonic, dst, src, src2))

def MatchD6(pc, mem):
    orig_pc = pc
    mode = mem[pc+1]
    mnemonic = "st"

    pc += 2
    src, dest, pc = D6Mode(mode, pc, mem)

    return Match(orig_pc, pc, BasicCpu6Inst(mnemonic, dest, src))

def MatchPushPop(pc, mem):
    orig_pc = pc
    mnemonic = "push" if mem[pc] == 0x7e else "pop"
    start = mem[pc+1] >> 4
    count = mem[pc+1] & 0x0f
    pc += 2

    if start + count > 15:
        return Match(orig_pc, pc, BasicCpu6Inst("unknown_push"))

    return Match(orig_pc, pc, BasicCpu6Inst(mnemonic, MultiRegRef(start, count)))

def MatchD7_E6(pc, mem):
    store = mem[pc] == 0xd7

    level = mem[pc+1] >> 4
    ref = LvlRegRef(level, Reg16Ref(mem[pc+1] & 0x0f))
    dst, src = (ref, Reg16Ref(0)) if store else (Reg16Ref(0), ref)

    return Match(pc, pc+2, BasicCpu6Inst("mov", dst, src))


# Implements all opcodes 0x80 and above
# Memory and load immediate
def MemoryMatch(pc, mem):
    orig_pc = pc
    inst = mem[pc]
    pc += 1

    if inst == 0xf6:
        # All memory references are in the Device address space
        # OPSYS exclusively uses these instructions when accessing MMIO device registers
        # CPU6 seems to be some feature to put MMIO in a different address space.
        # It must be disabled on boot for compatibility, and enabled later.

        dst, src, pc = F6Mode(pc, mem)
        return Match(orig_pc, pc, BasicCpu6Inst("mov", dst, src))

    elif inst & 0x80 == 0x80:
        # Instructions that operate on A & B
        # bit 6: Accumulator select - 0 for "A", 1 for "B"
        reg = 0 if inst & 0x40 == 0 else 2
        # bit 5: Direction - 0 for read, 1 for write
        mode = 'ld' if inst & 0x20 == 0 else 'st'

        # bit 4: Length - 0 for byte, 1 for word
        word = inst & 0x10 != 0
        if not word:
            reg += 1

        address_mode = inst & 0xf
    elif inst & 0xf0 == 0x60:
        # Instructions that operate on X
        reg = 4
        word = True
        mode = 'ld' if inst & 0x08 == 0 else 'st'
        address_mode = inst & 0x07
    elif inst & 0xf0 == 0x70:
        word = True
        mode = 'jmp' if inst & 0x08 == 0 else 'call'
        address_mode = inst & 0x07
    else:
        return None

    operand, pc = Cpu4AddrMode(address_mode, word, pc, mem)
    if operand is None:
        return None

    if mode in ['ld', 'st']:
        reg = Reg16Ref(reg) if word else Reg8Ref(reg)
        return Match(orig_pc, pc, BasicCpu6Inst(mode, reg, operand))

    if isinstance(operand, LiteralRef):
        # Literal addressing mode isn't valid for call/jump
        return None

    return Match(orig_pc, pc, ControlFlowInst(mode, operand), mem=mem)

# 00
control_instructions = [
    #B("00000000", "HALT", kill_branch),
    I("00000000", "HALT"),

    # Flag instructions:
    I("00000001", "nop"),
    I("00000010", "sf"), # set fault
    I("00000011", "rf"), # clear fault
    I("00000100", "ei"), # enable interrupts
    I("00000101", "di"), # disable interrupts
    I("00000110", "sl"), # set link/carry
    I("00000111", "rl"), # clear link/carry
    I("00001000", "cl"), # Complements carry

    B("00001001", "ret", kill_branch),
    I("00001010", "reti"), #, kill_branch),
    B("00001011", "rim", kill_branch),

    I("00001110", "dly"),
    B("00001111", "rsys", kill_branch),
    I("xxxxxxxx"),
]

# 10
branch_instructions = [
    B("00010000 SSSSSSSS", "bc", relative_branch),
    B("00010001 SSSSSSSS", "bnc", relative_branch),
    B("00010010 SSSSSSSS", "bn", relative_branch),
    B("00010011 SSSSSSSS", "bnn", relative_branch),
    B("00010100 SSSSSSSS", "bz", relative_branch),
    B("00010101 SSSSSSSS", "bnz", relative_branch),
    B("00010110 SSSSSSSS", "blt", relative_branch),
    B("00010111 SSSSSSSS", "bp", relative_branch), # positive
    B("00011000 SSSSSSSS", "bgt", relative_branch),
    B("00011001 SSSSSSSS", "ble", relative_branch), # lessthan or equal
    B("00011010 SSSSSSSS", "bs1", relative_branch),
    B("00011011 SSSSSSSS", "bs2", relative_branch),
    B("00011100 SSSSSSSS", "bs3", relative_branch),
    B("00011101 SSSSSSSS", "bs4", relative_branch),
    B("00011110 SSSSSSSS", "b?E", relative_branch),
    B("00011111 SSSSSSSS", "b?F", relative_branch),
    I("xxxxxxxx"),
]

instructions  = [
    I("01110110", "enable_parity_trap"),
    I("10000110", "disable_parity_trap"),
    I("11110111", "memcpy16"),
    I("01101110 NNNNNNNN NNNNNNNN", "ldcc [{N:#06x}]"),
    I("01101111 NNNNNNNN NNNNNNNN", "stcc [{N:#06x}]"),

    I("xxxxxxxx"),
]

def disassemble_instruction(mem, pc):
    byte = mem[pc]

    match byte >> 4:
        case 0:
            return scan(control_instructions, mem, pc, 1)
        case 1:
            return scan(branch_instructions, mem, pc, 2)
        case 2 | 3 | 4 | 5:
            match byte:
                case 0x2e:
                    return Match2e(pc, mem)
                case 0x2f:
                    if inst := Match2f(pc, mem):
                        return inst
                case 0x46:
                    return Match46(pc, mem)
                case 0x47:
                    return MatchBlock(pc, mem)
                case n if n & 0x40 and n & 0xf > 0xa:
                    # Single-byte transfers instructions
                    r = [4, 6, 2, 8, 10][(n & 0xf) - 0xb]
                    dst, src = (Reg16Ref(r), Reg16Ref(0)) if n & 0x10 else (Reg8Ref(r+1), Reg8Ref(1))
                    return Match(pc, pc+1, BasicCpu6Inst("mov", dst, src))
                case _:
                    if alu := AluMatch(pc, mem):
                        return alu
        case _:
            if m := MemoryMatch(pc, mem):
                return m

    match byte:
        case 0x3e:
            fn = lambda a,b: a.Add(1)
            return Match(pc, pc+1, BasicCpu6Inst("inc", Reg16Ref(4), fn=fn))
        case 0x3f:
            fn = lambda a,b: a.Sub(1)
            return Match(pc, pc+1, BasicCpu6Inst("dec", Reg16Ref(4), fn=fn))
        case 0x77 | 0x78:
            return MatchMul(pc, mem)
        case 0x66: # jsys aka Syscall
            return Match(pc, pc+2, SyscallInst(mem[pc+1]), mem=mem)
        case 0x67:
            return MatchBlock(pc, mem)
        case 0x7e | 0x7f:
            return MatchPushPop(pc, mem)
        case 0xd6:
            if inst := MatchD6(pc, mem):
                return inst
        case 0xd7 | 0xe6:
            return MatchD7_E6(pc, mem)

    return scan(instructions, mem, pc, 5)

__all__ = ["disassemble_instruction", "entry_points", "memory_addr_info"]