#!/usr/bin/env python3

from collections import defaultdict
import struct
from cpu6 import disassemble_instruction
from generic import memory_addr_info, entry_points, MemInfo, get_be16

def recursive_disassemble(memory, entry):
    valid = True
    pc = entry
    while valid and pc < 0xfe00:
        if memory_addr_info[pc].visited:
            return

        memory_addr_info[pc].visited = True

        info = disassemble_instruction(memory, pc)
        valid = info.valid

        for i in range(pc+1, pc + len(info.bytes)):
            if memory_addr_info[i].visited:
                valid = False

        if valid:
            memory_addr_info[pc].instruction = info

        if len(info.next_pc) == 0:
            return

        for next_pc in info.next_pc[1:]:
            if memory_addr_info[next_pc].label == None:
                memory_addr_info[next_pc].label = f"L_{next_pc:04x}"
            recursive_disassemble(memory, next_pc)

        next_pc = info.next_pc[0]

        if next_pc != pc + len(info.bytes):
            if memory_addr_info[next_pc].label == None:
                memory_addr_info[next_pc].label = f"L_{next_pc:04x}"
        pc = next_pc

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

def get_pstring16_length(memory, addr):
    # Parity is still applied to length bytes
    return get_be16(memory, addr) & 0x7f7f

class MemoryWrapper:
    def __init__(self, memory):
        self.memory = memory
        self.labels = {}

    def get_label(self, addr):
        if addr in memory_addr_info:
            return memory_addr_info[addr].label
        return None

    def get_u8(self, addr):
        return self.memory[addr]

    def get_be16(self, addr):
        return get_be16(self.memory, addr)

def tochar(byte):
    c = chr(byte&0x7f)
    if byte > 0x80 and c.isprintable():
        return True, c
    return False, '.'

def disassemble(memory):
    for entry in entry_points:
        recursive_disassemble(memory, entry)

    mem = MemoryWrapper(memory)

    i = 0
    while i < 0xfe00:
        if i & 0x000f == 0:
            try:
                if memory[i:i+16] == b"\x00" * 16:
                    i += 16
                    continue
            except:
                pass
        info = memory_addr_info[i] if i in memory_addr_info else MemInfo()

        if info.label:
            print(f"\n{info.label}:")

        if info.pre_comment:
            lines = info.pre_comment.split("\n")
            for line in lines:
                print(f"    ; {line}")

        out = ""

        def print_bytes(data):
            str = ""
            for b in data:
                str += f"{b:02x} "
            str += " " * (23 - len(str))
            return str

        if info.type == "cstring":
            out += f"{i:04x}:    \""

            while c := memory[i] & 0x7f:
                out += escape_char(c)
                i += 1
            out += "\\0\""

            i += 1

        elif info.type == "pstring16":
            # Pascal-style string, prefixed by a WORD of length.
            # Note high bit still needs to be stripped
            l = get_pstring16_length(memory, i)
            out += f"{i:04x}:    {l:d}, \""
            i += 2

            for j in range(0, l):
                c = memory[i + j] & 0x7f
                out += escape_char(c)
            out += "\""

            i += l

        elif info.type == "fnptr":
            # 16 bit absolute function pointer
            addr = get_be16(memory, i)
            entry_points.append(addr)
            label = memory_addr_info[addr].label
            if label == None:
                label = memory_addr_info[addr].label = f"L_{addr:04x}"
            out += f"{i:04x}:    "
            out += print_bytes(memory[i:i+2])
            out += f"{label}"
            i += 2

        elif info.type and info.type.startswith("char["):
            # fixed length string
            str_len = int(info.type[5:-1])
            out += f"{i:04x}:    "
            data = memory[i:i+str_len]
            i += str_len

            out += print_bytes(data)
            data = bytes([c & 0x7f for c in data]) # strip high bit
            string = data.decode("ascii", errors="replace")
            out += f"\"{string}\""


        elif info.type != None:
            value = struct.unpack_from(info.type, memory[i:])[0]
            data = struct.pack(info.type, value)

            out += f"{i:04x}:    "
            out += print_bytes(data)
            i += len(data)
            out += f"({value:#x})"

        elif info.instruction:
            inst = info.instruction
            out = f"{i:04x}:    "
            out += print_bytes(inst.bytes)

            out += inst.to_string(mem)

            i += len(inst.bytes)

        else:
            out += (f"{i:04x}:    {memory[i]:02x}")
            is_printable, c = tochar(memory[i])
            if is_printable:
                out += f" '{c}'"
            i += 1

        if info.comment:
            indent = len(out)
            lines = info.comment.split("\n")
            out += f"\t ; {lines[0]}"
            for line in lines[1:]:
                out += "\n" + " " * indent + f"\t ; {line}"

        print(out)

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
                   memory_addr_info[last_comment].pre_comment += text
               else:
                   memory_addr_info[last_comment].comment += text
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
               memory_addr_info[address].pre_comment = comment
               last_comment = address
               pre_comment = True
               continue

           if type == "code":
               entry_points.append(address)
               if len(items) > 2:
                   label = items[2].strip()
               else:
                   label = f"Entry_{hex(address)}"
               memory_addr_info[address].label = label
           elif type == "label":
               memory_addr_info[address].label = items[2].strip()
           elif type != "":
               memory_addr_info[address].visited = True
               memory_addr_info[address].type = type
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
               memory_addr_info[address].comment = comment
               last_comment = address
               pre_comment = False

if __name__ == "__main__":
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
                    old_value = struct.unpack(">H", memory[fixup:fixup+2])[0]
                    new_addr = old_value + addr
                    new_value = struct.pack(">H", (new_addr) & 0xffff)
                    memory = memory[:fixup] + new_value + memory[fixup + 2:]
                    data = data[2:]
                    entry_points.append(new_addr)
                    memory_addr_info[new_addr].label = f"R_{new_addr:04x}"
                    #memory_addr_info[fixup].label = f"F_{fixup:04x}"

    if args["annotations"]:
        for ann_filename in args["annotations"]:
            read_annotations(ann_filename, memory)

    if args["script"]:
        for script_filename in args["script"]:
            with open(script_filename, "r") as f:
                ast = compile(f.read(), script_filename, 'exec')
            script_globals = {
                'memory': memory,
                'memory_addr_info': memory_addr_info,
                'entry_points': entry_points}
            exec(ast, script_globals, {})

    disassemble(memory)

