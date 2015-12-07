# (let ((f (lambda (x) x))) (f 12))
# == vectorize-letrec ==>
# (let ((f (lambda (x) x))) (f 12))
# == close-free-variables ==>
# (let ((f (closure (x) () x))) (f 12))
# == null transform ==>

# (let ((f (closure (x) () x))) (f 12))

    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
# emit-expr
# emit-let
#  si   = -8
#  env  = ()
#  bindings = ((f (closure (x) () x)))
#  body = (f 12)
# emit-expr
# emit-closure
# si = -8
# env = ()
# expr = (closure (x) () x)
    movl $_L_36, 0(%ebp)  # closure label
    movl %ebp, %eax    # return base ptr
    add $2, %eax      # closure tag
    add $8, %ebp      # bump ebp
    jmp _L_37
_L_36:
# emit-tail-expr
# si=-12
# env=((x . -8))
# expr=(begin x)
# tail-begin body=(x)
# emit-expr
# emit-variable-ref
# env=((x . -8))
# var=x
    movl -8(%esp), %eax  # stack load x
# end emit-variable-ref
# tail-begin body=()
    movl -4(%esp), %edi  # restore closure env
    ret                  # return thru stack
    .align 4,0x90
_L_37:
    movl %eax, -8(%esp)  # stack save
# emit-expr
# funcall
#    si   =-12
#    env  = ((f . -8))
#    expr = (funcall f 12)
# emit-expr
    movl $48, %eax     # immed 12
    mov %eax, -20(%esp)    # arg 12
# emit-expr
# emit-variable-ref
# env=((f . -8))
# var=f
    movl -8(%esp), %eax  # stack load f
# end emit-variable-ref
    movl %edi, -16(%esp)   # save old closure
    movl %eax, %edi       # set current closure from procedure
    add $-8, %esp    # adjust base
    call *-2(%edi)        # call thru closure ptr
    add $8, %esp    # adjust base
    movl -4(%esp), %edi   #restore closure frame ptr
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
