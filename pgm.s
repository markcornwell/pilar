# (cond (1 2) (else 3))
# == eliminate-multi-element-body  ==>
# (cond (1 2) (else 3))
# == eliminate-let*  ==>
# (cond (1 2) (else 3))
# == eliminate-variable-name-shadowing  ==>
# (cond (1 2) (else 3))
# == vectorize-letrec  ==>
# (cond (1 2) (else 3))
# == eliminate-set!  ==>
# (cond (1 2) (else 3))
# == close-free-variables  ==>
# (cond (1 2) (else 3))
# == eliminate-quote  ==>
# (cond (1 2) (else 3))
# == eliminate-when/unless  ==>
# (cond (1 2) (else 3))
    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
# emit-expr
# funcall
#    si   =-8
#    env  = ()
#    expr = (funcall cond (1 2) (else 3))
# emit-expr
