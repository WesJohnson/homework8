LIBS=libcma.so
EXES=ma testProg
.PHONY: all clean

all: $(EXES)

libcma.so: cma.o
	gcc cma.o -shared -o libcma.so

ma.o: ma.c
	gcc -c ma.c -o ma.o

testProg.o: testProg.c
	gcc -c testProg.c -o testProg.o

cma.o: cma.c
	gcc -c cma.c -fPIC

ma: libcma.so ma.o
	gcc -o ma ma.o -L. -lcma

testProg: libcma.so testProg.o
	gcc -o testProg testProg.o -L. -lcma

test: ma testProg
	./ma; ./testProg 16384

dist: cma.c cma.h ma.c testProg.c Makefile
	tar -cvf cma.tar cma.h cma.c ma.c testProg.c Makefile

clean:
	-rm $(LIBS)
	-rm $(EXES)
	-rm *.o
