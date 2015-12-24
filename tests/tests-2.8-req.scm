
(add-tests-with-string-output "symbols list"
 [(symbols) => "(nil)\n"]
 [(make-symbol "foo" "baz") => "foo\n"]
 [(symbol? (make-symbol "foo" "bar")) => "#t\n"]
 [(symbol->string (make-symbol "foo" "bar")) => "\"foo\"\n"]
 [(symbol-value (make-symbol "foo" "bar")) => "\"bar\"\n"]
 
 [(let ((symlist (symbols)))
    (cond
     [(string=? str (symbol->string (car (symlist))))
      (car symlist)]
     [(null? (cdr symlist))
      (set-cdr! symlist (make-symbol "foo" '()))] ;; should be #<void> not '()
     [else (f str (cdr symlist))])) => "foo\n"]
 
 [(letrec ([f (lambda (str symlist)
		(cond
		 [(string=? str (symbol->string (car symlist)))
		  (car symlist)]
		 [(null? (cdr symlist))
		  (set-cdr! symlist (make-symbol str '()))] ;; should be #<void> not '()
		 [else (f str (cdr symlist))]))])
      (make-symbol "intern" (lambda (s) (f s (symbols))))) => "intern\n"]
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
