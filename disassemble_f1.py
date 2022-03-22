#!/usr/bin/env python3

filename = "roms/Diag_F1_Rev_1.0.BIN"

from diag_common import *


base_address = 0x8000

entry_points = [
    0x8077,
    0x8055,
    0x8482,
]

strings = [
    0x85b3,
    0x8614,
    0x8734,
    0x8788,
]

functions = [
    (0x850e, "WriteByte"),
    (0x8519, "WriteHexByte"),
    (0x8520, "WriteHexNibble"),
    (0x8566, "WriteByteTramp"),
    (0x8623, "WriteString"),
    (0x8634, "ReadChar"),
    (0x8728, "AuxiliaryTestMenu"),
    (0x8557, "CheckForReset"),
    (0x8482, "TOS_Entry"),
    (0x8500, "ReadByteWithEcho"),
    (0x8568, "AsciiToHexNibble"), # sets flags if conversion fails
    (0x853a, "ReadHexWord"),
]

lables = [
    (0x8774, "NextRom"),
    (0x84a3, "TOS_PromptLoop"),
    (0x84bf, "G_Command"),
    (0x84c3, "Q_Command"),
    (0x8001, "DiagEntryPoint"),

]

comments = [
    (0x8002, "This is the first word in Diag's 1KB of RAM"),
    (0x8013, "Set stack pointer just beyond top of Diag's 1KB of RAM"),

    (0x801b, "This is writing a pointer directly into registers."),
    (0x801f, "Something really funky is going on here."),
    (0x8022, "I assume this is calling or jumpting to that function"),

    (0x8024, "Turn Decimal Point 1 off"),
    (0x8027, "Turn Decimal Point 2 off"),
    (0x802a, "Turn Decimal Point 3 off"),
    (0x802d, "Turn Decimal Point 4 off"),
    (0x8030, "A = Dip swiches value"),
    (0x8035, "A = A & 0x0f"),
    (0x8037, "Write A to hex displays"),
    (0x803a, "Unblank the hex displys"),
    (0x803f, "Compare with 0b1011"),

    (0x8042, "If dipswitches == 0xb111: \n"
             "    Display Auxiliary Test Menu"),




    (0x8498, "Configure UART"),
    (0x84a3, "'\'"),
    (0x84b0, "'G'"),
    (0x84b5, "'Q'"),

    (0x84ba, "Start of ROM"),



    (0x8500, "Jumps back to the start of F1 if some condition is met"),

    (0x853c, "This is a DIAG IO port"),

    (0x875b, "will wrap around to 0x800, the length of each ROM"),
    (0x8774, "will wrap around to 0x800, the length of each ROM"),
    (0x8769, "'='"),
    (0x8770, "Write string"),


]

if __name__ == "__main__":
    with open(filename, "rb") as f:
        bytes = f.read()

    memory = b"\0" * (base_address) + bytes + b"\0" * (0x10000 - (len(bytes) + base_address))
    entry_points.append(0x8001)

    entry_points.append(0x8077)
    entry_points.append(0x808e)
    entry_points.append(0x811b)
    entry_points.append(0x8171)
    entry_points.append(0x8183)
    entry_points.append(0x81d1)
    entry_points.append(0x81a3)
    entry_points.append(0x8203)
    entry_points.append(0x826f)
    entry_points.append(0x8284)
    entry_points.append(0x82e3)
    entry_points.append(0x8247)
    entry_points.append(0x837f)
    entry_points.append(0x8467)
    entry_points.append(0x846f)
    entry_points.append(0x859d)
    entry_points.append(0x864d)
    entry_points.append(0x86b2)

    for (addr, name) in functions:
        memory_addr_info[addr].label = name
        entry_points.append(addr)

    for (addr, name) in lables:
        memory_addr_info[addr].label = name

    for addr in strings:
        add_string(memory, addr)

    apply_comments(comments)


    disassemble(memory, entry_points)
