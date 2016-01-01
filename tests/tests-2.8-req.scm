
(add-tests-with-string-output "symbols list"
 [(symbols) => "(nil)\n"]
 [(make-symbol "foo" "baz") => "foo\n"]
 [(symbol? (make-symbol "foo" "bar")) => "#t\n"]
 [(symbol->string (make-symbol "foo" "bar")) => "\"foo\"\n"]
 [(symbol-value (make-symbol "foo" "bar")) => "\"bar\"\n"]

 [(letrec ((s= (lambda (s1 i s2 j)     
		 (let ([l1 (string-length s1)]
		       [l2 (string-length s2)])
		   (if (not (fx= l1 l2))
		       #f
		       (if (fx= i l1)
			   #t
			   (if (char=? (string-ref s1 i)
				       (string-ref s2 j))
			       (s= s1 (fx+ i 1) s2 (fx+ j 1))
			       #f)))))))
    (s= "foo" 0 "foo" 0)) => "#t\n"]
 
 [(letrec ([s= (lambda (s1 i s2 j)    
		 (let ([l1 (string-length s1)]
		       [l2 (string-length s2)])
		 (if (not (fx= l1 l2))
		     #f
		     (if (fx= i l1)
			 #t
			 (if (char=? (string-ref s1 i)
				     (string-ref s2 j))
			     (s= s1 (fx+ i 1) s2 (fx+ j 1))
			     #f)))))]
	   [ss= (lambda (s1 s2) (s= s1 0 s2 0))])
    (ss= "foo" "foo")) => "#t\n"]

 [(letrec ([s= (lambda (s1 i s2 j)     
		 (let ([l1 (string-length s1)]
		       [l2 (string-length s2)])
		 (if (not (fx= l1 l2))
		     #f
		     (if (fx= i l1)
			 #t
			 (if (char=? (string-ref s1 i)
				     (string-ref s2 j))
			     (s= s1 (fx+ i 1) s2 (fx+ j 1))
			     #f)))))]
	   [ss= (lambda (s1 s2) (s= s1 0 s2 0))])
    (ss= "foo" "fo")) => "#f\n"]

 [(letrec ([s= (lambda (s1 i s2 j)  
		 (let ([l1 (string-length s1)]
		       [l2 (string-length s2)])
		 (if (not (fx= l1 l2))
		     #f
		     (if (fx= i l1)
			 #t
			 (if (char=? (string-ref s1 i)
				     (string-ref s2 j))
			     (s= s1 (fx+ i 1) s2 (fx+ j 1))
			     #f)))))]
	   [ss= (lambda (s1 s2) (s= s1 0 s2 0))])
    (ss= "" "")) => "#t\n"]

  [(letrec ([s= (lambda (s1 i s2 j)
		 (let ([l1 (string-length s1)]
		       [l2 (string-length s2)])
		 (if (not (fx= l1 l2))
		     #f
		     (if (fx= i l1)
			 #t
			 (if (char=? (string-ref s1 i)
				     (string-ref s2 j))
			     (s= s1 (fx+ i 1) s2 (fx+ j 1))
			     #f)))))]
	   [ss= (lambda (s1 s2) (s= s1 0 s2 0))])
     (ss= "" "fubar")) => "#f\n"]

  [(letrec ([s= (lambda (s1 i s2 j)
		  (let ([l1 (string-length s1)]
			[l2 (string-length s2)])
		    (if (not (fx= l1 l2))
			#f
			(if (fx= i l1)
			    #t
			    (if (char=? (string-ref s1 i)
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


    [(letrec
     ([s= (lambda (s1 i s2 j) 
	    (let ([l1 (string-length s1)]
		  [l2 (string-length s2)])
	      (if (not (fx= l1 l2))
		  #f
		  (if (fx= i l1)
		      #t
		      (if (char=? (string-ref s1 i)
				  (string-ref s2 j))
			  (s= s1 (fx+ i 1) s2 (fx+ j 1))
			  #f)))))]
      [ss= (lambda (s1 s2) (s= s1 0 s2 0))]
      [s2sym1 (lambda (str symlist)   ;; assumed symlist is never empty
		(if (ss= str (symbol->string (car symlist)))
		    (car symlist)
		    (if (null? (cdr symlist))
			(let ([new-sym (make-symbol str #f)])
			  (begin
			    (set-cdr! symlist (cons new-sym ()))
			    new-sym))
			(s2sym1 str (cdr symlist)))))]
      [s2sym (lambda (str) (s2sym1 str (symbols)))])
     (s2sym "baz")) => "baz\n"]

    [(letrec
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
			   (si<n s1 s2 (fx+ i 1) n)
		           #f)))]
	  
	  [ss= (lambda (s1 s2)
		 (if (slen= s1 s2)
		     (si<n s1 s2 0 (length s1))
		     #f))]

	  [str->sym1 (lambda (str symlist)   ;; assumed symlist is never empty
		    (if (ss= str (symbol->string (car symlist)))
			(car symlist)
			(if (null? (cdr symlist))
			    (let ([new-sym (make-symbol str #f)])
			      (begin
				(set-cdr! symlist (cons new-sym ()))
				new-sym))
			    (str->sym1 str (cdr symlist)))))]
	  
	  [str->sym (lambda (str) (str->sym1 str (symbols)))])
       
       (begin (str->sym "fu"))) => "fu\n"]

    [(let ([a (cons #t ())]
	   [b (cons #f ())])
       (set-cdr! a b)
       a) => "(#t #f)\n"]
    
    [(let ([a (cons #t ())]
	   [b (cons #f ())]
	   [c (cons 42 ())])
       (set-cdr! a b)
       (set-cdr! b c)	   
       a) => "(#t #f 42)\n"]    
    
    [(letrec
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
			   (si<n s1 s2 (fx+ i 1) n)
		           #f)))]
	  
	  [ss= (lambda (s1 s2)
		 (if (slen= s1 s2)
		     (si<n s1 s2 0 (length s1))
		     #f))]

	  [str->sym1  (lambda (str symlist)   ;; assumed symlist is never empty
			(if (ss= str (symbol->string (car symlist)))
			    (car symlist)
			    (if (null? (cdr symlist))
				(let* ([new-sym (make-symbol str #f)]
                                       [new-cdr (cons new-sym ())])
				  (begin
				    (set-cdr! symlist new-cdr)
				    new-sym))
				(str->sym1 str (cdr symlist)))))]
	  
	  [str->sym (lambda (str)
		      (str->sym1 str (symbols)))])    
       (begin
	 (str->sym "fu")
	 (symbols))) => "(nil fu)\n"]


    [(letrec
	 ([$slen= (lambda (s1 s2)
		    (fx= (string-length s1)
			 (string-length s2)))]
	  
	  [$si=  (lambda (s1 s2 i)
		   (char=? (string-ref s1 i)
			   (string-ref s2 i)))])

       ($si= "flip" "flop" 0)) => "#t\n"]

     [(letrec
	 ([$slen= (lambda (s1 s2)
		    (fx= (string-length s1)
			 (string-length s2)))]
	  
	  [$si=  (lambda (s1 s2 i)
		   (char=? (string-ref s1 i)
			   (string-ref s2 i)))])

       (cons ($si= "flip" "flop" 0) ())) => "(#t)\n"]   

     [(letrec
	 ([$slen= (lambda (s1 s2)
		    (fx= (string-length s1)
			 (string-length s2)))]
	  
	  [$si=  (lambda (s1 s2 i)
		   (char=? (string-ref s1 i)
			   (string-ref s2 i)))])

	(cons ($si= "flip" "flop" 0)
	      (cons ($si= "flip" "flop" 1) ()))) => "(#t #t)\n"]   


     [(letrec
	 ([$slen= (lambda (s1 s2)
		    (fx= (string-length s1)
			 (string-length s2)))]
	  
	  [$si=  (lambda (s1 s2 i)
		   (char=? (string-ref s1 i)
			   (string-ref s2 i)))])

	(cons ($si= "flip" "flop" 0)
	      (cons ($si= "flip" "flop" 1)
		    (cons ($si= "flip" "flop" 2) ())))) => "(#t #t #f)\n"]

     [(letrec
	 ([$slen= (lambda (s1 s2)
		    (fx= (string-length s1)
			 (string-length s2)))]
	  
	  [$si=  (lambda (s1 s2 i)
		   (char=? (string-ref s1 i)
			   (string-ref s2 i)))])

	(cons ($si= "flip" "flop" 0)
	      (cons ($si= "flip" "flop" 1)
		    (cons ($si= "flip" "flop" 2)
			  (cons ($si= "flip" "flop" 3) ()))))) => "(#t #t #f #t)\n"]

     [(letrec
	 ([$slen= (lambda (s1 s2)
		    (fx= (string-length s1)
			 (string-length s2)))]
	  
	  [$si=  (lambda (s1 s2 i)
		   (char=? (string-ref s1 i)
			   (string-ref s2 i)))]
          [$diff (lambda (s1 s2 i)
		   (if (fx= i (string-length s1))
		       #f
		       (if ($si= s1 s2 i)
			   ($diff s1 s2 (fx+ i 1))
			   #t)))])
	($diff "wah" "wah" 0)) => "#f\n"] 


     [(letrec
	 ([$slen= (lambda (s1 s2)
		    (fx= (string-length s1)
			 (string-length s2)))]
	  
	  [$si=  (lambda (s1 s2 i)
		   (char=? (string-ref s1 i)
			   (string-ref s2 i)))]
          [$diff (lambda (s1 s2 i)
		   (if (fx= i (string-length s1))
		       #f
		       (if ($si= s1 s2 i)
			   ($diff s1 s2 (fx+ i 1))
			   #t)))])
	(cons ($diff "wah" "wah" 0)
	      (cons ($diff "cornwell" "cornwall") ()))) => "(#f #t)\n"] 


     [(letrec	  
	  ([$m (lambda (s1 s2 i)
		  (if (fx= i (string-length s1))
		      ()
		      (cons (char=? (string-ref s1 i)
				    (string-ref s2 i))
			    ($m s1 s2 (fx+ i 1)))))])
	
	 ($m "yo" "yi" 0)) => "(#t #f)\n"]  
     

     [(letrec	  
	  ([$m (lambda (s1 s2 i)
		  (if (fx= i (string-length s1))
		      ()
		      (cons (char=? (string-ref s1 i)
				    (string-ref s2 i))
			    ($m s1 s2 (fx+ i 1)))))])
	
	 ($m "yobargomdoop" "yibargompood" 0)) => "(#t #f #t #t #t #t #t #t #f #t #t #f)\n"]

     [(letrec	  
	  ([$m (lambda (s1 s2 i)
		  (if (fx= i (string-length s1))
		      ()
		      (cons (char=? (string-ref s1 i)
				    (string-ref s2 i))
			    ($m s1 s2 (fx+ i 1)))))])
	
	 ($m "yo" "yi" 0)) => "(#t #f)\n"]   
     

     [(letrec	  
	 ([$si=  (lambda (s1 s2 i)
		   (char=? (string-ref s1 i)
			   (string-ref s2 i)))]

	  [$m (lambda (s1 s2 i)
		  (if (fx= i (string-length s1))
		      ()
		      (cons (make-symbol "foo" #f) ;; 
			    ($m s1 s2 (fx+ i 1)))))])
	
	 ($m "hj" "anything" 0)) => "(foo foo)\n"] 

     [(let
	  (($si= (make-vector 1))
	   ($m (make-vector 1)))
	(begin
	  (begin
	    (vector-set! $si=
			 0
			 (closure (s1 s2 i) ()
				    (char=? (string-ref s1 i)
					    (string-ref s2 i))))
	    (vector-set! $m
			 0
			 (closure (s1 s2 i) ($si= $m)
				    (if (fx= i (string-length s1))
					()
					(cons ((vector-ref $si= 0) s1 s2 i)
					      ((vector-ref $m 0)
					       s1
					       s2
					       (fx+ i 1)))))))
	  (funcall (vector-ref $m 0) "fi" "fo" 0))) => "(#t #f)\n"]
     
     [(letrec	  
	 ([$si=  (lambda (s1 s2 i)
		   (char=? (string-ref s1 i)
			   (string-ref s2 i)))]

	  [$m (lambda (s1 s2 i)
		  (if (fx= i (string-length s1))
		      ()
		      (cons ($si= s1 s2 i)
			    ($m s1 s2 (fx+ i 1)))))])
	
	 ($m "he" "ho" 0)) => "(#t #f)\n"]   
     

     [(letrec
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
			     #f)))])
	($si<n= "hi" "ho" 0 1)) => "#t\n"]
	  

     [(let
	  (($si= (make-vector 1))
	   ($si<n= (make-vector 1))
	   ($ss= (make-vector 1)))
	(begin
	  (begin
	    (vector-set! $si=
			 0
			 (closure (s1 s2 i) ()
				  (let ((s1 s1) (s2 s2) (i i))
				    (char=? (string-ref s1 i)
					    (string-ref s2 i)))))
	    (vector-set! $si<n=
			 0
			 (closure (s1 s2 i n) ($si= $si<n=)
				  (let ((s1 s1) (s2 s2) (i i) (n n))
				    (if (fx= i n)
					#t
					(if ((vector-ref $si= 0) s1 s2 i)
					    ((vector-ref $si<n= 0) s1 s2 (fx+ i 1) n)
					    #f)))))
	    (vector-set! $ss=
			 0
			 (closure (s1 s2) (dummy $si<n= length) ;;; This is the difference
				  (let ((s1 s1) (s2 s2))
				    (if (fx= (string-length s1)
					     (string-length s2))
					((vector-ref $si<n= 0)
					 s1
					 s2
					 0
					 (string-length s1))
					#f)))))
	  ((vector-ref $ss= 0) "mello" "mello"))) => "#t\n"]


     [(let
	 (($si= (make-vector 1))
	  ($si<n= (make-vector 1))
	  ($ss= (make-vector 1)))
       (begin
	 (begin
	   (vector-set! $si=
			0
			(closure (s1 s2 i) ()
				 (let ((s1 s1) (s2 s2) (i i))
				   (char=? (string-ref s1 i) (string-ref s2 i)))))
	   (vector-set! $si<n=
			0
			(closure (s1 s2 i n) ($si= $si<n=)
				 (let ((s1 s1) (s2 s2) (i i) (n n))
				   (if (fx= i n)
				       #t
				       (if ((vector-ref $si= 0) s1 s2 i)
					   ((vector-ref $si<n= 0) s1 s2 (fx+ i 1) n)
					   #f)))))
	   (vector-set! $ss=
			0
			(closure (s1 s2) (dummy $si<n=)  ;;; putting one dummy fields at front of closure fixes it
				 (let ((s1 s1) (s2 s2))
				   (if (fx= (string-length s1)
					    (string-length s2))
				       ((vector-ref $si<n= 0)
					s1
					s2
					0
					(string-length s1))
				       #f)))))
	 ((vector-ref $ss= 0) "leffo" "leffo"))) => "#t\n"]    



     [(let
	 (($si= (make-vector 1))
	  ($si<n= (make-vector 1))
	  ($ss= (make-vector 1)))
       (begin
	 (begin
	   (vector-set! $si=
			0
			(closure (s1 s2 i) ()
				 (let ((s1 s1) (s2 s2) (i i))
				   (char=? (string-ref s1 i) (string-ref s2 i)))))
	   (vector-set! $si<n=
			0
			(closure (s1 s2 i n) ($si= $si<n=)
				 (let ((s1 s1) (s2 s2) (i i) (n n))
				   (if (fx= i n)
				       #t
				       (if ((vector-ref $si= 0) s1 s2 i)
					   ((vector-ref $si<n= 0) s1 s2 (fx+ i 1) n)
					   #f)))))
	   (vector-set! $ss=
			0
			(closure (s1 s2) (dummy $si<n=) ;; dummy field in closure
				 (let ((s1 s1) (s2 s2))
				   (if (fx= (string-length s1)
					    (string-length s2))
				       ((vector-ref $si<n= 0)
					s1
					s2
					0
					(string-length s1))
				       #f)))))
	 (cons ((vector-ref $ss= 0) "leffo" "leffo")
	       (cons ((vector-ref $ss= 0) "mark cornwell" "mark cornwell")
		     (cons ((vector-ref $ss= 0) "little pink car" "little pink cat") ())))))=> "(#t #t #f)\n"]   

    [(let
	 (($si= (make-vector 1))
	  ($si<n= (make-vector 1))
	  ($ss= (make-vector 1)))
       (begin
	 (begin
	   (vector-set! $si=
			0
			(closure (s1 s2 i) ()
				 (let ((s1 s1) (s2 s2) (i i))
				   (char=? (string-ref s1 i) (string-ref s2 i)))))
	   (vector-set! $si<n=
			0
			(closure (s1 s2 i n) ($si= $si<n=)
				 (let ((s1 s1) (s2 s2) (i i) (n n))
				   (if (fx= i n)
				       #t
				       (if ((vector-ref $si= 0) s1 s2 i)
					   ((vector-ref $si<n= 0) s1 s2 (fx+ i 1) n)
					   #f)))))
	   (vector-set! $ss=
			0
			(closure (s1 s2) ($si<n=) 
				 (let ((s1 s1) (s2 s2))
				   (if (fx= (string-length s1)
					    (string-length s2))
				       ((vector-ref $si<n= 0)
					s1
					s2
					0
					(string-length s1))
				       #f)))))
	 ((vector-ref $ss= 0) "feddo" "feddo"))) => "#t\n"]

     
    [(letrec
	 ([$si=  (lambda (s1 s2 i)
		  (char=? (string-ref s1 i)
			  (string-ref s2 i)))]

	  [$si<n= (lambda (s1 s2 i n)
		   (if (fx= i n)
		       #t
		       (if ($si= s1 s2 i)
			   ($si<n= s1 s2 (fx+ i 1) n)
		           #f)))]

	  [$ss= (lambda (s1 s2)
		 (if (fx= (string-length s1) (string-length s2))
		     ($si<n= s1 s2 0 (string-length s1))
		     #f))])

         ($ss= "yello" "yello")) => "#t\n"]

    [(letrec
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
		     #f))])

         ($ss= "hello" "hello")) => "#t\n"]

    [(letrec
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
				($str->sym1 str (cdr symlist)))))]
	  
	  [$str->sym (lambda (str)
		      ($str->sym1 str (symbols)))])    
       (begin
	 ($str->sym "yellow")
	 ($str->sym "fellow")
	 ($str->sym "")
	 ($str->sym "fu")
	 ($str->sym "baz")				      
	 )) => "baz\n"]     

    [(string=? "foo" "foo") => "#t\n"]
    [(string=? "foo" "baz") => "#f\n"]
    [(string=? "foo" "fo")  =>  "#f\n"]
    [(string=? "foo" "for") => "#f\n"]
    [(string=? "" "for")    => "#f\n"] 
    [(string=? "foo" "")    => "#f\n"]
    [(string=? "" "")       => "#t\n"]
 )

(add-tests-with-string-output "symbols"
 [(string->symbol "foo") => "foo\n"]
 [(symbol? 'foo) => "#t\n"]
 [(symbol? '()) => "#f\n"]
 [(symbol? "") => "#f\n"]
 [(symbol? '(1 2)) => "#f\n"]
;; [(symbol? '#()) => "#f\n"]              ;; <<---- vector constants not implemented yet
 [(symbol? (lambda (x) x)) => "#f\n"]
 [(symbol? 'foo) => "#t\n"]
 [(string? 'foo) => "#f\n"]
 [(pair? 'foo) => "#f\n"]
 [(vector? 'foo) => "#f\n"]
 [(null? 'foo) => "#f\n"]
 [(boolean? 'foo) => "#f\n"]
 [(procedure? 'foo) => "#f\n"]
 
 [(eq? (string->symbol "foo") #t) => "#f\n"]
 [(eq? #t (string->symbol "bar")) => "#f\n"]
 [(begin (string->symbol "foo")) => "foo\n"]

 [(string->symbol "nil") => "nil\n"]
 
 [(let ([a (string->symbol "nil")]
	[b (string->symbol "nil")])
    (eq? a b)) => "#t\n"]
 
 [(let ([a (string->symbol "nil")]
	[b (string->symbol "foo")])
    (eq? a b)) => "#f\n"]

 [(let ([a (string->symbol "nil")]
	[b (string->symbol "nil")]
	[c (string->symbol "nil")]
	[d (string->symbol "nil")]
	[e (string->symbol "nil")])
    #t) => "#t\n"]

 [(let ([a (string->symbol "nil")]
	[b (string->symbol "fuu")]
	[c (string->symbol "nil")]
	[d (string->symbol "nil")]
	[e (string->symbol "nil")])
    #t) => "#t\n"]

 [(let ([a (string->symbol "nil")]
	[b (string->symbol "fuu")]
	[c (string->symbol "nil")]
	[d (string->symbol "nil")]
	[e (string->symbol "buu")]) 
    #t) => "#t\n"]
 
 [(let ([a (string->symbol "ha")]  
	[b (string->symbol "ha")]
	[c (string->symbol "ha")]
	[d (string->symbol "ha")]
	[e (string->symbol "ha")])
    #t) => "#t\n"]

 [(let ([a (string->symbol "goo")]  
	[b (string->symbol "ber")])
    #t) => "#t\n"] 
 
 [(let ([a (string->symbol "nil")]
	[b (string->symbol "foo")]
	[c (string->symbol "baz")])  
    #t) => "#t\n"] 

 [(let ([a (string->symbol "nil")]  
	[b (string->symbol "foo")]
	[c (string->symbol "baz")])
    (symbols)) => "(nil foo baz)\n"] 
 
 [(begin (string->symbol "foo") (string->symbol "foo") 42) => "42\n"] 
 
 [(begin (string->symbol "foo") (string->symbol "foo")) => "foo\n"]
 [(begin (string->symbol "foo") (string->symbol "bar")) => "bar\n"]
 [(eq? (string->symbol "foo") (string->symbol "bar")) => "#f\n"]    
 
 [(eq? 'foo 'bar) => "#f\n"]
 [(eq? 'foo 'foo) => "#t\n"]
 ['foo => "foo\n"]
 ['(foo bar baz) => "(foo bar baz)\n"]
 ['(foo foo foo foo foo foo foo foo foo foo foo) 
  => "(foo foo foo foo foo foo foo foo foo foo foo)\n"]
)

