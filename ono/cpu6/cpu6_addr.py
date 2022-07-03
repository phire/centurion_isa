from common.memory import Instruction
from .cpu6_regs import Reg8Ref, Reg16Ref, PostIncRef, PreDecRef
from .cpu6_ops import *
from common.ref import *
import cpu6.inst as inst

class DirectRef(MemRef):
    def __init__(self, addr, pc=None):
        if isinstance(addr, LiteralRef):
            self.ref = addr
        else:
            assert pc is not None, "pc or Literal is required for direct ref"
            self.ref = LiteralRef(addr, 2, pc)

    def getValue(self, memory, **kwargs):
        return self.ref.getValue(memory)

    def to_string(self, memory, **kwargs):
        return f"[{self.ref.to_string(memory, forceLabel=True)}]"

    def getNode(self, cpu):
        return cpu.getMem(self.ref.getNode(cpu))

    def __repr__(self) -> str:
        return f"<Direct {self.ref} @ {self.ref.pc:04x}>"

class ComplexRef(MemRef):
    def __init__(self, base, index=None, disp=None):
        self.base = base
        if isinstance(base, DirectRef): # unwrap
            self.base = base.ref
        self.index = index
        self.disp = disp

    def refs(self):
        return [x for x in [self.base, self.index, self.disp] if x]

    def __len__(self):
        return sum([len(x) for x in self.refs()])

    def __repr__(self):
        return f"<Complex base: {self.base}, index:{self.index}, disp:{self.disp}>"

    def to_string(self, memory, **kwargs):
        ret = f"[{self.base.to_string(memory, forceLabel=True)}"
        if self.index:
            ret += f" + {self.index.to_string(memory)}"
        if self.disp:
            return f"{ret} + {self.disp.to_string(memory)}]"
        return ret + "]"

    def getNode(self, cpu):
        node = self.base.getNode(cpu)
        if self.index:
            node = node.Add(self.index)
        if self.disp:
            node = node.Add(self.disp)
        return cpu.getMem(node)

class LiteralRef(Ref):
    def __init__(self, val, size, pc=None, signed=False):
        self.val = val
        self.size = size
        self.pc = pc
        self.signed = signed

    def __len__(self):
        return self.size

    def str_val(self):
        if self.val is not None:
            return f"{self.val:#0{self.size*2+2}x}"
        return "##unknown##"

    def __repr__(self):
        if self.pc:
            return f"<Literal_{self.size} {self.str_val()} @ {self.pc:04x}>"
        return f"<Literal_{self.size} {self.str_val()}>"

    def to_string(self, memory, **kwargs):
        val = self.getValue(memory)

        # Only label literals if they have been fixed up (or forced)
        if (self.pc and memory.is_fixup(self.pc)) or "forceLabel" in kwargs:
            if label := memory.get_label(val):
                if "suppressAlt" in kwargs:
                    return label
                return f"{label}|{self.str_val()}"
        return self.str_val()

    def getValue(self, memory, **kwargs):
        if self.pc:
            return memory.get(self.pc, self.size, self.signed)
        return self.val

    def getNode(self, cpu):
        if self.pc:
            val = cpu.readMem(LiteralValue(self.pc, 16), self.size * 8)
            if self.signed:
                assert self.size == 1
                return SignExtend(val)
            return val
        return LiteralValue(self.val, self.size * 8)

class SmallLiteralRef(Ref):
    def __init__(self, val):
        self.val = val

    def to_string(self, mem, **kwargs):
        return f"#{self.val:d}"

    def getNode(self, cpu):
        return LiteralValue(self.val, 4)

    def __len__(self):
        return 0

