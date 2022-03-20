#!/usr/bin/env python3

from disassemble import *

filename = "bootstrap_unscrambled.bin"
base_address = 0xfc00

entry_points = [
    0xfc00,

    # Our disasmebler doesn't currently find all code in bootstrap ROM, so we manually add some
    # extra entry points for now
    0xfd1c,
    0xfd1e,
    0xfdad,
]

functions = [
    (0xfc92, "WriteString"),
    (0xfc90, "ReadCharTrampoline"),
    (0xfca3, "ReadChar"),

]

def add_string(mem, address):
    memory_addr_info[address].visited = True
    memory_addr_info[address].type = "cstring"

    while True:
        if mem[address] == 0:
            break
        address += 1

     # resume execution after string
    address += 1
    entry_points.append(address)

if __name__ == "__main__":
    with open(filename, "rb") as f:
        bytes = f.read()

    memory = b"\0" * (base_address) + bytes + b"\0" * (0x10000 - (len(bytes) + base_address))

    for (addr, name) in functions:
        memory_addr_info[addr].label = name
        entry_points.append(addr)

    add_string(memory, 0xfc19) # "D=?\0"
    add_string(memory, 0xfc81) # "\r\nERROR\r\n\0"

    disassemble(memory, entry_points)
