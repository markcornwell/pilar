
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

(add-tests-with-string-output "error handlers"			      
   [(funcall #t) => "error:funcall: first arg must be a procedure\n"]
   [(funcall 14) => "error:funcall: first arg must be a procedure\n"]
   [(funcall #\A) => "error:funcall: first arg must be a procedure\n"]
   [(funcall "foo") => "error:funcall: first arg must be a procedure\n"]
   [(funcall 'a) => "error:funcall: first arg must be a procedure\n"]
   [(funcall 'fx+ 13 14) => "error:funcall: first arg must be a procedure\n"]
   [(funcall 'car) => "error:funcall: first arg must be a procedure\n"]
   [(funcall 'funcall) => "error:funcall: first arg must be a procedure\n"]
   [(funcall (let ((x 2)) (fx+ x x))) => "error:funcall: first arg must be a procedure\n"]
   [(funcall '(a b)) => "error:funcall: first arg must be a procedure\n"]
   
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



