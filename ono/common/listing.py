
import common.memory
import common.oldtype as oldtype
import common.strings as strings

def format_bytes(mem, addr, length, align):
    data = mem[addr:addr+length]

    str = ' '.join([f"{b:02x}" for b in data])
    return str + " " * (align - len(str))

def format_untyped(b):
    is_printable, c = strings.tochar(b)
    out = f"{b:02x}"
    if is_printable:
        out +=  f" '{c}'"
    return out

def printListing(mem: common.memory.MemoryWrapper):
    skipping = True # Ignore null bytes at start of memory

    addr = 0
    while addr < 0xfe00:
        info = mem.read_only_info(addr)

        if info.label:
            print(f"\n{info.label}:")
            skipping = False

        # Skip large blocks of zeros, but only if they don't have lables/comments
        if mem[addr] == 0 and mem[addr:addr+10] == b"\x00" * 10:
            if not skipping:
                print(f"{addr:04x}:    <null bytes>\n")
                skipping = True
            addr += 1
            while addr < mem.top and mem[addr] == 0 and not mem.hasInfo(addr):
                addr += 1
            continue

        if info.pre_comment:
            # Make sure an empty line is present in front of pre_comment
            # This aids proper parsing it back by extract_comments.py
            if not info.label:
                print("")
            lines = info.pre_comment.split("\n")
            for line in lines:
                print(f"    ; {line}")

        prefix = f"{addr:04x}:    "

        match info.type:
            case str() as typestring:
                length = oldtype.length(typestring, addr, mem)
            case _:
                length = max(info.length, 1)


        argstring = ""
        if info.arg_name:
            # For data that follows a call
            argstring += f"    {info.arg_name} = "

        match info.type:
            case str() as typestring:
                if not (typestring in ["cstring", "pstring16"] or typestring.startswith("char[")):
                    prefix += format_bytes(mem, addr, length, 23)
                out = prefix + argstring + oldtype.to_string(typestring, addr, mem)
            case None:
                out = prefix + argstring + format_untyped(mem[addr])
            case type:
                out = prefix + format_bytes(mem, addr, length, 22) + ' ' + argstring + type.to_string(mem)


        if info.comment:
            indent = len(out)
            lines = info.comment.split("\n")
            out += f"\t ; {lines[0]}"
            for line in lines[1:]:
                out += "\n" + " " * indent + f"\t ; {line}"
        print(out.strip())
        addr += length