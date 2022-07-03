from common.memory import Instruction, ResumeExecution, TransferExecution
from common.ref import Implicit, MemRef, RegRef
import cpu6.cpu6_addr as AddrMode
from cpu6.cpu6_ops import Flags
from cpu6.info import Xargs


def uses_operand(ref):
    match ref:
        case Implicit() | AddrMode.LiteralRef():
            return False
        case RegRef() | AddrMode.SmallLiteralRef():
            return True
        case ref:
            return any(uses_operand(r) for r in ref.refs())

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

    def to_string(self, mem, **kwargs):
        str = self.mnemonic
        arg_str = ", ".join([arg.to_string(mem, **kwargs) for arg in self.refs() if arg])
        if arg_str:
            str += " " + arg_str
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

    def refs(self):
        if self.dst:
            return [self.dst] + self.srcs
        return self.srcs

    def __len__(self):
        sum = 0
        operand = 0 # do refs use the operand byte?
        for arg in self.refs():
            if uses_operand(arg):
                operand = 1
            sum += len(arg)

        return 1 + operand + sum

class ImplicitLenInst(BasicCpu6Inst):
    def __init__(self, mnemonic, length, fn=None):
        self.length = length
        super().__init__(mnemonic, None, fn=fn)

    def __len__(self):
        return self.length

def mode2e_size(args):
    size = 0
    index_byte = False
    for arg in args:
        match arg:
            case Implicit():
                pass
            case AddrMode.LiteralRef():
                size += len(arg)
            case AddrMode.ComplexRef() if arg.disp == None:
                if not index_byte:
                    index_byte = True
                    size += 1
            case AddrMode.ComplexRef():
                size += len(arg) + 1
            case AddrMode.DirectRef():
                size += len(arg)
            case _:
                raise NotImplementedError(f"Unknown reference type: {arg}")
    return size


class BlockInst(BasicCpu6Inst):
    def __init__(self, mnonomic, *sources, fn=None):
        super().__init__(mnonomic, None, *sources, fn=fn)
        self.size = 2 + mode2e_size(sources)

    def __len__(self):
        return self.size


class BigNumInst(BasicCpu6Inst):
    def __init__(self, mnonomic, *sources, fn=None):
        super().__init__(mnonomic, None, *sources, fn=fn)
        self.size = 3 + mode2e_size(sources)

    def __len__(self):
        return self.size

class ControlFlowInst(Cpu6Inst):
    def __init__(self, mnemonic, target, resume=True):
        self.mnemonic = mnemonic
        self.target = target
        self.resume = resume

    def __repr__(self):
        return f"<ControlFlowInst: {self.mnemonic} {self.target}>"

    def __len__(self):
        operand_byte = 1 if uses_operand(self.target) else 0
        return 1 + len(self.target) + operand_byte

    def refs(self):
        return [self.target]

    def get_target(self, mem):
        target = self.target

        # It looks nicer if we unwrap these
        if isinstance(target, AddrMode.DirectRef):
            target = target.ref
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

    def refs(self, mem):
        return [self.num]

    def __repr__(self):
        return f"<SyscallInst: {self.num}>"

    def get_dst(self, mem):
        num = self.num.getValue(mem)
        if num in mem.syscall_map:
            return mem.syscall_map[num]
        return None

    def to_string(self, mem):
        label = self.num.to_string(mem)
        if addr := self.get_dst(mem):
            if name := mem.get_label(addr):
                label = name
        return f"jsys {label}"

    def __len__(self):
        return 2

class TerminalInst(ControlFlowInst):
    def __init__(self, mnemonic):
        self.mnemonic = mnemonic
        self.resume = False

    def refs(self, mem):
        return []

    def get_dst(self, mem):
        return None

    def __repr__(self):
        return f"<TerminalInst: {self.mnemonic}>"

    def __len__(self):
        return 1

    def to_string(self, mem):
        return f"{self.mnemonic}"

    def to_tree(self, cpu):
        return None
