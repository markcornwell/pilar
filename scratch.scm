yahweh:pilar mark$ make
echo "(test-all)" | petite compil.scm | tee tests.out
Petite Chez Scheme Version 8.4
Copyright (c) 1985-2011 Cadence Research Systems

> Performing vararg not using rest argument tests ...
test 0:(let ((f (lambda args 12))) (f)) ... ok
test 1:(let ((f (lambda args 12))) (f 10)) ... ok
test 2:(let ((f (lambda args 12))) (f 10 20)) ... ok
test 3:(let ((f (lambda args 12))) (f 10 20 30)) ... ok
test 4:(let ((f (lambda args 12))) (f 10 20 30 40)) ... ok
test 5:(let ((f (lambda args 12))) (f 10 20 30 40 50)) ... ok
test 6:(let ((f (lambda args 12))) (f 10 20 30 40 50 60 70 80 90)) ... ok
test 7:(let ((f (lambda (a0 . args) 12))) (f 10)) ...Exception in car: args is not a pair
> 
yahweh:pilar mark$ cat pgm.s
# (let ((f (lambda (a0 . args) 12))) (f 10))
# == explicit-begins  ==>
# (let ((f (lambda (a0 . args) 12))) (f 10))
# == eliminate-let*  ==>
# (let ((f (lambda (a0 . args) 12))) (f 10))
# == eliminate-shadowing  ==>
# (let ((f (lambda (a0 . args) 12))) (f 10))
# == vectorize-letrec  ==>
# (let ((f (lambda (a0 . args) 12))) (f 10))
# == eliminate-set!  ==>
# (let ((f (lambda (a0 . args) (let ((a0 a0)) 12)))) (f 10))   ;; <<<<---- BAD
# == close-free-variables  ==>
yahweh:pilar mark$

