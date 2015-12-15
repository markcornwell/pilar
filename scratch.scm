yahweh:pilar mark$ cat pgm.s

(letrec ((e (lambda (x) (if (fxzero? x) #t (o (fxsub1 x)))))
	 (o (lambda (x) (if (fxzero? x) #f (e (fxsub1 x))))))
  (e 25))

# == eliminate-multi-element-body  ==>

# (letrec ((e (lambda (x) (if (fxzero? x) #t (o (fxsub1 x)))))
	   (o (lambda (x) (if (fxzero? x) #f (e (fxsub1 x))))))
    (e 25))

# == eliminate-variable-name-shadowing  ==>

# (letrec ((e (lambda (x) (if (fxzero? x) #t (o (fxsub1 x)))))
	   (o (lambda (x) (if (fxzero? x) #f (e (fxsub1 x))))))
    (e 25))

# == vectorize-letrec  ==>

# (let ((e (make-vector 1))
	(o (make-vector 1)))
    (begin ((vector-set! e 0 (lambda (x)
			       (if (fxzero? x) #t ((vector-ref o 0)
						   (fxsub1 x)))))
	    (vector-set! o 0 (lambda (x)
			       (if (fxzero? x) #f ((vector-ref e 0)
						   (fxsub1 x))))))
	   ((vector-ref e 0) 25)))

# == eliminate-set!  ==>

# (let ((e (make-vector 1))
	(o (make-vector 1)))
    (begin ((vector-set! e 0 (lambda (x)
			       (if (fxzero? x) #t ((vector-ref o 0)
						   (fxsub1 x)))))
	    (vector-set! o 0 (lambda (x)
			       (if (fxzero? x) #f ((vector-ref e 0)
						   (fxsub1 x))))))
	   ((vector-ref e 0) 25)))

# == close-free-variables  ==>

# (let ((e (make-vector 1))
	(o (make-vector 1)))
    (begin ((vector-set! e 0 (closure (x) (o)
				      (if (fxzero? x) #t ((vector-ref o 0) (fxsub1 x)))))
	    (vector-set! o 0 (closure (x) (e)
				      (if (fxzero? x) #f ((vector-ref e 0) (fxsub1 x))))))
	   ((vector-ref e 0) 25)))

--------------

yahweh:pilar mark$ cat pgm.s
(let* ((x 1))
  (let* ((x (fx+ x 1))
	 (y (fx+ x 1)))
    y))

# == eliminate-multi-element-body  ==>

 (let* ((x 1))
    (let* ((x (fx+ x 1))
	   (y (fx+ x 1)))
      y))

# == eliminate-variable-name-shadowing  ==>

 (let* ((x 1))
    (let* ((x$19 (fx+ x$19 1))   <<---- WRONG  
	   (y (fx+ x$19 1)))
      y))

Should be

 (let* ((x 1))
    (let* ((x$19 (fx+ x 1)) 
	   (y (fx+ x$19 1)))
      y))


# == vectorize-letrec  ==>

# (let* ((x 1))
    (let* ((x$19 (fx+ x$19 1))
	   (y (fx+ x$19 1))) y))

# == eliminate-set!  ==>

# (let* ((x 1))
    (let* ((x$19 (fx+ x$19 1))
	   (y (fx+ x$19 1))) y))

# == close-free-variables  ==>

# (let* ((x 1))
    (let* ((x$19 (fx+ x$19 1))
	   (y (fx+ x$19 1)))
      y))
-------------------------------

(let ((x 12))
  (let ((x #f))
    (set! x 14))
  x)
# == eliminate-multi-element-body  ==>
(let ((x 12))
  (begin
    (let ((x #f))
      (set! x 14))
    x))
# == eliminate-let*  ==>
(let ((x 12))
  (begin
    (let ((x #f))
      (set! x 14))
    x))
# == eliminate-variable-name-shadowing  ==>
(let ((x 12))
    (begin
      (let ((x$0 #f))
	(set! x$0 14))
      x))
# == vectorize-letrec  ==>
(let ((x 12))
  (begin
    (let ((x$0 #f))
      (set! x$0 14))
    x))
# == eliminate-set!  ==>
 (let ((x 12))
    (begin
      (let (((vector-ref x$0 0) #f))  <<--- WRONG ----<<<
	(vector-set! x$0 0 14))
      x))
# == close-free-variables  ==>
 (let ((x 12)) (begin (let (((vector-ref x$0 0) #f)) (vector-set! x$0 0 14)) x))
