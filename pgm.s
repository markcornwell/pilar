# (let ((t (begin 12 (cons 1 2)))) (begin t t))
# == transform-toplevel-defs ==>
# (let ((t (begin 12 (cons 1 2)))) (begin t t))
# == transform-letrecs-to-lets ==>
# (let ((t (begin 12 (cons 1 2)))) (begin t t))
# == annotate ==>
# (let ((t (begin 12 (cons 1 2)))) (begin t t))
# == transform ==>

# (codes () (let ((t (begin 12 (cons 1 2)))) (begin t t)))

# emit-codes expr=(codes () (let ((t (begin 12 (cons 1 2)))) (begin t t)))
#  bindings=()
#  lvars=()
#  codes=()
#  labels=()
#  env=()
#  ---- >>>>> emit-codes start ----
#  ---- <<<<< emit-codes end ------
    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
# emit-let
#  si   = -4
#  env  = ()
#  bindings = ((t (begin 12 (cons 1 2))))
#  body = ((begin t t))
# emit-begin
#   body=(12 (cons 1 2))
#   env=()
    movl $48, %eax     # immed 12
# emit-begin
#   body=((cons 1 2))
#   env=()
# cons arg1=1 arg2=2
    movl $4, %eax     # immed 1
    movl %eax, -4(%esp)
    movl $8, %eax     # immed 2
    movl %eax, 4(%ebp)
    movl -4(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
# emit-begin
#   body=()
#   env=()
    movl %eax, -4(%esp)
# funcall
#  si   =-8
#  env  = ((t . -4))
#  expr = (funcall (begin t t))
#  oper = (begin t t)
# emit-begin
#   body=(t t)
#   env=((t . -4))
    movl -4(%esp), %eax
# emit-begin
#   body=(t)
#   env=((t . -4))
    movl -4(%esp), %eax
# emit-begin
#   body=()
#   env=((t . -4))
    movl %edi, -8(%esp)
    movl %eax, %edi
    add $-8, %esp    # adjust base
     call *-2(%edi)
    add $8, %esp    # adjust base
    movl -8(%esp), %edi
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
