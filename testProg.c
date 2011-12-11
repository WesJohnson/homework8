#include "cma.h"

//#define MSIZE 1024*16
//unsigned char mem[MSIZE];

int main(int argc, char * argv[]) {
	int msize = atoi(argv[1]);
	unsigned char mem[msize];
	
	int i = -1;
	int x = 1;
	int max = x;
	char *strings[50];
	
	class_memory(mem,msize); // give it memory allocator
	do {
		i+=1;
		strings[i] = (char *)class_malloc(x);
		max = x;
		x*=2;
	}while(strings[i]);
	
	for (i = 50; i>0; i--) 
		class_free(strings[i]);
	class_stats();
	
	printf("\nThe last allocation was: %d\n",max);
}
