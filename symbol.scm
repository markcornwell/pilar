;;-------------------
;;  Symbol libary
;;-------------------

;; (define (emit-init si env)
;;   (emit "          .data")
;;   (emit "          .globl symbols  # symbol list as a datum ")
;;   (emit "          .globl s2sym")
;;   (emit "          .align 8")
;;   (emit "symbols:")
;;   (emit "          .int 0xFF  # holds (symbols)")
;;   (emit "          .align 8")   ;;  does this really need to be aligned ???
;;   (emit "s2sym:")
;;   (emit "          .int 0xFF  # holds pgm-str-sym")
;;   (emit "          .text")
;;   (emit-expr si env '(cons (make-symbol "nil" ()) ()))  ;; start the symbols list
;;   (emit "    movl %eax, symbols")
;;   (emit-expr si env (apply-transforms expr-str->sym))
;;   (emit "    movl %eax, s2sym")
;;   )


;; (define (labels? expr)
;;   (and (pair? expr) (eq? (car expr) 'labels)))
;; (define labels-bindings second)
;; (define labels-body third)

;; (define (emit-labels si env expr)
;;   (let* ([bindings (labels-bindings expr)]
;; 	 [labels (map first labels-bindings)]
;; 	 [exprs (map second labels-bindings)]
;; 	 [body (labels-body expr)])
;;     (emit "     .data")
;;     (foreach (lambda (l)
;; 	       (emit "     .global ~s" l)
;; 	       (emit "     .align 8")
;; 	       (emit "~a:" l)
;; 	       (emit "     .int 0xFF"))
;; 	     labels)
;;     (emit "     .text")
;;     (emit "     .align 4");
;;     (foreach (lambda (l e)
;; 	       (emit-expr si env (apply-transforms e))
;; 	       (emit "     movl %eax, ~a" l))
;; 	     labels
;; 	     exprs)
;;     (emit-expr si env body))) 

;; To read this file:     (with-input-from-file "symbol.scm" (lambda () (read))
;; To compile this file:  (with-input-from-file "symbol.scm" (lambda () (emit-labels 0 '() (read))))
;; (with-output-to-file "symbol.s" (lambda () (with-input-from-file "symbol.scm" (lambda () (emit-labels 0 '() (read))))))

;; To compile this file (run-compil-lib)   ;; see tests-drive.scm

(labels
 ([symbols
   (cons (make-symbol "nil" ()) ())]
  [s2sym
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
       ($str->sym1 str (symbols))))])
 (begin #t))
   

