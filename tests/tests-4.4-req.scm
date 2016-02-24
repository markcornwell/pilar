
(add-tests-with-string-output "begin/implicit-begin"
 [(begin 12) => "12\n"]
 [(begin 13 122) => "122\n"]
 [(begin 123 2343 #t) => "#t\n"]
 [(cond [#t 'able 'baker 'charlie 'dog]) => "dog\n"]

 
  [(cond [#f 1 2 3] [#t 4 5 6 42]) => "42\n"]
  [(let ([a 14]) (fx+ a a) (fx- a a)) => "0\n"]
  [(let* ([a 14] [b (fx+ a 1)]) a b) => "15\n"]
  [(letrec ([a 20][b (fx+ a 1)]) a b) => "21\n"]
 ; [(letrec ([b (fx+ a 1)] [a 40]) a b (fx+ b 1)) => "42\n"]    ;; should not work
  [(when #t 39 40 41 42) => "42\n"]
  [(unless #f 42 43 44 45) => "45\n"]
  [((lambda (x) 46 47 48) 42) => "48\n"]

  [(let ([t (begin 12 (cons 1 2))]) (begin t t)) => "(1 . 2)\n"]
  [(let ([t (begin 13 (cons 1 2))])
     (cons 1 t)
     t) => "(1 . 2)\n"]
  [(let ([t (cons 1 2)])
     (if (pair? t) 
	 (begin t)
	 12)) => "(1 . 2)\n"]

  [(let ([n 2])
    (let ([v0 (make-string n)])
     (let ([v1 (make-string n)])
       (string-set! v0 0 #\a)
       (string-set! v0 1 #\b)
       (string-set! v1 0 #\c)
       (string-set! v1 1 #\d)
       (cons v0 v1)))) => "(\"ab\" . \"cd\")\n"]

  [(let ([n 3])
    (let ([v0 (make-string n)])
     (let ([v1 (make-string (string-length v0))])
       (string-length v1)))) =>  "3\n"]

  [(let ([n 3])
    (let ([v0 (make-string n)])
     (let ([v1 (make-string (string-length v0))])
       (string-length v0)))) =>  "3\n"]

  [(let ([v0 (make-string 3)])
     (begin
       (string-set! v0 0 #\a)
       #\f)) =>  "#\\f\n"]        

  
  [(let ([v0 (make-string 3)])
       (string-set! v0 (fx- (string-length v0) 3) #\a)
       #\d) =>  "#\\d\n"] 


   [(let ([v0 (make-string 3)])
       (string-set! v0 (fx- (string-length v0) 3) #\a)
       #\d) =>  "#\\d\n"]    

  [(let ([n 3])
    (let ([v0 (make-string n)])
       (string-set! v0 (fx- (string-length v0) 3) #\a)
       #\c)) =>  "#\\c\n"]                  
  
  [(let ([n 3])
    (let ([v0 (make-string n)])
     (let ([v1 (make-string (string-length v0))])
       (string-set! v0 (fx- (string-length v0) 3) #\a)
       #\b))) =>  "#\\b\n"]                    ;; ??
  
  
  [(let ([n 3])
    (let ([v0 (make-string n)])
     (let ([v1 (make-string (string-length v0))])
       (string-set! v0 (fx- (string-length v0) 3) #\a)
       (string-ref v0 0)))) =>  "#\\a\n"] 
  
  [(let ([n 3])
    (let ([v0 (make-string n)])
     (let ([v1 (make-string (string-length v0))])
       (string-set! v0 (fx- (string-length v0) 3) #\a)
       (string-set! v0 (fx- (string-length v1) 2) #\b)
       (string-set! v0 (fx- (string-length v0) 1) #\c)
       (string-set! v1 (fx- (string-length v1) 3) #\Z)
       (string-set! v1 (fx- (string-length v0) 2) #\Y)
       (string-set! v1 (fx- (string-length v1) 1) #\X)
       (cons v0 v1)))) =>  "(\"abc\" . \"ZYX\")\n"]  
)

