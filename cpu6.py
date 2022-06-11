from generic import *
from cpu6_regs import RegNames16, RegNames8
from cpu6_addr import Cpu6AddrMode
import struct

class BasicCpu6Inst:
    newpc = None
    def __init__(self, mnonomic, dst, src):
        self.mnemonic = mnonomic
        self.dst = dst
        self.src = src

    def to_string(self, dict):
        if self.src == None:
            return f"{self.mnemonic} {self.dst}"
        return f"{self.mnemonic} {self.dst}, {self.src}"

OPs = [
    "inc", "dec", "clr", "not", "srl", "sll", "rrc", "rlc",
    "add", "sub", "and", "or", "xor", "mov", "unk6", "unk7"
]

ImplcitTable = [
    (0x10, 6),
    (0x00, 6),
    (0x13, 14),
    (0x02, 12)
]

class AluInstance():
    def __init__(self, op, word, src, dest, postfix, literal):
        self.newpc = None
        self.op = op
        self.word = word
        self.src = src
        self.dest = dest
        self.postfix = postfix
        self.literal = literal

    def to_string(self, dict):
        op = OPs[self.op]
        op += self.postfix

        # mov with a literal ignores the second operand
        if self.op < 8 or (self.op == 13 and self.literal is not None):
            if self.word:
                str = f"{op} {RegNames16[self.src >> 1]}"
            else:
                str = f"{op} {RegNames8[self.src]}"
        else:
            if self.word:
                str = f"{op} {RegNames16[self.dest >> 1]}, {RegNames16[self.src >> 1]}"
            else:
                str = f"{op} {RegNames8[self.dest]}, {RegNames8[self.src]}"

        if self.literal is not None:
            str += f", #{self.literal:#06x}"

        return str

class AluWithImmInstance():
    def __init__(self, op, word, reg, imm):
        self.newpc = None
        self.op = op
        self.word = word
        self.reg = reg
        self.imm = imm

    def to_string(self, dict):
        op = OPs[self.op]

        if self.word:
            return f"{op} {RegNames16[self.reg >> 1]}, {self.imm}"
        else:
            return f"{op} {RegNames8[self.reg]}, {self.imm}"


def AluMatch(pc, memory):
    orig_pc = pc
    inst = memory[pc]
    pc += 1
    if inst < 0x20 or inst >= 0x5f:
        return None

    word = inst & 0x10 != 0
    fast = inst & 0x08 != 0
    op = inst & 0x07

    if inst >= 0x40:
        op += 8

    # These don't fit the pattern
    if inst & 0x0e == 0x0e or inst > 0x5b:
        return None

    postfix = ""
    literal = None

    if fast:
        if inst > 0x40:
            src = 0
            dest = 2
        else:
            src = 0
            dest = 0
        if not word:
            src += 1
            dest += 1

        postfix = '!'
    else:
        bytetwo = memory[pc]
        pc += 1
        dest = bytetwo & 0xf
        src = (bytetwo >> 4) & 0xf

        if inst & 0xe0 == 0x20:
            # This covers 20...27 and 30...37
            # These operations operate between a register and immediate,
            # which is encoded in low nibble ("dest")
            sub_op = inst & 0xef
            if sub_op != 0x22 and sub_op != 0x23:
                # Shifts and rotates effectively add 1 to 'imm' value
                dest += 1

            bytes = memory[orig_pc:pc]
            return InstructionMatch(orig_pc, AluWithImmInstance(op, word, src, dest), bytes, {})

        if inst < 0x40 and dest != 0:
            # these encoding make little sense, and there seems to be other instructions here
            return None

        expected, limit = ImplcitTable[op >> 4 - 2]
        if bytetwo == expected and op < limit:
            postfix = '*'

        if word and (src & 1 != 0):
            literal = get_be16(memory, pc)
            pc += 2

    bytes = memory[orig_pc:pc]
    return InstructionMatch(orig_pc, AluInstance(op, word, src, dest, postfix, literal), bytes, {})


# Implements the 46 "bignum" instructions
def Match46(pc, memory):
    orig_pc = pc

    a_size = memory[pc+1] >> 4
    b_size = memory[pc+1] & 0x0f
    a_mode = (memory[pc+2] >> 2) & 0x3
    b_mode = memory[pc+2] & 0x3

    op = memory[pc+2] >> 4
    ops = [
        "addbig", "subbig", "unkbig2", "unkbig3", "unkbig4", "unkbig5",
        "unkbig6", "unkbig7", "unkbig8", "unkbig9", "unkbigA", "unkbigB",
        "unkbigC", "unkbigD", "unkbigE", "unkbigF"
    ]

    pc += 3
    a_ref, pc = Cpu6AddrMode(a_mode, pc, memory)
    b_ref, pc = Cpu6AddrMode(b_mode, pc, memory, a_ref)

    bytes = memory[orig_pc:pc]
    return InstructionMatch(orig_pc, BasicCpu6Inst(f"{ops[op]}({b_size:x}, {a_size:x})", b_ref, a_ref), bytes, {})

