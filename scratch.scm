test 170:(letrec () 12) ...Exception in test: output mismatch for test 170, expected "12\n", got "-268435698\n"


(letrec () 12)
# == eliminate-multi-element-body  ==>
(letrec () 12)
# == eliminate-variable-name-shadowing  ==>
(letrec () (begin 12))
# == vectorize-letrec  ==>
(let () (begin) (begin (begin 12)))
# == eliminate-set!  ==>
(let () (begin))
# == close-free-variables  ==>
(let () (begin))
