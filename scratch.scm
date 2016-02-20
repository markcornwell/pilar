# (let ((s (make-string 10000)) (t "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz12344567890<>,./?;:'\"[]{}\\|`~!@#$%^&*()-_=+")) (letrec ((fill-string! (lambda (i j) (unless (fx= i (string-length s)) (if (fx>= j (string-length t)) (fill-string! i (fx- j (string-length t))) (begin (string-set! s i (string-ref t j)) (fill-string! (fxadd1 i) (fx+ j 17))))))) (write-string! (lambda (i p) (cond ((fx= i (string-length s)) (close-output-port p)) (else (begin (write-char (string-ref s i) p) (write-string! (fxadd1 i) p)))))) (verify (lambda (i p) (let ((x (read-char p))) (cond ((eof-object? x) (begin (close-input-port p) (fx= i (string-length s)))) ((fx= i (string-length s)) (error (quote verify) "file too short")) ((char= (string-ref s i) x) (verify (fxadd1 i) p)) (else (error (quote verify) "mismatch"))))))) (begin (fill-string! 0 0) (write-string! 0 (open-output-file "stst.tmp" (quote replace))) (verify 0 (open-input-file "stst.tmp")))))
# == explicit-begins  ==>
# (let ((s (make-string 10000)) (t "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz12344567890<>,./?;:'\"[]{}\\|`~!@#$%^&*()-_=+")) (letrec ((fill-string! (lambda (i j) (unless (fx= i (string-length s)) (if (fx>= j (string-length t)) (fill-string! i (fx- j (string-length t))) (begin (string-set! s i (string-ref t j)) (fill-string! (fxadd1 i) (fx+ j 17))))))) (write-string! (lambda (i p) (cond ((fx= i (string-length s)) (close-output-port p)) (else (begin (write-char (string-ref s i) p) (write-string! (fxadd1 i) p)))))) (verify (lambda (i p) (let ((x (read-char p))) (cond ((eof-object? x) (begin (close-input-port p) (fx= i (string-length s)))) ((fx= i (string-length s)) (error (quote verify) "file too short")) ((char= (string-ref s i) x) (verify (fxadd1 i) p)) (else (error (quote verify) "mismatch"))))))) (begin (fill-string! 0 0) (write-string! 0 (open-output-file "stst.tmp" (quote replace))) (verify 0 (open-input-file "stst.tmp")))))
# == eliminate-let*  ==>
# (let ((s (make-string 10000)) (t "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz12344567890<>,./?;:'\"[]{}\\|`~!@#$%^&*()-_=+")) (letrec ((fill-string! (lambda (i j) (unless (fx= i (string-length s)) (if (fx>= j (string-length t)) (fill-string! i (fx- j (string-length t))) (begin (string-set! s i (string-ref t j)) (fill-string! (fxadd1 i) (fx+ j 17))))))) (write-string! (lambda (i p) (cond ((fx= i (string-length s)) (close-output-port p)) (else (begin (write-char (string-ref s i) p) (write-string! (fxadd1 i) p)))))) (verify (lambda (i p) (let ((x (read-char p))) (cond ((eof-object? x) (begin (close-input-port p) (fx= i (string-length s)))) ((fx= i (string-length s)) (error (quote verify) "file too short")) ((char= (string-ref s i) x) (verify (fxadd1 i) p)) (else (error (quote verify) "mismatch"))))))) (begin (fill-string! 0 0) (write-string! 0 (open-output-file "stst.tmp" (quote replace))) (verify 0 (open-input-file "stst.tmp")))))
# == uniquify-variables  ==>
# (let ((f8049 (make-string 10000)) (f8048 "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz12344567890<>,./?;:'\"[]{}\\|`~!@#$%^&*()-_=+")) (letrec ((f8071 (lambda (f8086 f8087) (unless (fx= f8086 (string-length f8049)) (if (fx>= f8087 (string-length f8048)) (f8071 f8086 (fx- f8087 (string-length f8048))) (begin (string-set! f8049 f8086 (string-ref f8048 f8087)) (f8071 (fxadd1 f8086) (fx+ f8087 17))))))) (f8070 (lambda (f8084 f8085) (cond ((fx= f8084 (string-length f8049)) (close-output-port f8085)) (else (begin (write-char (string-ref f8049 f8084) f8085) (f8070 (fxadd1 f8084) f8085)))))) (f8069 (lambda (f8080 f8081) (let ((f8083 (read-char f8081))) (cond ((eof-object? f8083) (begin (close-input-port f8081) (fx= f8080 (string-length f8049)))) ((fx= f8080 (string-length f8049)) (error (quote f8069) "file too short")) ((char= (string-ref f8049 f8080) f8083) (f8069 (fxadd1 f8080) f8081)) (else (error (quote f8069) "mismatch"))))))) (begin (f8071 0 0) (f8070 0 (open-output-file "stst.tmp" (quote replace))) (f8069 0 (open-input-file "stst.tmp")))))
# == vectorize-letrec  ==>
# (let ((f8049 (make-string 10000)) (f8048 "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz12344567890<>,./?;:'\"[]{}\\|`~!@#$%^&*()-_=+")) (let ((f8071 (make-vector 1)) (f8070 (make-vector 1)) (f8069 (make-vector 1))) (begin (begin (vector-set! f8071 0 (lambda (f8086 f8087) (unless (fx= f8086 (string-length f8049)) (if (fx>= f8087 (string-length f8048)) ((vector-ref f8071 0) f8086 (fx- f8087 (string-length f8048))) (begin (string-set! f8049 f8086 (string-ref f8048 f8087)) ((vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17))))))) (vector-set! f8070 0 (lambda (f8084 f8085) (cond ((fx= f8084 (string-length f8049)) (close-output-port f8085)) (else (begin (write-char (string-ref f8049 f8084) f8085) ((vector-ref f8070 0) (fxadd1 f8084) f8085)))))) (vector-set! f8069 0 (lambda (f8080 f8081) (let ((f8083 (read-char f8081))) (cond ((eof-object? f8083) (begin (close-input-port f8081) (fx= f8080 (string-length f8049)))) ((fx= f8080 (string-length f8049)) (error (quote (vector-ref f8069 0)) "file too short")) ((char= (string-ref f8049 f8080) f8083) ((vector-ref f8069 0) (fxadd1 f8080) f8081)) (else (error (quote (vector-ref f8069 0)) "mismatch"))))))) (begin ((vector-ref f8071 0) 0 0) ((vector-ref f8070 0) 0 (open-output-file "stst.tmp" (quote replace))) ((vector-ref f8069 0) 0 (open-input-file "stst.tmp"))))))
# == eliminate-set!  ==>
# (let ((f8049 (make-string 10000)) (f8048 "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz12344567890<>,./?;:'\"[]{}\\|`~!@#$%^&*()-_=+")) (let ((f8071 (make-vector 1)) (f8070 (make-vector 1)) (f8069 (make-vector 1))) (begin (begin (vector-set! f8071 0 (lambda (f8086 f8087) (let ((f8086 f8086) (f8087 f8087)) (unless (fx= f8086 (string-length f8049)) (if (fx>= f8087 (string-length f8048)) ((vector-ref f8071 0) f8086 (fx- f8087 (string-length f8048))) (begin (string-set! f8049 f8086 (string-ref f8048 f8087)) ((vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17)))))))) (vector-set! f8070 0 (lambda (f8084 f8085) (let ((f8084 f8084) (f8085 f8085)) (cond ((fx= f8084 (string-length f8049)) (close-output-port f8085)) (else (begin (write-char (string-ref f8049 f8084) f8085) ((vector-ref f8070 0) (fxadd1 f8084) f8085))))))) (vector-set! f8069 0 (lambda (f8080 f8081) (let ((f8080 f8080) (f8081 f8081)) (let ((f8083 (read-char f8081))) (cond ((eof-object? f8083) (begin (close-input-port f8081) (fx= f8080 (string-length f8049)))) ((fx= f8080 (string-length f8049)) (error (quote (vector-ref f8069 0)) "file too short")) ((char= (string-ref f8049 f8080) f8083) ((vector-ref f8069 0) (fxadd1 f8080) f8081)) (else (error (quote (vector-ref f8069 0)) "mismatch")))))))) (begin ((vector-ref f8071 0) 0 0) ((vector-ref f8070 0) 0 (open-output-file "stst.tmp" (quote replace))) ((vector-ref f8069 0) 0 (open-input-file "stst.tmp"))))))
# == close-free-variables  ==>
# (let ((f8049 (make-string 10000)) (f8048 "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz12344567890<>,./?;:'\"[]{}\\|`~!@#$%^&*()-_=+")) (let ((f8071 (make-vector 1)) (f8070 (make-vector 1)) (f8069 (make-vector 1))) (begin (begin (vector-set! f8071 0 (closure (f8086 f8087) (f8049 f8048 f8071 f8048 f8049 f8048 f8071) (let ((f8086 f8086) (f8087 f8087)) (unless (fx= f8086 (string-length f8049)) (if (fx>= f8087 (string-length f8048)) ((vector-ref f8071 0) f8086 (fx- f8087 (string-length f8048))) (begin (string-set! f8049 f8086 (string-ref f8048 f8087)) ((vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17)))))))) (vector-set! f8070 0 (closure (f8084 f8085) (f8049 f8049 f8070) (let ((f8084 f8084) (f8085 f8085)) (cond ((fx= f8084 (string-length f8049)) (close-output-port f8085)) (else (begin (write-char (string-ref f8049 f8084) f8085) ((vector-ref f8070 0) (fxadd1 f8084) f8085))))))) (vector-set! f8069 0 (closure (f8080 f8081) (f8049 f8049 f8069 char= f8049 f8069 f8069) (let ((f8080 f8080) (f8081 f8081)) (let ((f8083 (read-char f8081))) (cond ((eof-object? f8083) (begin (close-input-port f8081) (fx= f8080 (string-length f8049)))) ((fx= f8080 (string-length f8049)) (error (quote (vector-ref f8069 0)) "file too short")) ((char= (string-ref f8049 f8080) f8083) ((vector-ref f8069 0) (fxadd1 f8080) f8081)) (else (error (quote (vector-ref f8069 0)) "mismatch")))))))) (begin ((vector-ref f8071 0) 0 0) ((vector-ref f8070 0) 0 (open-output-file "stst.tmp" (quote replace))) ((vector-ref f8069 0) 0 (open-input-file "stst.tmp"))))))
# == eliminate-quote  ==>
# (let ((f8049 (make-string 10000)) (f8048 "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz12344567890<>,./?;:'\"[]{}\\|`~!@#$%^&*()-_=+")) (let ((f8071 (make-vector 1)) (f8070 (make-vector 1)) (f8069 (make-vector 1))) (begin (begin (vector-set! f8071 0 (closure (f8086 f8087) (f8049 f8048 f8071 f8048 f8049 f8048 f8071) (let ((f8086 f8086) (f8087 f8087)) (unless (fx= f8086 (string-length f8049)) (if (fx>= f8087 (string-length f8048)) ((vector-ref f8071 0) f8086 (fx- f8087 (string-length f8048))) (begin (string-set! f8049 f8086 (string-ref f8048 f8087)) ((vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17)))))))) (vector-set! f8070 0 (closure (f8084 f8085) (f8049 f8049 f8070) (let ((f8084 f8084) (f8085 f8085)) (cond ((fx= f8084 (string-length f8049)) (close-output-port f8085)) (else (begin (write-char (string-ref f8049 f8084) f8085) ((vector-ref f8070 0) (fxadd1 f8084) f8085))))))) (vector-set! f8069 0 (closure (f8080 f8081) (f8049 f8049 f8069 char= f8049 f8069 f8069) (let ((f8080 f8080) (f8081 f8081)) (let ((f8083 (read-char f8081))) (cond ((eof-object? f8083) (begin (close-input-port f8081) (fx= f8080 (string-length f8049)))) ((fx= f8080 (string-length f8049)) (error (cons (string->symbol "vector-ref") (cons (string->symbol "f8069") (cons 0 ()))) "file too short")) ((char= (string-ref f8049 f8080) f8083) ((vector-ref f8069 0) (fxadd1 f8080) f8081)) (else (error (cons (string->symbol "vector-ref") (cons (string->symbol "f8069") (cons 0 ()))) "mismatch")))))))) (begin ((vector-ref f8071 0) 0 0) ((vector-ref f8070 0) 0 (open-output-file "stst.tmp" (string->symbol "replace"))) ((vector-ref f8069 0) 0 (open-input-file "stst.tmp"))))))
# == eliminate-when/unless  ==>
# (let ((f8049 (make-string 10000)) (f8048 "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz12344567890<>,./?;:'\"[]{}\\|`~!@#$%^&*()-_=+")) (let ((f8071 (make-vector 1)) (f8070 (make-vector 1)) (f8069 (make-vector 1))) (begin (begin (vector-set! f8071 0 (closure (f8086 f8087) (f8049 f8048 f8071 f8048 f8049 f8048 f8071) (let ((f8086 f8086) (f8087 f8087)) (if (not (fx= f8086 (string-length f8049))) (begin (if (fx>= f8087 (string-length f8048)) ((vector-ref f8071 0) f8086 (fx- f8087 (string-length f8048))) (begin (string-set! f8049 f8086 (string-ref f8048 f8087)) ((vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17))))) #f)))) (vector-set! f8070 0 (closure (f8084 f8085) (f8049 f8049 f8070) (let ((f8084 f8084) (f8085 f8085)) (cond ((fx= f8084 (string-length f8049)) (close-output-port f8085)) (else (begin (write-char (string-ref f8049 f8084) f8085) ((vector-ref f8070 0) (fxadd1 f8084) f8085))))))) (vector-set! f8069 0 (closure (f8080 f8081) (f8049 f8049 f8069 char= f8049 f8069 f8069) (let ((f8080 f8080) (f8081 f8081)) (let ((f8083 (read-char f8081))) (cond ((eof-object? f8083) (begin (close-input-port f8081) (fx= f8080 (string-length f8049)))) ((fx= f8080 (string-length f8049)) (error (cons (string->symbol "vector-ref") (cons (string->symbol "f8069") (cons 0 ()))) "file too short")) ((char= (string-ref f8049 f8080) f8083) ((vector-ref f8069 0) (fxadd1 f8080) f8081)) (else (error (cons (string->symbol "vector-ref") (cons (string->symbol "f8069") (cons 0 ()))) "mismatch")))))))) (begin ((vector-ref f8071 0) 0 0) ((vector-ref f8070 0) 0 (open-output-file "stst.tmp" (string->symbol "replace"))) ((vector-ref f8069 0) 0 (open-input-file "stst.tmp"))))))
# == eliminate-cond  ==>
# (let ((f8049 (make-string 10000)) (f8048 "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz12344567890<>,./?;:'\"[]{}\\|`~!@#$%^&*()-_=+")) (let ((f8071 (make-vector 1)) (f8070 (make-vector 1)) (f8069 (make-vector 1))) (begin (begin (vector-set! f8071 0 (closure (f8086 f8087) (f8049 f8048 f8071 f8048 f8049 f8048 f8071) (let ((f8086 f8086) (f8087 f8087)) (if (not (fx= f8086 (string-length f8049))) (begin (if (fx>= f8087 (string-length f8048)) ((vector-ref f8071 0) f8086 (fx- f8087 (string-length f8048))) (begin (string-set! f8049 f8086 (string-ref f8048 f8087)) ((vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17))))) #f)))) (vector-set! f8070 0 (closure (f8084 f8085) (f8049 f8049 f8070) (let ((f8084 f8084) (f8085 f8085)) (if (fx= f8084 (string-length f8049)) (close-output-port f8085) (begin (write-char (string-ref f8049 f8084) f8085) ((vector-ref f8070 0) (fxadd1 f8084) f8085)))))) (vector-set! f8069 0 (closure (f8080 f8081) (f8049 f8049 f8069 char= f8049 f8069 f8069) (let ((f8080 f8080) (f8081 f8081)) (let ((f8083 (read-char f8081))) (if (eof-object? f8083) (begin (close-input-port f8081) (fx= f8080 (string-length f8049))) (if (fx= f8080 (string-length f8049)) (error (cons (string->symbol "vector-ref") (cons (string->symbol "f8069") (cons 0 ()))) "file too short") (if (char= (string-ref f8049 f8080) f8083) ((vector-ref f8069 0) (fxadd1 f8080) f8081) (error (cons (string->symbol "vector-ref") (cons (string->symbol "f8069") (cons 0 ()))) "mismatch"))))))))) (begin ((vector-ref f8071 0) 0 0) ((vector-ref f8070 0) 0 (open-output-file "stst.tmp" (string->symbol "replace"))) ((vector-ref f8069 0) 0 (open-input-file "stst.tmp"))))))
# == external-symbols  ==>
(let ((f8049 (make-string 10000))
      (f8048 "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz12344567890<>,./?;:'\"[]{}\\|`~!@#$%^&*()-_=+"))
  (let ((f8071 (make-vector 1))
	(f8070 (make-vector 1))
	(f8069 (make-vector 1)))
    (begin
      (begin
	(vector-set! f8071
		     0
		     (closure (f8086 f8087)
			      (f8049 f8048 f8071 f8048 f8049 f8048 f8071)
			      (let ((f8086 f8086)
				    (f8087 f8087))
				(if (not (fx= f8086 (string-length f8049)))
				    (begin
				      (if (fx>= f8087 (string-length f8048))
					  ((vector-ref f8071 0) f8086 (fx- f8087 (string-length f8048)))
					  (begin
					    (string-set! f8049 f8086 (string-ref f8048 f8087))
					    ((vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17)))))
				    #f))))
	(vector-set! f8070
		     0
		     (closure (f8084 f8085)
			      (f8049 f8049 f8070)
			      (let ((f8084 f8084)
				    (f8085 f8085))
				(if (fx= f8084 (string-length f8049))
				    ((primitive-ref close-output-port) f8085)
				    (begin
				      ((primitive-ref write-char)
				       (string-ref f8049 f8084) f8085)
				      ((vector-ref f8070 0)
				       (fxadd1 f8084) f8085))))))
	(vector-set! f8069
		     0
		     (closure (f8080 f8081)
			      (f8049 f8049 f8069 char= f8049 f8069 f8069)
			      (let ((f8080 f8080)
				    (f8081 f8081))
				(let ((f8083 ((primitive-ref read-char) f8081)))
				  (if (eof-object? f8083)
				      (begin
					((primitive-ref close-input-port) f8081)
					(fx= f8080 (string-length f8049)))
				      (if (fx= f8080 (string-length f8049))
					  ((primitive-ref error)
					   (cons ((primitive-ref string->symbol) "vector-ref")
						 (cons ((primitive-ref string->symbol) "f8069")
						       (cons 0 ())))
					   "file too short")
					  (if (char= (string-ref f8049 f8080) f8083)
					      ((vector-ref f8069 0)
					       (fxadd1 f8080) f8081)
					      ((primitive-ref error)
					       (cons ((primitive-ref string->symbol) "vector-ref")
						     (cons ((primitive-ref string->symbol) "f8069")
							   (cons 0 ())))
					       "mismatch")))))))))
      (begin
	((vector-ref f8071 0) 0 0)
	((vector-ref f8070 0) 0 ((primitive-ref open-output-file) "stst.tmp" ((primitive-ref string->symbol) "replace")))
	((vector-ref f8069 0) 0 ((primitive-ref open-input-file) "stst.tmp"))))))

# emit-scheme-entry
    .text
    .align 16, 0x90
    .globl _L_scheme_entry
_L_scheme_entry:
    movl $0, %edi  # dummy for debugging
    .global base_init_callback
    .extern base_init
    addl $-4,%esp
    jmp base_init
base_init_callback:
    addl $4,%esp
# emit-expr (let ((f8049 (make-string 10000)) (f8048 "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz12344567890<>,./?;:'\"[]{}\\|`~!@#$%^&*()-_=+")) (let ((f8071 (make-vector 1)) (f8070 (make-vector 1)) (f8069 (make-vector 1))) (begin (begin (vector-set! f8071 0 (closure (f8086 f8087) (f8049 f8048 f8071 f8048 f8049 f8048 f8071) (let ((f8086 f8086) (f8087 f8087)) (if (not (fx= f8086 (string-length f8049))) (begin (if (fx>= f8087 (string-length f8048)) ((vector-ref f8071 0) f8086 (fx- f8087 (string-length f8048))) (begin (string-set! f8049 f8086 (string-ref f8048 f8087)) ((vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17))))) #f)))) (vector-set! f8070 0 (closure (f8084 f8085) (f8049 f8049 f8070) (let ((f8084 f8084) (f8085 f8085)) (if (fx= f8084 (string-length f8049)) ((primitive-ref close-output-port) f8085) (begin ((primitive-ref write-char) (string-ref f8049 f8084) f8085) ((vector-ref f8070 0) (fxadd1 f8084) f8085)))))) (vector-set! f8069 0 (closure (f8080 f8081) (f8049 f8049 f8069 char= f8049 f8069 f8069) (let ((f8080 f8080) (f8081 f8081)) (let ((f8083 ((primitive-ref read-char) f8081))) (if (eof-object? f8083) (begin ((primitive-ref close-input-port) f8081) (fx= f8080 (string-length f8049))) (if (fx= f8080 (string-length f8049)) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "file too short") (if (char= (string-ref f8049 f8080) f8083) ((vector-ref f8069 0) (fxadd1 f8080) f8081) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "mismatch"))))))))) (begin ((vector-ref f8071 0) 0 0) ((vector-ref f8070 0) 0 ((primitive-ref open-output-file) "stst.tmp" ((primitive-ref string->symbol) "replace"))) ((vector-ref f8069 0) 0 ((primitive-ref open-input-file) "stst.tmp"))))))
# emit-let
#  si   = -8
#  env  = ()
#  bindings = ((f8049 (make-string 10000)) (f8048 "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz12344567890<>,./?;:'\"[]{}\\|`~!@#$%^&*()-_=+"))
#  body = (let ((f8071 (make-vector 1)) (f8070 (make-vector 1)) (f8069 (make-vector 1))) (begin (begin (vector-set! f8071 0 (closure (f8086 f8087) (f8049 f8048 f8071 f8048 f8049 f8048 f8071) (let ((f8086 f8086) (f8087 f8087)) (if (not (fx= f8086 (string-length f8049))) (begin (if (fx>= f8087 (string-length f8048)) ((vector-ref f8071 0) f8086 (fx- f8087 (string-length f8048))) (begin (string-set! f8049 f8086 (string-ref f8048 f8087)) ((vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17))))) #f)))) (vector-set! f8070 0 (closure (f8084 f8085) (f8049 f8049 f8070) (let ((f8084 f8084) (f8085 f8085)) (if (fx= f8084 (string-length f8049)) ((primitive-ref close-output-port) f8085) (begin ((primitive-ref write-char) (string-ref f8049 f8084) f8085) ((vector-ref f8070 0) (fxadd1 f8084) f8085)))))) (vector-set! f8069 0 (closure (f8080 f8081) (f8049 f8049 f8069 char= f8049 f8069 f8069) (let ((f8080 f8080) (f8081 f8081)) (let ((f8083 ((primitive-ref read-char) f8081))) (if (eof-object? f8083) (begin ((primitive-ref close-input-port) f8081) (fx= f8080 (string-length f8049))) (if (fx= f8080 (string-length f8049)) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "file too short") (if (char= (string-ref f8049 f8080) f8083) ((vector-ref f8069 0) (fxadd1 f8080) f8081) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "mismatch"))))))))) (begin ((vector-ref f8071 0) 0 0) ((vector-ref f8070 0) 0 ((primitive-ref open-output-file) "stst.tmp" ((primitive-ref string->symbol) "replace"))) ((vector-ref f8069 0) 0 ((primitive-ref open-input-file) "stst.tmp")))))
# emit-expr (make-string 10000)
# make-string len=10000
# emit-expr 10000
    movl $40000, %eax     # immed 10000
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48748"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48748:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_48749
# invoke error handler eh_length
    .extern mrc_eh$ulength
    movl mrc_eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48749:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl $6, %eax
    sar $2, %esi
    add $4, %esi
    add $7, %esi
    andl $-8, %esi
    add  %esi, %ebp
# make-string end
    movl %eax, -8(%esp)  # stack save
# emit-expr "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz12344567890<>,./?;:'\"[]{}\\|`~!@#$%^&*()-_=+"
# string literal
    jmp _L_48751
    .align 8,0x90
_L_48750 :
    .int 380
    .ascii "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz12344567890<>,./?;:'\"[]{}\\|`~!@#$%^&*()-_=+"
_L_48751:
    movl $_L_48750, %eax
    orl $6, %eax
    movl %eax, -12(%esp)  # stack save
# emit-expr (let ((f8071 (make-vector 1)) (f8070 (make-vector 1)) (f8069 (make-vector 1))) (begin (begin (vector-set! f8071 0 (closure (f8086 f8087) (f8049 f8048 f8071 f8048 f8049 f8048 f8071) (let ((f8086 f8086) (f8087 f8087)) (if (not (fx= f8086 (string-length f8049))) (begin (if (fx>= f8087 (string-length f8048)) ((vector-ref f8071 0) f8086 (fx- f8087 (string-length f8048))) (begin (string-set! f8049 f8086 (string-ref f8048 f8087)) ((vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17))))) #f)))) (vector-set! f8070 0 (closure (f8084 f8085) (f8049 f8049 f8070) (let ((f8084 f8084) (f8085 f8085)) (if (fx= f8084 (string-length f8049)) ((primitive-ref close-output-port) f8085) (begin ((primitive-ref write-char) (string-ref f8049 f8084) f8085) ((vector-ref f8070 0) (fxadd1 f8084) f8085)))))) (vector-set! f8069 0 (closure (f8080 f8081) (f8049 f8049 f8069 char= f8049 f8069 f8069) (let ((f8080 f8080) (f8081 f8081)) (let ((f8083 ((primitive-ref read-char) f8081))) (if (eof-object? f8083) (begin ((primitive-ref close-input-port) f8081) (fx= f8080 (string-length f8049))) (if (fx= f8080 (string-length f8049)) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "file too short") (if (char= (string-ref f8049 f8080) f8083) ((vector-ref f8069 0) (fxadd1 f8080) f8081) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "mismatch"))))))))) (begin ((vector-ref f8071 0) 0 0) ((vector-ref f8070 0) 0 ((primitive-ref open-output-file) "stst.tmp" ((primitive-ref string->symbol) "replace"))) ((vector-ref f8069 0) 0 ((primitive-ref open-input-file) "stst.tmp")))))
# emit-let
#  si   = -16
#  env  = ((f8048 . -12) (f8049 . -8))
#  bindings = ((f8071 (make-vector 1)) (f8070 (make-vector 1)) (f8069 (make-vector 1)))
#  body = (begin (begin (vector-set! f8071 0 (closure (f8086 f8087) (f8049 f8048 f8071 f8048 f8049 f8048 f8071) (let ((f8086 f8086) (f8087 f8087)) (if (not (fx= f8086 (string-length f8049))) (begin (if (fx>= f8087 (string-length f8048)) ((vector-ref f8071 0) f8086 (fx- f8087 (string-length f8048))) (begin (string-set! f8049 f8086 (string-ref f8048 f8087)) ((vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17))))) #f)))) (vector-set! f8070 0 (closure (f8084 f8085) (f8049 f8049 f8070) (let ((f8084 f8084) (f8085 f8085)) (if (fx= f8084 (string-length f8049)) ((primitive-ref close-output-port) f8085) (begin ((primitive-ref write-char) (string-ref f8049 f8084) f8085) ((vector-ref f8070 0) (fxadd1 f8084) f8085)))))) (vector-set! f8069 0 (closure (f8080 f8081) (f8049 f8049 f8069 char= f8049 f8069 f8069) (let ((f8080 f8080) (f8081 f8081)) (let ((f8083 ((primitive-ref read-char) f8081))) (if (eof-object? f8083) (begin ((primitive-ref close-input-port) f8081) (fx= f8080 (string-length f8049))) (if (fx= f8080 (string-length f8049)) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "file too short") (if (char= (string-ref f8049 f8080) f8083) ((vector-ref f8069 0) (fxadd1 f8080) f8081) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "mismatch"))))))))) (begin ((vector-ref f8071 0) 0 0) ((vector-ref f8070 0) 0 ((primitive-ref open-output-file) "stst.tmp" ((primitive-ref string->symbol) "replace"))) ((vector-ref f8069 0) 0 ((primitive-ref open-input-file) "stst.tmp"))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48752"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48752:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_48753
# invoke error handler eh_length
    .extern mrc_eh$ulength
    movl mrc_eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48753:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, -16(%esp)  # stack save
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48754"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48754:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_48755
# invoke error handler eh_length
    .extern mrc_eh$ulength
    movl mrc_eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48755:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, -20(%esp)  # stack save
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48756"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48756:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_48757
# invoke error handler eh_length
    .extern mrc_eh$ulength
    movl mrc_eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48757:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, -24(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f8071 0 (closure (f8086 f8087) (f8049 f8048 f8071 f8048 f8049 f8048 f8071) (let ((f8086 f8086) (f8087 f8087)) (if (not (fx= f8086 (string-length f8049))) (begin (if (fx>= f8087 (string-length f8048)) ((vector-ref f8071 0) f8086 (fx- f8087 (string-length f8048))) (begin (string-set! f8049 f8086 (string-ref f8048 f8087)) ((vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17))))) #f)))) (vector-set! f8070 0 (closure (f8084 f8085) (f8049 f8049 f8070) (let ((f8084 f8084) (f8085 f8085)) (if (fx= f8084 (string-length f8049)) ((primitive-ref close-output-port) f8085) (begin ((primitive-ref write-char) (string-ref f8049 f8084) f8085) ((vector-ref f8070 0) (fxadd1 f8084) f8085)))))) (vector-set! f8069 0 (closure (f8080 f8081) (f8049 f8049 f8069 char= f8049 f8069 f8069) (let ((f8080 f8080) (f8081 f8081)) (let ((f8083 ((primitive-ref read-char) f8081))) (if (eof-object? f8083) (begin ((primitive-ref close-input-port) f8081) (fx= f8080 (string-length f8049))) (if (fx= f8080 (string-length f8049)) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "file too short") (if (char= (string-ref f8049 f8080) f8083) ((vector-ref f8069 0) (fxadd1 f8080) f8081) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "mismatch"))))))))) (begin ((vector-ref f8071 0) 0 0) ((vector-ref f8070 0) 0 ((primitive-ref open-output-file) "stst.tmp" ((primitive-ref string->symbol) "replace"))) ((vector-ref f8069 0) 0 ((primitive-ref open-input-file) "stst.tmp"))))
# emit-begin
#   expr=(begin (begin (vector-set! f8071 0 (closure (f8086 f8087) (f8049 f8048 f8071 f8048 f8049 f8048 f8071) (let ((f8086 f8086) (f8087 f8087)) (if (not (fx= f8086 (string-length f8049))) (begin (if (fx>= f8087 (string-length f8048)) ((vector-ref f8071 0) f8086 (fx- f8087 (string-length f8048))) (begin (string-set! f8049 f8086 (string-ref f8048 f8087)) ((vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17))))) #f)))) (vector-set! f8070 0 (closure (f8084 f8085) (f8049 f8049 f8070) (let ((f8084 f8084) (f8085 f8085)) (if (fx= f8084 (string-length f8049)) ((primitive-ref close-output-port) f8085) (begin ((primitive-ref write-char) (string-ref f8049 f8084) f8085) ((vector-ref f8070 0) (fxadd1 f8084) f8085)))))) (vector-set! f8069 0 (closure (f8080 f8081) (f8049 f8049 f8069 char= f8049 f8069 f8069) (let ((f8080 f8080) (f8081 f8081)) (let ((f8083 ((primitive-ref read-char) f8081))) (if (eof-object? f8083) (begin ((primitive-ref close-input-port) f8081) (fx= f8080 (string-length f8049))) (if (fx= f8080 (string-length f8049)) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "file too short") (if (char= (string-ref f8049 f8080) f8083) ((vector-ref f8069 0) (fxadd1 f8080) f8081) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "mismatch"))))))))) (begin ((vector-ref f8071 0) 0 0) ((vector-ref f8070 0) 0 ((primitive-ref open-output-file) "stst.tmp" ((primitive-ref string->symbol) "replace"))) ((vector-ref f8069 0) 0 ((primitive-ref open-input-file) "stst.tmp"))))
#   env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# emit-expr (begin (vector-set! f8071 0 (closure (f8086 f8087) (f8049 f8048 f8071 f8048 f8049 f8048 f8071) (let ((f8086 f8086) (f8087 f8087)) (if (not (fx= f8086 (string-length f8049))) (begin (if (fx>= f8087 (string-length f8048)) ((vector-ref f8071 0) f8086 (fx- f8087 (string-length f8048))) (begin (string-set! f8049 f8086 (string-ref f8048 f8087)) ((vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17))))) #f)))) (vector-set! f8070 0 (closure (f8084 f8085) (f8049 f8049 f8070) (let ((f8084 f8084) (f8085 f8085)) (if (fx= f8084 (string-length f8049)) ((primitive-ref close-output-port) f8085) (begin ((primitive-ref write-char) (string-ref f8049 f8084) f8085) ((vector-ref f8070 0) (fxadd1 f8084) f8085)))))) (vector-set! f8069 0 (closure (f8080 f8081) (f8049 f8049 f8069 char= f8049 f8069 f8069) (let ((f8080 f8080) (f8081 f8081)) (let ((f8083 ((primitive-ref read-char) f8081))) (if (eof-object? f8083) (begin ((primitive-ref close-input-port) f8081) (fx= f8080 (string-length f8049))) (if (fx= f8080 (string-length f8049)) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "file too short") (if (char= (string-ref f8049 f8080) f8083) ((vector-ref f8069 0) (fxadd1 f8080) f8081) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "mismatch")))))))))
# emit-begin
#   expr=(begin (vector-set! f8071 0 (closure (f8086 f8087) (f8049 f8048 f8071 f8048 f8049 f8048 f8071) (let ((f8086 f8086) (f8087 f8087)) (if (not (fx= f8086 (string-length f8049))) (begin (if (fx>= f8087 (string-length f8048)) ((vector-ref f8071 0) f8086 (fx- f8087 (string-length f8048))) (begin (string-set! f8049 f8086 (string-ref f8048 f8087)) ((vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17))))) #f)))) (vector-set! f8070 0 (closure (f8084 f8085) (f8049 f8049 f8070) (let ((f8084 f8084) (f8085 f8085)) (if (fx= f8084 (string-length f8049)) ((primitive-ref close-output-port) f8085) (begin ((primitive-ref write-char) (string-ref f8049 f8084) f8085) ((vector-ref f8070 0) (fxadd1 f8084) f8085)))))) (vector-set! f8069 0 (closure (f8080 f8081) (f8049 f8049 f8069 char= f8049 f8069 f8069) (let ((f8080 f8080) (f8081 f8081)) (let ((f8083 ((primitive-ref read-char) f8081))) (if (eof-object? f8083) (begin ((primitive-ref close-input-port) f8081) (fx= f8080 (string-length f8049))) (if (fx= f8080 (string-length f8049)) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "file too short") (if (char= (string-ref f8049 f8080) f8083) ((vector-ref f8069 0) (fxadd1 f8080) f8081) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "mismatch")))))))))
#   env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# emit-expr (vector-set! f8071 0 (closure (f8086 f8087) (f8049 f8048 f8071 f8048 f8049 f8048 f8071) (let ((f8086 f8086) (f8087 f8087)) (if (not (fx= f8086 (string-length f8049))) (begin (if (fx>= f8087 (string-length f8048)) ((vector-ref f8071 0) f8086 (fx- f8087 (string-length f8048))) (begin (string-set! f8049 f8086 (string-ref f8048 f8087)) ((vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17))))) #f))))
# emit-expr f8071
# emit-variable-ref
# env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8071
    movl -16(%esp), %eax  # stack load f8071
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_48758
# invoke error handler eh_vector
    .extern mrc_eh$uvector
    movl mrc_eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48758:
    movl %eax, -28(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48759"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48759:
# check bounds on vector index
    movl -28(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_48761
    cmp  $0,%eax
    jge _L_48760
_L_48761:
# invoke error handler eh_vector_index
    .extern mrc_eh$uvector$uindex
    movl mrc_eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_48760:
    movl %eax, -32(%esp)
# emit-expr (closure (f8086 f8087) (f8049 f8048 f8071 f8048 f8049 f8048 f8071) (let ((f8086 f8086) (f8087 f8087)) (if (not (fx= f8086 (string-length f8049))) (begin (if (fx>= f8087 (string-length f8048)) ((vector-ref f8071 0) f8086 (fx- f8087 (string-length f8048))) (begin (string-set! f8049 f8086 (string-ref f8048 f8087)) ((vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17))))) #f)))
# emit-closure
# si = -36
# env = ((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# expr = (closure (f8086 f8087) (f8049 f8048 f8071 f8048 f8049 f8048 f8071) (let ((f8086 f8086) (f8087 f8087)) (if (not (fx= f8086 (string-length f8049))) (begin (if (fx>= f8087 (string-length f8048)) ((vector-ref f8071 0) f8086 (fx- f8087 (string-length f8048))) (begin (string-set! f8049 f8086 (string-ref f8048 f8087)) ((vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17))))) #f)))
    movl $_L_48762, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8049
    movl -8(%esp), %eax  # stack load f8049
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f8049
# emit-variable-ref
# env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8048
    movl -12(%esp), %eax  # stack load f8048
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f8048
# emit-variable-ref
# env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8071
    movl -16(%esp), %eax  # stack load f8071
# end emit-variable-ref
   movl  %eax, 12(%ebp)  # f8071
# emit-variable-ref
# env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8048
    movl -12(%esp), %eax  # stack load f8048
# end emit-variable-ref
   movl  %eax, 16(%ebp)  # f8048
# emit-variable-ref
# env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8049
    movl -8(%esp), %eax  # stack load f8049
# end emit-variable-ref
   movl  %eax, 20(%ebp)  # f8049
# emit-variable-ref
# env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8048
    movl -12(%esp), %eax  # stack load f8048
# end emit-variable-ref
   movl  %eax, 24(%ebp)  # f8048
# emit-variable-ref
# env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8071
    movl -16(%esp), %eax  # stack load f8071
# end emit-variable-ref
   movl  %eax, 28(%ebp)  # f8071
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $32, %ebp     # bump ebp
    jmp _L_48763            # jump around closure body
_L_48762:
# check argument count
    cmp $8,%eax
    je _L_48764
# invoke error handler eh_argcount
    .extern mrc_eh$uargcount
    movl mrc_eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_48764:
# emit-tail-expr
# si=-16
# env=((f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# expr=(let ((f8086 f8086) (f8087 f8087)) (if (not (fx= f8086 (string-length f8049))) (begin (if (fx>= f8087 (string-length f8048)) ((vector-ref f8071 0) f8086 (fx- f8087 (string-length f8048))) (begin (string-set! f8049 f8086 (string-ref f8048 f8087)) ((vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17))))) #f))
# emit-tail-let
#  si   = -16
#  env  = ((f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
#  bindings = ((f8086 f8086) (f8087 f8087))
#  body = (if (not (fx= f8086 (string-length f8049))) (begin (if (fx>= f8087 (string-length f8048)) ((vector-ref f8071 0) f8086 (fx- f8087 (string-length f8048))) (begin (string-set! f8049 f8086 (string-ref f8048 f8087)) ((vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17))))) #f)
# emit-expr f8086
# emit-variable-ref
# env=((f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8086
    movl -8(%esp), %eax  # stack load f8086
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f8087
# emit-variable-ref
# env=((f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8087
    movl -12(%esp), %eax  # stack load f8087
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f8087 . -20) (f8086 . -16) (f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# expr=(if (not (fx= f8086 (string-length f8049))) (begin (if (fx>= f8087 (string-length f8048)) ((vector-ref f8071 0) f8086 (fx- f8087 (string-length f8048))) (begin (string-set! f8049 f8086 (string-ref f8048 f8087)) ((vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17))))) #f)
# emit-expr (not (fx= f8086 (string-length f8049)))
# emit-expr (fx= f8086 (string-length f8049))
# emit-expr (string-length f8049)
# emit-expr f8049
# emit-variable-ref
# env=((f8087 . -20) (f8086 . -16) (f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8049
    movl 18(%edi), %eax  # frame load f8049
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_48767
# invoke error handler eh_string
    .extern mrc_eh$ustring
    movl mrc_eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $160,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48767:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48768"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $68,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48768:
    movl %eax, -24(%esp)
# emit-expr f8086
# emit-variable-ref
# env=((f8087 . -20) (f8086 . -16) (f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8086
    movl -16(%esp), %eax  # stack load f8086
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48769"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $68,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48769:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_48765
# emit-tail-expr
# si=-24
# env=((f8087 . -20) (f8086 . -16) (f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# expr=(begin (if (fx>= f8087 (string-length f8048)) ((vector-ref f8071 0) f8086 (fx- f8087 (string-length f8048))) (begin (string-set! f8049 f8086 (string-ref f8048 f8087)) ((vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17)))))
# tail-begin (begin (if (fx>= f8087 (string-length f8048)) ((vector-ref f8071 0) f8086 (fx- f8087 (string-length f8048))) (begin (string-set! f8049 f8086 (string-ref f8048 f8087)) ((vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17)))))
#   env=((f8087 . -20) (f8086 . -16) (f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# emit-tail-expr
# si=-24
# env=((f8087 . -20) (f8086 . -16) (f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# expr=(if (fx>= f8087 (string-length f8048)) ((vector-ref f8071 0) f8086 (fx- f8087 (string-length f8048))) (begin (string-set! f8049 f8086 (string-ref f8048 f8087)) ((vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17))))
# emit-expr (fx>= f8087 (string-length f8048))
# emit-expr (string-length f8048)
# emit-expr f8048
# emit-variable-ref
# env=((f8087 . -20) (f8086 . -16) (f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8048
    movl 22(%edi), %eax  # frame load f8048
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_48772
# invoke error handler eh_string
    .extern mrc_eh$ustring
    movl mrc_eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $160,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48772:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48773"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48773:
    movl %eax, -24(%esp)
# emit-expr f8087
# emit-variable-ref
# env=((f8087 . -20) (f8086 . -16) (f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8087
    movl -20(%esp), %eax  # stack load f8087
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48774"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48774:
    cmp -24(%esp), %eax
    setge %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_48770
# emit-tail-expr
# si=-24
# env=((f8087 . -20) (f8086 . -16) (f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# expr=((vector-ref f8071 0) f8086 (fx- f8087 (string-length f8048)))
# emit-tail-funcall
#    si   =-24
#    env  = ((f8087 . -20) (f8086 . -16) (f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
#    expr = (funcall (vector-ref f8071 0) f8086 (fx- f8087 (string-length f8048)))
# emit-expr (vector-ref f8071 0)
# emit-expr f8071
# emit-variable-ref
# env=((f8087 . -20) (f8086 . -16) (f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8071
    movl 26(%edi), %eax  # frame load f8071
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_48775
# invoke error handler eh_vector
    .extern mrc_eh$uvector
    movl mrc_eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48775:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48776"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48776:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_48778
    cmp  $0,%eax
    jge _L_48777
_L_48778:
# invoke error handler eh_vector_index
    .extern mrc_eh$uvector$uindex
    movl mrc_eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_48777:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr f8086
# emit-variable-ref
# env=((f8087 . -20) (f8086 . -16) (f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8086
    movl -16(%esp), %eax  # stack load f8086
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f8086
# emit-expr (fx- f8087 (string-length f8048))
# emit-expr (string-length f8048)
# emit-expr f8048
# emit-variable-ref
# env=((f8087 . -20) (f8086 . -16) (f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8048
    movl 22(%edi), %eax  # frame load f8048
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_48779
# invoke error handler eh_string
    .extern mrc_eh$ustring
    movl mrc_eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $160,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48779:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48780"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $92,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48780:
    movl %eax, -32(%esp)
# emit-expr f8087
# emit-variable-ref
# env=((f8087 . -20) (f8086 . -16) (f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8087
    movl -20(%esp), %eax  # stack load f8087
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48781"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $92,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48781:
    subl -32(%esp), %eax
    mov %eax, -32(%esp)    # arg (fx- f8087 (string-length f8048))
    movl -24(%esp), %edi   # load new closure to %edi
# emit-shift-args:  size=3   si=-24  delta=20
    mov -24(%esp), %ebx  # shift frame cell
    mov %ebx, -4(%esp)  # down to base
# emit-shift-args:  size=2   si=-28  delta=20
    mov -28(%esp), %ebx  # shift frame cell
    mov %ebx, -8(%esp)  # down to base
# emit-shift-args:  size=1   si=-32  delta=20
    mov -32(%esp), %ebx  # shift frame cell
    mov %ebx, -12(%esp)  # down to base
# emit-shift-args:  size=0   si=-36  delta=20
    movl $8,%eax   # save arg count
    jmp *-2(%edi)  # tail-funcall
    jmp _L_48771
_L_48770:
# emit-tail-expr
# si=-24
# env=((f8087 . -20) (f8086 . -16) (f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# expr=(begin (string-set! f8049 f8086 (string-ref f8048 f8087)) ((vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17)))
# tail-begin (begin (string-set! f8049 f8086 (string-ref f8048 f8087)) ((vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17)))
#   env=((f8087 . -20) (f8086 . -16) (f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# emit-expr (string-set! f8049 f8086 (string-ref f8048 f8087))
# emit-expr f8049
# emit-variable-ref
# env=((f8087 . -20) (f8086 . -16) (f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8049
    movl 18(%edi), %eax  # frame load f8049
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_48782
# invoke error handler eh_string
    .extern mrc_eh$ustring
    movl mrc_eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $168,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48782:
    movl %eax, -24(%esp)
# emit-expr f8086
# emit-variable-ref
# env=((f8087 . -20) (f8086 . -16) (f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8086
    movl -16(%esp), %eax  # stack load f8086
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48783"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $168,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48783:
# check bounds on string index
    movl -24(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_48785
    cmp  $0,%eax
    jge _L_48784
_L_48785:
# invoke error handler eh_string_index
    .extern mrc_eh$ustring$uindex
    movl mrc_eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $168,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_48784:
    movl %eax, -28(%esp)
# emit-expr (string-ref f8048 f8087)
# emit-expr f8048
# emit-variable-ref
# env=((f8087 . -20) (f8086 . -16) (f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8048
    movl 22(%edi), %eax  # frame load f8048
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_48786
# invoke error handler eh_string
    .extern mrc_eh$ustring
    movl mrc_eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $164,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48786:
    movl %eax, -32(%esp)
# emit-expr f8087
# emit-variable-ref
# env=((f8087 . -20) (f8086 . -16) (f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8087
    movl -20(%esp), %eax  # stack load f8087
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48787"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $164,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48787:
# check bounds on string index
    movl -32(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_48789
    cmp  $0,%eax
    jge _L_48788
_L_48789:
# invoke error handler eh_string_index
    .extern mrc_eh$ustring$uindex
    movl mrc_eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $164,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_48788:
    sar $2, %eax
    movl -32(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_48790"
# invoke error handler eh_character
    .extern mrc_eh$ucharacter
    movl mrc_eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $168,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48790:
    movl -24(%esp), %ebx
    movl -28(%esp), %esi
    sar $2, %esi
    movb  %ah, -2(%ebx,%esi)
# emit-tail-expr
# si=-24
# env=((f8087 . -20) (f8086 . -16) (f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# expr=(begin ((vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17)))
# tail-begin (begin ((vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17)))
#   env=((f8087 . -20) (f8086 . -16) (f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# emit-tail-expr
# si=-24
# env=((f8087 . -20) (f8086 . -16) (f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# expr=((vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17))
# emit-tail-funcall
#    si   =-24
#    env  = ((f8087 . -20) (f8086 . -16) (f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
#    expr = (funcall (vector-ref f8071 0) (fxadd1 f8086) (fx+ f8087 17))
# emit-expr (vector-ref f8071 0)
# emit-expr f8071
# emit-variable-ref
# env=((f8087 . -20) (f8086 . -16) (f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8071
    movl 26(%edi), %eax  # frame load f8071
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_48791
# invoke error handler eh_vector
    .extern mrc_eh$uvector
    movl mrc_eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48791:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48792"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48792:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_48794
    cmp  $0,%eax
    jge _L_48793
_L_48794:
# invoke error handler eh_vector_index
    .extern mrc_eh$uvector$uindex
    movl mrc_eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_48793:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr (fxadd1 f8086)
# emit-expr f8086
# emit-variable-ref
# env=((f8087 . -20) (f8086 . -16) (f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8086
    movl -16(%esp), %eax  # stack load f8086
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48795"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $56,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48795:
     addl $4, %eax
    mov %eax, -28(%esp)    # arg (fxadd1 f8086)
# emit-expr (fx+ f8087 17)
# emit-expr 17
    movl $68, %eax     # immed 17
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48796"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $88,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48796:
    movl %eax, -32(%esp)  # fx+ push arg1
# emit-expr f8087
# emit-variable-ref
# env=((f8087 . -20) (f8086 . -16) (f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8087
    movl -20(%esp), %eax  # stack load f8087
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48797"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $88,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48797:
    addl -32(%esp), %eax  # fx+ arg1 arg2
    mov %eax, -32(%esp)    # arg (fx+ f8087 17)
    movl -24(%esp), %edi   # load new closure to %edi
# emit-shift-args:  size=3   si=-24  delta=20
    mov -24(%esp), %ebx  # shift frame cell
    mov %ebx, -4(%esp)  # down to base
# emit-shift-args:  size=2   si=-28  delta=20
    mov -28(%esp), %ebx  # shift frame cell
    mov %ebx, -8(%esp)  # down to base
# emit-shift-args:  size=1   si=-32  delta=20
    mov -32(%esp), %ebx  # shift frame cell
    mov %ebx, -12(%esp)  # down to base
# emit-shift-args:  size=0   si=-36  delta=20
    movl $8,%eax   # save arg count
    jmp *-2(%edi)  # tail-funcall
     ret   # return thru stack
_L_48771:
     ret   # return thru stack
    jmp _L_48766
_L_48765:
# emit-tail-expr
# si=-24
# env=((f8087 . -20) (f8086 . -16) (f8087 . -12) (f8086 . -8) (f8071 . 28) (f8048 . 24) (f8049 . 20) (f8048 . 16) (f8071 . 12) (f8048 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_48766:
    .align 4,0x90
_L_48763:
    movl -28(%esp), %ebx
    movl -32(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f8070 0 (closure (f8084 f8085) (f8049 f8049 f8070) (let ((f8084 f8084) (f8085 f8085)) (if (fx= f8084 (string-length f8049)) ((primitive-ref close-output-port) f8085) (begin ((primitive-ref write-char) (string-ref f8049 f8084) f8085) ((vector-ref f8070 0) (fxadd1 f8084) f8085)))))) (vector-set! f8069 0 (closure (f8080 f8081) (f8049 f8049 f8069 char= f8049 f8069 f8069) (let ((f8080 f8080) (f8081 f8081)) (let ((f8083 ((primitive-ref read-char) f8081))) (if (eof-object? f8083) (begin ((primitive-ref close-input-port) f8081) (fx= f8080 (string-length f8049))) (if (fx= f8080 (string-length f8049)) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "file too short") (if (char= (string-ref f8049 f8080) f8083) ((vector-ref f8069 0) (fxadd1 f8080) f8081) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "mismatch")))))))))
# emit-begin
#   expr=(begin (vector-set! f8070 0 (closure (f8084 f8085) (f8049 f8049 f8070) (let ((f8084 f8084) (f8085 f8085)) (if (fx= f8084 (string-length f8049)) ((primitive-ref close-output-port) f8085) (begin ((primitive-ref write-char) (string-ref f8049 f8084) f8085) ((vector-ref f8070 0) (fxadd1 f8084) f8085)))))) (vector-set! f8069 0 (closure (f8080 f8081) (f8049 f8049 f8069 char= f8049 f8069 f8069) (let ((f8080 f8080) (f8081 f8081)) (let ((f8083 ((primitive-ref read-char) f8081))) (if (eof-object? f8083) (begin ((primitive-ref close-input-port) f8081) (fx= f8080 (string-length f8049))) (if (fx= f8080 (string-length f8049)) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "file too short") (if (char= (string-ref f8049 f8080) f8083) ((vector-ref f8069 0) (fxadd1 f8080) f8081) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "mismatch")))))))))
#   env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# emit-expr (vector-set! f8070 0 (closure (f8084 f8085) (f8049 f8049 f8070) (let ((f8084 f8084) (f8085 f8085)) (if (fx= f8084 (string-length f8049)) ((primitive-ref close-output-port) f8085) (begin ((primitive-ref write-char) (string-ref f8049 f8084) f8085) ((vector-ref f8070 0) (fxadd1 f8084) f8085))))))
# emit-expr f8070
# emit-variable-ref
# env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8070
    movl -20(%esp), %eax  # stack load f8070
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_48798
# invoke error handler eh_vector
    .extern mrc_eh$uvector
    movl mrc_eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48798:
    movl %eax, -28(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48799"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48799:
# check bounds on vector index
    movl -28(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_48801
    cmp  $0,%eax
    jge _L_48800
_L_48801:
# invoke error handler eh_vector_index
    .extern mrc_eh$uvector$uindex
    movl mrc_eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_48800:
    movl %eax, -32(%esp)
# emit-expr (closure (f8084 f8085) (f8049 f8049 f8070) (let ((f8084 f8084) (f8085 f8085)) (if (fx= f8084 (string-length f8049)) ((primitive-ref close-output-port) f8085) (begin ((primitive-ref write-char) (string-ref f8049 f8084) f8085) ((vector-ref f8070 0) (fxadd1 f8084) f8085)))))
# emit-closure
# si = -36
# env = ((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# expr = (closure (f8084 f8085) (f8049 f8049 f8070) (let ((f8084 f8084) (f8085 f8085)) (if (fx= f8084 (string-length f8049)) ((primitive-ref close-output-port) f8085) (begin ((primitive-ref write-char) (string-ref f8049 f8084) f8085) ((vector-ref f8070 0) (fxadd1 f8084) f8085)))))
    movl $_L_48802, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8049
    movl -8(%esp), %eax  # stack load f8049
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f8049
# emit-variable-ref
# env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8049
    movl -8(%esp), %eax  # stack load f8049
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f8049
# emit-variable-ref
# env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8070
    movl -20(%esp), %eax  # stack load f8070
# end emit-variable-ref
   movl  %eax, 12(%ebp)  # f8070
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_48803            # jump around closure body
_L_48802:
# check argument count
    cmp $8,%eax
    je _L_48804
# invoke error handler eh_argcount
    .extern mrc_eh$uargcount
    movl mrc_eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_48804:
# emit-tail-expr
# si=-16
# env=((f8085 . -12) (f8084 . -8) (f8070 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# expr=(let ((f8084 f8084) (f8085 f8085)) (if (fx= f8084 (string-length f8049)) ((primitive-ref close-output-port) f8085) (begin ((primitive-ref write-char) (string-ref f8049 f8084) f8085) ((vector-ref f8070 0) (fxadd1 f8084) f8085))))
# emit-tail-let
#  si   = -16
#  env  = ((f8085 . -12) (f8084 . -8) (f8070 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
#  bindings = ((f8084 f8084) (f8085 f8085))
#  body = (if (fx= f8084 (string-length f8049)) ((primitive-ref close-output-port) f8085) (begin ((primitive-ref write-char) (string-ref f8049 f8084) f8085) ((vector-ref f8070 0) (fxadd1 f8084) f8085)))
# emit-expr f8084
# emit-variable-ref
# env=((f8085 . -12) (f8084 . -8) (f8070 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8084
    movl -8(%esp), %eax  # stack load f8084
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f8085
# emit-variable-ref
# env=((f8085 . -12) (f8084 . -8) (f8070 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8085
    movl -12(%esp), %eax  # stack load f8085
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f8085 . -20) (f8084 . -16) (f8085 . -12) (f8084 . -8) (f8070 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# expr=(if (fx= f8084 (string-length f8049)) ((primitive-ref close-output-port) f8085) (begin ((primitive-ref write-char) (string-ref f8049 f8084) f8085) ((vector-ref f8070 0) (fxadd1 f8084) f8085)))
# emit-expr (fx= f8084 (string-length f8049))
# emit-expr (string-length f8049)
# emit-expr f8049
# emit-variable-ref
# env=((f8085 . -20) (f8084 . -16) (f8085 . -12) (f8084 . -8) (f8070 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8049
    movl 6(%edi), %eax  # frame load f8049
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_48807
# invoke error handler eh_string
    .extern mrc_eh$ustring
    movl mrc_eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $160,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48807:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48808"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $68,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48808:
    movl %eax, -24(%esp)
# emit-expr f8084
# emit-variable-ref
# env=((f8085 . -20) (f8084 . -16) (f8085 . -12) (f8084 . -8) (f8070 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8084
    movl -16(%esp), %eax  # stack load f8084
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48809"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $68,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48809:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_48805
# emit-tail-expr
# si=-24
# env=((f8085 . -20) (f8084 . -16) (f8085 . -12) (f8084 . -8) (f8070 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# expr=((primitive-ref close-output-port) f8085)
# emit-tail-funcall
#    si   =-24
#    env  = ((f8085 . -20) (f8084 . -16) (f8085 . -12) (f8084 . -8) (f8070 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
#    expr = (funcall (primitive-ref close-output-port) f8085)
# emit-expr (primitive-ref close-output-port)
    .extern mrc_close$moutput$mport
    movl mrc_close$moutput$mport,%eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr f8085
# emit-variable-ref
# env=((f8085 . -20) (f8084 . -16) (f8085 . -12) (f8084 . -8) (f8070 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8085
    movl -20(%esp), %eax  # stack load f8085
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f8085
    movl -24(%esp), %edi   # load new closure to %edi
# emit-shift-args:  size=2   si=-24  delta=20
    mov -24(%esp), %ebx  # shift frame cell
    mov %ebx, -4(%esp)  # down to base
# emit-shift-args:  size=1   si=-28  delta=20
    mov -28(%esp), %ebx  # shift frame cell
    mov %ebx, -8(%esp)  # down to base
# emit-shift-args:  size=0   si=-32  delta=20
    movl $4,%eax   # save arg count
    jmp *-2(%edi)  # tail-funcall
    jmp _L_48806
_L_48805:
# emit-tail-expr
# si=-24
# env=((f8085 . -20) (f8084 . -16) (f8085 . -12) (f8084 . -8) (f8070 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# expr=(begin ((primitive-ref write-char) (string-ref f8049 f8084) f8085) ((vector-ref f8070 0) (fxadd1 f8084) f8085))
# tail-begin (begin ((primitive-ref write-char) (string-ref f8049 f8084) f8085) ((vector-ref f8070 0) (fxadd1 f8084) f8085))
#   env=((f8085 . -20) (f8084 . -16) (f8085 . -12) (f8084 . -8) (f8070 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# emit-expr ((primitive-ref write-char) (string-ref f8049 f8084) f8085)
# funcall
#    si   =-24
#    env  = ((f8085 . -20) (f8084 . -16) (f8085 . -12) (f8084 . -8) (f8070 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
#    expr = (funcall (primitive-ref write-char) (string-ref f8049 f8084) f8085)
# emit-expr (primitive-ref write-char)
    .extern mrc_write$mchar
    movl mrc_write$mchar,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_48810"
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_48810":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr (string-ref f8049 f8084)
# emit-expr f8049
# emit-variable-ref
# env=((f8085 . -20) (f8084 . -16) (f8085 . -12) (f8084 . -8) (f8070 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8049
    movl 6(%edi), %eax  # frame load f8049
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_48811
# invoke error handler eh_string
    .extern mrc_eh$ustring
    movl mrc_eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $164,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48811:
    movl %eax, -36(%esp)
# emit-expr f8084
# emit-variable-ref
# env=((f8085 . -20) (f8084 . -16) (f8085 . -12) (f8084 . -8) (f8070 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8084
    movl -16(%esp), %eax  # stack load f8084
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48812"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $164,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48812:
# check bounds on string index
    movl -36(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_48814
    cmp  $0,%eax
    jge _L_48813
_L_48814:
# invoke error handler eh_string_index
    .extern mrc_eh$ustring$uindex
    movl mrc_eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $164,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_48813:
    sar $2, %eax
    movl -36(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
    mov %eax, -36(%esp)  # arg (string-ref f8049 f8084)
# emit-expr f8085
# emit-variable-ref
# env=((f8085 . -20) (f8084 . -16) (f8085 . -12) (f8084 . -8) (f8070 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8085
    movl -20(%esp), %eax  # stack load f8085
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg f8085
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f8085 . -20) (f8084 . -16) (f8085 . -12) (f8084 . -8) (f8070 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# expr=(begin ((vector-ref f8070 0) (fxadd1 f8084) f8085))
# tail-begin (begin ((vector-ref f8070 0) (fxadd1 f8084) f8085))
#   env=((f8085 . -20) (f8084 . -16) (f8085 . -12) (f8084 . -8) (f8070 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# emit-tail-expr
# si=-24
# env=((f8085 . -20) (f8084 . -16) (f8085 . -12) (f8084 . -8) (f8070 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# expr=((vector-ref f8070 0) (fxadd1 f8084) f8085)
# emit-tail-funcall
#    si   =-24
#    env  = ((f8085 . -20) (f8084 . -16) (f8085 . -12) (f8084 . -8) (f8070 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
#    expr = (funcall (vector-ref f8070 0) (fxadd1 f8084) f8085)
# emit-expr (vector-ref f8070 0)
# emit-expr f8070
# emit-variable-ref
# env=((f8085 . -20) (f8084 . -16) (f8085 . -12) (f8084 . -8) (f8070 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8070
    movl 10(%edi), %eax  # frame load f8070
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_48815
# invoke error handler eh_vector
    .extern mrc_eh$uvector
    movl mrc_eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48815:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48816"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48816:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_48818
    cmp  $0,%eax
    jge _L_48817
_L_48818:
# invoke error handler eh_vector_index
    .extern mrc_eh$uvector$uindex
    movl mrc_eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_48817:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr (fxadd1 f8084)
# emit-expr f8084
# emit-variable-ref
# env=((f8085 . -20) (f8084 . -16) (f8085 . -12) (f8084 . -8) (f8070 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8084
    movl -16(%esp), %eax  # stack load f8084
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48819"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $56,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48819:
     addl $4, %eax
    mov %eax, -28(%esp)    # arg (fxadd1 f8084)
# emit-expr f8085
# emit-variable-ref
# env=((f8085 . -20) (f8084 . -16) (f8085 . -12) (f8084 . -8) (f8070 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8085
    movl -20(%esp), %eax  # stack load f8085
# end emit-variable-ref
    mov %eax, -32(%esp)    # arg f8085
    movl -24(%esp), %edi   # load new closure to %edi
# emit-shift-args:  size=3   si=-24  delta=20
    mov -24(%esp), %ebx  # shift frame cell
    mov %ebx, -4(%esp)  # down to base
# emit-shift-args:  size=2   si=-28  delta=20
    mov -28(%esp), %ebx  # shift frame cell
    mov %ebx, -8(%esp)  # down to base
# emit-shift-args:  size=1   si=-32  delta=20
    mov -32(%esp), %ebx  # shift frame cell
    mov %ebx, -12(%esp)  # down to base
# emit-shift-args:  size=0   si=-36  delta=20
    movl $8,%eax   # save arg count
    jmp *-2(%edi)  # tail-funcall
     ret   # return thru stack
_L_48806:
    .align 4,0x90
_L_48803:
    movl -28(%esp), %ebx
    movl -32(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f8069 0 (closure (f8080 f8081) (f8049 f8049 f8069 char= f8049 f8069 f8069) (let ((f8080 f8080) (f8081 f8081)) (let ((f8083 ((primitive-ref read-char) f8081))) (if (eof-object? f8083) (begin ((primitive-ref close-input-port) f8081) (fx= f8080 (string-length f8049))) (if (fx= f8080 (string-length f8049)) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "file too short") (if (char= (string-ref f8049 f8080) f8083) ((vector-ref f8069 0) (fxadd1 f8080) f8081) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "mismatch")))))))))
# emit-begin
#   expr=(begin (vector-set! f8069 0 (closure (f8080 f8081) (f8049 f8049 f8069 char= f8049 f8069 f8069) (let ((f8080 f8080) (f8081 f8081)) (let ((f8083 ((primitive-ref read-char) f8081))) (if (eof-object? f8083) (begin ((primitive-ref close-input-port) f8081) (fx= f8080 (string-length f8049))) (if (fx= f8080 (string-length f8049)) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "file too short") (if (char= (string-ref f8049 f8080) f8083) ((vector-ref f8069 0) (fxadd1 f8080) f8081) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "mismatch")))))))))
#   env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# emit-expr (vector-set! f8069 0 (closure (f8080 f8081) (f8049 f8049 f8069 char= f8049 f8069 f8069) (let ((f8080 f8080) (f8081 f8081)) (let ((f8083 ((primitive-ref read-char) f8081))) (if (eof-object? f8083) (begin ((primitive-ref close-input-port) f8081) (fx= f8080 (string-length f8049))) (if (fx= f8080 (string-length f8049)) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "file too short") (if (char= (string-ref f8049 f8080) f8083) ((vector-ref f8069 0) (fxadd1 f8080) f8081) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "mismatch"))))))))
# emit-expr f8069
# emit-variable-ref
# env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8069
    movl -24(%esp), %eax  # stack load f8069
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_48820
# invoke error handler eh_vector
    .extern mrc_eh$uvector
    movl mrc_eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48820:
    movl %eax, -28(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48821"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48821:
# check bounds on vector index
    movl -28(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_48823
    cmp  $0,%eax
    jge _L_48822
_L_48823:
# invoke error handler eh_vector_index
    .extern mrc_eh$uvector$uindex
    movl mrc_eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_48822:
    movl %eax, -32(%esp)
# emit-expr (closure (f8080 f8081) (f8049 f8049 f8069 char= f8049 f8069 f8069) (let ((f8080 f8080) (f8081 f8081)) (let ((f8083 ((primitive-ref read-char) f8081))) (if (eof-object? f8083) (begin ((primitive-ref close-input-port) f8081) (fx= f8080 (string-length f8049))) (if (fx= f8080 (string-length f8049)) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "file too short") (if (char= (string-ref f8049 f8080) f8083) ((vector-ref f8069 0) (fxadd1 f8080) f8081) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "mismatch")))))))
# emit-closure
# si = -36
# env = ((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# expr = (closure (f8080 f8081) (f8049 f8049 f8069 char= f8049 f8069 f8069) (let ((f8080 f8080) (f8081 f8081)) (let ((f8083 ((primitive-ref read-char) f8081))) (if (eof-object? f8083) (begin ((primitive-ref close-input-port) f8081) (fx= f8080 (string-length f8049))) (if (fx= f8080 (string-length f8049)) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "file too short") (if (char= (string-ref f8049 f8080) f8083) ((vector-ref f8069 0) (fxadd1 f8080) f8081) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "mismatch")))))))
    movl $_L_48824, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8049
    movl -8(%esp), %eax  # stack load f8049
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f8049
# emit-variable-ref
# env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8049
    movl -8(%esp), %eax  # stack load f8049
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f8049
# emit-variable-ref
# env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8069
    movl -24(%esp), %eax  # stack load f8069
# end emit-variable-ref
   movl  %eax, 12(%ebp)  # f8069
# WARNING: free var char= not defined in the environmnet
# emit-variable-ref
# env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8049
    movl -8(%esp), %eax  # stack load f8049
# end emit-variable-ref
   movl  %eax, 20(%ebp)  # f8049
# emit-variable-ref
# env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8069
    movl -24(%esp), %eax  # stack load f8069
# end emit-variable-ref
   movl  %eax, 24(%ebp)  # f8069
# emit-variable-ref
# env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8069
    movl -24(%esp), %eax  # stack load f8069
# end emit-variable-ref
   movl  %eax, 28(%ebp)  # f8069
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $32, %ebp     # bump ebp
    jmp _L_48825            # jump around closure body
_L_48824:
# check argument count
    cmp $8,%eax
    je _L_48826
# invoke error handler eh_argcount
    .extern mrc_eh$uargcount
    movl mrc_eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_48826:
# emit-tail-expr
# si=-16
# env=((f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# expr=(let ((f8080 f8080) (f8081 f8081)) (let ((f8083 ((primitive-ref read-char) f8081))) (if (eof-object? f8083) (begin ((primitive-ref close-input-port) f8081) (fx= f8080 (string-length f8049))) (if (fx= f8080 (string-length f8049)) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "file too short") (if (char= (string-ref f8049 f8080) f8083) ((vector-ref f8069 0) (fxadd1 f8080) f8081) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "mismatch"))))))
# emit-tail-let
#  si   = -16
#  env  = ((f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
#  bindings = ((f8080 f8080) (f8081 f8081))
#  body = (let ((f8083 ((primitive-ref read-char) f8081))) (if (eof-object? f8083) (begin ((primitive-ref close-input-port) f8081) (fx= f8080 (string-length f8049))) (if (fx= f8080 (string-length f8049)) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "file too short") (if (char= (string-ref f8049 f8080) f8083) ((vector-ref f8069 0) (fxadd1 f8080) f8081) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "mismatch")))))
# emit-expr f8080
# emit-variable-ref
# env=((f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8080
    movl -8(%esp), %eax  # stack load f8080
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f8081
# emit-variable-ref
# env=((f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8081
    movl -12(%esp), %eax  # stack load f8081
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# expr=(let ((f8083 ((primitive-ref read-char) f8081))) (if (eof-object? f8083) (begin ((primitive-ref close-input-port) f8081) (fx= f8080 (string-length f8049))) (if (fx= f8080 (string-length f8049)) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "file too short") (if (char= (string-ref f8049 f8080) f8083) ((vector-ref f8069 0) (fxadd1 f8080) f8081) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "mismatch")))))
# emit-tail-let
#  si   = -24
#  env  = ((f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
#  bindings = ((f8083 ((primitive-ref read-char) f8081)))
#  body = (if (eof-object? f8083) (begin ((primitive-ref close-input-port) f8081) (fx= f8080 (string-length f8049))) (if (fx= f8080 (string-length f8049)) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "file too short") (if (char= (string-ref f8049 f8080) f8083) ((vector-ref f8069 0) (fxadd1 f8080) f8081) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "mismatch"))))
# emit-expr ((primitive-ref read-char) f8081)
# funcall
#    si   =-24
#    env  = ((f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
#    expr = (funcall (primitive-ref read-char) f8081)
# emit-expr (primitive-ref read-char)
    .extern mrc_read$mchar
    movl mrc_read$mchar,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_48827"
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_48827":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f8081
# emit-variable-ref
# env=((f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8081
    movl -20(%esp), %eax  # stack load f8081
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f8081
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -24(%esp)  # stack save
# emit-tail-expr
# si=-28
# env=((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# expr=(if (eof-object? f8083) (begin ((primitive-ref close-input-port) f8081) (fx= f8080 (string-length f8049))) (if (fx= f8080 (string-length f8049)) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "file too short") (if (char= (string-ref f8049 f8080) f8083) ((vector-ref f8069 0) (fxadd1 f8080) f8081) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "mismatch"))))
# emit-expr (eof-object? f8083)
# emit-expr f8083
# emit-variable-ref
# env=((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8083
    movl -24(%esp), %eax  # stack load f8083
# end emit-variable-ref
    cmp $95, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_48828
# emit-tail-expr
# si=-28
# env=((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# expr=(begin ((primitive-ref close-input-port) f8081) (fx= f8080 (string-length f8049)))
# tail-begin (begin ((primitive-ref close-input-port) f8081) (fx= f8080 (string-length f8049)))
#   env=((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# emit-expr ((primitive-ref close-input-port) f8081)
# funcall
#    si   =-28
#    env  = ((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
#    expr = (funcall (primitive-ref close-input-port) f8081)
# emit-expr (primitive-ref close-input-port)
    .extern mrc_close$minput$mport
    movl mrc_close$minput$mport,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_48830"
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_48830":
   movl %eax,  -36(%esp)  # stash funcall-oper in closure slot
# emit-expr f8081
# emit-variable-ref
# env=((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8081
    movl -20(%esp), %eax  # stack load f8081
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg f8081
    movl -36(%esp), %edi   # load new closure to %edi
    add $-28, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $28, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-28
# env=((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# expr=(begin (fx= f8080 (string-length f8049)))
# tail-begin (begin (fx= f8080 (string-length f8049)))
#   env=((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# emit-tail-expr
# si=-28
# env=((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# expr=(fx= f8080 (string-length f8049))
# tail primcall
# emit-expr (string-length f8049)
# emit-expr f8049
# emit-variable-ref
# env=((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8049
    movl 18(%edi), %eax  # frame load f8049
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_48831
# invoke error handler eh_string
    .extern mrc_eh$ustring
    movl mrc_eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $160,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48831:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48832"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $68,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48832:
    movl %eax, -28(%esp)
# emit-expr f8080
# emit-variable-ref
# env=((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8080
    movl -16(%esp), %eax  # stack load f8080
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48833"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $68,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48833:
    cmp -28(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (fx= f8080 (string-length f8049))
    ret
     ret   # return thru stack
    jmp _L_48829
_L_48828:
# emit-tail-expr
# si=-28
# env=((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# expr=(if (fx= f8080 (string-length f8049)) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "file too short") (if (char= (string-ref f8049 f8080) f8083) ((vector-ref f8069 0) (fxadd1 f8080) f8081) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "mismatch")))
# emit-expr (fx= f8080 (string-length f8049))
# emit-expr (string-length f8049)
# emit-expr f8049
# emit-variable-ref
# env=((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8049
    movl 18(%edi), %eax  # frame load f8049
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_48836
# invoke error handler eh_string
    .extern mrc_eh$ustring
    movl mrc_eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $160,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48836:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48837"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $68,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48837:
    movl %eax, -28(%esp)
# emit-expr f8080
# emit-variable-ref
# env=((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8080
    movl -16(%esp), %eax  # stack load f8080
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48838"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $68,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48838:
    cmp -28(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_48834
# emit-tail-expr
# si=-28
# env=((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# expr=((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "file too short")
# emit-tail-funcall
#    si   =-28
#    env  = ((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
#    expr = (funcall (primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "file too short")
# emit-expr (primitive-ref error)
    .extern mrc_error
    movl mrc_error,%eax
   movl %eax,  -28(%esp)  # stash funcall-oper in next closure slot
# emit-expr (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ())))
# cons arg1=((primitive-ref string->symbol) "vector-ref") arg2=(cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))
# emit-expr ((primitive-ref string->symbol) "vector-ref")
# funcall
#    si   =-32
#    env  = ((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
#    expr = (funcall (primitive-ref string->symbol) "vector-ref")
# emit-expr (primitive-ref string->symbol)
    .extern mrc_string$m$gsymbol
    movl mrc_string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_48839"
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_48839":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-ref"
# string literal
    jmp _L_48841
    .align 8,0x90
_L_48840 :
    .int 40
    .ascii "vector-ref"
_L_48841:
    movl $_L_48840, %eax
    orl $6, %eax
    mov %eax, -44(%esp)  # arg vector-ref
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -32(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))
# cons arg1=((primitive-ref string->symbol) "f8069") arg2=(cons 0 ())
# emit-expr ((primitive-ref string->symbol) "f8069")
# funcall
#    si   =-36
#    env  = ((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
#    expr = (funcall (primitive-ref string->symbol) "f8069")
# emit-expr (primitive-ref string->symbol)
    .extern mrc_string$m$gsymbol
    movl mrc_string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_48842"
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_48842":
   movl %eax,  -44(%esp)  # stash funcall-oper in closure slot
# emit-expr "f8069"
# string literal
    jmp _L_48844
    .align 8,0x90
_L_48843 :
    .int 20
    .ascii "f8069"
_L_48844:
    movl $_L_48843, %eax
    orl $6, %eax
    mov %eax, -48(%esp)  # arg f8069
    movl -44(%esp), %edi   # load new closure to %edi
    add $-36, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $36, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -36(%esp)
# emit-expr (cons 0 ())
# cons arg1=0 arg2=()
# emit-expr 0
    movl $0, %eax     # immed 0
    movl %eax, -40(%esp)
# emit-expr ()
    movl $63, %eax     # immed ()
    movl %eax, 4(%ebp)
    movl -40(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl %eax, 4(%ebp)
    movl -36(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl %eax, 4(%ebp)
    movl -32(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    mov %eax, -32(%esp)    # arg (cons ((primitive-ref string->symbol) vector-ref) (cons ((primitive-ref string->symbol) f8069) (cons 0 ())))
# emit-expr "file too short"
# string literal
    jmp _L_48846
    .align 8,0x90
_L_48845 :
    .int 56
    .ascii "file too short"
_L_48846:
    movl $_L_48845, %eax
    orl $6, %eax
    mov %eax, -36(%esp)    # arg file too short
    movl -28(%esp), %edi   # load new closure to %edi
# emit-shift-args:  size=3   si=-28  delta=24
    mov -28(%esp), %ebx  # shift frame cell
    mov %ebx, -4(%esp)  # down to base
# emit-shift-args:  size=2   si=-32  delta=24
    mov -32(%esp), %ebx  # shift frame cell
    mov %ebx, -8(%esp)  # down to base
# emit-shift-args:  size=1   si=-36  delta=24
    mov -36(%esp), %ebx  # shift frame cell
    mov %ebx, -12(%esp)  # down to base
# emit-shift-args:  size=0   si=-40  delta=24
    movl $8,%eax   # save arg count
    jmp *-2(%edi)  # tail-funcall
    jmp _L_48835
_L_48834:
# emit-tail-expr
# si=-28
# env=((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# expr=(if (char= (string-ref f8049 f8080) f8083) ((vector-ref f8069 0) (fxadd1 f8080) f8081) ((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "mismatch"))
# emit-expr (char= (string-ref f8049 f8080) f8083)
# funcall
#    si   =-28
#    env  = ((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
#    expr = (funcall char= (string-ref f8049 f8080) f8083)
# emit-expr char=
# emit-variable-ref
# env=((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=char=
    movl 14(%edi), %eax  # frame load char=
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_48849"
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_48849":
   movl %eax,  -36(%esp)  # stash funcall-oper in closure slot
# emit-expr (string-ref f8049 f8080)
# emit-expr f8049
# emit-variable-ref
# env=((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8049
    movl 18(%edi), %eax  # frame load f8049
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_48850
# invoke error handler eh_string
    .extern mrc_eh$ustring
    movl mrc_eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $164,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48850:
    movl %eax, -40(%esp)
# emit-expr f8080
# emit-variable-ref
# env=((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8080
    movl -16(%esp), %eax  # stack load f8080
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48851"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $164,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48851:
# check bounds on string index
    movl -40(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_48853
    cmp  $0,%eax
    jge _L_48852
_L_48853:
# invoke error handler eh_string_index
    .extern mrc_eh$ustring$uindex
    movl mrc_eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $164,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_48852:
    sar $2, %eax
    movl -40(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
    mov %eax, -40(%esp)  # arg (string-ref f8049 f8080)
# emit-expr f8083
# emit-variable-ref
# env=((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8083
    movl -24(%esp), %eax  # stack load f8083
# end emit-variable-ref
    mov %eax, -44(%esp)  # arg f8083
    movl -36(%esp), %edi   # load new closure to %edi
    add $-28, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $28, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_48847
# emit-tail-expr
# si=-28
# env=((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# expr=((vector-ref f8069 0) (fxadd1 f8080) f8081)
# emit-tail-funcall
#    si   =-28
#    env  = ((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
#    expr = (funcall (vector-ref f8069 0) (fxadd1 f8080) f8081)
# emit-expr (vector-ref f8069 0)
# emit-expr f8069
# emit-variable-ref
# env=((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8069
    movl 26(%edi), %eax  # frame load f8069
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_48854
# invoke error handler eh_vector
    .extern mrc_eh$uvector
    movl mrc_eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48854:
    movl %eax, -28(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48855"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48855:
# check bounds on vector index
    movl -28(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_48857
    cmp  $0,%eax
    jge _L_48856
_L_48857:
# invoke error handler eh_vector_index
    .extern mrc_eh$uvector$uindex
    movl mrc_eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_48856:
    movl -28(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -28(%esp)  # stash funcall-oper in next closure slot
# emit-expr (fxadd1 f8080)
# emit-expr f8080
# emit-variable-ref
# env=((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8080
    movl -16(%esp), %eax  # stack load f8080
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48858"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $56,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48858:
     addl $4, %eax
    mov %eax, -32(%esp)    # arg (fxadd1 f8080)
# emit-expr f8081
# emit-variable-ref
# env=((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8081
    movl -20(%esp), %eax  # stack load f8081
# end emit-variable-ref
    mov %eax, -36(%esp)    # arg f8081
    movl -28(%esp), %edi   # load new closure to %edi
# emit-shift-args:  size=3   si=-28  delta=24
    mov -28(%esp), %ebx  # shift frame cell
    mov %ebx, -4(%esp)  # down to base
# emit-shift-args:  size=2   si=-32  delta=24
    mov -32(%esp), %ebx  # shift frame cell
    mov %ebx, -8(%esp)  # down to base
# emit-shift-args:  size=1   si=-36  delta=24
    mov -36(%esp), %ebx  # shift frame cell
    mov %ebx, -12(%esp)  # down to base
# emit-shift-args:  size=0   si=-40  delta=24
    movl $8,%eax   # save arg count
    jmp *-2(%edi)  # tail-funcall
    jmp _L_48848
_L_48847:
# emit-tail-expr
# si=-28
# env=((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# expr=((primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "mismatch")
# emit-tail-funcall
#    si   =-28
#    env  = ((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
#    expr = (funcall (primitive-ref error) (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))) "mismatch")
# emit-expr (primitive-ref error)
    .extern mrc_error
    movl mrc_error,%eax
   movl %eax,  -28(%esp)  # stash funcall-oper in next closure slot
# emit-expr (cons ((primitive-ref string->symbol) "vector-ref") (cons ((primitive-ref string->symbol) "f8069") (cons 0 ())))
# cons arg1=((primitive-ref string->symbol) "vector-ref") arg2=(cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))
# emit-expr ((primitive-ref string->symbol) "vector-ref")
# funcall
#    si   =-32
#    env  = ((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
#    expr = (funcall (primitive-ref string->symbol) "vector-ref")
# emit-expr (primitive-ref string->symbol)
    .extern mrc_string$m$gsymbol
    movl mrc_string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_48859"
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_48859":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-ref"
# string literal
    jmp _L_48861
    .align 8,0x90
_L_48860 :
    .int 40
    .ascii "vector-ref"
_L_48861:
    movl $_L_48860, %eax
    orl $6, %eax
    mov %eax, -44(%esp)  # arg vector-ref
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -32(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "f8069") (cons 0 ()))
# cons arg1=((primitive-ref string->symbol) "f8069") arg2=(cons 0 ())
# emit-expr ((primitive-ref string->symbol) "f8069")
# funcall
#    si   =-36
#    env  = ((f8083 . -24) (f8081 . -20) (f8080 . -16) (f8081 . -12) (f8080 . -8) (f8069 . 28) (f8069 . 24) (f8049 . 20) (char= . 16) (f8069 . 12) (f8049 . 8) (f8049 . 4) (f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
#    expr = (funcall (primitive-ref string->symbol) "f8069")
# emit-expr (primitive-ref string->symbol)
    .extern mrc_string$m$gsymbol
    movl mrc_string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_48862"
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_48862":
   movl %eax,  -44(%esp)  # stash funcall-oper in closure slot
# emit-expr "f8069"
# string literal
    jmp _L_48864
    .align 8,0x90
_L_48863 :
    .int 20
    .ascii "f8069"
_L_48864:
    movl $_L_48863, %eax
    orl $6, %eax
    mov %eax, -48(%esp)  # arg f8069
    movl -44(%esp), %edi   # load new closure to %edi
    add $-36, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $36, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -36(%esp)
# emit-expr (cons 0 ())
# cons arg1=0 arg2=()
# emit-expr 0
    movl $0, %eax     # immed 0
    movl %eax, -40(%esp)
# emit-expr ()
    movl $63, %eax     # immed ()
    movl %eax, 4(%ebp)
    movl -40(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl %eax, 4(%ebp)
    movl -36(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl %eax, 4(%ebp)
    movl -32(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    mov %eax, -32(%esp)    # arg (cons ((primitive-ref string->symbol) vector-ref) (cons ((primitive-ref string->symbol) f8069) (cons 0 ())))
# emit-expr "mismatch"
# string literal
    jmp _L_48866
    .align 8,0x90
_L_48865 :
    .int 32
    .ascii "mismatch"
_L_48866:
    movl $_L_48865, %eax
    orl $6, %eax
    mov %eax, -36(%esp)    # arg mismatch
    movl -28(%esp), %edi   # load new closure to %edi
# emit-shift-args:  size=3   si=-28  delta=24
    mov -28(%esp), %ebx  # shift frame cell
    mov %ebx, -4(%esp)  # down to base
# emit-shift-args:  size=2   si=-32  delta=24
    mov -32(%esp), %ebx  # shift frame cell
    mov %ebx, -8(%esp)  # down to base
# emit-shift-args:  size=1   si=-36  delta=24
    mov -36(%esp), %ebx  # shift frame cell
    mov %ebx, -12(%esp)  # down to base
# emit-shift-args:  size=0   si=-40  delta=24
    movl $8,%eax   # save arg count
    jmp *-2(%edi)  # tail-funcall
_L_48848:
_L_48835:
_L_48829:
    .align 4,0x90
_L_48825:
    movl -28(%esp), %ebx
    movl -32(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# emit-expr (begin (begin ((vector-ref f8071 0) 0 0) ((vector-ref f8070 0) 0 ((primitive-ref open-output-file) "stst.tmp" ((primitive-ref string->symbol) "replace"))) ((vector-ref f8069 0) 0 ((primitive-ref open-input-file) "stst.tmp"))))
# emit-begin
#   expr=(begin (begin ((vector-ref f8071 0) 0 0) ((vector-ref f8070 0) 0 ((primitive-ref open-output-file) "stst.tmp" ((primitive-ref string->symbol) "replace"))) ((vector-ref f8069 0) 0 ((primitive-ref open-input-file) "stst.tmp"))))
#   env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# emit-expr (begin ((vector-ref f8071 0) 0 0) ((vector-ref f8070 0) 0 ((primitive-ref open-output-file) "stst.tmp" ((primitive-ref string->symbol) "replace"))) ((vector-ref f8069 0) 0 ((primitive-ref open-input-file) "stst.tmp")))
# emit-begin
#   expr=(begin ((vector-ref f8071 0) 0 0) ((vector-ref f8070 0) 0 ((primitive-ref open-output-file) "stst.tmp" ((primitive-ref string->symbol) "replace"))) ((vector-ref f8069 0) 0 ((primitive-ref open-input-file) "stst.tmp")))
#   env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# emit-expr ((vector-ref f8071 0) 0 0)
# funcall
#    si   =-28
#    env  = ((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
#    expr = (funcall (vector-ref f8071 0) 0 0)
# emit-expr (vector-ref f8071 0)
# emit-expr f8071
# emit-variable-ref
# env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8071
    movl -16(%esp), %eax  # stack load f8071
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_48867
# invoke error handler eh_vector
    .extern mrc_eh$uvector
    movl mrc_eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48867:
    movl %eax, -36(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48868"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48868:
# check bounds on vector index
    movl -36(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_48870
    cmp  $0,%eax
    jge _L_48869
_L_48870:
# invoke error handler eh_vector_index
    .extern mrc_eh$uvector$uindex
    movl mrc_eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_48869:
    movl -36(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_48871"
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_48871":
   movl %eax,  -36(%esp)  # stash funcall-oper in closure slot
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -40(%esp)  # arg 0
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -44(%esp)  # arg 0
    movl -36(%esp), %edi   # load new closure to %edi
    add $-28, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $28, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-expr (begin ((vector-ref f8070 0) 0 ((primitive-ref open-output-file) "stst.tmp" ((primitive-ref string->symbol) "replace"))) ((vector-ref f8069 0) 0 ((primitive-ref open-input-file) "stst.tmp")))
# emit-begin
#   expr=(begin ((vector-ref f8070 0) 0 ((primitive-ref open-output-file) "stst.tmp" ((primitive-ref string->symbol) "replace"))) ((vector-ref f8069 0) 0 ((primitive-ref open-input-file) "stst.tmp")))
#   env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# emit-expr ((vector-ref f8070 0) 0 ((primitive-ref open-output-file) "stst.tmp" ((primitive-ref string->symbol) "replace")))
# funcall
#    si   =-28
#    env  = ((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
#    expr = (funcall (vector-ref f8070 0) 0 ((primitive-ref open-output-file) "stst.tmp" ((primitive-ref string->symbol) "replace")))
# emit-expr (vector-ref f8070 0)
# emit-expr f8070
# emit-variable-ref
# env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8070
    movl -20(%esp), %eax  # stack load f8070
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_48872
# invoke error handler eh_vector
    .extern mrc_eh$uvector
    movl mrc_eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48872:
    movl %eax, -36(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48873"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48873:
# check bounds on vector index
    movl -36(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_48875
    cmp  $0,%eax
    jge _L_48874
_L_48875:
# invoke error handler eh_vector_index
    .extern mrc_eh$uvector$uindex
    movl mrc_eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_48874:
    movl -36(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_48876"
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_48876":
   movl %eax,  -36(%esp)  # stash funcall-oper in closure slot
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -40(%esp)  # arg 0
# emit-expr ((primitive-ref open-output-file) "stst.tmp" ((primitive-ref string->symbol) "replace"))
# funcall
#    si   =-44
#    env  = ((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
#    expr = (funcall (primitive-ref open-output-file) "stst.tmp" ((primitive-ref string->symbol) "replace"))
# emit-expr (primitive-ref open-output-file)
    .extern mrc_open$moutput$mfile
    movl mrc_open$moutput$mfile,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_48877"
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_48877":
   movl %eax,  -52(%esp)  # stash funcall-oper in closure slot
# emit-expr "stst.tmp"
# string literal
    jmp _L_48879
    .align 8,0x90
_L_48878 :
    .int 32
    .ascii "stst.tmp"
_L_48879:
    movl $_L_48878, %eax
    orl $6, %eax
    mov %eax, -56(%esp)  # arg stst.tmp
# emit-expr ((primitive-ref string->symbol) "replace")
# funcall
#    si   =-60
#    env  = ((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
#    expr = (funcall (primitive-ref string->symbol) "replace")
# emit-expr (primitive-ref string->symbol)
    .extern mrc_string$m$gsymbol
    movl mrc_string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_48880"
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_48880":
   movl %eax,  -68(%esp)  # stash funcall-oper in closure slot
# emit-expr "replace"
# string literal
    jmp _L_48882
    .align 8,0x90
_L_48881 :
    .int 28
    .ascii "replace"
_L_48882:
    movl $_L_48881, %eax
    orl $6, %eax
    mov %eax, -72(%esp)  # arg replace
    movl -68(%esp), %edi   # load new closure to %edi
    add $-60, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $60, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -60(%esp)  # arg ((primitive-ref string->symbol) replace)
    movl -52(%esp), %edi   # load new closure to %edi
    add $-44, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $44, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -44(%esp)  # arg ((primitive-ref open-output-file) stst.tmp ((primitive-ref string->symbol) replace))
    movl -36(%esp), %edi   # load new closure to %edi
    add $-28, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $28, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-expr (begin ((vector-ref f8069 0) 0 ((primitive-ref open-input-file) "stst.tmp")))
# emit-begin
#   expr=(begin ((vector-ref f8069 0) 0 ((primitive-ref open-input-file) "stst.tmp")))
#   env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# emit-expr ((vector-ref f8069 0) 0 ((primitive-ref open-input-file) "stst.tmp"))
# funcall
#    si   =-28
#    env  = ((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
#    expr = (funcall (vector-ref f8069 0) 0 ((primitive-ref open-input-file) "stst.tmp"))
# emit-expr (vector-ref f8069 0)
# emit-expr f8069
# emit-variable-ref
# env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# var=f8069
    movl -24(%esp), %eax  # stack load f8069
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_48883
# invoke error handler eh_vector
    .extern mrc_eh$uvector
    movl mrc_eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48883:
    movl %eax, -36(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_48884"
# error handler eh_fixnum
    .extern mrc_eh$ufixnum
    movl mrc_eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_48884:
# check bounds on vector index
    movl -36(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_48886
    cmp  $0,%eax
    jge _L_48885
_L_48886:
# invoke error handler eh_vector_index
    .extern mrc_eh$uvector$uindex
    movl mrc_eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_48885:
    movl -36(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_48887"
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_48887":
   movl %eax,  -36(%esp)  # stash funcall-oper in closure slot
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -40(%esp)  # arg 0
# emit-expr ((primitive-ref open-input-file) "stst.tmp")
# funcall
#    si   =-44
#    env  = ((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
#    expr = (funcall (primitive-ref open-input-file) "stst.tmp")
# emit-expr (primitive-ref open-input-file)
    .extern mrc_open$minput$mfile
    movl mrc_open$minput$mfile,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_48888"
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_48888":
   movl %eax,  -52(%esp)  # stash funcall-oper in closure slot
# emit-expr "stst.tmp"
# string literal
    jmp _L_48890
    .align 8,0x90
_L_48889 :
    .int 32
    .ascii "stst.tmp"
_L_48890:
    movl $_L_48889, %eax
    orl $6, %eax
    mov %eax, -56(%esp)  # arg stst.tmp
    movl -52(%esp), %edi   # load new closure to %edi
    add $-44, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $44, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -44(%esp)  # arg ((primitive-ref open-input-file) stst.tmp)
    movl -36(%esp), %edi   # load new closure to %edi
    add $-28, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $28, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f8069 . -24) (f8070 . -20) (f8071 . -16) (f8048 . -12) (f8049 . -8))
    ret
    .text
    .align 16, 0x90
    .globl _scheme_entry
_scheme_entry:
    movl 4(%esp), %ecx
    movl %ebx, 4(%ecx)
    movl %esi, 16(%ecx)
    movl %edi, 20(%ecx)
    movl %ebp, 24(%ecx)
    movl %esp, 28(%ecx)
    movl 12(%esp), %ebp
    movl 8(%esp), %esp
    call _L_scheme_entry
    movl 4(%ecx), %ebx
    movl 16(%ecx), %esi
    movl 20(%ecx), %edi
    movl 24(%ecx), %ebp
    movl 28(%ecx), %esp
    ret
