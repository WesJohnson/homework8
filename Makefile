LIBS=libcma.so
EXES=ma testProg
DEBUG=libcmaDebug.so maDebug testProgDebug
.PHONY: all clean

all: $(EXES)

libcma.so: cma.o
	gcc cma.o -shared -o libcma.so

libcmaDebug.so: cmaDebug.o
	gcc cmaDebug.o -shared -o libcmaDebug.so

ma.o: ma.c
	gcc -c ma.c -o ma.o

maDebug.o: ma.c
	gcc -c ma.c -o maDebug.o
	
testProg.o: testProg.c
	gcc -c testProg.c -o testProg.o

testProgDebug.o: testProg.c
	gcc -c testProg.c -o testProgDebug.o

cma.o: cma.c
	gcc -c cma.c -fPIC

cmaDebug.o: cma.c
	gcc -c cma.c -o cmaDebug.o -fPIC -DDODEBUG

ma: libcma.so ma.o
	gcc -o ma ma.o -L. -lcma

maDebug: libcmaDebug.so maDebug.o
	gcc -o maDebug  maDebug.o -L. -lcmaDebug

testProg: libcma.so testProg.o
	gcc -o testProg testProg.o -L. -lcma

testProgDebug: libcmaDebug.so testProgDebug.o
	gcc -o testProgDebug testProgDebug.o -L. -lcmaDebug

test: ma testProg
	./ma; ./testProg 16384

debug: maDebug testProgDebug
	./maDebug; ./testProgDebug 16384

dist: cma.c cma.h ma.c testProg.c Makefile
	tar -cvf cma.tar cma.h cma.c ma.c testProg.c Makefile

clean:
	-rm $(LIBS)
	-rm $(EXES)
	-rm $(DEBUG)
	-rm *.o
