# makefile
#
# may eliminate the makefile in the near future
# kept around for documentation

go:
	echo "(test-all)" | petite compil.scm | tee tests.out

base.s: base.scm compil.scm tests-driver.scm
	echo "(run-compil-lib)" | petite compil.scm | tee base.out

dbg:
	as -arch i386 p.s -o p.o
	gcc -m32 -Wall -Wl,-no_pie runtime.c p.o -o st
	./st

# useful for getting sample assembly code from gcc
test.s: test.c
	gcc -O3 --omit-frame-pointer -S test.c

test.o: test.s
	as test.s -o test.o

runtime.s: runtime.c
	gcc -m32 -Wall -S runtime.c

hello.s: hello.c
	gcc -Wall -O3 -m32 hello.c -S -o hello.s

hello: hello.s
	gcc -Wall -m32 hello.s -o hello

hell: hell.s
	gcc -Wall -m32 -Wl,-no_pie hell.s -o hell

exit.s:
	gcc -Wall -O3 -m32 exit.c -S -o exit.s

exit: .s exit.c
	gcc -Wall -m32 exit.s -o exit

foo : foo.s
	as -arch i386 foo.s -o foo.o
	gcc -Wall -O3 -m32 -Wl,-no_pie runtime.c base.o foo.o -o foo
