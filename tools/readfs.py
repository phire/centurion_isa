import sys
import os
from construct import *
from construct.core import *
from datetime import date, timedelta

def to_ascii(data):
    if data[0] == 0:
        return None
    return ''.join([chr(c & 0x7f) for c in data])

DirectoryEntry = Struct(
    "rawName" / Array(10, Byte),
    "name" / Computed(lambda ctx: to_ascii(ctx.rawName)),
    "metadata_entry" / Byte,
    "metadata_sector" / Int16ub,
    "filetype" / Byte,
    "date" / Int16ub,
)

DirectoryHeader = Struct(
    "rawName" / Array(10, Byte),
    "name" / Computed(lambda ctx: to_ascii(ctx.rawName)),
    "lastReorg" / Int16ub,
    "ReorgErrorCount" / Int8ub, # number of errors in last reorg
    "metadataBase" / Int24ub,
)

MetadataHeader = Struct(
    "size" / Int16ub,
    "begin" / Int16ub, # seems to always be 0x8000
    "blockSize" / Byte, # log2 number of sectors per block
    "fileClass" / Byte, # 0 for virtual files pointing at filesystem metadata. 0xff for everthing else
)


MetadataEntry = Union(0,
    "sector" / Int24ub,
    "next" / Struct(
        "sector" / Int16ub,
        "offset" / Int8ub
    )
)


with open(sys.argv[1], "rb") as f:
    # I'm lazy. Read the entire drive into memory
    drive_data = f.read()


def readSector(num):
    # assumes 400 stripped
    offset = (num & 0x3fff) * 400
    return drive_data[offset:offset+400]

class File:
    def __init__(self, sectorFn, entry, indent):
        self.name = entry.name.strip()
        self.type = entry.filetype & 0xf
        self.unk1 = entry.filetype >> 4 # extended file type?
        # This Epoch is just a guess, but it gives sensible results
        self.date = date(1900, 1, 1) + timedelta(days = entry.date)
        self.readMetadata(sectorFn, entry, indent)

    def readMetadata(self, sectorFn, entry, indent):
        offset = entry.metadata_entry * 3
        sector = entry.metadata_sector
        physical_sector = sectorFn(sector, True)
        #print(f"sector {sector}, real sector: {real_sector:#x}")
        data = readSector(physical_sector)
        header = MetadataHeader.parse(data[offset:])
        self.size = header.size + 1
        #print(header)
        blocksize = 1 << header.blockSize
        print(f"{indent}{blocksize} sector blocks; {header.size} sectors; {header.begin:04x}, {header.fileClass:02x}")
        offset += 6
        count = 0
        raw_sectors = []
        while offset < 398:
            print(f"{indent:<3}{sector:x}:{offset//3:}", end='')
            entry = MetadataEntry.parse(data[offset:])
            print(f" sector: {entry.sector:06x}", end='')
            offset += 3
            if entry.sector < 0x800000:
                # One block worth of sectors
                raw_sectors += list(range(entry.sector, entry.sector + blocksize))
                count += blocksize
                print(f" phys {sectorFn(entry.sector,False):#06x}")
            elif entry.sector == 0xffffff:
                # End of sector list
                print(f" end with {count} sectors")
                if count != self.size:
                    print("Error, expected " + self.size)
                break
            else:
                if entry.next.sector == 0x8000:
                    # next sector
                    # todo: Is it possible to jump forwards more than one sector?
                    sector += 1
                    print(" next")
                else:
                    sector = 0xffff - entry.next.sector
                    print(" jump")

                data = readSector(sectorFn(sector, True))
                offset = (entry.next.offset) * 3
        self.raw_sectors = raw_sectors
        # we might be in a subdirectory, so apply the sectorFn transform
        self.sectors = [sectorFn(s, False) for s in raw_sectors] # physical sectors

    def getData(self):
        data = bytes()
        for sector in self.sectors:
            data += readSector(sector)
        return data

metadataBase = 0
diskname = ""
def listDirectory(sector, sectorFn, indent='', dir=None):
    data = readSector(sectorFn(sector, False))
    if len(data) == 0:
        print(f"No Data for sector {sectorFn(sector, False):#x}")
        return
    header = DirectoryHeader.parse(data)
    if header.name and header.name.strip() != '':
        print(f"Disk Name: '{header.name}'")
        global diskname
        diskname = header.name.strip()
        #os.makedirs(diskname)
    if header.metadataBase:
        metadataBase = header.metadataBase
        sectorFn = lambda x, metadata: (x + metadataBase) if metadata else x
        print(f"Metadata Base: {metadataBase:#06x}")
    start = 16
    while True:
        for offset in range(start, 400, 16):
            print(offset)
            entry = DirectoryEntry.parse(data[offset:])
            if not entry.name:
                print(indent + "Done")
                return
            file = File(sectorFn, entry, indent + '  ')
            print(f"{indent}{entry.name} filetype: {entry.filetype:02x}" +\
            f" date: {file.date}")
            if file.sectors and (file.type & 0xf == 5):
                print(f"Directory with {len(file.sectors)} sectors")
                #os.makedirs(os.path.join(diskname, file.name))
                listDirectory(0, lambda x, _: file.sectors[x], '   ', file)
            else:
                continue
                # path = file.name
                # if dir:
                #     path = os.path.join(dir.name, path)
                # path = os.path.join(diskname, path)

                # with open(f"{path}.{file.type}.bin", "wb") as f:
                #     f.write(file.getData())
                # if file.type == 2:
                #     # ascii file
                #     ascii = bytes([c & 0x7f for c in file.getData()])
                #     with open(f"{path}.{file.type}.txt", "wb") as f:
                #         f.write(ascii)


        sector += 1 # Directories can cross multiple sectors
        start = 0
        data = readSector(sectorFn(sector, False))


listDirectory(16, lambda x, _: x)