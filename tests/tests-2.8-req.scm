
(add-tests-with-string-output "symbols list"
 [(symbols) => "(nil)\n"]
 [(make-symbol "foo" "baz") => "foo\n"]
 [(symbol? (make-symbol "foo" "bar")) => "#t\n"]
 [(symbol->string (make-symbol "foo" "bar")) => "\"foo\"\n"]
 [(symbol-value (make-symbol "foo" "bar")) => "\"bar\"\n"]
		    
 [(letrec ((s= (lambda (s1 i s2 j)         ;; This WORKS !!!
		 (let ([l1 (string-length s1)]
		       [l2 (string-length s2)])
		 (if (not (fx= l1 l2))
		     #f
		     (if (fx= i l1)
			 #t
			 (if (fx= (string-ref s1 i)
				  (string-ref s2 j))
			     (s= s1 (fx+ i 1) s2 (fx+ j 1))
			     #f)))))))
    (s= "foo" 0 "foo" 0)) => "#t\n"]

 [(letrec ([s= (lambda (s1 i s2 j)          ;; This WORKS !!!
		 (let ([l1 (string-length s1)]
		       [l2 (string-length s2)])
		 (if (not (fx= l1 l2))
		     #f
		     (if (fx= i l1)
			 #t
			 (if (fx= (string-ref s1 i)
				  (string-ref s2 j))
			     (s= s1 (fx+ i 1) s2 (fx+ j 1))
			     #f)))))]
	   [ss= (lambda (s1 s2) (s= s1 0 s2 0))])
    (ss= "foo" "foo")) => "#t\n"]

 [(letrec ([s= (lambda (s1 i s2 j)          ;; This WORKS !!!
		 (let ([l1 (string-length s1)]
		       [l2 (string-length s2)])
		 (if (not (fx= l1 l2))
		     #f
		     (if (fx= i l1)
			 #t
			 (if (fx= (string-ref s1 i)
				  (string-ref s2 j))
			     (s= s1 (fx+ i 1) s2 (fx+ j 1))
			     #f)))))]
	   [ss= (lambda (s1 s2) (s= s1 0 s2 0))])
    (ss= "foo" "fo")) => "#f\n"]

 [(letrec ([s= (lambda (s1 i s2 j)          ;; This WORKS !!!
		 (let ([l1 (string-length s1)]
		       [l2 (string-length s2)])
		 (if (not (fx= l1 l2))
		     #f
		     (if (fx= i l1)
			 #t
			 (if (fx= (string-ref s1 i)
				  (string-ref s2 j))
			     (s= s1 (fx+ i 1) s2 (fx+ j 1))
			     #f)))))]
	   [ss= (lambda (s1 s2) (s= s1 0 s2 0))])
    (ss= "" "")) => "#t\n"]

  [(letrec ([s= (lambda (s1 i s2 j)          ;; This WORKS !!!
		 (let ([l1 (string-length s1)]
		       [l2 (string-length s2)])
		 (if (not (fx= l1 l2))
		     #f
		     (if (fx= i l1)
			 #t
			 (if (fx= (string-ref s1 i)
				  (string-ref s2 j))
			     (s= s1 (fx+ i 1) s2 (fx+ j 1))
			     #f)))))]
	   [ss= (lambda (s1 s2) (s= s1 0 s2 0))])
     (ss= "" "fubar")) => "#f\n"]

    [(letrec ([s= (lambda (s1 i s2 j)          ;; This version fixes some bugs in the prior test
		 (let ([l1 (string-length s1)]
		       [l2 (string-length s2)])
		 (if (not (fx= l1 l2))
		     #f
		     (if (fx= i l1)
			 #t
			 (if (fx= (string-ref s1 i)
				  (string-ref s2 j))
			     (s= s1 (fx+ i 1) s2 (fx+ j 1))
			     #f)))))]
	      [ss= (lambda (s1 s2) (s= s1 0 s2 0))]
	      [s2sym1 (lambda (str symlist)
			(if (ss= str (symbol->string (car symlist)))
			    (car symlist)
			    (if (null? (cdr symlist))
				(begin
				  (set-cdr! symlist (cons (make-symbol str #f) ()))
				  (car (cdr symlist)))
				(s2sym1 str (cdr symlist)))))]
	      [s2sym (lambda (str) (s2sym1 str (symbols)))])    ;; this does a string->symbol
			    
    (s2sym "fubar")) => "fubar\n"]  ;; we could emit s2sym as part of init and build a closure
 
 ;; [(string=? "foo" "foo") => "#t\n"]
 ;; [(string=? "foo" "baz") => "#f\n"]
 ;; [(string=? "foo" "fo")  =>  "#f\n"]
 ;; [(string=? "foo" "for") => "#f\n"]
 ;; [(string=? "" "for")    => "#f\n"] 
 ;; [(string=? "foo" "")    => "#f\n"]
 ;; [(string=? "" "")       => "#t\n"]
 
 )

(add-tests-with-string-output "symbols"
 [(symbol? 'foo) => "#t\n"]
 [(symbol? '()) => "#f\n"]
 [(symbol? "") => "#f\n"]
 [(symbol? '(1 2)) => "#f\n"]
 [(symbol? '#()) => "#f\n"]
 [(symbol? (lambda (x) x)) => "#f\n"]
 [(symbol? 'foo) => "#t\n"]
 [(string? 'foo) => "#f\n"]
 [(pair? 'foo) => "#f\n"]
 [(vector? 'foo) => "#f\n"]
 [(null? 'foo) => "#f\n"]
 [(boolean? 'foo) => "#f\n"]
 [(procedure? 'foo) => "#f\n"]
 [(eq? 'foo 'bar) => "#f\n"]
 [(eq? 'foo 'foo) => "#t\n"]
 ['foo => "foo\n"]
 ['(foo bar baz) => "(foo bar baz)\n"]
 ['(foo foo foo foo foo foo foo foo foo foo foo) 
  => "(foo foo foo foo foo foo foo foo foo foo foo)\n"]
)
