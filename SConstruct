env = Environment();
env.Program(target='ma', source=['ma.c', 'libcma.so'])

lib_target  = "libcma.so"
lib_sources = ["cma.c"]

env.SharedLibrary(target = lib_target, source = lib_sources)
