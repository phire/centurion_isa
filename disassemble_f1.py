#!/usr/bin/env python3

filename = "Diag_F1_Rev_1.0.BIN"

from diag_common import *


base_address = 0x8000

functions = [
    (0x850e, "ReadByte"),
    (0x8566, "ReadByteTramp"),
    (0x8623, "WriteString"),
    (0x8634, "ReadChar"),
    (0x8728, "AuxiliaryTestMenu"),
]

strings = [
    0x85b3,
    0x8614,
    0x8734,
    0x8788,
]

comments = [
    (0x8002, "Probally setting the 7 segment LEDs to 0 0"),
    (0x875b, "will wrap around to 0x800, the length of each ROM"),
    (0x8774, "will wrap around to 0x800, the length of each ROM"),

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
    entry_points.append(0x82a3)
    entry_points.append(0x82e3)

    for (addr, name) in functions:
        memory_addr_info[addr].label = name
        entry_points.append(addr)

    for addr in strings:
        add_string(memory, addr)

    apply_comments(comments)


    disassemble(memory, entry_points)
