env = Environment();

env.Alias('install', ['/usr/local/bin'])

lib_target  = "libcma.so"
lib_sources = ["cma.c"]
 
env.SharedLibrary(target = lib_target, source = lib_sources)

ma = env.Program(target='ma', source=['ma.c', 'libcma.so'])
testProg = env.Program(target='testProg', source=['testProg.c', 'libcma.so'])

env.Install("/usr/local/bin", ma)
env.Install("/usr/local/bin", testProg)
