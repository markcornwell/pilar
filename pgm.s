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
# (let ((f (lambda (a0 . args) (let ((a0 a0)) 12)))) (f 10))
# == close-free-variables  ==>
