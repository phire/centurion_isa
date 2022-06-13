import struct

Syscalls = {
    0x09: "Abort",
}

# Syscall table
for num, addr in enumerate(range(0x88cc, 0x89ac, 2)):
    syscall_addr = struct.unpack(">H", memory[addr:addr+2])[0]

    if syscall_addr == 0:
        memory_addr_info[addr].type = ">H"
        continue

    memory_addr_info[addr].type = "fnptr"
    entry_points.append(syscall_addr)
    label = f"Syscall_{num:02x}"
    if num in Syscalls:
        label = f"Syscall_{Syscalls[num]}"
    memory_addr_info[syscall_addr].label = f"Syscall_{num:02x}"


def add_device(addr):
    name = bytes([c&0x7f for c in memory[addr+7:addr+13]]).decode("ascii").strip()
    memory_addr_info[addr].label = f"Device_{name}"
    memory_addr_info[addr].type = "char[1]"
    memory_addr_info[addr+1].type = ">H"
    memory_addr_info[addr+3].type = "fnptr"
    memory_addr_info[addr+5].type = "fnptr"
    memory_addr_info[addr+5].label = f"Device_{name}_Obj"
    memory_addr_info[addr+7].type = 'char[6]'
    memory_addr_info[addr+15].type = "fnptr"

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

    memory_addr_info[addr].type = "fnptr"
    add_device(device_addr)
    device_num += 1

#memory_addr_info[0xce38].visited = True