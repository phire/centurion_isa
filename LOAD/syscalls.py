from cpu6.info import FunctionInfo

Syscalls = {
    0x02: ("02", {"DiskNum": "byte", "Filename": "ptr", "Buffer": "word", "arg4": "byte"}),
    0x04: ("04", {"arg1": "ptr", "arg2": "ptr", "arg3": "byte"}),
    0x05: ("05", {"arg1": "byte"}), # fixme, can't follow whole function. probally wrong
    0x06: ("06", {"arg1": "byte"}), # same as 12, but takes arg on X
    0x07: ("Yield", None),
    0x08: ("Flush", {"op_struct": "ptr"}),
    0x09: ("Abort", {"abort_code": "byte"}),
    0x0c: ("0c", None),
    0x0e: ("OpenFile?", {"arg1" : "ptr"}),
    0x10: ("DoFileOp", None),
    0x12: ("12", None), # same as 06, but takes arg in A
    0x16: ("16", {"arg1": "word", "out": "word"}),
    0x17: ("17", {"arg1": "word"}),
    #19
    0x1a: ("1a", None),


    0x4c: ("4c", {
        "size" : "word",
        "fileHandle" : "word",
        "disknum" : "byte",
        "SectorNum" : "word",
        "Buffer" : "ptr",
        "arg6" : "byte"}),
    0x4f: ("4f", {"arg1" : "word", "arg2" : "ptr" }),
    0x55: ("55", {"arg1" : "word" }),
    0x57: ("57", {"arg1" : "word", "arg2" : "word", "arg3" : "byte" }),
    0x59: ("59", None),
    0x5a: ("5a", None),
    0x64: ("64", {"filename" : "ptr", "arg2" : "word"}),
    0x65: ("65", {"arg1" : "word"}),
    0x6b: ("AbortAL", None), # Same as 09 Abort, but abort_code is passed via AL

    # These aren't used within @LOAD

    0x0b: ("UptimeDays", None),
    0x15: ("GetUptimeAB", None),
    0x1b: ("GetUptimePtr", {"dest": "ptr"}),
    0x1c: ("GetClock?", {"dest": "ptr"}),
    0x2b: ("multiply", None),
    0x2c: ("divide", None),
}

def syscall_annotate(mem, entry_points, memory_addr_info, table_start, table_end):
    syscall_map = {}

    entry_points.append(0x100) # jsys entry

    # Syscall table
    for num, addr in enumerate(range(table_start, table_end, 2)):
        syscall_addr = mem.get_be16(addr)
        if syscall_addr == 0:
            memory_addr_info[addr].type = ">H"
            continue

        memory_addr_info[addr].type = "fnptr"
        entry_points.append(syscall_addr)
        label = f"Syscall_{num:02x}"
        if num in Syscalls:
            (label, xargs) = Syscalls[num]
            label = f"Syscall_{label}"
            memory_addr_info[syscall_addr].func_info = FunctionInfo(xargs)

        syscall_map[num] = syscall_addr
        memory_addr_info[syscall_addr].label = label

    mem.syscall_map = syscall_map
