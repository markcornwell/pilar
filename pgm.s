# (cons 1 2 3)
# == explicit-begins  ==>
# (cons 1 2 3)
# == eliminate-let*  ==>
# (cons 1 2 3)
# == uniquify-variables  ==>
# (cons 1 2 3)
# == vectorize-letrec  ==>
# (cons 1 2 3)
# == eliminate-set!  ==>
# (cons 1 2 3)
# == close-free-variables  ==>
# (cons 1 2 3)
# == eliminate-quote  ==>
# (cons 1 2 3)
# == eliminate-when/unless  ==>
# (cons 1 2 3)
# == eliminate-cond  ==>
# (cons 1 2 3)
# == external-symbols  ==>
# (cons 1 2 3)
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
# emit-expr (cons 1 2 3)
