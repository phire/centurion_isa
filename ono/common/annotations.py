from common.memory import memory_addr_info, entry_points
from depgen import add_dependency

def read_annotations(name, memory):
    add_dependency(name)
    with open(name, "r") as f:
        for line in f.readlines():
           if len(line) == 0 or line[0] == "#":
               continue
           comment_pos = line.find(';')
           if comment_pos == -1:
               comment = None
           else:
               comment = line[comment_pos + 1:].strip()
               line = line[:comment_pos]

           items = line.split(',', 2)
           addr_str = items[0].strip()

           if addr_str == "":
               # No address specified.
               # This is a continuation of a multi-line comment
               text = "\n" + comment
               if pre_comment:
                   memory.info(last_comment).pre_comment += text
               else:
                   memory.info(last_comment).comment += text
               continue

           address = int(addr_str, 0)
           if len(items) < 2:
               type = ""
           else:
               type = items[1].strip()
               # "comment" is optional, a missing or empty field has the same meaning
               if type == "comment":
                   type = ""

           if type == "pre_comment":
               memory.info(address).pre_comment = comment
               last_comment = address
               pre_comment = True
               continue

           if type == "code":
               entry_points.append(address)
               if len(items) > 2:
                   label = items[2].strip()
               else:
                   label = f"Entry_{hex(address)}"
               memory.info(address).label = label
           elif type == "fnptr":
                # 16 bit absolute function pointer
                memory.info(address).type = "fnptr"
                ptr_addr = memory.get_be16(address)
                entry_points.append(ptr_addr)

           elif type == "label":
               memory.info(address).label = items[2].strip()
           elif type != "":
               memory.info(address).visited = True
               memory.info(address).type = type
               # Data is often embedded in the code, generate an entry point at the end
               # so that disassembly continues.
               if type[0:2] == ">B":
                   entry_points.append(address + 1)
               elif type[0:2] == ">H" or type == "ptr":
                   entry_points.append(address + 2)
               elif type == "cstring":
                   while c := memory[address] & 0x7f:
                       address += 1
                   entry_points.append(address + 1)
               elif type == "pstring16":
                   pass
                   #entry_points.append(address + 2 + get_pstring16_length(memory, address))

           if comment is not None:
               memory.info(address).comment = comment
               last_comment = address
               pre_comment = False

def apply_comments(comments):
    for addr, comment in comments:
        memory_addr_info[addr].comment = comment

