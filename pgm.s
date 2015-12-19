# (let ((x (cons 1 2))) (when (pair? x) (set-car! x (fx+ (car x) (cdr x)))) x)
# == eliminate-multi-element-body  ==>
# (let ((x (cons 1 2))) (begin (when (pair? x) (set-car! x (fx+ (car x) (cdr x)))) x))
# == eliminate-let*  ==>
# (let ((x (cons 1 2))) (begin (when (pair? x) (set-car! x (fx+ (car x) (cdr x)))) x))
# == eliminate-variable-name-shadowing  ==>
# (let ((x (cons 1 2))) (begin (when (pair? x) (set-car! x (fx+ (car x) (cdr x)))) x))
# == vectorize-letrec  ==>
# (let ((x (cons 1 2))) (begin (when (pair? x) (set-car! x (fx+ (car x) (cdr x)))) x))
# == eliminate-set!  ==>
# (let ((x (cons 1 2))) (begin (when (pair? x) (set-car! x (fx+ (car x) (cdr x)))) x))
# == close-free-variables  ==>
# (let ((x (cons 1 2))) (begin (when (pair? x) (set-car! x (fx+ (car x) (cdr x)))) x))
# == eliminate-quote  ==>
# (let ((x (cons 1 2))) (begin (when (pair? x) (set-car! x (fx+ (car x) (cdr x)))) x))
    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
# emit-expr
# emit-let
#  si   = -8
#  env  = ()
#  bindings = ((x (cons 1 2)))
#  body = (begin (when (pair? x) (set-car! x (fx+ (car x) (cdr x)))) x)
# emit-expr
# cons arg1=1 arg2=2
# emit-expr
    movl $4, %eax     # immed 1
    movl %eax, -8(%esp)
# emit-expr
    movl $8, %eax     # immed 2
    movl %eax, 4(%ebp)
    movl -8(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl %eax, -8(%esp)  # stack save
# emit-expr
# emit-begin
#   body=((when (pair? x) (set-car! x (fx+ (car x) (cdr x)))) x)
#   env=((x . -8))
# emit-expr
# funcall
#    si   =-12
#    env  = ((x . -8))
#    expr = (funcall when (pair? x) (set-car! x (fx+ (car x) (cdr x))))
# emit-expr
