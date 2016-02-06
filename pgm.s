# (let ((x (string #\a #\b #\c)) (y 12)) (string-set! x 0 y))
# == explicit-begins  ==>
# (let ((x (string #\a #\b #\c)) (y 12)) (string-set! x 0 y))
# == eliminate-let*  ==>
# (let ((x (string #\a #\b #\c)) (y 12)) (string-set! x 0 y))
# == uniquify-variables  ==>
# (let ((f1078 (string #\a #\b #\c)) (f1077 12)) (string-set! f1078 0 f1077))
# == vectorize-letrec  ==>
# (let ((f1078 (string #\a #\b #\c)) (f1077 12)) (string-set! f1078 0 f1077))
# == eliminate-set!  ==>
# (let ((f1078 (string #\a #\b #\c)) (f1077 12)) (string-set! f1078 0 f1077))
# == close-free-variables  ==>
# (let ((f1078 (string #\a #\b #\c)) (f1077 12)) (string-set! f1078 0 f1077))
# == eliminate-quote  ==>
# (let ((f1078 (string #\a #\b #\c)) (f1077 12)) (string-set! f1078 0 f1077))
# == eliminate-when/unless  ==>
# (let ((f1078 (string #\a #\b #\c)) (f1077 12)) (string-set! f1078 0 f1077))
# == eliminate-cond  ==>
# (let ((f1078 (string #\a #\b #\c)) (f1077 12)) (string-set! f1078 0 f1077))
# == external-symbols  ==>
# (let ((f1078 (string #\a #\b #\c)) (f1077 12)) (string-set! f1078 0 f1077))
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
# emit-expr (let ((f1078 (string #\a #\b #\c)) (f1077 12)) (string-set! f1078 0 f1077))
# emit-let
#  si   = -8
#  env  = ()
#  bindings = ((f1078 (string #\a #\b #\c)) (f1077 12))
#  body = (string-set! f1078 0 f1077)
# emit-expr (string #\a #\b #\c)
# funcall
#    si   =-8
#    env  = ()
#    expr = (funcall string #\a #\b #\c)
# emit-expr string
