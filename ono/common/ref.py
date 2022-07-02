
class Ref:
    def to_string(self, memory, **kwargs):
        return str(self)

class RegRef(Ref):
    pass

class MemRef(Ref):
    pass

