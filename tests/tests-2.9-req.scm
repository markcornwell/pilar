
(add-tests-with-string-output "error handlers for vectors"
   [(make-vector #t) => "error:make-vector: arg must be a fixnum\n"]
   [(vector-length 43) => "error:vector-length: arg must be a vector\n"]
   [(make-vector -1) => "error:make-vector: length must be a fixnum >= 0\n"]
   [(vector-length (make-vector 1)) => "1\n"]
   [(vector-length (make-vector 666)) => "666\n"]
   [(vector-set! (make-vector 1) 1 #t) => "error:vector-set!: index out of bounds\n"]
   [(let ([v (make-vector 1)]) (vector-set! v 1 #t)) => "error:vector-set!: index out of bounds\n"]
   [(let ([v (make-vector 5)]) (vector-set! v -1 42)) => "error:vector-set!: index out of bounds\n"]
   [(let ([v (make-vector 2)]) (vector-set! v #f 3)) => "error:vector-set!: arg must be a fixnum\n"]
   [(let ([v (make-vector 1)]) (vector-ref v 1)) => "error:vector-ref: index out of bounds\n"]
   [(let ([v (make-vector 5)]) (vector-ref v -4)) => "error:vector-ref: index out of bounds\n"]
   [(let ([v (make-vector 2)]) (vector-ref v #\Z)) => "error:vector-ref: arg must be a fixnum\n"]
   )

(add-tests-with-string-output "error handlers for strings"
   [(make-string #t) => "error:make-string: arg must be a fixnum\n"]
   [(make-string -42) => "error:make-string: length must be a fixnum >= 0\n"]
   [(string-ref (make-string 2) 2) => "error:string-ref: index out of bounds\n"]
   [(string-ref (make-string 2) -1) => "error:string-ref: index out of bounds\n"]
   [(string-ref #t -1) => "error:string-ref: arg must be a string\n"]
   [(string-length #t) => "error:string-length: arg must be a string\n"]
   [(string-set! (make-string 2) 2 #\A) => "error:string-set!: index out of bounds\n"]
   [(string-set! (make-string 2) -1 #\A) => "error:string-set!: index out of bounds\n"]
   [(string-set! #t -1 #\A) => "error:string-set!: arg must be a string\n"]   
   [(string-set! (make-string 2) #t #\A) => "error:string-set!: arg must be a fixnum\n"]
   [(string-set! (make-string 2) 0 #f) => "error:string-set!: arg must be a character\n"]
   )

(add-tests-with-string-output "error handlers for funcall"
   [(funcall #t) => "error:funcall: arg 1 must be a procedure\n"]
   [(funcall 14) => "error:funcall: arg 1 must be a procedure\n"]
   [(funcall #\A) => "error:funcall: arg 1 must be a procedure\n"]
   [(funcall "foo") => "error:funcall: arg 1 must be a procedure\n"]
   [(funcall 'a) => "error:funcall: arg 1 must be a procedure\n"]
   [(funcall 'fx+ 13 14) => "error:funcall: arg 1 must be a procedure\n"]
   [(funcall 'car) => "error:funcall: arg 1 must be a procedure\n"]
   [(funcall 'funcall) => "error:funcall: arg 1 must be a procedure\n"]
   [(funcall (let ((x 2)) (fx+ x x))) => "error:funcall: arg 1 must be a procedure\n"]
   [(funcall '(a b)) => "error:funcall: arg 1 must be a procedure\n"]
   [((lambda (x y)(cons x y)) 1 2 3) => "error:funcall: wrong number of args\n"]
   [((lambda (x y)(cons x y)) 1) => "error:funcall: wrong number of args\n"] 
   )

(add-tests-with-string-output "error handlers for fixnum"			      
   [(fixnum->char #t) => "error:fixnum->char: arg must be a fixnum\n"]
   [(fxlognot #t) => "error:fxlognot: arg must be a fixnum\n"]
   [(fxlogand #t #f) => "error:fxlogand: arg must be a fixnum\n"]
   [(fxlogor #t 12) => "error:fxlogor: arg must be a fixnum\n"]
   [(fxadd1 #f) => "error:fxadd1: arg must be a fixnum\n"]
   [(fxsub1 #\M) => "error:fxsub1: arg must be a fixnum\n"]
   [(fxzero? #f) => "error:fxzero?: arg must be a fixnum\n"]
   [(fx= #f 4) => "error:fx=: arg must be a fixnum\n"]
   [(fx= 4 #t) => "error:fx=: arg must be a fixnum\n"]
   [(fx<= #f 3) => "error:fx<=: arg must be a fixnum\n"]
   [(fx<= 3 #t) => "error:fx<=: arg must be a fixnum\n"]
   [(fx< #f 3) => "error:fx<: arg must be a fixnum\n"]
   [(fx< 3 #t) => "error:fx<: arg must be a fixnum\n"]
   [(fx>= #f 3) => "error:fx>=: arg must be a fixnum\n"]
   [(fx>= 3 #t) => "error:fx>=: arg must be a fixnum\n"]
   [(fx> #f 3) => "error:fx>: arg must be a fixnum\n"]
   [(fx> 3 #t) => "error:fx>: arg must be a fixnum\n"]
   [(fx+ #f 3) => "error:fx+: arg must be a fixnum\n"]
   [(fx+ 3 #t) => "error:fx+: arg must be a fixnum\n"]
   [(fx- #f 3) => "error:fx-: arg must be a fixnum\n"]
   [(fx- 3 #t) => "error:fx-: arg must be a fixnum\n"]
   [(fx* #f 3) => "error:fx*: arg must be a fixnum\n"]
   [(fx* 3 #t) => "error:fx*: arg must be a fixnum\n"]
   )

(add-tests-with-string-output "error handlers for pair"
   [(cons 1 1) => "(1 . 1)\n"]
   [(car #f) => "error:car: arg must be a pair\n"]
   [(cdr 43) => "error:cdr: arg must be a pair\n"]
   [(set-car! "foo" 42) => "error:set-car!: arg must be a pair\n"]
   [(set-cdr! #\A #f) => "error:set-cdr!: arg must be a pair\n"]
   [(cons #t (car #f)) => "error:car: arg must be a pair\n"]
   )


(add-tests-with-string-output "error handlers for char"
  [(char->fixnum 42) => "error:char->fixnum: arg must be a character\n"]
   [(char=? #\A #t) => "error:char=?: arg must be a character\n"]
   [(char=? #f #\B) => "error:char=?: arg must be a character\n"]   
   [(char=? #t 14) => "error:char=?: arg must be a character\n"]
   )

(add-tests-with-string-output "exit"
    [(foreign-call "s_foo") => "foo\n#t\n"]		      
    [(foreign-call "exit" 0) => ""]
 ;  [(foreign-call "exit" 1) => ""]			      
)

(add-tests-with-string-output "write"
 ;   [(foreign-call "s_nop") => "#t\n"]   ;; wierd - see base.scm
     [(foreign-call "s_42") => "42\n"]
     [(foreign-call "s_true") => "#t\n"]
     [(foreign-call "s_false") => "#f\n"]  
     [(foreign-call "s_once" 0) => "0\n"] ;; these all work with a pad of 0, 32
     [((lambda () (foreign-call "s_twice" 2))) => "4\n"]
     [(foreign-call "s_once" 1) => "1\n"]
     [(foreign-call "s_once" 2) => "2\n"]
     [(foreign-call "s_twice" 2) => "4\n"]
     [(foreign-call "s_twice" 250) => "500\n"]
     [(foreign-call "s_foo") => "foo\n#t\n"]  ;; this is first to break at pad=32, likes pad=36
     [(foreign-call "s_write_foo") => "foo\n#t\n"]
     [(foreign-call "s_write_hello") => "Hello World!\n#t\n"]
     [(foreign-call "s_exit") => ""]
     [(foreign-call "s_write" 1 "hello world" 11) => "hello world11\n"]
     [(foreign-call "s_write" 1 "hello world" (string-length "hello world")) => "hello world11\n"]
)

(add-tests-with-string-output "error"			      
    [(let* ([write-stderr (lambda (s)
		     (foreign-call "s_write" 1 s (string-length s)))]
	    [write-emsg (lambda (sym emsg)
		       (write-stderr "error:")
		       (write-stderr (symbol->string sym))
		       (write-stderr ": ")
		       (write-stderr emsg)
		       (write-stderr "\n"))])
       (write-emsg 'car "argument not a pair")
       #f) => "error:car: argument not a pair\n#f\n"]

    [(let* ([write-stderr (lambda (s)
			    (foreign-call "s_write" 1 s (string-length s)))]
	    [write-emsg (lambda (sym emsg)
			  (write-stderr "error:")
			  (write-stderr (symbol->string sym))
			  (write-stderr ": ")
			  (write-stderr emsg)
			  (write-stderr "\n"))])
       (write-emsg 'car "argument not a pair")
       (foreign-call "s_exit" 1) ;; must call s_exit to properly convert fixnum 1 to int 1
       #f) => "error:car: argument not a pair\n"]  
    [(error 'car "argument must be a pair") => "error:car: argument must be a pair\n"]
    [(error 'cdr "argument must be a pair") => "error:cdr: argument must be a pair\n"]
    [(error 'funcall "first arg must be a procedure") => "error:funcall: first arg must be a procedure\n"]
    )

(add-tests-with-string-output "primitives list"
    ;; [(primitives) => "(fixnum->char char->fixnum null? char? fixnum? boolean? not eq? char=? fxlognot fxlogand fxlogor fxadd1 fxsub1 fxzero? fx= fx< fx<= fx> fx>= fx+ fx- fx* pair? cons car cdr set-car! set-cdr! vector? make-vector vector-length vector-set! vector-ref vector make-string string? string-length string-ref string-set! symbol? make-symbol symbol->string symbol-value car cdr procedure?)\n"]
    [(list-ref (primitives) 0) => "fixnum->char\n"]
    [(list-ref (primitives) 1) => "char->fixnum\n"]
    [(list-ref (primitives) 2) => "null?\n"]
    [(list-ref (primitives) 3) => "char?\n"]
)



;; (add-tests-with-string-output "S_error"
;;  [(let ([error (lambda args
;;                  (foreign-call "ik_error" args))])
;;    (error #f "died")
;;    12) => ""]

;;  [(let ([error (lambda args
;;                  (foreign-call "ik_error" args))])
;;    (error 'car "died")
;;    12) => ""]
;; )



