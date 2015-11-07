
(add-tests-with-string-output "define"
  [(let ((a8 #o70)) a8) => "56\n"]
  [(begin (define a8 #o70) a8) => "56\n"]			      
  )


(add-tests-with-string-output "and/or"
  [(and) => "#t\n"]
  [(and 5) => "5\n"]
  [(and #f) => "#f\n"]
  [(and 5 6) => "6\n"]
  [(and #f ((lambda (x) (x x)) (lambda (x) (x x)))) => "#f\n"]
  [(or) => "#f\n"]
  [(or #t) => "#t\n"]
  [(or 5) => "5\n"]
  [(or 1 2 3) => "1\n"]
  [(or (cons 1 2) ((lambda (x) (x x)) (lambda (x) (x x)))) => "(1 . 2)\n"]
  [(let ([if 12]) (or if 17)) => "12\n"]
  [(let ([if 12]) (and if 17)) => "17\n"]
  [(let ([let 8]) (or let 18)) => "8\n"]
  [(let ([let 8]) (and let 18)) => "18\n"]
;  [(let ([t 1])
;     (and (begin (set! t (fxadd1 t)) t) t)) => "2\n"]
;  [(let ([t 1])
;     (or (begin (set! t (fxadd1 t)) t) t)) => "2\n"]
)

(add-tests-with-string-output "square"
  [(begin (define a8 #o70) a8) => "56\n"]
  [(begin (define NSQ #o100) NSQ) => "64\n"]
  [(letrec ([a8 56]
	    [a1 0]
	    [h8 63])
     (and (fx<= a1 a8) (fx<= a8 h8))) => "#t\n"]
  [(letrec ([a8 56]
	    [a1 0]
	    [h8 63]
	    [isSquare (lambda (x) ((and (fx<= a1 x) (fx<= x h8))))])
     (and (fx<= a1 a8) (fx<= a8 h8))) => "#t\n"]
  [(let    ([a8 56]
	    [a1 0]
	    [h8 63]
	    [isSquare (lambda (x) ((and (fx<= a1 x) (fx<= x h8))))])
     (isSquare a8)) => "#t\n"]
  
  [(letrec ([a8 56]
	    [a1 0]
	    [h8 63]
	    [isSquare (lambda (x) ((and (fx<= a1 x) (fx<= x h8))))])
     (isSquare a8)) => "#t\n"]
  [(begin
     (define a8 #o70)
     (define a1 #o00)
     (define h8 #o77)
     (define (isSquare x)
       (and (fx<= a1 x) (fx<= x h8)))
     (isSquare a8)) => "#t\n"]
  [(begin
     (define a1 #o00)
     (define h8 #o77)     
     (define NSQ #o100)
     (define (isSquare x)
       (and (fx<= a1 x) (fx<= x h8)))
     (isSquare NSQ)) => "#f\n"]
  [(begin
     (define NSQ #o100)
     (define (noSquare x) (fx= x NSQ))
     (noSquare NSQ)) => "#t\n"]
  [(begin
     (define a8 #o70)
     (define NSQ #o100)     
     (define (noSquare x) (fx= x NSQ))
     (noSquare a8)) => "#f\n"]
  [(begin
     (define a8 #o70)
     (define (rank sq) (fix:lsh (fix:and sq #o70) -3))
     (rank a8)) => "7\n"]
  [(begin
     (define a8 #o70)
     (define (file sq) (fix:and sq #o07)) 
     (file a8)) => "0\n"]
  [(begin 
     (define (squareAt f r) (fix:+ f (fix:* 8 r)))
     (squareAt 0 7)) => "56\n"]
  [(begin
     (define a8 #o70)
     (define (squareAt f r) (fix:+ f (fix:* 8 r)))
     (eq? (squareAt 0 7) a8)) => "#t\n"]     
  
  ;[(begin (load "square.scm") a1) => "0\n"]
) 
