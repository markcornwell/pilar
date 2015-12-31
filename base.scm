;;-------------------
;;  Symbol libary
;;-------------------

;; To read:     (with-input-from-file "symbol.scm" (lambda () (read))
;; To compile:  (with-input-from-file "symbol.scm" (lambda () (emit-labels 0 '() (read))))
;; (with-output-to-file "symbol.s" (lambda () (with-input-from-file "symbol.scm" (lambda () (emit-labels 0 '() (read))))))

;; To compile this file (run-compil-lib)   ;; see tests-driver.scm

(labels
 ([symbols
   (let ([interned-symbols (cons (make-symbol "nil" ()) ())])
     (lambda () interned-symbols))]
  [string->symbol
   (letrec
       ([$slen= (lambda (s1 s2)
		  (fx= (string-length s1)
		       (string-length s2)))]
	
	[$si=  (lambda (s1 s2 i)
		 (char=? (string-ref s1 i)
			 (string-ref s2 i)))]
	
	[$si<n= (lambda (s1 s2 i n)
		  (if (fx= i n)
		      #t
		      (if ($si= s1 s2 i)
			  ($si<n= s1 s2 (fx+ i 1) n)
			  #f)))]
	
	[$ss= (lambda (s1 s2)
		(if ($slen= s1 s2)
		    ($si<n= s1 s2 0 (string-length s1))
		    #f))]

	[$str->sym1  (lambda (str symlist)   ;; assume symlist is never empty
		       (if ($ss= str (symbol->string (car symlist)))
			   (car symlist)
			   (if (null? (cdr symlist))
			       (let* ([new-sym (make-symbol str #f)]
				      [new-cdr (cons new-sym ())])
				 (begin
				   (set-cdr! symlist new-cdr)
				   new-sym))
			       ($str->sym1 str (cdr symlist)))))])
     
     (lambda (str)
       ($str->sym1 str (symbols))))]))
   

