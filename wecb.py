#!/usr/bin/env python3

# This is the binary format used by wipl to load binaries
# may or may not be the main binary format used system-wide
# It's very close to the DECB aka XXDP binary file format used on the PDP11

import struct

class ChecksumException(Exception):
    pass

class WecbLoader:
    def __init__(self, data):
        self.data = data
        self.next_sector()
        self.section_type = None

    def next_sector(self):
        self.sector_data = self.data[:400]
        self.data = self.data[400:]

    def sections(self):
        while True:
            # Blocks start with a 4 byte header
            # 8bit type, 8 bit size (limited to 0x78?), 16bit destination address
            type, size, addr = struct.unpack_from(">BBH", self.sector_data + bytes(3))

            if type == 0x80: # A type of 0x80 means there are no more blocks in this sector
                self.next_sector() # And we should load the next one
                continue

            # Combine blocks
            if type != self.section_type or addr != self.section_addr + len(self.section_data):
                if self.section_type != None:
                    yield self.section_type, self.section_addr, self.section_data
                self.section_type = type
                self.section_addr = addr
                self.section_data = bytearray()

            if type == 0x84: # Pretty sure this means end of file
                return 0x84, 0, 0

            # there is a checksum byte at the end of the block
            checksum = 0x100 - sum(self.sector_data[:size + 4]) & 0xff
            expected = self.sector_data[size + 4]

            if checksum != expected:
                raise ChecksumException("Checksum mismatch!")

            self.section_data += self.sector_data[4:size + 4]
            self.sector_data = self.sector_data[size+5:]

def hexdump(addr, data):
    def tochar(byte):
        c = chr(byte&0x7f)
        if c.isprintable():
            return c
        return '.'
    i = 0
    while i < len(data):
        to_read = 16
        if addr % 16 != 0:
            to_read = 16 - (addr % 16)

        row, data = data[i:i+to_read], data[i+to_read:]
        print(f"{addr:08x}: ", end='')
        start_padding = 0

        if to_read != 16:
            start_padding = (16 - to_read) * 3
            print(" " * start_padding, end='')
        print(f"{''.join(f'{b:02x} ' for b in row[0:8])}", end='')
        print(f"{''.join(f'{b:02x} ' for b in row[8:])}  ", end='')
        if (16 - to_read + len(row)) != 16:
            end_padding = (16 - (16 - to_read + len(row))) * 3 + (start_padding // 3)
            print(" " * end_padding, end='')
        print(f"{''.join(tochar(b) for b in row)}")
        addr += to_read

if __name__ == "__main__":
    import sys
    if len(sys.argv) != 3:
        print(f"Usage: {sys.argv[0]} <mode> <file>")
        print ("Modes:")
        print ("    hex - hex dump the file contents")
        print ("    verify - verify the checksums")
        sys.exit(1)

    with open(sys.argv[2], "rb") as f:
        data = f.read()
        loader = WecbLoader(data)

    if sys.argv[1] == "dump":
        for type, addr, data in loader.sections():
            if type == 0 and len(data) != 0:
                print("Load:")
                hexdump(addr, data)
            elif type == 0 and len(data) == 0:
                print(f"Empty Load to {addr:#06x}")
            elif type == 1:
                pass
                print("Fixup:")
                while len(data) > 1:
                    fixup = struct.unpack_from(">H", data)[0]
                    data = data[2:]
                    print(f"  {fixup:#06x} = {addr:#06x}")
            else:
                raise Exception(f"Unknown section type {type}")
    if sys.argv[1] == "verify":
        try:
            for _ in loader.sections():
                pass
        except ChecksumException as e:
            print("Checksum Error")
            sys.exit(1)
        print("Valid")
