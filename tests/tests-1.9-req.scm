
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
 )

(add-tests-with-string-output "set-car! set-cdr!"
  [(let ([x (cons 1 2)])
     (begin (set-cdr! x ())
            x)) => "(1)\n"]
  [(let ([x (cons 1 2)])
     (set-cdr! x ())
     x) => "(1)\n"]
  [(let ([x (cons 12 13)] [y (cons 14 15)])
     (set-cdr! x y)
     x) => "(12 14 . 15)\n"]
  [(let ([x (cons 12 13)] [y (cons 14 15)])
     (set-cdr! y x)
     y) => "(14 12 . 13)\n"]
  [(let ([x (cons 12 13)] [y (cons 14 15)])
     (set-cdr! y x)
     x) => "(12 . 13)\n"]
  [(let ([x (cons 12 13)] [y (cons 14 15)])
     (set-cdr! x y)
     y) => "(14 . 15)\n"]
  [(let ([x (let ([x (cons 1 2)]) (set-car! x #t) (set-cdr! x #f) x)])
     (cons x x)
     x) => "(#t . #f)\n"]
  [(let ([x (cons 1 2)])
     (set-cdr! x x)
     (set-car! (cdr x) x)
     (cons (eq? x (car x)) (eq? x (cdr x)))) => "(#t . #t)\n"]
 [(let ([x #f])
    (if (pair? x)
        (set-car! x 12)
        #f)
    x) => "#f\n"]
 
 [(let ([x #f])
    (if (pair? #f)
        (set-car! #f 12)
        #f)
    x) => "#f\n"]   ;; was commented out
)


(add-tests-with-string-output "eq?"
  [(eq? 1 1) => "#t\n"]
  [(eq? 1 2) => "#f\n"]
  [(eq? #t 2) => "#f\n"]
  [(eq? #t #t) => "#t\n"]
  [(eq? () ()) => "#t\n"]
  [(eq? (cons 1 2) (cons 1 2)) => "#f\n"]
  [(let [(v (cons 1 2))] (eq? v v)) => "#t\n"]
  )

(add-tests-with-string-output "vectors"
  [(vector? (make-vector 0)) => "#t\n"]
  [(vector-length (make-vector 12)) => "12\n"]
  [(vector? (cons 1 2)) => "#f\n"]
  [(vector? 1287) => "#f\n"]
  [(vector? ()) => "#f\n"]
  [(vector? #t) => "#f\n"]
  [(vector? #f) => "#f\n"]
  [(pair? (make-vector 12)) => "#f\n"]
  [(null? (make-vector 12)) => "#f\n"]
  [(boolean? (make-vector 12)) => "#f\n"]
  [(make-vector 0) => "#()\n"]

  [(let ([v (make-vector 1)])
     (vector-set! v 0 #t)
     v) => "#(#t)\n"]

  [(let ([v (make-vector 2)])
     (vector-set! v 0 #t)
     (vector-set! v 1 #f)
     v) => "#(#t #f)\n"]

  [(let ([v (make-vector 2)])
     (vector-set! v 0 v)
     (vector-set! v 1 v)
     (eq? (vector-ref v 0) (vector-ref v 1))) => "#t\n"]
  
  [(let ([v (make-vector 1)] [y (cons 1 2)])
     (vector-set! v 0 y)
     (eq? y (vector-ref v 0))) => "#t\n"]
  
  [(cons 1 2) => "(1 . 2)\n"]
  
  ;; if the problem is printing lets try not printing
  [(let [(w (let ([v (make-vector 1)] [y (cons 1 2)])
	      (vector-set! v 0 y)
	      (cons y (eq? y 0))))]
     (pair? w)) => "#t\n"]
  
  [(let [(w (let ([v (make-vector 1)] [y (cons 1 2)])
	      (vector-set! v 0 y)
	      (cons y (eq? y 0))))]
     (and (pair? w)
	  (pair? (car w)))) => "#t\n"]
  
  [(let [(w (let ([v (make-vector 1)] [y (cons 1 2)])
	      (vector-set! v 0 y)
	      (cons y (eq? y 0))))]
     (cdr w)) => "#f\n"]
  
   [(let [(w (let ([v (make-vector 1)] [y (cons 96 2)])
	      ;(vector-set! v 0 y)
	      ;(cons y (eq? y 0))
	       y))]
      
      w) => "(96 . 2)\n"]
   [(let [(w (let ([v (make-vector 1)] [y (cons 97 2)])
	      ;(vector-set! v 0 y)
	      (cons y (eq? y 0))
	      y))]
      w) => "(97 . 2)\n"]   ;; ok
   [(let [(w (let ([v (make-vector 1)] [y (cons 97 3)])
	      (vector-set! v 0 y)
	      ;(cons y (eq? y 0))
	      y))]
      w) => "(97 . 3)\n"] 
  [(let [(w (let ([v (make-vector 1)] [y (cons 98 2)])
	      (vector-set! v 0 y)
	      (cons y (eq? y 0))
	      y))]
     w) => "(98 . 2)\n"]   
  [(let [(w (let ([v (make-vector 1)] [y (cons 99 2)])
	      (vector-set! v 0 y)
	      (cons y (eq? y 0))))]
     (car w)) => "(99 . 2)\n"]  
  [(let [(w (let ([v (make-vector 1)] [y (cons 1 2)])
	      (vector-set! v 0 y)
	      (cons y (eq? y 0))))]
	 (eq? (car (car w)) 1)) => "#t\n"] 
  [(let [(w (let ([v (make-vector 1)] [y (cons 1 2)])
	      (vector-set! v 0 y)
	      (cons y (eq? y 0))))]
	 (and (eq? (car (car w)) 1)
	      (eq? (cdr (car w)) 2)
	      (eq? (cdr w) #f))) => "#t\n"] 
  [(let ([v (make-vector 1)] [y (cons 1 2)])
     (vector-set! v 0 y)
     (cons y (eq? y 0))) => "((1 . 2) . #f)\n"]  

  [(let ([v (make-vector 1)] [y (cons 1 2)])
     (vector-set! v 0 y)
     (cons y (eq? y (vector-ref v 0)))) => "((1 . 2) . #t)\n"]

   [(let ([v0 (make-vector 2)])
     (let ([v1 (make-vector 2)])  
       (vector? v1))) => "#t\n"] 
  
   [(let ([v0 (make-vector 2)])
     (let ([v1 (make-vector 2)])   
       (and (vector? v0)
	    (vector? v1)))) => "#t\n"]  
  
  [(let ([v0 (make-vector 2)])
     (let ([v1 (make-vector 2)]) 
       (vector-set! v0 0 100)
       (vector-set! v0 1 200)
       (vector-set! v1 0 300)
       (vector-set! v1 1 400)
       (and (vector? v0)
	    (vector? v1)))) => "#t\n"]  

  [(let ([v0 (make-vector 2)])
     (let ([v1 (make-vector 2)])  
       (vector-set! v0 0 100)
       (vector-set! v0 1 200)
       (vector-set! v1 0 300)
       (vector-set! v1 1 400)
       v0)) => "#(100 200)\n"]

  [(vector-length (make-vector 1)) => "1\n"]
  [(let ([v0 (make-vector 2)])
     (vector-length v0)) => "2\n"]
  [(let ([v0 (make-vector 2)])
     (vector-set! v0 0 100)
     (vector-set! v0 1 200)
     (vector-length v0)) => "2\n"]
  

  [(let ([v0 (make-vector 2)])
     (let ([v1 (make-vector 2)])  
       (vector-set! v0 0 100)
       (vector-set! v0 1 200)
       (vector-set! v1 0 300)
       (vector-set! v1 1 400)
       (vector-length v1))) => "2\n"]

  [(let ([v0 (make-vector 2)])
     (let ([v1 (make-vector 2)])  
       (vector-set! v0 0 100)
       (vector-set! v0 1 200)
       (vector-set! v1 0 300)
       (vector-set! v1 1 400)
       v1)) => "#(300 400)\n"]

  [(let ([v0 (make-vector 2)])
     (let ([v1 (make-vector 2)])  
       (vector-set! v0 0 100)
       (vector-set! v0 1 200)
       (vector-set! v1 0 300)
       (vector-set! v1 1 400)
       (car (cons v0 v1)))) => "#(100 200)\n"]

  [(let ([v0 (make-vector 2)])
     (let ([v1 (make-vector 2)])  
       (vector-set! v0 0 100)
       (vector-set! v0 1 200)
       (vector-set! v1 0 300)
       (vector-set! v1 1 400)
       (cdr (cons v0 v1)))) => "#(300 400)\n"]

  [(let ([v0 (make-vector 2)])
       (vector-set! v0 0 100)
       (vector-set! v0 1 200)
       (cons v0 ())) => "(#(100 200))\n"] 

  [(let ([v0 (make-vector 2)])
       (vector-set! v0 0 100)
       (vector-set! v0 1 200)
       (cons #t v0)) => "(#t . #(100 200))\n"]  
  
  [(let ([v0 (make-vector 2)])
     (let ([v1 (make-vector 2)])  
       (vector-set! v0 0 100)
       (vector-set! v0 1 200)
       (vector-set! v1 0 300)
       (vector-set! v1 1 400)
       (cons v0 v1))) => "(#(100 200) . #(300 400))\n"] 

  [(let ([v0 (make-vector 3)])
     (let ([v1 (make-vector 3)])
       (vector-set! v0 0 100)
       (vector-set! v0 1 200)
       (vector-set! v0 2 150)
       (vector-set! v1 0 300)
       (vector-set! v1 1 400)
       (vector-set! v1 2 350)
       (cons v0 v1))) => "(#(100 200 150) . #(300 400 350))\n"]
  [(let ([n 2])
    (let ([v0 (make-vector n)])
     (let ([v1 (make-vector n)])
       (vector-set! v0 0 100)
       (vector-set! v0 1 200)
       (vector-set! v1 0 300)
       (vector-set! v1 1 400)
       (cons v0 v1)))) => "(#(100 200) . #(300 400))\n"]
  [(let ([n 3])
    (let ([v0 (make-vector n)])
     (let ([v1 (make-vector (vector-length v0))])
       (vector-set! v0 (fx- (vector-length v0) 3) 100)
       (vector-set! v0 (fx- (vector-length v1) 2) 200)
       (vector-set! v0 (fx- (vector-length v0) 1) 150)
       (vector-set! v1 (fx- (vector-length v1) 3) 300)
       (vector-set! v1 (fx- (vector-length v0) 2) 400)
       (vector-set! v1 (fx- (vector-length v1) 1) 350)
       (cons v0 v1)))) => "(#(100 200 150) . #(300 400 350))\n"]
  [(let ([n 1])
     (vector-set! (make-vector n) (fxsub1 n) (fx* n n))
     n) => "1\n"]
  [(let ([n 1])
     (let ([v (make-vector 1)])
       (vector-set! v (fxsub1 n) n)
       (vector-ref v (fxsub1 n)))) => "1\n"]
 [(let ([v0 (make-vector 1)])
    (vector-set! v0 0 1)
    (let ([v1 (make-vector 1)])
      (vector-set! v1 0 13)
      (vector-set! (if (vector? v0) v0 v1) 
           (fxsub1 (vector-length (if (vector? v0) v0 v1)))
           (fxadd1 (vector-ref
                      (if (vector? v0) v0 v1)
                      (fxsub1 (vector-length (if (vector? v0) v0 v1))))))
      (cons v0 v1))) => "(#(2) . #(13))\n"]
)

(add-tests-with-string-output "strings"
  [(make-string 0) => "\"\"\n"]	
  [(string? (make-string 0)) => "#t\n"]
  [(let ([s (make-string 1)]) 
     (string-set! s 0 #\a)
     (string-ref s 0)) => "#\\a\n"]
  [(let ([s (make-string 2)]) 
     (string-set! s 0 #\a)
     (string-set! s 1 #\b)
     (string-ref s 1)) => "#\\b\n"]
  [(let ([s (make-string 3)]) 
     (string-set! s 0 #\a)
     (string-set! s 1 #\b)
     (string-set! s 2 #\c)
     (string-ref s 2)) => "#\\c\n"]
  [(let ([s (make-string 4)]) 
     (string-set! s 0 #\a)
     (string-set! s 1 #\b)
     (string-set! s 2 #\c)
     (string-set! s 3 #\d)
     (string-ref s 3)) => "#\\d\n"]
  [(let ([s (make-string 5)]) 
     (string-set! s 0 #\a)
     (string-set! s 1 #\b)
     (string-set! s 2 #\c)
     (string-set! s 3 #\d)
     (string-set! s 4 #\e)
     (string-ref s 3)) => "#\\d\n"]

  [(cons 1 2) => "(1 . 2)\n"]
  [(cons (make-string 0) ()) => "(\"\")\n"]
  
  [(let ([s (make-string 2)]) 
     (string-set! s 0 #\a)
     (string-set! s 1 #\b)
     (cons (string-ref s 0) (string-ref s 1))) => "(#\\a . #\\b)\n"]  ;; <--- broken
  
  [(let ([i 0])
    (let ([s (make-string 1)]) 
     (string-set! s i #\a)
     (string-ref s i))) => "#\\a\n"]

  [(let ([i 0] [j 1])
    (let ([s (make-string 2)]) 
     (string-set! s i #\a)
     (string-set! s j #\b)
     (string-ref s i))) => "#\\a\n"]
  
  [(let ([i 0] [j 1])
    (let ([s (make-string 2)]) 
     (string-set! s i #\a)
     (string-set! s j #\b)
     (cons (string-ref s i) (string-ref s j)))) => "(#\\a . #\\b)\n"]
 
  [(let ([i 0] [c #\a])
    (let ([s (make-string 1)]) 
     (string-set! s i c)
     (string-ref s i))) => "#\\a\n"] 

  [(string-length (make-string 12)) => "12\n"]
  [(string? (make-vector 12)) => "#f\n"]
  [(string? (cons 1 2)) => "#f\n"]
  [(string? 1287) => "#f\n"]
  [(string? ()) => "#f\n"]
  [(string? #t) => "#f\n"]
  [(string? #f) => "#f\n"]
  [(pair? (make-string 12)) => "#f\n"]
  [(null? (make-string 12)) => "#f\n"]
  [(boolean? (make-string 12)) => "#f\n"]
  [(vector? (make-string 12)) => "#f\n"]
  [(make-string 0) => "\"\"\n"]
  [(let ([v (make-string 2)])
     (string-set! v 0 #\t)
     (string-set! v 1 #\f)
     v) => "\"tf\"\n"]

  [(let ([v (make-string 2)])
     (string-set! v 0 #\x)
     (string-set! v 1 #\x)
     (char=? (string-ref v 0) (string-ref v 1))) => "#t\n"]

  [(let ([v0 (make-string 3)])
     (let ([v1 (make-string 3)])
       (string-set! v0 0 #\a)
       (string-set! v0 1 #\b)
       (string-set! v0 2 #\c)
       (string-set! v1 0 #\d)
       (string-set! v1 1 #\e)
       (string-set! v1 2 #\f)
       (cons v0 v1))) => "(\"abc\" . \"def\")\n"]

  [(let ([n 2])
    (let ([v0 (make-string n)])
     (let ([v1 (make-string n)])
       (string-set! v0 0 #\a)
       (string-set! v0 1 #\b)
       (string-set! v1 0 #\c)
       (string-set! v1 1 #\d)
       (cons v0 v1)))) => "(\"ab\" . \"cd\")\n"]

;; ;;   ISSUE #15 on GITHUB
;;   [(let ([n 3])
;;     (let ([v0 (make-string n)])
;;      (let ([v1 (make-string (string-length v0))])
;;        (string-set! v0 (fx- (string-length v0) 3) #\a)
;;        (string-set! v0 (fx- (string-length v1) 2) #\b)
;;        (string-set! v0 (fx- (string-length v0) 1) #\c)
;;        (string-set! v1 (fx- (string-length v1) 3) #\Z)
;;        (string-set! v1 (fx- (string-length v0) 2) #\Y)
;;        (string-set! v1 (fx- (string-length v1) 1) #\X)
;;        (cons v0 v1)))) =>  "(\"abc\" . \"ZYX\")\n"]      ;; <<--- broken

  [(let ([n 1])
     (string-set! (make-string n) (fxsub1 n) (fixnum->char 34))
     n) => "1\n"]

  [(let ([n 1])
     (let ([v (make-string 1)])
       (string-set! v (fxsub1 n) (fixnum->char n))
       (char->fixnum (string-ref v (fxsub1 n))))) => "1\n"]

 [(let ([v0 (make-string 1)])
    (string-set! v0 0 #\a)
    (let ([v1 (make-string 1)])
      (string-set! v1 0 #\A)
      (string-set! (if (string? v0) v0 v1) 
           (fxsub1 (string-length (if (string? v0) v0 v1)))
           (fixnum->char
             (fxadd1 
                (char->fixnum
                  (string-ref
                     (if (string? v0) v0 v1)
                     (fxsub1 (string-length (if (string? v0) v0 v1))))))))
      (cons v0 v1))) => "(\"b\" . \"A\")\n"]

 [(let ([s (make-string 1)])
     (string-set! s 0 #\")
     s) => "\"\\\"\"\n"]             ;; <<--- broken

 [(let ([s (make-string 1)])
     (string-set! s 0 #\\)
     s) => "\"\\\\\"\n"]             ;; <<--- broken
)

