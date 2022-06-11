import struct

Syscalls = {

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
        label = Syscalls[num]
    memory_addr_info[syscall_addr].label = f"Syscall_{num:02x}"
