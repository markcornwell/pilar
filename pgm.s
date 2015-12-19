# (letrec () 12)
# == eliminate-multi-element-body  ==>
# (letrec () 12)
# == eliminate-let*  ==>
# (letrec () 12)
# == eliminate-variable-name-shadowing  ==>
# (letrec () 12)
# == vectorize-letrec  ==>
# (let () (begin (begin) 12))
# == eliminate-set!  ==>
# (let () (begin (begin) 12))
# == close-free-variables  ==>
# (let () (begin (begin) 12))
# == eliminate-quote  ==>
# (let () (begin (begin) 12))
# == eliminate-when/unless  ==>
# (let () (begin (begin) 12))
# == expand-cond  ==>
# let
    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
# emit-expr
