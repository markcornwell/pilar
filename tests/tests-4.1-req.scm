(add-tests-with-string-output "remainder/modulo/quotient"
 ; [42 => "42\n"]			      
 ; [#\tab => "#\\tab\n"]
  [(fxquotient 16 4) => "4\n"]
  [(fxquotient 5 2) => "2\n"]
  [(fxquotient -45 7) => "-6\n"]
  [(fxquotient 10 -3) => "-3\n"]
  [(fxquotient -17 -9) => "1\n"]

  [(fxremainder 16 4) => "0\n"]
  [(fxremainder 5 2) => "1\n"]
  [(fxremainder -45 7) => "-3\n"]
  [(fxremainder 10 -3) => "1\n"]
  [(fxremainder -17 -9) => "-8\n"] 

;  [(fxmodulo 16 4) => "0\n"]
;  [(fxmodulo 5 2) => "1\n"]
;  [(fxmodulo -45 7) => "4\n"]
;  [(fxmodulo 10 -3) => "-2\n"]
;  [(fxmodulo -17 -9) => "-8\n"]
)   

(add-tests-with-string-output "write-char"
  [(begin (exit)) => ""]
  [(begin (vector-ref (current-output-port) 0)) => "output-port\n"]
  [(begin (port-size (current-output-port))) => "1024\n"]
  [(begin (port-ndx (current-output-port))) => "0\n"]
  [(begin (port-fd (current-output-port))) => "1\n"]
;  [(begin (port-buf (current-output-port))) => "\"\x0;\x0;\x0;\x0;\x0;\x0;\x0;\x0;\x0;\x0;\"\n"]
  [(begin (flush-output-port (current-output-port)) (exit)) => ""]
  [(begin (write-char #\b) (exit)) => "b"]
  [(eq? standard-out standard-out) => "#t\n"]
  [(let ((p standard-out)) (port-ndx p)) => "0\n"]
  [(let ((p standard-out)) (port-ndx-add1 p) (port-ndx p)) => "1\n"]
  [(let ((p standard-out)) (write-char #\v) (port-ndx p)) => "1\n"]
  [(let ([p (current-output-port)]) (write-char #\w) (port-ndx p)) => "1\n"]
  [(begin (current-output-port) (write-char #\w) (port-ndx (current-output-port))) => "1\n"]  
  [(begin (write-char #\w) (port-ndx (current-output-port))) => "1\n"]
 ; [(begin (write-char #\c) (port-buf (current-output-port))) => "\"c\x0;\x0;\x0;\x0;\x0;\x0;\x0;\x0;\x0;\"\n"]  
  [(begin 
     (write-char #\a)
     (write-char #\b)
     (write-char #\c)
     (write-char #\newline)
    (flush-output-port (current-output-port))
    (exit)) => "abc\n"]
  [(begin 
    (write-char #\a)
    (close-output-port (current-output-port))
    (exit)) => "a"]
  [(begin 
    (write-char #\H)
    (write-char #\e)
    (write-char #\l)
    (write-char #\l)
    (write-char #\o)
    (write-char #\space)
    (flush-output-port)
    (write-char #\W)
    (write-char #\o)
    (write-char #\r)
    (write-char #\l)
    (write-char #\d)
    (write-char #\!)
    (flush-output-port (current-output-port))
    (exit)) => "Hello World!"]
)


(add-tests-with-string-output "write/display"
  [(fx+ -536870911 -1) => "-536870912\n"]
  [(begin (write #\a)(exit)) => "#\\a"]
  [(begin (write #t)(exit)) => "#t"]
  [(begin (write '()) (exit)) => "()"]
  [(integer->char 42) => "#\\*\n"]
  [(string->list "mark") => "(#\\m #\\a #\\r #\\k)\n"]
  [(reverse '(1 2 3)) => "(3 2 1)\n"]  
  [(integer->list 42) => "(4 2)\n"]
  [(reverse '(1 2 3)) => "(3 2 1)\n"]
  [(begin (map write-char '(#\h #\e #\l #\l #\o)) (exit)) => "hello"]
  [(begin (for-each write-char '(#\h #\e #\l #\l #\o)) (exit)) => "hello"]  
  [(begin (write 42) (exit)) => "42"]
  [(begin (write 314159) (exit)) => "314159"]
  [(begin (write -314159) (exit)) => "-314159"]
  [(begin (write 0) (exit)) => "0"]  
  [(begin
     (write '(1 2 3))
     (exit)) => "(1 2 3)"]
  [(begin
     (write '"Hello World!")
     (exit)) => "\"Hello World!\""]

  ;; TBD -- add lots more tests
  
)
