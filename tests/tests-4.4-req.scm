
(add-tests-with-string-output "begin/implicit-begin"
 [(begin 12) => "12\n"]
 [(begin 13 122) => "122\n"]
 [(begin 123 2343 #t) => "#t\n"]
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

  [(let ([n 3])
    (let ([v0 (make-string n)])
     (let ([v1 (make-string (string-length v0))])
       (string-set! v0 (fx- (string-length v0) 3) #\a)
       (string-ref v0 0)))) =>  "#\\a\n"]  ;;  <<<-----------<<<<  line 1: 13824 Segmentation fault: 11  ./stst >&stst.out
  

;;   ISSUE #15 on GITHUB
  [(let ([n 3])
    (let ([v0 (make-string n)])
     (let ([v1 (make-string (string-length v0))])
       (string-set! v0 (fx- (string-length v0) 3) #\a)
       (string-set! v0 (fx- (string-length v1) 2) #\b)
       (string-set! v0 (fx- (string-length v0) 1) #\c)
       (string-set! v1 (fx- (string-length v1) 3) #\Z)
       (string-set! v1 (fx- (string-length v0) 2) #\Y)
       (string-set! v1 (fx- (string-length v1) 1) #\X)
       (cons v0 v1)))) =>  "(\"abc\" . \"ZYX\")\n"]      ;; line 1: 13391 Segmentation fault: 11  ./stst >&stst.out

)

