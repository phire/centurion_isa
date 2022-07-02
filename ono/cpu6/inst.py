from common.memory import Instruction, ResumeExecution, TransferExecution
from common.ref import MemRef
import cpu6.cpu6_addr as AddrMode
from cpu6.cpu6_ops import Flags
from cpu6.info import Xargs


class Cpu6Inst(Instruction):
    pass

class BasicCpu6Inst(Cpu6Inst):
    def __init__(self, mnonomic, dst=None, *sources, fn=None):
        self.mnemonic = mnonomic
        self.dst = dst
        self.srcs = [s for s in sources if s is not None]
        self.fn = fn

    def __repr__(self):
        return f"<BasicCpu6Inst: {self.mnemonic} {self.dst}, {self.srcs}>"

    def to_string(self, mem):
        str = self.mnemonic
        if self.dst:
            str += f" {self.dst.to_string(mem)}"
        for src in self.srcs:
            str += f", {src.to_string(mem)}"
        return str

    def to_tree(self, cpu):
        if len(self.srcs) == 1:
            a, b = self.dst, self.srcs[0]
        elif len(self.srcs) == 2:
            a, b = self.srcs
        else:
            return None

        if self.fn:
            return self.dst.getNode(cpu).Eq(Flags(self.fn(a.getNode(cpu), b.getNode(cpu))))
        if self.mnemonic in ["ld", "mov"]:
            return self.dst.getNode(cpu).Eq(Flags(b.getNode(cpu)))
        if self.mnemonic == "st":
            return b.getNode(cpu).Eq(Flags(a.getNode(cpu)))

class ControlFlowInst(Cpu6Inst):
    def __init__(self, mnemonic, src):
        self.mnemonic = mnemonic
        self.target = src
        self.resume = mnemonic == "call"

    def mem_ref(self):
        return self.target

    def get_target(self, mem):
        target = self.target

        # It looks nicer if we unwrap these
        if isinstance(target, AddrMode.DirectRef):
            target = target.addr
        elif isinstance(target, AddrMode.PcDisplacementRef):
            _, target = target.getLiteralRef(mem)
        return target

    def get_dst(self, mem):
        target = self.get_target(mem)
        try: return target.getValue(mem)
        except AttributeError: return None

    def get_xargs(self, mem):
        if addr := self.get_dst(mem):
            return mem.get_xargs(addr)
        return None

    def next_pc(self, mem, end_addr):
        ret = []
        if self.resume:
            if xargs := self.get_xargs(mem):
                xargs = Xargs(xargs)
                end_addr = xargs.annotate(mem, end_addr)
            ret += [ResumeExecution(end_addr)]
        if dst := self.get_dst(mem):
            ret += [TransferExecution(dst)]
        return ret

    def to_string(self, mem):
        target = self.get_target(mem)

        return f"{self.mnemonic} {target.to_string(mem, forceLabel=True, suppressAlt=True)}"

    def to_tree(self, cpu):
        return None

class SyscallInst(ControlFlowInst):
    def __init__(self, num):
        self.num = num
        self.resume = True

    def get_dst(self, mem):
        if self.num in mem.syscall_map:
            return mem.syscall_map[self.num]
        return None

    def to_string(self, mem):
        label = f"{self.num:02x}"
        if addr := self.get_dst(mem):
            if name := mem.get_label(addr):
                label = name
        return f"jsys {label}"

