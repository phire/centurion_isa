
import os, sys
from os import path

ignore = []
additional_deps = []

def add_dependency(path):
    additional_deps.append(path)

def pretty_path(path, basedir):
    # use relative path if it's within our basedir

    relpath = os.path.relpath(path, basedir)
    if not relpath.startswith('..'):
        path = relpath
    return path

def collect_import_deps(basedir):
    deps = []
    # Collect paths to all currently imported modules
    for module in sys.modules.values():
        try:
            path = pretty_path(module.__file__, basedir)
            if path not in ignore:
                deps.append(path)
        except:
            # ignore build-in modules that don't have a __file__
            pass

    return deps

def write_depfile(depfile, target, deps):
    # make folders exists
    os.makedirs(os.path.dirname(depfile), exist_ok=True)

    # write out dependencies in a format a Makefile can import
    with open(depfile, 'w') as f:
        dep_string = ' \\\n\t'.join(deps) # put each dep on it's own line
        f.write(f"{target}: \\\n\t{dep_string}\n")

        f.write("\n# These empty rules help avoid issues with deleted files\n")

        for dep in deps:
            f.write(f"{dep}:\n")

def generate_depfile(depfile, output_filename):
    """
    Use some python magic to automatically generate make dependency info
    for the currently loaded modules.

    Specify additional datafiles with add_dependency
    """

    basedir = path.curdir

    deps = collect_import_deps(basedir) + additional_deps

    write_depfile(depfile, output_filename, deps)


__all__ = ["add_dependency", "generate_depfile"]
