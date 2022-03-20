#!/usr/bin/env python3

from disassemble import *

filename = "bootstrap.bin"
base_address = 0xfc00

entry_points = [
    0xfc00,
    0xfc31,
    0xfc3c,
    0xfd5a,
    0xfd6d,
]

if __name__ == "__main__":
    with open(filename, "rb") as f:
        bytes = f.read()

    memory = b"\0" * (base_address) + bytes + b"\0" * (0x10000 - (len(bytes) + base_address))

    memory_addr_info[0xfd01].label = "s_error"
    memory_addr_info[0xfd01].visited = True
    memory_addr_info[0xfd01].type = "cstring"

    disassemble(memory, entry_points)
