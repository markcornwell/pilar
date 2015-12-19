(letrec ((f 12)
	 (g (lambda (n) (set! f n))))
  (g 130)
  f)

# == eliminate-multi-element-body  ==>

(letrec ((f 12)
	 (g (lambda (n)
	      (set! f n))))
  (begin
    (g 130)
    f))

# == eliminate-let*  ==>

(letrec ((f 12)
	 (g (lambda (n)
	      (set! f n))))
  (begin
    (g 130)
    f))

# == eliminate-variable-name-shadowing  ==>

(letrec ((f 12)
	 (g (lambda (n)
	      (set! f n))))
  (begin
    (g 130)
    f))

# == vectorize-letrec  ==>

(let ((f (make-vector 1))
      (g (make-vector 1)))
  (begin
    (begin
      (vector-set! f 0 12)
      (vector-set! g 0 (lambda (n)
			 (set! (vector-ref f 0) n))))
    (begin
      ((vector-ref g 0) 130)
      (vector-ref f 0))))

# == eliminate-set!  ==>
