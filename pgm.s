# (let ((x 12)) (set! x 13) x)
# == annotate ==>
# (let ((x 12)) (begin (set! x 13) x))
# == null transform ==>

# (let ((x 12)) (begin (set! x 13) x))

    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
# emit-let
#  si   = -4
#  env  = ()
#  bindings = ((x 12))
#  body = (begin (begin (set! x 13) x))
    movl $48, %eax     # immed 12
    movl %eax, -4(%esp)
# emit-begin
#   body=((begin (set! x 13) x))
#   env=((x . -4))
# emit-begin
#   body=((set! x 13) x)
#   env=((x . -4))
# funcall
#  si   =-8
#  env  = ((x . -4))
#  expr = (funcall set! x 13)
    movl -4(%esp), %eax
    mov %eax, -16(%esp)    # arg x
    movl $52, %eax     # immed 13
    mov %eax, -20(%esp)    # arg 13
#  oper = set!
