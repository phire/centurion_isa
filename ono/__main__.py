
import argparse
import sys, os
import struct
from depgen import *
from common.memory import entry_points, memory_addr_info, MemoryWrapper
from common.annotations import read_annotations
from common.disassemble import disassembleAllEntries
from common.listing import printListing
from common.script import run_script
import cpu6

relocation_targets = []

def load_binary(name, type):
    filename = args["input"]
    if args["type"] == "binary":
        if args["start"] is None:
            print("Start must be specified for binary files")
            sys.exit(1)
        base_address = int(args["start"], 16)

        entry_points.append(base_address)
        memory_addr_info[base_address].label = "Start"

    with open(filename, "rb") as f:
        add_dependency(filename)
        data = f.read()

    if args["type"] == "binary":
        memory = b"\0" * (base_address) + data + b"\0" * (0x10000 - (len(data) + base_address))
    if args["type"] == "wecb":
        memory = b"\0" * 0x10000
        from cpu6.wecb import WecbLoader

        wecb = WecbLoader(data)
        offset = 0

        for type, addr, data in wecb.sections():
            addr += offset
            if type == 0:
                if len(data) == 0:
                    entry_points.append(addr)
                memory = memory[:addr] + data + memory[addr + len(data):]
                if (addr == 0x4c and len(data) > 0x1e):
                    offset = struct.unpack_from(">H", data[0x1b:])[0]
            elif type == 1:
                while len(data) > 1:
                    fixup = struct.unpack_from(">H", data)[0] + offset
                    memory_addr_info[fixup].fixup = addr

                    old_value = struct.unpack(">H", memory[fixup:fixup+2])[0]
                    new_addr = old_value + addr
                    new_value = struct.pack(">H", (new_addr) & 0xffff)
                    memory = memory[:fixup] + new_value + memory[fixup + 2:]
                    data = data[2:]
                    relocation_targets.append(new_addr)
                    memory_addr_info[new_addr].label = f"R_{new_addr:04x}"
                    #memory_addr_info[fixup].label = f"F_{fixup:04x}"

    return MemoryWrapper(memory)


def argumesnts():
    all_args = argparse.ArgumentParser()

    all_args.add_argument("-i", "--input", required=True, help="input file")
    all_args.add_argument("-s", "--start", required=False, help="starting address of this file")
    all_args.add_argument("-t", "--type", required=False, help="type of file", default="binary")
    all_args.add_argument("-a", "--annotations", action='append', help="annotations file")
    all_args.add_argument("-o", "--output", required=False, help="output file")
    all_args.add_argument("--depfile", help="automatic dependency generation for make")
    all_args.add_argument("--script", action='append', help="script file")
    return vars(all_args.parse_args())

args = argumesnts()

mem = load_binary(args['input'], args['type'])

if args["annotations"]:
    for ann_filename in args["annotations"]:
        add_dependency(ann_filename)
        read_annotations(ann_filename, mem)

if args["script"]:
    for script_filename in args["script"]:
        run_script(script_filename, mem)


if args["depfile"] and args["output"]:
    generate_depfile(args["depfile"], args["output"])


# TODO: disassemble shouldn't be printing to stdout
#       but until that is fixed we can redirect stdout

if args["output"]:
    f = open(args["output"], "w")
    sys.stdout = f

disassembleAllEntries(mem, cpu6)

if relocation_targets:
    # In order to get a more complete disassembly, we optimistically
    # add all relocation targets as entries
    # this is not correct. Many are data, many are halfway though an instruction

    # But by doing it after we have already disassembled all reachable
    # code, we minimize disruptions

    for reloc in set(relocation_targets):
        # filter out relocs which point at null bytes, they are probally data
        if mem[reloc] == 0:
            continue
        entry_points.append(reloc)

    disassembleAllEntries(mem, cpu6)


printListing(mem)

