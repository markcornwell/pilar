;;--------------------------------------------------------------------------------------
;;                              Base Runtime Library
;;--------------------------------------------------------------------------------------
;; This file is written in pilar scheme.  Instead of using petite scheme we use pilar
;; compile this file into a assembly that we later will assemble and link as part of
;; the compiled program.  Parts of the compiler itself us this library for basic
;; capabilties such as managing symbols as runtime objects and managing error handling.
;; Also core library functions are implemented here such string=? and list-ref.
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
;;     (lambda ()
;;         (with-input-from-file "symbol.scm"
;;                               (lambda () (emit-labels 0 '() (read))))))
;; To compile this file (run-compil-lib)   ;; see tests-driver.scm
;;-------------------------------------------------------------------------------------

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

;;----------------------------------------------------------------------------------
;;                                      Lists
;;----------------------------------------------------------------------------------

  [append1
   (lambda (lst elt)
     (if (null? lst)
	 (cons e nil)
	 (cons (car lst) (append1 (cdr lst) elt))))]

  [list-ref
   (lambda (l k)
     (if (fx= k 0)
	 (car l)
	 (list-ref (cdr l) (fx- k 1))))]

  [list-length
   (lambda (l)
     (if (null? l)
	 0
	 (fxadd1 (list-length (cdr l)))))]

;;----------------------------------------------------------------------------------
;;                                     Vectors
;;----------------------------------------------------------------------------------

  [vector
   (letrec
       ([fill-vector
  	 (lambda (v k args)
  	   (if (null? args)
  	       v
  	       (begin
  		 (vector-set! v k (car args))
  		 (fill-vector v (fxadd1 k) (cdr args)))))])	
     (lambda args
       (let ([v (make-vector (list-length args))])
  	   (fill-vector v 0 args))))]

;;----------------------------------------------------------------------------------
;;                                     Strings
;;----------------------------------------------------------------------------------

  [string
   (letrec
       ([fill-string
  	 (lambda (s k args)
  	   (if (null? args)
  	       s
  	       (begin
  		 (string-set! s k (car args))
  		 (fill-string s (fxadd1 k) (cdr args)))))])	
     (lambda args
       (let ([s (make-string (list-length args))])
  	   (fill-string s 0 args))))]
  
;;----------------------------------------------------------------------------------
;;                         Handlers for Runtime Errors
;;----------------------------------------------------------------------------------

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

  ;;--------------------------------------------------------------------------------------
  ;; auto enerated by (generate-primitives)  TBD: Automate incorporation of generated code
  ;;--------------------------------------------------------------------------------------
  ;; The error handlers identify the primitives reporting the error by passing the ordinal
  ;; position in this list of primitives.  That way we can report the function name in the
  ;; error message making the message much more informative.
  ;; (See "Error Checking for Safe Primitives" in compil.scm)
  ;;--------------------------------------------------------------------------------------
  
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
 ;;  (set! p (cons 'vector p))    ;; replace by library proc
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
     (set! p (cons 'fxremainder p)) ; new
     (set! p (cons 'fxquotient p)) ;; new     
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
  
  [eh_procedure    (lambda ()    (error 'funcall "arg 1 must be a procedure"))]
  [eh_argcount     (lambda ()    (error 'funcall "wrong number of args"))]
  [eh_argcount_min (lambda ()    (error 'funcall "too few args"))]
 ;[eh_argcount     (lambda ()    (error 'lambda "wrong number of args"))]  ;; lambda confuses pilar  
  [eh_fixnum       (lambda (i)   (error (list-ref (primitives) i)  "arg must be a fixnum"))]
  [eh_string       (lambda (i)   (error (list-ref (primitives) i)  "arg must be a string"))]
  [eh_character    (lambda (i)   (error (list-ref (primitives) i)  "arg must be a character"))]
  [eh_pair         (lambda (i)   (error (list-ref (primitives) i)  "arg must be a pair"))]
  [eh_vector       (lambda (i)   (error (list-ref (primitives) i)  "arg must be a vector"))]
  [eh_length       (lambda (i)   (error (list-ref (primitives) i)  "length must be a fixnum >= 0"))]
  [eh_vector_index (lambda (i)   (error (list-ref (primitives) i)  "index out of bounds"))]
  [eh_string_index (lambda (i)   (error (list-ref (primitives) i)  "index out of bounds"))]


;;----------------------------------------------------------------------------------------
;;                                      Output Ports
;;----------------------------------------------------------------------------------------
;; The functionality provided by our compiler so far allows us to implement output ports
;; easily in Scheme. We represent output ports by vector containing the following fields:
;;
;; 0. A unique identifier that allows us to distinguish output ports from ordinary vectors.
;; 1. A string denoting the file name associated with the port.
;; 2. A file-descriptor associated with the opened file.
;; 3. A string that serves as an output buffer.
;; 4. An index pointing to the next position in the buffer.
;; 5. The size of the buffer.
;;
;; The current-output-port is initialized at startup and its file descriptor is 1 on Unix
;; systems. The buffers are chosen to be sufficiently large (4096 characters) in order to
;; reduce the number of trips to the operating system. The procedure write-char writes
;; to the buffer, increments the index, and if the index of the port reaches its size, the
;; contents of the buffer are flushed using s write (from 3.15) and the index is reset.
;; The procedures output-port?, open-output-file, close-output-port, and flush-output-port
;; are also implemented. (Ghuloum 2006)
;;----------------------------------------------------------------------------------------  

  [standard-out
   (let ([p (make-vector 6)]
	 [sz 10])           ;; We represent output ports by vector containing the following fields:
        (vector-set! p 0 'output-port)  ;; 0. A unique identifier to distinguish output ports from ordinary vectors
        (vector-set! p 1 "/dev/stdout") ;; 1. A string denoting the file name associated with the port.
        (vector-set! p 2 1)             ;; 2. A file-descriptor associated with the opened file.
        (vector-set! p 3 (make-string sz)) ;; 3. A string that serves as an output buffer.
        (vector-set! p 4 0)             ;; 4. An index pointing to the next position in the buffer.
        (vector-set! p 5 sz)            ;; 5. The size of the buffer.      
        (lambda () p))]

  [current-output-port
   (let ([current-out (standard-out)])
     (lambda () current-out))]

  [port-fd        (lambda (p) (vector-ref p 2))]
  [port-buf       (lambda (p) (vector-ref p 3))]
  [port-ndx       (lambda (p) (vector-ref p 4))]
  [port-ndx-add1  (lambda (p) (vector-set! p 4 (fxadd1 (vector-ref p 4))))]
  [port-ndx-reset (lambda (p) (vector-set! p 4 0))]
  [port-size      (lambda (p) (vector-ref p 5))]
  
  [write-char 
   (lambda (ch)
     (let ([p (current-output-port)])
       (when (fx= (port-ndx p) (port-size p))
             (flush-output-port p))
       (string-set! (port-buf p) (port-ndx p) ch)
       (port-ndx-add1 p)))]
   
   [flush-output-port
    (lambda (p)
      (foreign-call "s_write" (port-fd p) (port-buf p) (port-ndx p))
      (port-ndx-reset p))]

   [exit (lambda () (foreign-call "s_exit"))]
 
   [output-port?  (lambda (x) (error 'output-port? "not yet implemented"))]
   [open-output-file (lambda (x) (error 'open-output "not yet implemented"))]
   [close-output-port (lambda (x) (error 'close-output-port "not yet implemented"))])

   
 (begin #t)) ; end labels
 

