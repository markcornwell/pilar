
(add-tests-with-string-output "cons"
  [(fxadd1 0) => "1\n"]
  [(pair? 12) => "#f\n"]
  [(pair? #t) => "#f\n"]
  [(pair? #f) => "#f\n"]
  [(pair? ()) => "#f\n"]
  [(cons 1 2) => "(1 . 2)\n"]
  [(pair? (cons 1 2)) => "#t\n"] 
  [(fixnum? (cons 12 43)) => "#f\n"]
  [(boolean? (cons 12 43)) => "#f\n"]
  [(null? (cons 12 43)) => "#f\n"]
  [(not (cons 12 43)) => "#f\n"]
  [(if (cons 12 43) 32 43) => "32\n"]
  [(car (cons 1 23)) => "1\n"]
  [(cdr (cons 43 123)) => "123\n"]
  [(cons #t #f) => "(#t . #f)\n"]
  [(car (cons #t #f)) => "#t\n"]
  [(cons 1 ()) => "(1)\n"]
  [(cons 1 (cons 2 ())) => "(1 2)\n"]
  [(cons (cons 12 3) (cons 45 6)) => "((12 . 3) 45 . 6)\n"]
  [(cons (cons 12 3) (cons #t #f)) => "((12 . 3) #t . #f)\n"]
  [(car (car (cons (cons 12 3) (cons #t #f)))) => "12\n"]
  [(cdr (car (cons (cons 12 3) (cons #t #f)))) => "3\n"]
  [(car (cdr (cons (cons 12 3) (cons #t #f)))) => "#t\n"]
  [(cdr (cdr (cons (cons 12 3) (cons #t #f)))) => "#f\n"]
  [(cons 1 (cons 2 (cons 3 ()))) => "(1 2 3)\n"]
  [(let ([x (let ([y (fx+ 1 2)]) (fx* y y))])
     (cons x (fx+ x x)))
   => "(9 . 18)\n"]
  [(let ([t0 (cons 1 2)] [t1 (cons 3 4)])
     (let ([a0 (car t0)] [a1 (car t1)] [d0 (cdr t0)] [d1 (cdr t1)])
       (let ([t0 (cons a0 d1)] [t1 (cons a1 d0)])
         (cons t0 t1))))
   => "((1 . 4) 3 . 2)\n"]
  [(let ([t (cons 1 2)])
     (let ([t t])
       (let ([t t])
         (let ([t t])
           t))))
   => "(1 . 2)\n"]
  [(let ([t (let ([t (let ([t (let ([t (cons 1 2)]) t)]) t)]) t)]) t)
   => "(1 . 2)\n"]
  [(let ([x ()])
     (let ([x (cons x x)])
       (let ([x (cons x x)])
         (let ([x (cons x x)])
           (cons x x)))))
   => "((((()) ()) (()) ()) ((()) ()) (()) ())\n"]
  [(cons (let ([x #t]) (let ([y (cons x x)]) (cons x y)))
         (cons (let ([x #f]) (let ([y (cons x x)]) (cons y x))) 
               ())) 
   => "((#t #t . #t) ((#f . #f) . #f))\n"]
)

(add-tests-with-string-output "procedures"
  [(letrec () 12) => "12\n"]
  [(letrec () (let ([x 5]) (fx+ x x))) => "10\n"]
  [(letrec ([f (lambda () 5)]) 7) => "7\n"]
  [(letrec ([f (lambda () 5)]) (let ([x 12]) x)) => "12\n"]
  [(letrec ([f (lambda () 5)]) (app f)) => "5\n"]
  [(letrec ([f (lambda () 5)]) (f)) => "5\n"]
  [(letrec ([f (lambda () 5)]) (let ([x (f)]) x)) => "5\n"]
  [(letrec ([f (lambda () 5)]) (fx+ 6 (app f))) => "11\n"] 
  [(letrec ([f (lambda () 5)]) (fx+ (app f) 6)) => "11\n"]
  [(letrec ([f (lambda () 5)]) (fx+ (f) 6)) => "11\n"]
  [(letrec ([f (lambda () 5)]) (fx- 20 (f))) => "15\n"]
  [(letrec ([f (lambda () 5)]) (fx+ (f) (f))) => "10\n"]
  [(letrec ([f (lambda () (fx+ 5 7))]
            [g (lambda () 13)]) 
    (fx+ (f) (g))) => "25\n"]
  [(letrec ([f (lambda (x) (fx+ x 12))]) (f 13)) => "25\n"] 
  [(letrec ([f (lambda (x) (fx+ x 12))]) (f (f 10))) => "34\n"]
  [(letrec ([f (lambda (x) (fx+ x 12))]) (f (f (f 0)))) => "36\n"]

  [(letrec ([f (lambda (x y) (fx+ x y))] 
            [g (lambda (x) (fx+ x 12))]) 
     (f 16 (f (g 0) (fx+ 1 (g 0))))) => "41\n"]
  
  [(letrec ([g (lambda (x y) (fx+ x y))]
	    [f (lambda (x) (g x x))])
     (f 12)) => "24\n"]

  ;; border casese that pose special challenges

   [(letrec ([f (lambda (x) (g x x))]   ;; <<<- Can't close over not-yet-bound g
             [g (lambda (x y) (fx+ x y))])
     (f 12)) => "24\n"]

   ;;-------------------------------------------------------
   ;; But why?  We should already know where the variable g will be allocated.
   ;;
   ;; This will rewrite into IL as
   ;;
   ;;  (letrec ([f (closure (x) (g) (g x x))]
   ;;           [g (closure (x y) () (fx+ x y))])
   ;;    (f 12))
   ;;
   ;; So clearly we can't copy the value of g into the the first closure
   ;; since g will not have a value until we evaluate the second closure.
   ;;
   ;; Can we solve this with rewriting?
   ;;
   ;; Replace g with a vector.  Rewrite letrec as
   ;;

   [(let ([f (make-vector 1)] [g (make-vector 1)])
         (vector-set! f 0 (closure (x) (g) ((vector-ref g 0) x x)))
         (vector-set! g 0 (closure (x y) () (fx+ x y)))
         ((vector-ref f 0) 12)) => "24\n"]
   
   ;; This test passes with our current implementation.  So all we need
   ;; to do now is write up the transform.
   ;;
   ;;-------------------------------------------------------

  ;; try the same tranform again

  [(letrec ([f (lambda (x) 
                 (if (fxzero? x)
                     1
                     (fx* x (f (fxsub1 x)))))])
     (f 5)) => "120\n"]

   ;; rewrites to
  
   [(let ([f (make-vector 1)])
      (vector-set! f 0 (closure (x) (f) (if (fxzero? x)
					   1
					   (fx* x ((vector-ref f 0) (fxsub1 x))))))
      ((vector-ref f 0) 5)) => "120\n"]
   
  ;; OMG!  This rewrite passed the test.  I am on to something!
   
  ;; mutually recursive calls inside a letrec.
  
  [(letrec ([e (lambda (x) (if (fxzero? x) #t (o (fxsub1 x))))]
            [o (lambda (x) (if (fxzero? x) #f (e (fxsub1 x))))])
     (e 25)) => "#f\n"]

   [(let ([e (make-vector 1)] [o (make-vector 1)])
      (vector-set! e 0 (closure (x) (o) (if (fxzero? x) #t ((vector-ref o 0) (fxsub1 x)))))
      (vector-set! o 0 (closure (x) (e) (if (fxzero? x) #f ((vector-ref e 0) (fxsub1 x)))))
      ((vector-ref e 0) 25)) => "#f\n"]

   ;; and this rewrite works as well.
   ;;
   ;; The trick is that we use a unary vector as a holder for values that lets us delay
   ;; the act of referencing the values.  Thus our closure does not copy the value, it copies
   ;; a holder for the value, one that will get filled in before we look in the holder for the
   ;; value.  Sounds complicated when you say it our loud, but it simple if you think about it.
   ;;
)

(add-tests-with-string-output "deeply nested procedures"   ;; requires Proper Tail Calls
#|			      
  [(letrec ([sum (lambda (n ac)
                   (if (fxzero? n)
                        ac
                        (app sum (fxsub1 n) (fx+ n ac))))])
    (app sum 10000 0)) => "50005000\n"]

  [(letrec ([e (lambda (x) (if (fxzero? x) #t (app o (fxsub1 x))))]
            [o (lambda (x) (if (fxzero? x) #f (app e (fxsub1 x))))])
     (app e 5000000)) => "#t\n"]
|#
  )

