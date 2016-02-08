# (begin (write-char #\a) (flush-output-port (current-output-port)) (exit))
# == explicit-begins  ==>
# (begin (write-char #\a) (flush-output-port (current-output-port)) (exit))
# == eliminate-let*  ==>
# (begin (write-char #\a) (flush-output-port (current-output-port)) (exit))
# == uniquify-variables  ==>
# (begin (write-char #\a) (flush-output-port (current-output-port)) (exit))
# == vectorize-letrec  ==>
# (begin (write-char #\a) (flush-output-port (current-output-port)) (exit))
# == eliminate-set!  ==>
# (begin (write-char #\a) (flush-output-port (current-output-port)) (exit))
# == close-free-variables  ==>
# (begin (write-char #\a) (flush-output-port (current-output-port)) (exit))
# == eliminate-quote  ==>
# (begin (write-char #\a) (flush-output-port (current-output-port)) (exit))
# == eliminate-when/unless  ==>
# (begin (write-char #\a) (flush-output-port (current-output-port)) (exit))
# == eliminate-cond  ==>
# (begin (write-char #\a) (flush-output-port (current-output-port)) (exit))
# == external-symbols  ==>
# (begin (write-char #\a) (flush-output-port (current-output-port)) (exit))
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
# emit-expr (begin (write-char #\a) (flush-output-port (current-output-port)) (exit))
# emit-begin
#   expr=(begin (write-char #\a) (flush-output-port (current-output-port)) (exit))
#   env=()
# emit-expr (write-char #\a)
# funcall
#    si   =-8
#    env  = ()
#    expr = (funcall write-char #\a)
# emit-expr write-char
