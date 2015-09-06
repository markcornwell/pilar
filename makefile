# makefile
#
# may eliminate the makefile in the near future
# kept around for documentation

go:
	echo "(test-all)" | petite compil.scm | tee tests.out

# useful for getting sample assembly code from gcc
test.s: test.c
	gcc -O3 --omit-frame-pointer -S test.c

test.o: test.s
	as test.s -o test.o
