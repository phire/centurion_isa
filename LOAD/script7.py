import struct
from cpu6.info import FunctionInfo

from syscalls import syscall_annotate

def annotate(memory, entry_points, memory_addr_info):

    syscall_annotate(memory, entry_points, memory_addr_info, 0x8a21, 0x8a21 + (0x5a * 2))

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
    table_start = memory.get_be16(0x109) # seems to be hardcoded across versions
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

    # some kind of jump table:
    memory_addr_info[0xc325].label = "Unk40jumptable"
    for addr in range(0xc325, 0xc389, 2):
        memory_addr_info[addr].type = "fnptr"
