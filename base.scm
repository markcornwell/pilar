;;--------------------------------------------------------------------------------------
;;
;;
;;
;;--------------------------------------------------------------------------------------
;;                                Symbols libary
;;--------------------------------------------------------------------------------------
;;
;; Here we initialize a list of symbols.  The list is a conventional list of cons nodes
;; Where the car of each node will hold a symbol.
;;
;;            +-----------+
;;   pair --->|  *  | nil | 
;;            +--|--------+
;;               |
;;               V symbol
;;            +-----------+
;;            |  *  | nil |  
;;            +--|--------+         
;;               |
;;               V string
;;            +-----+-----+----+----+
;;            |  3  |  n  |  i |  l |
;;            +-----+-----+----+----+  
;;
;; Important to note that the type tags are encoded in the pointers.  So we have to
;; correct for the tags when turning them into addresses, usually by subtracting the
;; tag value from the pointer.
;;-------------------------------------------------------------------------------------
;;
;; To read:     (with-input-from-file "symbol.scm" (lambda () (read))
;; To compile:  (with-input-from-file "symbol.scm" (lambda () (emit-labels 0 '() (read))))
;; (with-output-to-file "symbol.s"
;;     (lambda () (with-input-from-file "symbol.scm" (lambda () (emit-labels 0 '() (read))))))
;; To compile this file (run-compil-lib)   ;; see tests-driver.scm
;;

(labels
 ([symbols
   (let ([interned-symbols
	  (cons (make-symbol "nil" ()) ())])
     (lambda () interned-symbols))]

  [string=?
   (letrec
       ([slen= (lambda (s1 s2)
		 (fx= (string-length s1)
		      (string-length s2)))]
	
	[si=  (lambda (s1 s2 i)
		(char=? (string-ref s1 i)
			(string-ref s2 i)))]
	
	[si<n= (lambda (s1 s2 i n)
		 (if (fx= i n)
		     #t
		     (if (si= s1 s2 i)
			 (si<n= s1 s2 (fx+ i 1) n)
			 #f)))]
	[ss= (lambda (s1 s2)
		(if (slen= s1 s2)
		    (si<n= s1 s2 0 (string-length s1))
		    #f))])
     ss=)]
  
  [string->symbol
   (letrec
       ([str->sym  (lambda (str symlist)   ;; assume symlist is never empty
		      (if (string=? str (symbol->string (car symlist)))
			  (car symlist)
			  (if (null? (cdr symlist))
			      (let* ([new-sym (make-symbol str #f)]
				     [new-cdr (cons new-sym ())])
				(begin
				  (set-cdr! symlist new-cdr)
				  new-sym))
			      (str->sym str (cdr symlist)))))])
     
     (lambda (str)
       (str->sym str (symbols))))]

  [append1
   (lambda (lst elt)
     (if (null? lst)
	 (cons e nil)
	 (cons (car lst) (append1 (cdr lst) elt))))]

  [list-ref
   (lambda (lst k)
     (if (fx= k 0)
	 (car lst)
	 (list-ref (cdr lst) (fx- k 1))))]

  [error
   (let* ([write-stderr (lambda (s)
			  (foreign-call "s_write" 2 s (string-length s)))]
	  [write-errmsg (lambda (sym emsg)
			  (write-stderr "error:")
			  (write-stderr (symbol->string sym))
			  (write-stderr ": ")
			  (write-stderr emsg)
			  (write-stderr "\n"))])
     (lambda (sym emsg)
       (write-errmsg sym emsg)
       (foreign-call "s_exit" 1)))]

;; auto enerated by (generate-primitives)  TBD: Automate incorporation of generated code
  [primitives
   (let ([p '()])
     (set! p (cons 'procedure? p))
     (set! p (cons 'cdr p))
     (set! p (cons 'car p))
     (set! p (cons 'symbol-value p))
     (set! p (cons 'symbol->string p))
     (set! p (cons 'make-symbol p))
     (set! p (cons 'symbol? p))
     (set! p (cons 'string-set! p))
     (set! p (cons 'string-ref p))
     (set! p (cons 'string-length p))
     (set! p (cons 'string? p))
     (set! p (cons 'make-string p))
     (set! p (cons 'vector p))
     (set! p (cons 'vector-ref p))
     (set! p (cons 'vector-set! p))
     (set! p (cons 'vector-length p))
     (set! p (cons 'make-vector p))
     (set! p (cons 'vector? p))
     (set! p (cons 'set-cdr! p))
     (set! p (cons 'set-car! p))
     (set! p (cons 'cdr p))
     (set! p (cons 'car p))
     (set! p (cons 'cons p))
     (set! p (cons 'pair? p))
     (set! p (cons 'fx* p))
     (set! p (cons 'fx- p))
     (set! p (cons 'fx+ p))
     (set! p (cons 'fx>= p))
     (set! p (cons 'fx> p))
     (set! p (cons 'fx<= p))
     (set! p (cons 'fx< p))
     (set! p (cons 'fx= p))
     (set! p (cons 'fxzero? p))
     (set! p (cons 'fxsub1 p))
     (set! p (cons 'fxadd1 p))
     (set! p (cons 'fxlogor p))
     (set! p (cons 'fxlogand p))
     (set! p (cons 'fxlognot p))
     (set! p (cons 'char=? p))
     (set! p (cons 'eq? p))
     (set! p (cons 'not p))
     (set! p (cons 'boolean? p))
     (set! p (cons 'fixnum? p))
     (set! p (cons 'char? p))
     (set! p (cons 'null? p))
     (set! p (cons 'char->fixnum p))
     (set! p (cons 'fixnum->char p))
     (lambda () p))]
  
  [eh_procedure  (lambda ()  (error 'funcall    "arg 1 must be a procedure"))]
  [eh_fixnum     (lambda (i) (error (list-ref (primitives) i)  "arg must be a fixnum"))]
  [eh_string     (lambda (i) (error (list-ref (primitives) i)  "arg must be a string"))]
  [eh_character  (lambda (i) (error (list-ref (primitives) i)  "arg must be a character"))]
  [eh_argcount   (lambda ()  (error 'funcall "wrong number of args"))]
  [eh_pair       (lambda (i) (error (list-ref (primitives) i)  "arg must be a pair"))]
  [eh_vector     (lambda (i) (error (list-ref (primitives) i)  "arg must be a vector"))]
  [eh_length     (lambda (i) (error (list-ref (primitives) i)  "length must be a fixnum >= 0"))]
 ;; [eh_argcount   (lambda ()  (error 'lambda "wrong number of args"))]  ;; lambda confuses pilar
 ) ; end labels
 
 (begin #t)) 
