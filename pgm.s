# (pair? (primitivies))
# == explicit-begins  ==>
# (pair? (primitivies))
# == eliminate-let*  ==>
# (pair? (primitivies))
# == uniquify-variables  ==>
# (pair? (primitivies))
# == vectorize-letrec  ==>
# (pair? (primitivies))
# == eliminate-set!  ==>
# (pair? (primitivies))
# == close-free-variables  ==>
# (pair? (primitivies))
# == eliminate-quote  ==>
# (pair? (primitivies))
# == eliminate-when/unless  ==>
# (pair? (primitivies))
# == eliminate-cond  ==>
# (pair? (primitivies))
# == external-symbols  ==>
# (pair? (primitivies))
# emit-scheme-entry
    .text
    .align 16, 0x90
    .globl _L_scheme_entry
_L_scheme_entry:
    movl $0, %edi  # dummy for debugging
    .global base_init_callback
    .extern base_init
    addl $-4,%esp
    jmp base_init
base_init_callback:
    addl $4,%esp
# emit-expr (pair? (primitivies))
# emit-expr (primitivies)
# funcall
#    si   =-8
#    env  = ()
#    expr = (funcall primitivies)
# emit-expr primitivies
