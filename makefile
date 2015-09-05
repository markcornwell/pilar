test.s: test.c
	gcc -O3 --omit-frame-pointer -S test.c

test.o: test.s
	as test.s -o test.o

main: main.c test.o
	gcc main.c test.o -o main


