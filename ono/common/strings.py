
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

def tochar(byte):
    c = chr(byte&0x7f)
    if byte > 0x80 and c.isprintable():
        return True, c
    return False, '.'
