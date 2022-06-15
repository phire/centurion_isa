#!/usr/bin/env python3

from collections import defaultdict
import struct
from cpu6 import disassemble_instruction
from generic import memory_addr_info, entry_points, MemInfo, TransferExecution

def recursive_disassemble(mem, entry):
    valid = True
    pc = entry
    while valid and pc < 0xfe00:
        if mem.visited(pc):
            return

        mem.info(pc).visited = True

        info = disassemble_instruction(mem, pc)
        valid = info.valid

        for i in range(pc+1, pc + len(info.bytes)):
            if mem.info(i).visited:
                valid = False

        if valid:
            mem.info(pc).instruction = info

        if len(info.next_pc) == 0:
            return

        for next_pc in info.next_pc[1:]:
            if isinstance(next_pc, TransferExecution):
                if mem.info(next_pc()).label == None:
                    mem.info(next_pc()).label = f"L_{next_pc():04x}"
            recursive_disassemble(mem, next_pc())

        next_pc = info.next_pc[0]

        if isinstance(next_pc, TransferExecution):
            if mem.info(next_pc()).label == None:
                mem.info(next_pc()).label = f"L_{next_pc():04x}"
        pc = next_pc()

def escape_char(c):
    # if char is printable, print it
    if c >= 32 and c <= 126:
        return chr(c)
    elif c == 10: # else escape it
        return "\\n"
    elif c == 13:
        return "\\r"
    else:
        return f"\\x{c:02x}"

def get_pstring16_length(mem, addr):
    # Parity is still applied to length bytes
    return mem.get_be16(addr) & 0x7f7f


class Xargs():
    def __init__(self, xargs):
        self.xargs = xargs

    def annotate(self, mem, pc):
        for name, arg in self.xargs.items():
            info = mem.info(pc)
            info.arg_name = name
            match arg:
                case "ptr":
                    info.type = "ptr"
                    pc += 2
                case "word":
                    info.type = ">H"
                    pc += 2
                case "byte" | "char":
                    pc += 1
                    info.type = "B"
                case "cstring":
                    info.type = "cstring"
                    while mem[pc] != 0:
                        pc += 1
        return pc


class MemoryWrapper:
    def __init__(self, memory):
        self.memory = memory
        self.labels = {}
        self.syscall_map = {}
        self.top = 0xffff

    def __getitem__(self, key):
        return self.memory.__getitem__(key)

    def get_label(self, addr):
        if addr in memory_addr_info:
            return memory_addr_info[addr].label
        return None

    def get_xargs(self, addr):
        if memory_addr_info[addr].func_info:
            if memory_addr_info[addr].func_info.xargs:
                return Xargs(memory_addr_info[addr].func_info.xargs)
        return None

    def get_u8(self, addr):
        return struct.unpack_from('B', self.memory[addr:])[0]

    def get_be16(self, addr):
        return struct.unpack_from('>H', self.memory[addr:])[0]

    def get_i8(self, addr):
        return struct.unpack_from('b', self.memory[addr:])[0]

    def is_fixup(self, addr):
        return addr in memory_addr_info and memory_addr_info[addr].fixup

    def visited(self, addr):
        return addr in memory_addr_info and memory_addr_info[addr].visited

    def info(self, addr):
        return memory_addr_info[addr]

    def read_only_info(self, addr):
        # like info(), but doesn't create a new entry in the DefaultDict
        return memory_addr_info[addr] if addr in memory_addr_info else MemInfo()

    def hasInfo(self, addr):
        if addr in memory_addr_info:
            return (memory_addr_info[addr].label
                or memory_addr_info[addr].comment
                or memory_addr_info[addr].type)
        return False

def tochar(byte):
    c = chr(byte&0x7f)
    if byte > 0x80 and c.isprintable():
        return True, c
    return False, '.'

