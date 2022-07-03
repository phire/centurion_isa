
class Ref:
    def to_string(self, mem, **kwargs):
        if hasattr(self, "ref"):
            return self.ref.to_string(mem, **kwargs)
        raise(NotImplementedError)

    def __len__(self):
        if hasattr(self, "ref"):
            return len(self.ref)
        print(f"{self} has no length")
        raise(NotImplementedError)

    def __bool__(self):
        return True

    def refs(self):
        if hasattr(self, "ref"):
            return [self.ref]
        return []

    def all_refs(self):
        to_process = self.refs()
        refs = []
        while to_process:
            ref = to_process.pop()
            refs.append(ref)
            to_process += ref.refs()
        return refs



class RegRef(Ref):
    def __len__(self):
        return 0

class MemRef(Ref):
    pass

class Implicit(Ref):
    def __init__(self, ref):
        self.ref = ref

