
import struct
from common.memory import MemoryWrapper
from common.strings import get_pstring16_length, escape_char, tochar

def printListing(memory: MemoryWrapper):
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
            memory.create_label(addr)
            label = memory.info(addr).label
            data = memory[i:i+2]
            out += f"{label}"
            i += 2

        elif isinstance(info.type, str) and info.type.startswith("char["):
            # fixed length string
            str_len = int(info.type[5:-1])

            out += "\""
            for j in range(0, str_len):
                c = memory[i + j] & 0x7f
                out += escape_char(c)
            out += "\""

            i += str_len

        elif isinstance(info.type, str):
            value = struct.unpack_from(info.type, memory[i:])[0]
            data = struct.pack(info.type, value)

            i += len(data)
            out += f"({value:#x})"

        elif info.length > 0:
            inst = info.type
            data = memory[i: i+info.length]

            out += inst.to_string(mem=memory)

            i += info.length

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