#!/usr/bin/env python3

import sys

with open(sys.argv[1], "rb") as f:
    bytes = f.read()

lba_size = 0
if len(sys.argv) > 2:
    lba_size = int(sys.argv[2], 10)

i = 0

def tochar(byte):
    c = chr(byte&0x7f)
    if c.isprintable():
        return c
    return '.'

def print_sector(lba):
    sector = lba & 0xf
    head = (lba >> 4) & 1
    cyc = (lba >> 5) & 0x1ff
    print (f"\nLBA: {lba:#04x} (CHS: {cyc:03x},{head:01x},{sector:01x})")


while i < len(bytes):
    if lba_size:
        lba = i // lba_size
        if lba * lba_size == i:
            print_sector(lba)
    row = bytes[i:i+16]
    print(f"{i:08x}: {''.join(f'{b:02x} ' for b in row[0:8])} {''.join(f'{b:02x} ' for b in row[8:])}  {''.join(tochar(b) for b in row)}")

    i+= 16