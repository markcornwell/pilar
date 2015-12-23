(label
 ((str2sym
   (let ((f (make-vector 1)))
     (begin
       (begin
	 (vector-set! f
		      0
		      (closure (str symlist)
			       (string=? symbol->string nil f)  ;; WTF
			       (let ((str str) (symlist symlist)) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (set-cdr! symlist (make-symbol str nil)) ((vector-ref f 0) str (cdr symlist)))))))) (closure (s) (f) (let ((s s)) ((vector-ref f 0) s (symbols)))))))) (make-symbol "string->symbol" (label-ref str2sym)))
