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
    0xfcfe,
    0xfcba,
]

functions = [
    (0xfc92, "WriteString"),
    (0xfc90, "ReadCharTramp"),
    (0xfca3, "ReadChar"),
    (0xfd11, "DiskCommand"), # takes arguments from pc
]

comments = [
    (0xfc09, "Configure the first port on the mux board to 9600 baud, 8N1"),
    (0xfc0e, "Write control code FF aka Form Feed to serial\n"
             "Should cause a printer to move to the next page, and\n"
             "cause a CRT terminal to clear the screen"),
    (0xfc16, "Setup stack at 0x1000 (probally)"),
    (0xfc1e, "A == 'F'"),
    (0xfc25, "A == 'C'"),
    (0xfc2a, "A == 'H'"),
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

    apply_comments(comments)

    disassemble(memory, entry_points)
