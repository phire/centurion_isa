from collections import defaultdict
from cpu6_regs import RegNames16, RegNames8
import struct

class MemInfo:
    def __init__(self):
        self.instruction = None
        self.label = None
        self.visited = False
        self.type = None
        self.comment = None
        self.pre_comment = None
        self.fixup = None
        self.func_info = None
        self.arg_name = None

class FunctionInfo:
    def __init__(self, x_args):
        self.xargs = x_args

class ResumeExecution:
    def __init__(self, pc):
        self.pc = pc

    def __call__(self):
        return self.pc

class TransferExecution:
    def __init__(self, pc):
        self.pc = pc

    def __call__(self):
        return self.pc


entry_points = []
memory_addr_info = defaultdict(MemInfo)

signed_wildcards = ("S")

class I:
    def __init__(self, pattern, format = "unknown"):
        self.pattern = pattern = pattern.replace(" ", "")
        assert len(pattern) % 8 == 0

        self.format = format
        self.newpc = None

    def match(self, pc, bitstring, bytes, mem):
        bitstring = bitstring[0:len(self.pattern)]

        wildcard_bitstrings = defaultdict(str)

        for p, b in zip(self.pattern, bitstring):
            # if the pattern has a '0' or '1', it must match the bit
            if p in ("0", "1"):
                if b != p:
                    return None
                continue

            # otherwise, the pattern is a wildcard which we extract
            wildcard_bitstrings[p] += b

        bytes = bytes[0:len(self.pattern) // 8]

        dict = {}
        for key, bistring in wildcard_bitstrings.items():
            signed = key in signed_wildcards
            dict[key] = bitstring_to_int(bistring, signed)

        return InstructionMatch(pc, self, bytes, dict)

    def to_string(self, dict, mem):
        return self.format.format(**dict)


def relative_branch(next_pc, S, **kwargs):
    return [ResumeExecution(next_pc), TransferExecution(next_pc + S)]

def relative_branch_unconditional(next_pc, S, **kwargs):
    return [TransferExecution(next_pc + S)]

def relative_call(next_pc, S, **kwargs):
    return [ResumeExecution(next_pc), TransferExecution(next_pc + S)]

def indirect_relative_call(next_pc, S, **kwargs):
    # FIXME: Provide memory view here and do the indirection
    return [ResumeExecution(next_pc)]

def abolsute_branch_uncondtionional(N, **kwargs):
    return [TransferExecution(N)]

def absolute_call(next_pc, N, **kwargs):
    return [ResumeExecution(next_pc), TransferExecution(N)]

def kill_branch(**kwargs):
    return []


class B(I):
    def __init__(self, pattern, name, newpc):
        super().__init__(pattern, "")
        self.newpc = newpc
        self.name = name

    def to_string(self, dict, mem):
        if self.newpc == kill_branch:
            return self.name.format(**dict)
        if self.newpc == indirect_relative_call:
            dest = dict["next_pc"] + dict["S"]
            label = f"@{dest:#04x}"
            return f"{self.name.format(**dict)} {label}"
        if self.newpc == relative_branch or self.newpc == relative_branch_unconditional:
            dest = dict["next_pc"] + dict["S"]
        elif self.newpc == relative_call:
            dest = dict["next_pc"] + dict["S"]
        else:
            dest = dict["N"]

        label = memory_addr_info[dest].label
        if label == None:
            label = f"{dest:#04x}"
        return f"{self.name.format(**dict)} {label}"


class InvalidInstruction():
    newpc = None

    def to_string(self, dict, **kwargs):
        return dict["bytes"] + " <Invalid>"

class QuickInstuction:
    newpc = None
    def __init__(self, format):
        self.format = format

    def to_string(self, dict, **kwargs):
        return self.format.format(**dict)

class InstructionMatch:
    def __init__(self, pc, instruction, bytes, dict={}, mem=None):
        self.disassembled = True
        self.valid = not isinstance(instruction, InvalidInstruction)
        self.instruction = instruction

        self.bytes = bytes
        self.next_pc = [ResumeExecution(pc + len(self.bytes))]

        self.dict = dict | {
            "bytes": " ".join([f"{b:02x}" for b in self.bytes]),
            "pc": pc,
            "next_pc": self.next_pc[0](),
            "RegNames8": RegNames8,
            "RegNames16": RegNames16,
            "instruction": instruction,
            "mem": mem,
        }

        if self.instruction.newpc is not None:
            self.next_pc = instruction.newpc(**self.dict)

    def to_string(self, mem=None, **kwargs):
        return self.instruction.to_string(self.dict, mem=mem, **kwargs)



def bitstring_to_int(bitstring, signed=False):
    # bigendian
    limit = 1 << len(bitstring)
    while len(bitstring) % 8 != 0:
        bitstring = "0" + bitstring

    num = 0
    shift = 0
    while len(bitstring) != 0:
        byte = bitstring[-8:]
        bitstring = bitstring[:-8]
        num |= int(byte, 2) << shift

        if signed and len(bitstring) == 0 and num > (limit >> 1):
            num = num - limit


        shift += 8

    return num

def make_bitstring(bytes):
    bitstring = ""
    for byte in bytes:
        bitstring += format(byte, '08b')
    return bitstring


def scan(instructions, mem, pc, len):
    bytes = mem[pc:pc+len]
    bitstring = make_bitstring(bytes)

    for instruction in instructions:
        if match := instruction.match(pc, bitstring, bytes, mem):
            return match
    return InstructionMatch(pc, InvalidInstruction(), bytes, {})