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
;; Where the car of each node will hold a symbol.  We initialize our list with a symbol
;; whose print name is "nil".
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
;;            +-----+--+--+--+
;;            |  3  |n | i| l|
;;            +-----+--+--+--+ 
;;
;; Important to note that the type tags are encoded in the pointers.  So we have to
;; correct for the tags when turning them into addresses, usually by subtracting the
;; tag value from the pointer.
;;-------------------------------------------------------------------------------------
;;
;; To read:   (with-input-from-file "symbol.scm" (lambda () (read))
;; To compil: (with-input-from-file "symbol.scm" (lambda () (emit-labels 0 '() (read))))
;;
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
	 (cons elt nil)
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

  [reverse
   (letrec ([f (lambda (l lrev)
		 (if (null? l)
		     lrev
		     (f (cdr l) (cons (car l) lrev))))])
     (lambda (l) (f l '())))]

  [list
   (lambda args args)]   ;; so cool!
	 

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

  [string->list
   (letrec
       ([f (lambda (s i)
	     (if (fx= i (string-length s))
		 '()
		 (cons (string-ref s i)
		       (f s (fxadd1 i)))))])
     (lambda (s) (f s 0)))]

  [integer->list  ;; assume i>0
   (letrec
       ([f (lambda (i l)
	     (cond
	      [(fx< i 10) (cons i l)]
	      [else
	       (f (fxquotient i 10)
		  (cons (fxremainder i 10) l))]))])
     (lambda (i) (f i '())))]


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
  ;; Auto generated by (generate-primitives)  TBD: Automate incorporation of generated code
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
     (set! p (cons 'eof-object p))
     (set! p (cons 'eof-object? p))
     (set! p (cons 'null? p))
     (set! p (cons 'char->fixnum p))
     (set! p (cons 'fixnum->char p))
     (lambda () p))]
  
  [eh_procedure    (lambda ()    (error 'funcall "arg 1 must be a procedure"))]
  [eh_argcount     (lambda ()    (error 'funcall "wrong number of args"))]
  [eh_argcount_min (lambda ()    (error 'funcall "too few args"))]
 ;[eh_argcount     (lambda ()    (error 'lambda "wrong number of args"))]  ;; lambda symbol confuses pilar  
  [eh_fixnum       (lambda (i)   (error (list-ref (primitives) i)  "arg must be a fixnum"))]
  [eh_string       (lambda (i)   (error (list-ref (primitives) i)  "arg must be a string"))]
  [eh_character    (lambda (i)   (error (list-ref (primitives) i)  "arg must be a character"))]
  [eh_pair         (lambda (i)   (error (list-ref (primitives) i)  "arg must be a pair"))]
  [eh_vector       (lambda (i)   (error (list-ref (primitives) i)  "arg must be a vector"))]
  [eh_length       (lambda (i)   (error (list-ref (primitives) i)  "length must be a fixnum >= 0"))]
  [eh_vector_index (lambda (i)   (error (list-ref (primitives) i)  "index out of bounds"))]
  [eh_string_index (lambda (i)   (error (list-ref (primitives) i)  "index out of bounds"))]

;;----------------------------------------------------------------------------------------
;;                                    Numerical Operations
;;----------------------------------------------------------------------------------------

  [zero? (lambda (z) (fxzero? z))]
  [positive? (lambda (x) (fx> x 0))]
  [negative? (lambda (x) (fx< x 0))]
  [even? (lambda (x) (fxzero? (fxremainder x 2)))]    ;; TBD optimize as bit twiddling
  [odd? (lambda (x) (not (even? x)))]

;;----------------------------------------------------------------------------------------
;;                                     Map and for-each
;;----------------------------------------------------------------------------------------
;;  (map proc list1 list2 ...)
;;  (for-each proc list1 list2 ...)
;;
  
  [map (lambda (f l)    ;; special case of map   TBD generalize to more arglists
	  (if (null? l)
	      (quote ())
	      (cons (f (car l)) (map f (cdr l)))))]

  [for-each (lambda (f l)   ;; TBD  generalize later
	       (unless (null? l)
		  (begin
		    (f (car l))
		    (for-each f (cdr l)))))]

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
  	 [sz 1024])                     ;; We represent output ports by vector containing
                                        ;; the following fields:
        (vector-set! p 0 'output-port)  ;; 0. A unique identifier to distinguish output ports from ordinary vectors
        (vector-set! p 1 "/dev/stdout") ;; 1. A string denoting the file name associated with the port.
        (vector-set! p 2 1)             ;; 2. A file-descriptor associated with the opened file.
        (vector-set! p 3 (make-string sz)) ;; 3. A string that serves as an output buffer.
        (vector-set! p 4 0)             ;; 4. An index pointing to the next position in the buffer.
        (vector-set! p 5 sz)            ;; 5. The size of the buffer.      
        p)]

  [current-output-port
   (let ([current-out standard-out])
     (lambda () current-out))]

  [current-input-port
   (let ([current-in standard-in])
     (lambda () current-in))]

  [port-kind      (lambda (p) (vector-ref p 0))]
  [port-path      (lambda (p) (vector-ref p 1))]
  [port-fd        (lambda (p) (vector-ref p 2))]
  [port-buf       (lambda (p) (vector-ref p 3))]
  [port-ndx       (lambda (p) (vector-ref p 4))]
  [port-ndx-add1  (lambda (p) (vector-set! p 4 (fxadd1 (vector-ref p 4))))]
  [port-ndx-reset (lambda (p) (vector-set! p 4 0))]
  [port-size      (lambda (p) (vector-ref p 5))]

  
  ;;----------------------------------------------------------------------------------------
  ;; (write-char char)                                    procedure
  ;; (write-char char port)                               procedure
  ;;
  ;; Writes the character char (not an external representation of the character) to the
  ;; given port and returns an unspecified value. The port argument may be omit- ted, in
  ;; which case it defaults to the value returned by current-output-port.
  ;;----------------------------------------------------------------------------------------

  [write-char 
   (lambda (ch . args)
     (let ([p (if (null? args)
		  (current-output-port)
		  (car args))])
       (begin
	 (when  (fx= (port-ndx p) (port-size p)) (flush-output-port p))
	 (string-set! (port-buf p) (port-ndx p) ch)
	 (port-ndx-add1 p))))]
   
   [flush-output-port  ;; TBD  add error checking
    (lambda args
      (let ([p (if (null? args)
		   (current-output-port)
		   (car args))])
	(begin   ;; TBD investigate why this begin is needed.  early pass should have inserted it for us.
	  (foreign-call "s_write" (port-fd p) (port-buf p) (port-ndx p))
	  (port-ndx-reset p))))]

   [exit
    (lambda ()
      (begin
        (flush-output-port) ;; should be flush all output ports  TBD
	(foreign-call "s_exit")))]


   ;;---------------------------------------------------------------------------------------- 
   ;; (open-output-file filename)                        procedure
   ;;
   ;; Takes a string naming an output file to be created and returns an output port capable
   ;; of writing cracters to a new file by that name. If the file cannot be opened, an error
   ;; is signalled. If a file with the given name already exists, the effect is unspecified.
   ;;----------------------------------------------------------------------------------------

   [open-output-file
    (lambda (filename)
      (begin
   	(unless (string? filename)
   		(error 'open-output-file "filename must be a string"))
   	(let ([fd (foreign-call "s_open" filename)])  ;; TBD Check if open succeeded
   	  (begin
   	    (when (negative? fd) (error 'open-output-file "open failed"))
   	    (let ([p (make-vector 6)]
   		  [sz 1024])                     ;; We represent output ports by vector containing the following fields:
   	      (begin
   		(vector-set! p 0 'output-port)     ;; 0. A unique id to distinguish output ports from ordinary vectors
   		(vector-set! p 1 filename)         ;; 1. A string denoting the file name associated with the port.
   		(vector-set! p 2 fd)               ;; 2. A file-descriptor associated with the opened file.
   		(vector-set! p 3 (make-string sz)) ;; 3. A string that serves as an output buffer.
   		(vector-set! p 4 0)                ;; 4. An index pointing to the next position in the buffer.
   		(vector-set! p 5 sz)               ;; 5. The size of the buffer.      
   		p))))))]
    
   ;;---------------------------------------------------------------------------------------- 
   ;; (close-input-port port)                              procedure
   ;; (close-output-port port)                             procedure
   ;;
   ;; Closes the file associated with port, rendering the port incapable of delivering or
   ;; accepting characters. These routines have no effect if the file has already been
   ;; closed. The value returned is unspecified.
   ;;---------------------------------------------------------------------------------------- 

   [close-input-port
    (lambda (p)
      ;;  TBD - free the port resources ???
      (foreign-call "s_close" (port-fd p)))]

   
   [close-output-port
    (lambda (p)
      (flush-output-port p)
      (foreign-call "s_close" (port-fd p)))]

   ;;---------------------------------------------------------------------------------------- 
   ;; 3.20 Write and Display
   ;;---------------------------------------------------------------------------------------- 
   ;; Once write-char is implemented, implementing the procedures write and display becomes
   ;; straightforward by dispatching on the type of the argument. The two procedures are
   ;; identical except for their treatment of strings and characters and therefore can be
   ;; implemented in terms of one common procedure. In order to write the fixnums, the
   ;; primitive quotient must be added to the compiler.
   ;;
   ;; Implementing write in Scheme allows us to eliminate the now- redundant writer that we
   ;; implemented as part of the C run-time system.
   ;;
   ;; (Ghuloup 2006)
   ;;----------------------------------------------------------------------------------------    
   
   [base-write
    (letrec
   	([print-boolean
   	  (lambda (expr p)
   	    (begin
   	      (write-char #\# p)
   	      (if expr (write-char #\t p) (write-char #\f p))))]
   	 [print-null
   	  (lambda (p)
   	    (begin (write-char #\( p) (write-char #\) p)))]
   	 [print-char
   	  (lambda (expr p)
   	    (begin (write-char #\# p) (write-char #\\ p) (write-char expr p)))]
   	 [print-fixnum
   	  (lambda (i p)
   	    (if (negative? i)
   		(begin (write-char #\- p) (print-fixnum (fx* -1 i) p))
   		(map (lambda (x)
   			(write-char (fixnum->char (fx+ (char->fixnum #\0) x)) p))
   		      (integer->list i))))]
   	 [print-string
   	  (lambda (s p)
   	    (write-char #\" p)
   	    (for-each (lambda (c) (write-char c p)) (string->list s))   ;; TBD Optimize
   	    (write-char #\" p))]
   	 [print-string-alpha
   	  (lambda (s p)
   	    (for-each (lambda (c) (write-char c p)) (string->list s)))]  ;; TBD Optimize
   	 [print-pair
   	  (lambda (pr p)
   	    (begin
   	      (write-char #\( p)
   	      (print-pairs pr p)
   	      (write-char #\) p)))]
   	 [print-pairs
   	  (lambda (pr p)
   	    (write (car pr) p)
   	    (cond
   	     [(null? (cdr pr)) #t]
   	     [(pair? (cdr pr))
   	      (begin
   	 	(write-char #\space p)
   	 	(print-pairs (cdr pr) p))]
   	     [else
   	      (begin
   	 	(write-char #\space p)
   	 	(write-char #\. p)
   	 	(write-char #\space p)
   	 	(write (cdr pr) p))]))]
	 )
	 
   	 (lambda (expr p alpha)
   	   (cond
   	    [(boolean? expr) (print-boolean expr p)]
   	    [(null? expr) (print-null p)]
   	    [(char? expr) (if alpha
                              (write-char expr p)
   			      (print-char expr p))]
   	    [(fixnum? expr) (print-fixnum expr p)]
   	    [(string? expr) (if alpha
   				(print-string-alpha expr p)
   				(print-string expr p))]
   	    [(pair? expr) (print-pair expr p)]
   	    [else (error 'write "unrecognized expression")] )))]

   ;;---------------------------------------------------------------------------------------- 
   ;;  (write obj )                                        library procedure
   ;;  (write obj port)                                    library procedure
   ;;
   ;; Writes a written representation of obj to the given port. Strings that appear in the
   ;; written representation are enclosed in doublequotes, and within those strings
   ;; backslash and doublequote characters are escaped by backslashes. Character objects are
   ;; written using the #\ notation. Write returns an unspecified value. The port argument
   ;; may be omitted, in which case it defaults to the value returned by current-output-port. 
   ;;----------------------------------------------------------------------------------------

   [write
    (lambda (expr . args)
      (let ([p (if (null? args)
		   (current-output-port)
		   (car args))])
	(base-write expr p #f)))]

   ;;----------------------------------------------------------------------------------------
   ;; (display obj)                                       library procedure
   ;; (display obj port)                                  library procedure
   ;;
   ;; Writes a representation of obj to the given port. Strings that appear in the written
   ;; representation are not enclosed in doublequotes, and no characters are escaped within
   ;; those strings. Character objects appear in the representation as if written by
   ;; write-char instead of by write. Display returns an unspecified value. The port argument
   ;; may be omitted, in which case it defaults to the value returned by current-output-port.
   ;;
   ;; Rationale: Write is intended for producing machine-readable output and display is for
   ;; producing human-readable output. Implementations that allow “slashification” within
   ;; symbols will probably want write but not display to slashify funny characters in symbols.
   ;;----------------------------------------------------------------------------------------

   [display
    (lambda (expr . args)
      (let ([p (if (null? args)
		   (current-output-port)
		   (car args))])
      (base-write expr p #t)))]
   
   [integer->char
    (lambda (i) (fixnum->char i))]

   ;;---------------------------------------------------------------------------------------- 
   ;; 3.21 Input Ports
   ;;---------------------------------------------------------------------------------------- 
   ;; The representation of input ports is very similar to output ports. The only difference
   ;; is that we add one extra field to support “unreading” a character which adds very
   ;; minor overhead to the primitives read-char and peek-char, but greatly simplifies the
   ;; implementation of the tokenizer (next step). The primitives added at this stage are
   ;; input-port?, open-input-file, read-char, unread-char, peek-char, and eof-object? (by
   ;; adding a special end-of-file object that is similar to the empty-list). (Ghuloum 2006)
   ;;---------------------------------------------------------------------------------------- 

   [standard-in
    (let* ([p (make-vector 8)]
	   [sz 1024])    
      (begin                               ;; We represent input ports by vector containing the following fields:
   	(vector-set! p 0 'input-port)      ;; 0. A unique id to distinguish output ports from ordinary vectors
   	(vector-set! p 1 "/dev/stdin")     ;; 1. A string denoting the file name associated with the port.
   	(vector-set! p 2 0)                ;; 2. A file-descriptor associated with the opened file.
   	(vector-set! p 3 (make-string sz)) ;; 3. A string that serves as an output buffer.
   	(vector-set! p 4 0)                ;; 4. An index pointing to the next position in the buffer.
   	(vector-set! p 5 sz)               ;; 5. The size of the buffer.
   	(vector-set! p 6 #f)               ;; 6. unread-char buffer
	(vector-set! p 7 -1)               ;; 7. position after last valid position in the buffer	
   	p))]  
   
   [port-unread        (lambda (p) (vector-ref p 6))]
   [port-unread-clear  (lambda (p) (vector-set! p 6 #f))]
   [port-unread-set!   (lambda (p x) (vector-set! p 6 x))]
   [port-last          (lambda (p) (vector-ref p 7))]
   [port-last-set!     (lambda (p i) (vector-set! p 7 i))]
   
   ;;---------------------------------------------------------------------------------------- 
   ;; (input-port? obj)                                  procedure
   ;; (output-port? obj)                                 procedure
   ;;
   ;; Returns #t if obj is an input port or output port respec- tively, otherwise returns #f.
   ;; (R5RS)
   ;;---------------------------------------------------------------------------------------- 
   
   [input-port?
    (lambda (p)
      (and (vector? p)
	   (and (fx= (vector-length p) 8)
		(eq? (port-kind p) 'input-port))))]

   [output-port?
    (lambda (p)
      (and (vector? p)
	   (and (fx= (vector-length p) 6)
		(eq? (port-kind p) 'output-port))))]

   ;;----------------------------------------------------------------------------------------
   ;; (open-input-file filename)                          procedure
   ;;
   ;; Takes a string naming an existing file and returns an input port capable of delivering
   ;; characters from the file. If the file cannot be opened, an error is signalled. (R5RS)
   ;;----------------------------------------------------------------------------------------
   
   [open-input-file
    (lambda (filename)
      (begin
   	(unless (string? filename)
   		(error 'open-input-file "filename must be a string"))
   	(let ([fd (foreign-call "s_open" filename)])  ;; TBD Check if open succeeded
   	  (begin
   	    (when (negative? fd) (error 'open-input-file "open failed"))
   	    (let ([p (make-vector 8)]
   		  [sz 1024])                      ;; We represent input ports by vector containing the following fields:
   	      (begin
   		(vector-set! p 0 'input-port)     ;; 0. A unique id to distinguish output ports from ordinary vectors
   		(vector-set! p 1 filename)        ;; 1. A string denoting the file name associated with the port.
   		(vector-set! p 2 fd)              ;; 2. A file-descriptor associated with the opened file.
   		(vector-set! p 3 (make-string sz));; 3. A string that serves as an output buffer.
   		(vector-set! p 4 0)               ;; 4. An index pointing to the next position in the buffer.
   		(vector-set! p 5 sz)              ;; 5. The size of the buffer.
   		(vector-set! p 6 #f)              ;; 6. unread-char buffer.
		(vector-set! p 7 0)               ;; 7. position after last valid position in the buffer
   		p))))))]

   ;;----------------------------------------------------------------------------------------
   ;; (read-char)                                        procedure
   ;; (read-char port )                                  procedure
   ;;
   ;; Returns the next character available from the input port, updating the port to point
   ;; to the following character. If no more characters are available, an end of file object
   ;; is returned. Port may be omitted, in which case it defaults to the value returned by
   ;; current-input-port.   (R5RS)
   ;;----------------------------------------------------------------------------------------
   
   [read-char
    (lambda args
      (let ([p (if (null? args)
   		   (current-input-port)
   		   (car args))])
   	(cond
   	 [(port-unread p)
   	  (let ([ch (port-unread p)])
	    (begin
	      (unless (eof-object? (port-unread p))
		      (port-unread-clear p))
	      ch))]
   	 [else   ;; note fill-input-buffer only called when port-unread is #f
   	  (begin
   	    (when (fx= (port-last p) (port-ndx p))
		  (fill-input-buffer p))
	    (if (port-unread p)
		(port-unread p)
		(let ([ch (string-ref (port-buf p) (port-ndx p))])
		  (begin
		    (port-ndx-add1 p)
		    ch))))])))]

   [fill-input-buffer
    (lambda (p)
      (let ([nbytes (foreign-call "s_read" (port-fd p) (port-buf p) (port-size p))])
   	(begin
	  (port-ndx-reset p)
	  (port-last-set! p nbytes)
   	  (when (fxzero? nbytes)
		(port-unread-set! p (eof-object))))))] 
                                     ;;  Need to seriously rethink this
	     
   [unread-char 'TBD]

   ;;----------------------------------------------------------------------------------------  
   ;;  (peek-char)                                       procedure 
   ;;  (peek-char port )                                 procedure
   ;;
   ;; Returns the next character available from the input port, without updating the port
   ;; to point to the following character. If no more characters are available, an end of
   ;; file object is returned. Port may be omitted, in which case it defaults to the value
   ;; returned by current-input-port.
   ;;
   ;; Note: The value returned by a call to peek-char is the same as the value that would
   ;; have been returned by a call to read-char with the same port. The only difference is
   ;; that the very next call to read-char or peek-char on that port will return the value
   ;; returned by the preceding call to peek-char. In particular, a call to peek-char on
   ;; an interactive port will hang waiting for input whenever a call to read-char would
   ;; have hung.  (R5RS)
   ;;---------------------------------------------------------------------------------------- 
   
   ;; [peek-char
   ;;  (lambda args
   ;;    (let ([p (if (null? args)
   ;; 		   (current-input-port)
   ;; 		   (car args))])
   ;; 	(if (port-unread p)
   ;; 	    (port-unread p)
   ;; 	    (begin
   ;; 	      (when (fx= (port-ndx p) (port-size p))
   ;; 		    (fill-input-buffer))	    
   ;; 	      (string-ref (port-buf) (port-ndx))))))]

   ;;----------------------------------------------------------------------------------------  
   ;; (char-ready?)                                      procedure
   ;; (char-ready? port)                                 procedure
   ;;
   ;; Returns #t if a character is ready on the input port and returns #f otherwise. If
   ;; char-ready returns #t then the next read-char operation on the given port is guaranteed
   ;; not to hang. If the port is at end of file then char-ready? returns #t. Port may be
   ;; omitted, in which case it defaults to the value returned by current-input-port.
   ;;
   ;; Rationale: Char-ready? exists to make it possible for a program to accept characters
   ;; from interactive ports without getting stuck waiting for input. Any input editors
   ;; associated with such ports must ensure that characters whose existence has been
   ;; asserted by char-ready? cannot be rubbed out. If char-ready? were to return #f at end
   ;; of file, a port at end of file would be indistinguishable from an interactive port that
   ;; has no ready characters.
   ;;----------------------------------------------------------------------------------------  
   
   ) ;; end labels bindings
 (begin #t)) ; end labels
 

