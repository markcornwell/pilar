# (letrec ((f (lambda (x) (g x x))) (g (lambda (x y) (fx+ x y)))) (f 12))
# == annotate ==>
# (letrec ((f (code (x) () (g x x))) (g (code (x y) () (fx+ x y)))) (begin (f 12)))
# == transform ==>

# (codes ((f53 (code (x y) () (fx+ x y))) (f52 (code (x) () (g x x)))) (letrec ((f (closure f52)) (g (closure f53))) (begin (f 12))))

# emit-codes expr=(codes ((f53 (code (x y) () (fx+ x y))) (f52 (code (x) () (g x x)))) (letrec ((f (closure f52)) (g (closure f53))) (begin (f 12))))
#  bindings=((f53 (code (x y) () (fx+ x y))) (f52 (code (x) () (g x x))))
#  lvars=(f53 f52)
#  codes=((code (x y) () (fx+ x y)) (code (x) () (g x x)))
#  labels=("_L_97" "_L_96")
#  env=((f53 . "_L_97") (f52 . "_L_96"))
#  ---- >>>>> emit-codes start ----
# emit-code (code (x y) () (fx+ x y))
    .text
    .align 4,0x90
    .globl _L_97
_L_97:
# fmls = (x y)
# frev = ()
# body = ((fx+ x y))
# env  = ((f53 . "_L_97") (f52 . "_L_96"))
# tail-begin body=((fx+ x y))
    movl -8(%esp), %eax
    movl %eax, -12(%esp)  # fx+ push arg1
    movl -4(%esp), %eax
    addl -12(%esp), %eax  # fx+ arg1 arg2
# tail-begin body=()
    ret
    ret   # from lambda
# emit-code (code (x) () (g x x))
    .text
    .align 4,0x90
    .globl _L_96
_L_96:
# fmls = (x)
# frev = ()
# body = ((g x x))
# env  = ((f53 . "_L_97") (f52 . "_L_96"))
# tail-begin body=((g x x))
# funcall
#  si   =-8
#  env  = ((x . -4) (f53 . "_L_97") (f52 . "_L_96"))
#  expr = (funcall g x x)
    movl -4(%esp), %eax
    mov %eax, -16(%esp)    # arg x
    movl -4(%esp), %eax
    mov %eax, -20(%esp)    # arg x
#  oper = g
