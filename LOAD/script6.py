import struct

import sys
print(__name__, __file__, file=sys.stderr)

from .syscalls import *

def annotate(memory, entry_points, memory_addr_info):

    syscall_annotate(memory, entry_points, memory_addr_info, 0x88cc, 0x89ac)

    def add_device(addr):
        name = bytes([c&0x7f for c in memory[addr+7:addr+13]]).decode("ascii").strip()
        memory_addr_info[addr].label = f"Device_{name}"
        memory_addr_info[addr].type = "B"
        memory_addr_info[addr+1].type = "B"
        memory_addr_info[addr+2].type = "B"
        memory_addr_info[addr+2].label = f"Device_{name}_number"
        memory_addr_info[addr+3].type = "ptr"
        memory_addr_info[addr+5].type = "ptr"
        memory_addr_info[addr+7].type = 'char[6]'

        if name.startswith("DISK"):
            memory_addr_info[addr+0x11].type = ">H"
            memory_addr_info[addr+0x11].label = f"Device_{name}_TotalTracks"
            memory_addr_info[addr+0x13].type = "B"
            memory_addr_info[addr+0x14].type = "ptr"
            memory_addr_info[addr+0x17].type = ">H"
            memory_addr_info[addr+0x17].comment = f"Set to the user supplied boot Code"
        if name.startswith("CRT"):
            memory_addr_info[addr+15].type = "ptr"


    # Devices table (might be special files?)
    table_start = 0x01ba
    memory_addr_info[table_start].Label = "Devices"
    device_num = 0
    while True:
        addr = table_start + (device_num * 2)
        device_addr = struct.unpack(">H", memory[addr:addr+2])[0]

        if device_addr == 0:
            memory_addr_info[addr].type = ">H"
            memory_addr_info[addr].label = "DevicesEnd"
            break

        memory_addr_info[addr].type = "ptr"
        add_device(device_addr)
        device_num += 1

    def func(addr, name, xargs):
        if name:
            memory_addr_info[addr].label = name
        if xargs:
            memory_addr_info[addr].func_info = FunctionInfo(xargs)


    func(0x85fa, "FlushFn", {"fileop": "ptr"})
    func(0xcd4d, None, {"dest": "ptr"})
    func(0xb4f8, "PrintStringToErrorDevice", {"string": "ptr"})
    func(0x85b9, None, {"arg1": "byte"})
    func(0xb5f2, None, {
        "fileHandle": "ptr",
        "size": "word",
        "diskNum": "byte",
        "SectorNum" : "word",
        "Buffer" : "ptr",
        "arg6": "byte",
    })


    for i in range(0xdb30, 0xdca0, 21):
        memory_addr_info[i].type = "char[21]"

    for i in range(0xdd2f, 0xde00, 21):
        memory_addr_info[i].type = "char[21]"

    for i in range(0xde72, 0xdf00, 21):
        memory_addr_info[i].type = "char[21]"

    # TOS Command table
    # Gets indexed by the letter in the range A-Z
    num = 0
    for i in range(0xe935, 0xe968, 2):
        key = chr(ord('A') + num)
        num += 1
        memory.info(i).type = ">h"

        offset = memory.get_be16(i)
        if offset == 0:
            continue

        # not a pointer directly to the function,
        if offset < 0x7fff:
            # if it's positive, we add it directly to the offset
            dest = 0xe399 + offset
        else:
            dest = 0xe399 + (0x10000 - offset)


        label = memory.get_label(dest)
        if not label:
            label = f"TOS_Command{key}"
            memory.info(dest).label = label
            memory_addr_info[i].comment = memory.get_label(dest)
        memory.info(i).comment = f"Key: {key} -> {label}"
        entry_points += [dest]