# Implements all opcodes 0x80 and above
# Memory and load immediate
def MemoryMatch(pc, memory):
    orig_pc = pc
    inst = memory[pc]
    pc += 1

    if inst == 0xf6:
        load = True
        word = False

        bytetwo = memory[pc]
        offset_byte = memory[pc+1]
        pc += 2

        reg = (bytetwo >> 4) & 0xf
        index = bytetwo & 0xf

        reg_name = RegNames8[reg]
        index_name = RegNames16[index >> 1]
        op = ["ld", "st"][index & 1]
        addr = f"{struct.unpack_from('>xH', memory[orig_pc:])[0]:#06x}"

        offset = f"{struct.unpack_from('b', struct.pack('B', offset_byte))[0]:+#04x}"
        format = f"{op} {reg_name}, {offset}({index_name})"

        bytes = memory[orig_pc:pc]
        return InstructionMatch(orig_pc, QuickInstuction(format), bytes, {
            "reg": reg_name,
            "index": index_name,
            "addr": addr,
            "offset": offset,
        })

    elif inst & 0x80 == 0x80:
        # Instructions that operate on A & B
        # bit 6: Accumulator select - 0 for "A", 1 for "B"
        reg = 0 if inst & 0x40 == 0 else 2
        # bit 5: Direction - 0 for read, 1 for write
        load = inst & 0x20 == 0
        # bit 4: Length - 0 for byte, 1 for word
        word = inst & 0x10 != 0
        if not word:
            reg += 1

        address_mode = inst & 0xf
    elif inst & 0xf0 == 0x60:
        # Instructions that operate on RT
        reg = 4
        word = True

        load = inst & 0x08 == 0
        address_mode = inst & 0x07
    else:
        return None


    index_name = None
    if address_mode == 0b101:
        index = memory[pc] >> 4
        index_name = RegNames16[index >> 1]
    elif address_mode & 0b1000:
        index = (address_mode & 0x7) << 1
        index_name = RegNames16[index >> 1]

    if word:
        reg_name = RegNames16[reg >> 1]
    else:
        reg_name = RegNames8[reg]


    address_modes = [
        (1 + word, "#{addr}"),               # 000 = immediate
        (2, "({addr})"),        # 001 = direct
        (2, "@({addr})"),
        (1, "(PC{offset})"),
        (1, "@(PC{offset})"), # 100 = PC relative
        (1, "indexed_modes"), # 101 = indexed with increment
        (1, "unknown"),
        (1, "unknown"),
        (0, "({index})"),     # indexed
        (0, "({index})"),
        (0, "({index})"),
        (0, "({index})"),
        (0, "({index})"),
        (0, "({index})"),
        (0, "({index})"),
        (0, "({index})"),
    ]

    indexed_modes = [
        "({index})", # guess
        "({index})+",
        "-({index})",
        "unknown_indexed",
        "unknown_indexed",
        "unknown_indexed",
        "unknown_indexed",
        "unknown_indexed",
        "{offset}({index})", # guess
        "{offset}({index})+",
        "{offset}-({index})",
        "unknown_indexed",
        "unknown_indexed",
        "unknown_indexed",
        "unknown_indexed",
        "unknown_indexed",
    ]

    offset_byte = memory[pc]
    addr = f"{struct.unpack_from('>H', memory[pc:])[0]:#06x}"

    if address_mode == 0 and not word:
        addr = addr[:4]

    format = ["st", "ld"][load]

    size, addr_format = address_modes[address_mode]
    if address_mode == 5:
        indexed_mode = memory[pc] & 0x0f
        addr_format = indexed_modes[indexed_mode]
        if indexed_mode & 8 != 0:
            offset_byte = memory[pc+1]
            size += 1

    offset = f"{struct.unpack_from('b', struct.pack('B', offset_byte))[0]:+#04x}"

    format = f"{format} {reg_name}, {addr_format}"
    pc += size

    bytes = memory[orig_pc:pc]
    return InstructionMatch(orig_pc, QuickInstuction(format), bytes, {
        "reg": reg_name,
        "index": index_name,
        "addr": addr,
        "offset": offset,
    })



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
    I("xxxxxxxx"),
]

