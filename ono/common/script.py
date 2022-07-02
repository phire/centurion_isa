
import os, sys
from depgen import add_dependency
from common.memory import entry_points, memory_addr_info

base = os.path.dirname(sys.modules['__main__'].__file__)

def run_script(script_filename, mem):
    add_dependency(script_filename)

    old_path = sys.path
    # add script's directory to sys.path
    sys.path += [os.path.abspath(os.path.dirname(script_filename))]

    with open(script_filename, "r") as f:
        ast = compile(f.read(), script_filename, 'exec')

    name = '.'.join(os.path.split(os.path.splitext(script_filename)[0]))
    script_globals = {
        # Needed for relative imports to work
        '__name__': name,
        '__file__': os.path.abspath(script_filename)
    }
    exec(ast, script_globals, script_globals)

    # restore original path
    sys.path = old_path

    if 'annotate' in script_globals:
        script_globals['annotate'](mem, entry_points, memory_addr_info)


all = [run_script]