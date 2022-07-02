
from .memory import entry_points, TransferExecution, ResumeExecution
import struct


def disassemble_basicblock(mem, entry, isa):
    """Disassembles instructions until it hits control flow or
       something that has already been processed."""

    valid = True
    pc = entry
    while valid and pc < 0xfe00:
        if mem.visited(pc):
            return

        mem.info(pc).visited = True

        info = isa.disassemble_instruction(mem, pc)
        valid = info.valid

        for i in range(pc+1, pc + len(info.bytes)):
            if mem.info(i).visited:
                valid = False

        if valid:
            mem.info(pc).instruction = info
            for i in range(1, len(info.bytes)):
                mem.info(pc + i).insn_offset = i
                if mem.info(pc + i).label:
                    # There could be a label inside an instruction, perhaps
                    # from wecb fixups. This means there's an inline variable here,
                    # let's put the label at the instruction itself
                    mem.create_label(pc)

        if len(info.next_pc) == 0:
            return

        for next_pc in info.next_pc[1:]:
            if isinstance(next_pc, TransferExecution):
                mem.create_label(next_pc())
            entry_points.insert(0, next_pc())
            disassemble_basicblock(mem, next_pc(), isa)

        next_pc = info.next_pc[0]

        if isinstance(next_pc, TransferExecution):
            mem.create_label(next_pc())
            entry_points.insert(0, next_pc())
            return

        pc = next_pc()


def disassembleAllEntries(memory, isa):
    while entry_points:
        entry = entry_points.pop(0)
        disassemble_basicblock(memory, entry, isa)