instructions  = [
    I("01111110 NNNNNNNN", "push"),
    I("01111111 NNNNNNNN", "pop"),
    I("01100110 NNNNNNNN", "jsys"),

    I("01011011", "mov X, A"),

    # Special cases that don't match the general ALU pattern
    I("00101110 ssssdddd", "?? r{d}, r{s}"),
    # ugly, but indexing dynamic indexing into RegNames16 isn't supported :(
    I("00101111 00000000", "dma_load_addr {RegNames16[0]}"),
    I("00101111 00100000", "dma_load_addr {RegNames16[1]}"),
    I("00101111 01000000", "dma_load_addr {RegNames16[2]}"),
    I("00101111 01100000", "dma_load_addr {RegNames16[3]}"),
    I("00101111 10000000", "dma_load_addr {RegNames16[4]}"),
    I("00101111 10100000", "dma_load_addr {RegNames16[5]}"),
    I("00101111 00000010", "dma_load_count {RegNames16[0]}"),
    I("00101111 00100010", "dma_load_count {RegNames16[1]}"),
    I("00101111 01000010", "dma_load_count {RegNames16[2]}"),
    I("00101111 01100010", "dma_load_count {RegNames16[3]}"),
    I("00101111 10000010", "dma_load_count {RegNames16[4]}"),
    I("00101111 10100010", "dma_load_count {RegNames16[5]}"),
    I("00101111 00000001", "dma_store_addr {RegNames16[0]}"),
    I("00101111 00100001", "dma_store_addr {RegNames16[1]}"),
    I("00101111 01000001", "dma_store_addr {RegNames16[2]}"),
    I("00101111 01100001", "dma_store_addr {RegNames16[3]}"),
    I("00101111 10000001", "dma_store_addr {RegNames16[4]}"),
    I("00101111 10100001", "dma_store_addr {RegNames16[5]}"),
    I("00101111 00000011", "dma_store_count {RegNames16[0]}"),
    I("00101111 00100011", "dma_store_count {RegNames16[1]}"),
    I("00101111 01000011", "dma_store_count {RegNames16[2]}"),
    I("00101111 01100011", "dma_store_count {RegNames16[3]}"),
    I("00101111 10000011", "dma_store_count {RegNames16[4]}"),
    I("00101111 10100011", "dma_store_count {RegNames16[5]}"),

    I("00101111 dddd0100", "dma_set_mode {d}"),
    I("00101111 00000110", "dma_enable"),


    I("00101111 xxxxNNNN", "dma? {x}, {N}"),

# 30
    I("00111110", "inc {RegNames16[2]}"),
    I("00111111", "dec {RegNames16[2]}"),

# 48
    # Special cases that don't match the general ALU pattern
    I("01011100", "mov {RegNames16[3]}, {RegNames16[0]}"),
    I("01011101", "mov {RegNames16[1]}, {RegNames16[0]}"),
    I("01011110", "mov {RegNames16[4]}, {RegNames16[0]}"),
    I("01011111", "mov {RegNames16[5]}, {RegNames16[0]}"),

# 60
    # ld.w RT, .... instruction are here. Handled by Memory()

# 70

    B("01110001 NNNNNNNN NNNNNNNN", "jump #{N:#06x}", abolsute_branch_uncondtionional),
    B("01110010 NNNNNNNN NNNNNNNN", "jump @({N:#06x})", kill_branch),
    B("01110011 SSSSSSSS", "jump (PC{S:+#05x})", relative_branch_unconditional),
    B("01110101 NNNNNNNN", "jump (A + {N:#04x})", kill_branch),
    B("01110110", "syscall", kill_branch), # "Return to interrupt level 15"

# 78

    B("01111001 NNNNNNNN NNNNNNNN", "call #{N:#06x}", absolute_call),
    I("01111010 NNNNNNNN NNNNNNNN", "call @({N:#06x})"),
    B("01111100 SSSSSSSS", "call @(PC{S:+#05x})", indirect_relative_call),
    B("01111011 SSSSSSSS", "call (PC{S:+#05x})", relative_call),
    I("01111101 NNNNNNNN", "call (A + {N:#04x})"),

    I("xxxxxxxx"),
]

def disassemble_instruction(memory, pc):
    byte = memory[pc]

    match byte >> 4:
        case 0:
            return scan(control_instructions, memory, pc, 1)
        case 1:
            return scan(branch_instructions, memory, pc, 2)
        case 2 | 3 | 4 | 5:
            match byte:
                case 0x2e:
                    pass
                case 0x2f:
                    pass
                case 0x46:
                    return Match46(pc, memory)
                case 0x47:
                    pass
                case 0x5b:
                    pass
                # case 0x55:
                #     pass
                # case n if n & 0x40 and n & 0xf > 0xa:
                #     pass
                case _:
                    if alu := AluMatch(pc, memory):
                        return alu
        case 7:
            pass
        case _:
            if mem := MemoryMatch(pc, memory):
                return mem

    return scan(instructions, memory, pc, 3)

__all__ = ["disassemble_instruction", "entry_points", "memory_addr_info"]