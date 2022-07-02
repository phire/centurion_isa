from collections import defaultdict
#from cpu6.info import Xargs


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
        self.insn_offset = None

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


class MemoryWrapper:
    def __init__(self, memory):
        self.memory = memory
        self.labels = {}
        self.syscall_map = {}
        self.top = 0xffff

    def __getitem__(self, key):
        return self.memory.__getitem__(key)

    def get_label(self, addr):
        if addr in memory_addr_info:
            info = memory_addr_info[addr]
            if not info.label and info.insn_offset:
                # The address being referenced is located inside an instruction
                # Try to fetch a label for the instruction instead
                offset = info.insn_offset
                insn_info = memory_addr_info[addr - offset]
                if insn_info.label:
                    return insn_info.label + f"+{offset}"
            return info.label
        return None

    def get_xargs(self, addr):
        if memory_addr_info[addr].func_info:
            if memory_addr_info[addr].func_info.xargs:
                return memory_addr_info[addr].func_info.xargs
        return None

    def get(self, addr, size, signed=False):
        return int.from_bytes(self.memory[addr:addr+size], 'big', signed=signed)

    def get_u8(self, addr):
        return self.get(addr, 1, False)

    def get_be16(self, addr):
        return self.get(addr, 2, False)

    def get_i8(self, addr):
        return self.get(addr, 1, True)

    def is_fixup(self, addr):
        return addr in memory_addr_info and memory_addr_info[addr].fixup

    # If this address is inside a multi-byte type, return it's info
    def owned(self, addr):
        # TODO: pre-calculate backrefs data so we can find relationships more than 2 bytes back
        # TODO: support other types of backrefs
        for check_addr in range(addr, addr-2, -1):
            if info := self.read_only_info(check_addr):
                if not info.instruction:
                    continue
                distance = check_addr - addr
                if len(info.instruction.bytes) >= distance:
                    return (check_addr, info)
        return None

    def visited(self, addr):
        return addr in memory_addr_info and memory_addr_info[addr].visited

    def info(self, addr) -> MemInfo:
        return memory_addr_info[addr]

    def create_label(self, addr):
        info = memory_addr_info[addr]
        if info.label == None:
            info.label = f"L_{addr:04x}"

    def read_only_info(self, addr) -> MemInfo:
        # like info(), but doesn't create a new entry in the DefaultDict
        return memory_addr_info[addr] if addr in memory_addr_info else MemInfo()

    def hasInfo(self, addr):
        if addr in memory_addr_info:
            return (memory_addr_info[addr].label
                or memory_addr_info[addr].comment
                or memory_addr_info[addr].type)
        return False


# FIXME: These globals are currently imported and modified everywhere
entry_points = []
memory_addr_info = defaultdict(MemInfo)