class PcDisplacementRef(MemRef):
    def __init__(self, pc, disp, size=2):
        self.pc = pc
        self.disp = disp # disp is a literal ref
        self.size = size

    def refs(self):
        return [self.disp]

    def __str__(self):
        return f"[pc + {self.disp}]"

    def __len__(self):
        return len(self.disp)

    def getAddr(self, memory):
         # disp is a literal ref, just in case self-modifying code patches it
        return self.pc + self.disp.getValue(memory)

    def getLiteralRef(self, memory):
        addr = self.getAddr(memory)
        addr_ref = LiteralRef(addr, 2)
        lit_ref = LiteralRef(None, self.size, addr)
        return lit_ref, addr_ref

    def getValue(self, memory):
        ref, _ = self.getLiteralRef(memory)
        return ref.getValue(memory)

    def to_string(self, memory, **kwargs):
        ref, addr_ref = self.getLiteralRef(memory)
        return f"[{addr_ref.to_string(memory, forceLabel=True)}]"

    def via(self, ref: LiteralRef, addr, memory, **kwargs):
        if ref.pc != addr:
            # ref address doesn't match our target
            return "@" + self.to_string(memory, **kwargs)

        addr_ref = LiteralRef(addr-1, 2)

        kwargs["forceLabel"] = True
        kwargs["suppressAlt"] = True

        ret = f"{ref.to_string(memory, **kwargs)}"
        ret += f" (via {addr_ref.to_string(memory, **kwargs)}+1)"

        return ret

    def to_string_indirect(self, memory, **kwargs):
        addr = self.getAddr(memory)
        match memory.owned(addr):
            case (owner_addr, inst.Cpu6Inst() as o):
                if o.mnemonic == "call" and isinstance(o.target, DirectRef):
                    return self.via(o.target.ref, addr, memory, **kwargs)
                if o.mnemonic in ["ld", "st"] and isinstance(o.srcs[0], DirectRef):
                    return '[' + self.via(o.srcs[0].ref, addr, memory, **kwargs) + ']'
        return "@" + self.to_string(memory)


    def getNode(self, cpu):
        return cpu.getMem(LiteralValue(self.pc, 16).Add(self.disp), self.size * 8)

class IndirectRef(MemRef):
    def __init__(self, ref):
        self.ref = ref

    def __str__(self):
        return f"@{self.ref}"

    def to_string(self, memory, **kwargs):
        try:
            return self.ref.to_string_indirect(memory, **kwargs)
        except AttributeError as e:
            if e.obj != self.ref:
                raise e
            return f"@{self.ref.to_string(memory, **kwargs)}"

    def getNode(self, cpu):
        return cpu.getMem(self.ref)

class DeviceRef(Ref):
    # OPSYS exclusively uses these references when accessing MMIO device registers
    # CPU6 seems to be some feature to put MMIO in a different address space.
    # It must be disabled on boot for compatibility, and enabled later.
    def __init__(self, ref):
        self.ref = ref

    def __str__(self):
        return f"Device{self.ref}"

    def to_string(self, memory, **kwargs):
        return f"Device{self.ref.to_string(memory, **kwargs)}"

    def getNode(self, cpu):
        return cpu.getMem(self.ref)

def signedOffset(pc, mem):
    return LiteralRef(mem.get_i8(pc), 1, pc, signed=True)


# A short 2bit address mode, which will consume more bytes from PC
def Cpu6AddrMode(mode, pc, mem, prev=None, size = 1):
    match mode:
        case 0: # direct
            ref = DirectRef(mem.get_be16(pc), pc)
            pc += 2
            return ref, pc
        case 1: # complex
            regs = mem[pc]
            pc += 1

            reg_a = Reg16Ref(regs >> 4)
            reg_b = Reg16Ref(regs & 0xf)
            if reg_b.reg == 0:
                reg_b = None

            if regs & 0x10 == 0:
                imm = signedOffset(pc, mem)
                pc += 1
            else:
                imm = LiteralRef(mem.get_be16(pc), 2, pc)
                pc += 2

            # todo: This mode also does PC-relative addressing?
            return ComplexRef(reg_a, reg_b, imm), pc
        case 2: # indexed
            if getattr(prev, 'only_upper', False):
                # Not confirmed
                # There is a special case which packs two indexed references into one byte
                reg = mem[pc-1] & 0xf
                upper = False
            elif prev is not None:
                reg = mem[pc] & 0xf
                upper = False
                pc += 1
            else:
                reg = mem[pc] >> 4
                pc += 1
                upper = True
            ref = ComplexRef(Reg16Ref(reg))
            ref.only_upper = upper
            return ref, pc
        case 3: # literal
            ref = LiteralRef(mem.get(pc, size), size, pc)
            pc += size
            return ref, pc

