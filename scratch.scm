test 21:(let ((f (lambda (x y) (fx+ x y)))) (f 12 13)) ... ok
test 22:(let ((f (lambda (z) (let ((g (lambda (x y) (fx+ x y)))) (g z 100))))) (f 1002)) ...Exception in test: output mismatch for test ~s, expected ~s, got ~s with irritants (22 "1102\n" "2004\n")
> 
yahweh:pilar mark$ cat pgm.s
# (let ((f (lambda (z) (let ((g (lambda (x y) (fx+ x y)))) (g z 100))))) (f 1002))
# == vectorize-letrec ==>
# (let ((f (lambda (z) (let ((g (lambda (x y) (fx+ x y)))) (g z 100))))) (f 1002))
# == close-free-variables ==>
# (let ((f (closure (z) () (let ((g (closure (x y) () (fx+ x y)))) (g z 100))))) (f 1002))
# == null transform ==>

# (let ((f (closure (z) () (let ((g (closure (x y) () (fx+ x y)))) (g z 100))))) (f 1002))

    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
# emit-expr
# emit-let
#  si   = -4
#  env  = ()
#  bindings = ((f (closure (z) () (let ((g (closure (x y) () (fx+ x y)))) (g z 100)))))
#  body = (f 1002)
# emit-expr
# emit-closure
# si = -4
# env = ()
# expr = (closure (z) () (let ((g (closure (x y) () (fx+ x y)))) (g z 100)))
    movl $_L_40, 0(%ebp)  # closure label
    movl %ebp, %eax    # return base ptr
    add $2, %eax      # closure tag
    add $8, %ebp      # bump ebp
    jmp _L_41
_L_40:
# emit-tail-expr
# si=-8
# env=((z . -4))
# expr=(begin (let ((g (closure (x y) () (fx+ x y)))) (g z 100)))
# tail-begin body=((let ((g (closure (x y) () (fx+ x y)))) (g z 100)))
# emit-tail-expr
# si=-8
# env=((z . -4))
# expr=(let ((g (closure (x y) () (fx+ x y)))) (g z 100))
# emit-tail-let
#  si   = -8
#  env  = ((z . -4))
#  bindings = ((g (closure (x y) () (fx+ x y))))
#  body = (g z 100)
# emit-expr
# emit-closure
# si = -8
# env = ((z . -4))
# expr = (closure (x y) () (fx+ x y))
    movl $_L_42, 0(%ebp)  # closure label
    movl %ebp, %eax    # return base ptr
    add $2, %eax      # closure tag
    add $8, %ebp      # bump ebp
    jmp _L_43
_L_42:
# emit-tail-expr
# si=-12
# env=((y . -8) (x . -4))
# expr=(begin (fx+ x y))
# tail-begin body=((fx+ x y))
# emit-tail-expr
# si=-12
# env=((y . -8) (x . -4))
# expr=(fx+ x y)
# tail primcall
# emit-expr
# emit-variable-ref
# env=((y . -8) (x . -4))
# var=y
    movl -8(%esp), %eax  # stack load y
    movl %eax, -12(%esp)  # fx+ push arg1
# emit-expr
# emit-variable-ref
# env=((y . -8) (x . -4))
# var=x
    movl -4(%esp), %eax  # stack load x
    addl -12(%esp), %eax  # fx+ arg1 arg2
    movl -4(%esp), %edi # tail primcall
    ret
    .align 4,0x90
_L_43:
    movl %eax, -8(%esp)  # stack save
# emit-tail-expr
# si=-12
# env=((g . -8) (z . -4))
# expr=(g z 100)
# emit-tail-funcall
# emit-expr
# emit-variable-ref
# env=((g . -8) (z . -4))
# var=z
    movl -4(%esp), %eax  # stack load z
    mov %eax, -20(%esp)    # arg 
# emit-expr
    movl $400, %eax     # immed 100
    mov %eax, -24(%esp)    # arg 
# emit-expr
# emit-variable-ref
# env=((g . -8) (z . -4))
# var=g
    movl -8(%esp), %eax  # stack load g
    movl %eax, %edi  # put funcall op into %edi
# emit-shift-args:  argc=2   si=-20  delta=12
    mov -20(%esp), %ebx  # shift arg
    mov %ebx, -8(%esp)  # down to base
# emit-shift-args:  argc=1   si=-24  delta=12
    mov -24(%esp), %ebx  # shift arg
    mov %ebx, -12(%esp)  # down to base
# emit-shift-args:  argc=0   si=-28  delta=12
    jmp *-2(%edi)  # tail-funcall
    .align 4,0x90
_L_41:
    movl %eax, -4(%esp)  # stack save
# emit-expr
# funcall
#  si   =-8
#  env  = ((f . -4))
#  expr = (funcall f 1002)
# emit-expr
    movl $4008, %eax     # immed 1002
    mov %eax, -16(%esp)    # arg 1002
#  oper = f
# emit-expr
# emit-variable-ref
# env=((f . -4))
# var=f
    movl -4(%esp), %eax  # stack load f
    movl %edi, -8(%esp)   # save old closure
    movl %eax, %edi       # set current closure from procedure
    add $-8, %esp    # adjust base
    call *-2(%edi)        # call thru closure ptr
    add $8, %esp    # adjust base
    movl -8(%esp), %edi   #restore closure frame ptr
    ret
    .text
    .align 4,0x90
    .globl _scheme_entry
_scheme_entry:
    movl 4(%esp), %ecx
    movl %ebx, 4(%ecx)
    movl %esi, 16(%ecx)
    movl %edi, 20(%ecx)
    movl %ebp, 24(%ecx)
    movl %esp, 28(%ecx)
    movl 12(%esp), %ebp
    movl 8(%esp), %esp
    movl $0x0, %edi
    call _L_scheme_entry
    movl 4(%ecx), %ebx
    movl 16(%ecx), %esi
    movl 20(%ecx), %edi
    movl 24(%ecx), %ebp
    movl 28(%ecx), %esp
    ret
yahweh:pilar mark$ 
