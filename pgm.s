# (letrec ((f (lambda () 5))) 7)
# == transform-toplevel-defs ==>
# (letrec ((f (lambda () 5))) 7)
# == transform-letrecs-to-lets ==>
# (let ((f #f)) (set! f (lambda () 5)) . 7)