# The traditional ee200 addressing mode used by most load/store. Plus jmp/call
def Cpu4AddrMode(mode, word, pc, mem):
    orig_pc = pc
    match mode:
        case 0: # Literal
            if word:
                return LiteralRef(mem.get_be16(pc), 2, pc), pc + 2
            return LiteralRef(mem[pc], 1, pc), pc + 1
        case 1: # Direct
            return DirectRef(mem.get_be16(pc), pc), pc + 2
        case 2: # Indirect
            return IndirectRef(DirectRef(mem.get_be16(pc), pc)), pc + 2
        case 3: # Displaced
            return PcDisplacementRef(pc+1, signedOffset(pc, mem), 1 + word), pc + 1
        case 4: # Displaced Indirect
            return IndirectRef(PcDisplacementRef(pc+1, signedOffset(pc, mem))), pc + 1
        case 5: # Indexed
            disp = None
            ref = Reg16Ref(mem[pc] >> 4)
            modifier = mem[pc] & 0xf
            pc += 1

            match modifier & 0x3:
                case 1: # PostIncrement
                    ref = PostIncRef(ref)
                case 2: # PreDecrement
                    ref = PreDecRef(ref)
                case 3:
                    return None, orig_pc

            if modifier & 8 == 8: # Displacement
                disp = signedOffset(pc, mem)
                pc += 1

            ref = ComplexRef(ref, None, disp)
            if modifier & 4 == 4: # Indirect
                return IndirectRef(ref), pc
            return ref, pc # Direct

        case 6 | 7:
            return None, pc
        case mode: # One byte indexed mode
            reg = (mode & 7) << 1
            return ComplexRef(Implicit(Reg16Ref(reg))), pc

def TwoRegExtendedMode(mode, pc, mem):
    dst_reg = Reg16Ref(mode & 0xe)
    src_reg = Reg16Ref((mode >> 4) & 0xe)
    match mode & 0x11:
        case 0x00: # neither lower bit set, normal reg, reg
            return dst_reg, src_reg, None, pc
        case 0x01: # dest <- src (direct)
            return dst_reg, src_reg, DirectRef(mem.get_be16(pc), pc), pc + 2
        case 0x10: # dest <- src op literal
            return dst_reg, src_reg, LiteralRef(mem.get_be16(pc), 2, pc), pc + 2
        case 0x11: # dest <- src(index) op dest
            disp = LiteralRef(mem.get_be16(pc), 2, pc)
            return dst_reg, ComplexRef(src_reg, None, disp), dst_reg, pc + 2


# Handles all the addressing modes in alu instructions
# returns (dst, src1, src2, newpc)
def AluAddrMode(mode, inst, pc, mem):
    # Small literal used in 20/30 instrutions
    # Shifts, rotates and increments effectively add 1 to 'imm' value
    imm = SmallLiteralRef((mode & 0xf) + (0 if inst in [0x22, 0x23, 0x32, 0x33] else 1))

    match inst & 0x70:
        case 0x20:
            return Reg8Ref(mode >> 4), imm, None, pc
        case 0x30 if mode & 0x10 == 0:
            return Reg16Ref(mode >> 4), imm, None, pc
        case 0x30:
            # lower nibble set means we use a special address mode
            addr = LiteralRef(mem.get_be16(pc), 2, pc)
            match (mode >> 4) & 0xe:
                case 0: # Direct
                    return DirectRef(addr), imm, None, pc+2
                case reg: # Indexed
                    return ComplexRef(Reg16Ref(reg), addr), imm, None, pc+2
        case 0x40:
            return Reg8Ref(mode & 0xf), Reg8Ref(mode >> 4), None, pc
        #case 0x50 if mode & 0x11 == 0: # neither lower nibble set
        case 0x50 | 0x70:
            return TwoRegExtendedMode(mode, pc, mem)

def D6Mode(mode, pc, mem):
    # almost the same as TwoRegExtendedMode above, bur with src and dst switched up
    dst_reg = Reg16Ref(mode & 0xe)
    src_reg = Reg16Ref((mode >> 4) & 0xe)
    match mode & 0x11:
        case 0x00: # neither lower nibble set, normal reg, reg
            return dst_reg, src_reg, pc
        case 0x01: # dest <- src (direct)
            return DirectRef(mem.get_be16(pc), pc), src_reg, pc + 2
        case 0x10: # dest <- src op literal
            return LiteralRef(mem.get_be16(pc), 2, pc), src_reg, pc + 2
        case 0x11: # dest <- src op reg
            disp = LiteralRef(mem.get_be16(pc), 2, pc)
            return ComplexRef(dst_reg, None, disp), src_reg, pc + 2

def F6Mode(pc, mem):
    opn = mem[pc]
    pc += 1

    if opn & 0x10:
        # Odd regs operate on bytes
        reg = Reg8Ref(opn >> 4)
    else:
        # Even regs operate on words
        reg = Reg16Ref(opn >> 4)

    offset = signedOffset(pc, mem)
    pc += 1

    ref = ComplexRef(Reg16Ref(opn & 0xe), offset)

    if opn & 0x01:
        # Device(Mem) <- reg
        return DeviceRef(ref), reg, pc
    else:
        # reg <- Device(Mem)
         return reg, DeviceRef(ref), pc

