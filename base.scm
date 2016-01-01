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

  )
 
 (begin #t))


