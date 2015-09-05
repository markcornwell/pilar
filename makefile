go:
	petite load.scm

pgm.o: pgm.s
	as pgm.s -o pgm.o

main: main.c pgm.o
	gcc main.c pgm.o -o main

# useful for getting sample assembly code from gcc
test.s: test.c
	gcc -O3 --omit-frame-pointer -S test.c

test.o: test.s
	as test.s -o test.o
