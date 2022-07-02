
class Xargs():
    def __init__(self, xargs):
        self.xargs = xargs

    def annotate(self, mem, pc):
        for name, arg in self.xargs.items():
            info = mem.info(pc)
            info.arg_name = name
            match arg:
                case "ptr":
                    info.type = "ptr"
                    pc += 2
                case "word":
                    info.type = ">H"
                    pc += 2
                case "byte" | "char":
                    pc += 1
                    info.type = "B"
                case "cstring":
                    info.type = "cstring"
                    while mem[pc] != 0:
                        pc += 1
        return pc

class FunctionInfo:
    def __init__(self, x_args: Xargs):
        self.xargs = x_args

