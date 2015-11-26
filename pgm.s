# (letrec ((f (lambda (x) (g x x))) (g (lambda (x y) (fx+ x y)))) (f 12))
# == annotate ==>
# (letrec ((f (closure (x) () (g x x))) (g (closure (x y) () (fx+ x y)))) (begin (f 12)))
# == null transform ==>

# (letrec ((f (closure (x) () (g x x))) (g (closure (x y) () (fx+ x y)))) (begin (f 12)))

    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
# emit-letrec
#  si   = -4
#  env  = ()
#  bindings = ((f (closure (x) () (g x x))) (g (closure (x y) () (fx+ x y))))
#  body = (begin (begin (f 12)))
# emit-closure
# si = -4
# env = ((g . -8) (f . -4))
# expr = (closure (x) () (g x x))
    movl $_L_148, 0(%ebp)  # closure label
    movl %ebp, %eax    # return base ptr
    add $2, %eax      # closure tag
    add $8, %ebp      # bump ebp
    jmp _L_149
_L_148:
# tail-begin body=((g x x))
# funcall
#  si   =-8
#  env  = ((x . -4) (g . -8) (f . -4))
#  expr = (funcall g x x)
    movl -4(%esp), %eax
    mov %eax, -16(%esp)    # arg x
    movl -4(%esp), %eax
    mov %eax, -20(%esp)    # arg x
#  oper = g
    movl -8(%esp), %eax
    movl %edi, -8(%esp)
    movl %eax, %edi
    add $-8, %esp    # adjust base
     call *-2(%edi)
    add $8, %esp    # adjust base
    movl -8(%esp), %edi
# tail-begin body=()
    ret
    .align 4,0x90
_L_149:
    movl %eax, -4(%esp)
# emit-closure
# si = -8
# env = ((g . -8) (f . -4))
# expr = (closure (x y) () (fx+ x y))
    movl $_L_150, 0(%ebp)  # closure label
    movl %ebp, %eax    # return base ptr
    add $2, %eax      # closure tag
    add $8, %ebp      # bump ebp
    jmp _L_151
_L_150:
# tail-begin body=((fx+ x y))
    movl -8(%esp), %eax
    movl %eax, -12(%esp)  # fx+ push arg1
    movl -4(%esp), %eax
    addl -12(%esp), %eax  # fx+ arg1 arg2
# tail-begin body=()
    ret
    .align 4,0x90
_L_151:
    movl %eax, -8(%esp)
# emit-begin
#   body=((begin (f 12)))
#   env=((g . -8) (f . -4))
# emit-begin
#   body=((f 12))
#   env=((g . -8) (f . -4))
# funcall
#  si   =-12
#  env  = ((g . -8) (f . -4))
#  expr = (funcall f 12)
    movl $48, %eax     # immed 12
    mov %eax, -20(%esp)    # arg 12
#  oper = f
    movl -4(%esp), %eax
    movl %edi, -12(%esp)
    movl %eax, %edi
    add $-12, %esp    # adjust base
     call *-2(%edi)
    add $12, %esp    # adjust base
    movl -12(%esp), %edi
# emit-begin
#   body=()
#   env=((g . -8) (f . -4))
# emit-begin
#   body=()
#   env=((g . -8) (f . -4))
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
    call _L_scheme_entry
    movl 4(%ecx), %ebx
    movl 16(%ecx), %esi
    movl 20(%ecx), %edi
    movl 24(%ecx), %ebp
    movl 28(%ecx), %esp
    ret
