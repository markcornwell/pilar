
(add-tests-with-string-output "sting literals"
    ["hello" => "\"hello\"\n"]
    ["" => "\"\"\n"]
    ["When in the course of human events..." => "\"When in the course of human events...\"\n"]
    )

(add-tests-with-string-output "simple quote"
    [(quote #t) => "#t\n"]
    [(quote #f) => "#f\n"]
    [(quote #\A) => "#\\A\n"]
    [(quote 4) => "4\n"]
    [(quote -42) => "-42\n"]
    [(quote "hello") => "\"hello\"\n"]
    [(quote "When in the course of human events...") => "\"When in the course of human events...\"\n"]
)

(add-tests-with-string-output "complex constants"
 ['42 => "42\n"]
 ['(1 . 2) => "(1 . 2)\n"]
 ['(1 2 3) => "(1 2 3)\n"]
 [(let ([x '(1 2 3)]) x) => "(1 2 3)\n"]
 [(let ([f (lambda () '(1 2 3))])
   (f)) => "(1 2 3)\n"]
;; [(let ([f (lambda () '(1 2 3))])                       ;; Semantics NOT required by R5RS
;;   (eq? (f) (f))) => "#t\n"]
 [(let ([f (lambda ()
             (lambda () 
               '(1 2 3)))])
   ((f))) => "(1 2 3)\n"]
;; [(let ([x '#(1 2 3)])                                  ;; Vector literals not yet supported
;;    (cons x (vector-ref x 0))) => "(#(1 2 3) . 1)\n"]
  ["Hello World" => "\"Hello World\"\n"]                  
  ['("Hello" "World") => "(\"Hello\" \"World\")\n"] 
)
