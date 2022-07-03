
from .memory import entry_points, TransferExecution, ResumeExecution
import struct
import sys, traceback, pdb


def disassemble_basicblock(mem, entry, isa):
    """Disassembles instructions until it hits control flow or
       something that has already been processed."""



    valid = True
    pc = entry
    while valid and pc < 0xfe00:
        if mem.visited(pc) or mem.info(pc).type:
            return

        info = mem.info(pc)
        info.visited = True


        if mem[pc] == 0 and mem.get(pc, 16) == 0:
            # abort runs of more than 16 zeros
            mem.info(pc).visited = True
            return

        match = isa.disassemble_instruction(mem, pc)
        valid = match.valid

        length = match.length()
        for i in range(pc+1, pc + length):
            if mem.info(i).visited:
                valid = False

        if valid:
            info.type = match.type()
            info.length = length
            assert length > 0

            for i in range(1, length):
                mem.info(pc + i).insn_offset = i
                if mem.info(pc + i).label:
                    # There could be a label inside an instruction, perhaps
                    # from wecb fixups. This means there's an inline variable here,
                    # let's put the label at the instruction itself
                    mem.create_label(pc)

        next = match.next_pc(mem)

        if not next:
            return

        for next_pc in next[1:]:
            dest = next_pc()
            if isinstance(next_pc, TransferExecution):
                mem.create_label(dest)
            entry_points.insert(0, dest)
            disassemble_basicblock(mem, dest, isa)

        next_pc = next[0]
        pc = next_pc()

        if isinstance(next_pc, TransferExecution):
            mem.create_label(pc)
            entry_points.insert(0, pc)
            return

def disassembleAllEntries(memory, isa):
    while entry_points:
        entry = entry_points.pop(0)
        disassemble_basicblock(memory, entry, isa)