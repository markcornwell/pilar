# makefile
#
# may eliminate the makefile in the near future
# kept around for documentation

go:
	echo "(test-all)" | petite compil.scm | tee tests.out

clean:
	rm -f stst.heap
	rm -f stst.out
	rm -f tests.out
	rm -f pgm.s

