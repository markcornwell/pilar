
(add-tests-with-string-output "error"
  [(error 'foo "here") => "error:foo: here\n"])


(add-tests-with-string-output "apply error"
  [(let ([f 6])
     (f f)) => "error:funcall: arg 1 must be a procedure\n"]
  [(let ([f 6])
     (f (f))) => "error:funcall: arg 1 must be a procedure\n"]
  [(1 2 3) => "error:funcall: arg 1 must be a procedure\n"]
  [(1 (3 4)) => "error:funcall: arg 1 must be a procedure\n"]
  [(let ([f (lambda () (1 2 3))])
     12) => "12\n"]
)

(add-tests-with-string-output "arg-check for fixed-arg procedures"
 [(let ([f (lambda () 12)])
    (f)) => "12\n"]
 [(let ([f (lambda () 12)])
    (f 1)) => "error:funcall: wrong number of args\n"]
 [(let ([f (lambda () 12)])
    (f 1 2)) => "error:funcall: wrong number of args\n"]
 [(let ([f (lambda (x) (fx+ x x))])
    (f)) =>  "error:funcall: wrong number of args\n"]
 [(let ([f (lambda (x) (fx+ x x))])
    (f 1)) => "2\n"]
 [(let ([f (lambda (x) (fx+ x x))])
    (f 1 2)) => "error:funcall: wrong number of args\n"]
 [(let ([f (lambda (x y) (fx* x (fx+ y y)))])
    (f)) => "error:funcall: wrong number of args\n"]
 [(let ([f (lambda (x y) (fx* x (fx+ y y)))])
    (f 2)) => "error:funcall: wrong number of args\n"]
 [(let ([f (lambda (x y) (fx* x (fx+ y y)))])
    (f 2 3)) => "12\n"]
 [(let ([f (lambda (x y) (fx* x (fx+ y y)))])
    (f 2 3 4)) => "error:funcall: wrong number of args\n"]
) 
 
(add-tests-with-string-output "arg-check for var-arg procedures"
 [(let ([f (lambda x x)])
    (f)) => "()\n"]
 [(let ([f (lambda x x)])
    (f 'a)) => "(a)\n"]
 [(let ([f (lambda x x)])
    (f 'a 'b)) => "(a b)\n"]
 [(let ([f (lambda x x)])
    (f 'a 'b 'c)) => "(a b c)\n"]
 [(let ([f (lambda x x)])
    (f 'a 'b 'c 'd)) => "(a b c d)\n"]
 
 [(let ([f (lambda (x . rest) (vector x rest))])
    (f)) => "error:funcall: too few args\n"]
 [(let ([f (lambda (x . rest) (vector x rest))])
    (f 'a)) => "#(a ())\n"]
 [(let ([f (lambda (x . rest) (vector x rest))])
    (f 'a 'b)) => "#(a (b))\n"]
 [(let ([f (lambda (x . rest) (vector x rest))])
    (f 'a 'b 'c)) => "#(a (b c))\n"]
 [(let ([f (lambda (x . rest) (vector x rest))])
    (f 'a 'b 'c 'd)) => "#(a (b c d))\n"]
 
 [(let ([f (lambda (x y . rest) (vector x y rest))])
    (f)) => "error:funcall: too few args\n"]
 [(let ([f (lambda (x y . rest) (vector x y rest))])
    (f 'a)) => "error:funcall: too few args\n"]
 [(let ([f (lambda (x y . rest) (vector x y rest))])
    (f 'a 'b)) => "#(a b ())\n"]
 [(let ([f (lambda (x y . rest) (vector x y rest))])
    (f 'a 'b 'c)) => "#(a b (c))\n"]
 [(let ([f (lambda (x y . rest) (vector x y rest))])
    (f 'a 'b 'c 'd)) => "#(a b (c d))\n"]
) 

;; (add-tests-with-string-output "arg-check for primitives" 
;;   [(cons 1 2 3) => ""]
;;   [(cons 1) => ""]
;;   [(vector-ref '#() 1 2 3 4) => ""]
;;   [(vector-ref) => ""]
;;   [(vector) => "#()\n"]
;;   [(string) => "\"\"\n"]
;; )
