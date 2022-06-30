# Converts from centurion ASCII files to modern PC ASCII files
import sys

def conv():
    with open(sys.argv[1], "rb") as f:
        data = f.read()
    sectors = [data[i:i+400] for i in range(0, len(data), 400)]

    out = ""
    for i, sector in enumerate(sectors):
        #print(f"------------------Sector{i}")
        prev = None
        for b in sector:
            c = bytes([b&0x7f]).decode("ascii", errors="backslashreplace")
            if b == 0x87:
                c = "<BEL>" # Ascii bell charater

            if b == 0x8d: # Cartridge return.
                if prev == 0x8d:
                    # Two CRs in a row mark the end of a sector
                    break
                c = '\n' # Replace with newline
            if b == 0:
                break
            if b == 0x84:
                print(out)
                return
            prev = b
            out += c
        print(out)
        out = ""

conv()
