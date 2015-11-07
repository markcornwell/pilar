
(add-tests-with-string-output "square"
  [(begin (define a8 #o70) a8) => "56\n"]
  [(begin (define NSQ #o100) a8) => "64\n"]
  [(begin
     (define a8 #o70)
     (define (isSquare x)
       (and (fx<= a1 x) (fx<= x h8)))
     (isSquare a8)) => "#t\n"]
  [(begin
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

