#!/usr/bin/env python3

import sys

# This tool tries to extract comments from a disassembly file
# and compose an annotations file out of them.
# This is useful if one wants to regenerate the disassembly, but keep
# all the comments previously written.

with open(sys.argv[1], "r") as f:
    lines = f.readlines()

continuation = False
pre_comment = []

for line in lines:
    addr_end = line.find(':')
    comment_start = line.find(';')

    if addr_end == -1:
        address = None
    else:
        try:
            address = int(line[:addr_end], 16)
        except ValueError:
            address = None
            
    if address is not None and len(pre_comment) > 0:
        # We've found an address. Dump the accumulated pre_comments
        prefix = hex(address) + ",\tpre_comment"
        for text in pre_comment:
            print(prefix, "\t;", text)
            prefix = "\t"
        pre_comment = []

    if comment_start == -1:
       # This line has no comment text. Terminate multi-line comment in progress
       continuation = False
       continue;

    text = line[comment_start + 1:].strip()

    if address is not None:
        print(hex(address), ",\tcomment\t;", text)
        # This possibly starts a multi-line comment
        continuation = True
        continue;

    # An empty line with a sole comment. It can be a part of a multi-line comment
    if (continuation):
        print("\t\t;", text)
    else:
        # This is part of a pre-comment. We don't know the address, so
        # accumulate these lines until we find one.
        pre_comment.append(text)