def disassemble(memory):
    for entry in entry_points:
        recursive_disassemble(memory, entry)

    skipping = True # Ignore null bytes at start of memory

    i = 0
    while i < 0xfe00:
        info = memory.read_only_info(i)

        if info.label:
            print(f"\n{info.label}:")
            skipping = False

        # Skip large blocks of zeros, but only if they don't have lables/comments
        if memory[i] == 0 and memory[i:i+10] == b"\x00" * 10:
            if not skipping:
                print(f"{i:04x}:    <null bytes>\n")
                skipping = True
            i += 1
            while i < memory.top and memory[i] == 0 and not memory.hasInfo(i):
                i += 1
            continue

        if info.pre_comment:
            # Make sure an empty line is present in front of pre_comment
            # This aids proper parsing it back by extract_comments.py
            if not info.label:
                print("")
            lines = info.pre_comment.split("\n")
            for line in lines:
                print(f"    ; {line}")

        start_addr = i
        out = ""
        data = bytes()

        # For data that follows a call
        if info.arg_name:
            out = f"    {info.arg_name} = "

        if info.type == "cstring":
            out += '"'

            while c := memory[i] & 0x7f:
                out += escape_char(c)
                i += 1
            out += '\\0"'

            i += 1

        elif info.type == "pstring16":
            # Pascal-style string, prefixed by a WORD of length.
            # Note high bit still needs to be stripped
            l = get_pstring16_length(memory, i)
            out += f"{l:d}, \""
            i += 2

            for j in range(0, l):
                c = memory[i + j] & 0x7f
                out += escape_char(c)
            out += "\""

            i += l

        elif info.type in ["fnptr", "ptr"]:
            # 16 bit absolute pointer
            addr = memory.get_be16(i)
            label = memory.info(addr).label
            if label == None:
                label = memory.info(addr).label = f"L_{addr:04x}"
            data = memory[i:i+2]
            out += f"{label}"
            i += 2

        elif info.type and info.type.startswith("char["):
            # fixed length string
            str_len = int(info.type[5:-1])
            data = memory[i:i+str_len]
            i += str_len

            stripped_data = bytes([c & 0x7f for c in data]) # strip high bit
            string = stripped_data.decode("ascii", errors="replace")
            out += f"\"{string}\""


        elif info.type != None:
            value = struct.unpack_from(info.type, memory[i:])[0]
            data = struct.pack(info.type, value)

            i += len(data)
            out += f"({value:#x})"

        elif info.instruction:
            inst = info.instruction
            data = inst.bytes

            out += inst.to_string(memory)

            i += len(inst.bytes)

        else:
            out += f"{memory[i]:02x}"
            is_printable, c = tochar(memory[i])
            if is_printable:
                out += f" '{c}'"
            i += 1

        def print_bytes(bytes):
            str = ""
            if len(bytes) != 0:
                for b in bytes:
                    str += f"{b:02x} "
                str += " " * (23 - len(str))
            return str

        out = f"{start_addr:04x}:    {print_bytes(data)}{out}"

        if info.comment:
            indent = len(out)
            lines = info.comment.split("\n")
            out += f"\t ; {lines[0]}"
            for line in lines[1:]:
                out += "\n" + " " * indent + f"\t ; {line}"
        print(out.strip())

def apply_comments(comments):
    for addr, comment in comments:
        memory_addr_info[addr].comment = comment

