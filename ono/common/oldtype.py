import struct
from common.strings import get_pstring16_length, escape_char, tochar

# This contains old functionality that should eventually be refactored and removed

def to_string(typestring, addr, mem):
    memory = mem
    if typestring == "cstring":
        out = '"'
        i = addr
        while c := memory[i] & 0x7f:
            out += escape_char(c)
            i += 1
        return out + '\\0"'

    elif typestring == "pstring16":
        # Pascal-style string, prefixed by a WORD of length.
        # Note high bit still needs to be stripped
        l = get_pstring16_length(memory, addr)
        out = f"{l:d}, \""
        addr += 2

        for j in range(0, l):
            c = memory[addr + j] & 0x7f
            out += escape_char(c)
        return out + "\""

    elif typestring in ["fnptr", "ptr"]:
        # 16 bit absolute pointer
        addr = memory.get_be16(addr)
        memory.create_label(addr)
        label = memory.get_label(addr)
        return f"{label}"

    elif isinstance(typestring, str) and typestring.startswith("char["):
        # fixed length string
        str_len = int(typestring[5:-1])

        out = "\""
        for j in range(0, str_len):
            c = memory[addr + j] & 0x7f
            out += escape_char(c)
        return out + "\""

    elif isinstance(typestring, str):
        value = struct.unpack_from(typestring, memory[addr:])[0]
        return f"({value:#x})"


def length(typestring, addr, mem):
    if typestring == "cstring":
        i = addr
        while mem[i] & 0x7f:
            i += 1
        return (i + 1) - addr

    elif typestring == "pstring16":
        # Pascal-style string, prefixed by a WORD of length.
        # Note high bit still needs to be stripped
        return 2 +  get_pstring16_length(mem, addr)

    elif typestring in ["fnptr", "ptr"]:
        return 2 # 16 bit absolute pointer

    elif isinstance(typestring, str) and typestring.startswith("char["):
        # fixed length string
        return int(typestring[5:-1])

    elif isinstance(typestring, str):
        return struct.calcsize(typestring)