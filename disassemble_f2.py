#!/usr/bin/env python3

filename = "Diag_F2_Rev_1.0.BIN"

from diag_common import *


base_address = 0x8800

functions = [
    (0x7cc, "WriteString"),

]

strings = [
    0x8f76,
    0x8f8c,
    0x8fa8,
    0x8850,
    0x8dc2,
    0x8dfc,
]

if __name__ == "__main__":
    with open(filename, "rb") as f:
        bytes = f.read()

    memory = b"\0" * (base_address) + bytes + b"\0" * (0x10000 - (len(bytes) + base_address))

    scan_calls(memory, base_address, base_address)

    print(entry_points)

    for (addr, name) in functions:
        memory_addr_info[base_address + addr].label = name
        entry_points.append(base_address + addr)

    for addr in strings:
        add_string(memory, addr)

    body_addr = parse_header(memory, base_address, base_address)

    #scan_strings(memory, body_addr)


    disassemble(memory, entry_points)