def read_annotations(name, memory):
    with open(name, "r") as f:
        for line in f.readlines():
           if len(line) == 0 or line[0] == "#":
               continue
           comment_pos = line.find(';')
           if comment_pos == -1:
               comment = None
           else:
               comment = line[comment_pos + 1:].strip()
               line = line[:comment_pos]

           items = line.split(',', 2)
           addr_str = items[0].strip()

           if addr_str == "":
               # No address specified.
               # This is a continuation of a multi-line comment
               text = "\n" + comment
               if pre_comment:
                   memory.info(last_comment).pre_comment += text
               else:
                   memory.info(last_comment).comment += text
               continue

           address = int(addr_str, 0)
           if len(items) < 2:
               type = ""
           else:
               type = items[1].strip()
               # "comment" is optional, a missing or empty field has the same meaning
               if type == "comment":
                   type = ""

           if type == "pre_comment":
               memory.info(address).pre_comment = comment
               last_comment = address
               pre_comment = True
               continue

           if type == "code":
               entry_points.append(address)
               if len(items) > 2:
                   label = items[2].strip()
               else:
                   label = f"Entry_{hex(address)}"
               memory.info(address).label = label
           elif type == "fnptr":
                # 16 bit absolute function pointer
                memory.info(address).type = "fnptr"
                ptr_addr = memory.get_be16(address)
                entry_points.append(ptr_addr)

           elif type == "label":
               memory.info(address).label = items[2].strip()
           elif type != "":
               memory.info(address).visited = True
               memory.info(address).type = type
               # Data is often embedded in the code, generate an entry point at the end
               # so that disassembly continues.
               if type[0:2] == ">B":
                   entry_points.append(address + 1)
               elif type[0:2] == ">H":
                   entry_points.append(address + 2)
               elif type == "cstring":
                   while c := memory[address] & 0x7f:
                       address += 1
                   entry_points.append(address + 1)
               elif type == "pstring16":
                   pass
                   #entry_points.append(address + 2 + get_pstring16_length(memory, address))

           if comment is not None:
               memory.info(address).comment = comment
               last_comment = address
               pre_comment = False

def main():
    import argparse
    import sys

    all_args = argparse.ArgumentParser()

    all_args.add_argument("-i", "--input", required=True, help="input file")
    all_args.add_argument("-s", "--start", required=False, help="starting address of this file")
    all_args.add_argument("-t", "--type", required=False, help="type of file", default="binary")
    all_args.add_argument("-a", "--annotations", action='append', help="annotations file")
    all_args.add_argument("--script", action='append', help="script file")
    args = vars(all_args.parse_args())

    filename = args["input"]
    if args["type"] == "binary":
        if args["start"] is None:
            print("Start must be specified for binary files")
            sys.exit(1)
        base_address = int(args["start"], 16)

        entry_points.append(base_address)
        memory_addr_info[base_address].label = "Start"

    with open(filename, "rb") as f:
        data = f.read()

    if args["type"] == "binary":
        memory = b"\0" * (base_address) + data + b"\0" * (0x10000 - (len(data) + base_address))
    if args["type"] == "wecb":
        memory = b"\0" * 0x10000
        from wecb import WecbLoader

        wecb = WecbLoader(data)

        for type, addr, data in wecb.sections():
            if type == 0:
                memory = memory[:addr] + data + memory[addr + len(data):]
            elif type == 1:
                while len(data) > 1:
                    fixup = struct.unpack_from(">H", data)[0]
                    memory_addr_info[fixup].fixup = addr

                    old_value = struct.unpack(">H", memory[fixup:fixup+2])[0]
                    new_addr = old_value + addr
                    new_value = struct.pack(">H", (new_addr) & 0xffff)
                    memory = memory[:fixup] + new_value + memory[fixup + 2:]
                    data = data[2:]
                    entry_points.append(new_addr)
                    memory_addr_info[new_addr].label = f"R_{new_addr:04x}"
                    #memory_addr_info[fixup].label = f"F_{fixup:04x}"

    mem = MemoryWrapper(memory)

    if args["annotations"]:
        for ann_filename in args["annotations"]:
            read_annotations(ann_filename, mem)

    if args["script"]:
        for script_filename in args["script"]:
            with open(script_filename, "r") as f:
                ast = compile(f.read(), script_filename, 'exec')
            script_globals = {
                'memory': mem,
                'memory_addr_info': memory_addr_info,
                'entry_points': entry_points}
            exec(ast, script_globals, script_globals)

    disassemble(mem)

if __name__ == "__main__":
    main()
