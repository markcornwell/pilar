# (letrec ((f (lambda (f n) (if (fxzero? n) 1 (fx* n (f f (fxsub1 n))))))) (f f 5))
# == explicit-begins  ==>
# (letrec ((f (lambda (f n) (if (fxzero? n) 1 (fx* n (f f (fxsub1 n))))))) (f f 5))
# == eliminate-let*  ==>
# (letrec ((f (lambda (f n) (if (fxzero? n) 1 (fx* n (f f (fxsub1 n))))))) (f f 5))
# == eliminate-shadowing  ==>
# (letrec ((f (lambda (f n) (if (fxzero? n) 1 (fx* n (f f (fxsub1 n))))))) (f f 5))
# == vectorize-letrec  ==>
# (let ((f (make-vector 1))) (begin (begin (vector-set! f 0 (lambda ((vector-ref f 0) n) (if (fxzero? n) 1 (fx* n ((vector-ref f 0) (vector-ref f 0) (fxsub1 n))))))) ((vector-ref f 0) (vector-ref f 0) 5)))
# == eliminate-set!  ==>
# (let ((f (make-vector 1))) (begin (begin (vector-set! f 0 (lambda ((vector-ref f 0) n) (let (((vector-ref f 0) (vector-ref f 0)) (n n)) (if (fxzero? n) 1 (fx* n ((vector-ref f 0) (vector-ref f 0) (fxsub1 n)))))))) ((vector-ref f 0) (vector-ref f 0) 5)))
# == close-free-variables  ==>
