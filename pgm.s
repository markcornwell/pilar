# (let ((v (vector 11))) (vector-length v))
# == vectorize-letrec  ==>
# (let ((v (vector 11))) (vector-length v))
# == eliminate-set!  ==>
# (let ((v (vector 11))) (begin (vector-length v)))
# == close-free-variables  ==>
# (let ((v (vector 11))) (begin (begin (vector-length v))))
    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
# emit-expr
# emit-let
#  si   = -8
#  env  = ()
#  bindings = ((v (vector 11)))
#  body = (begin (begin (begin (vector-length v))))
# emit-expr
   movl $1,0(%ebp)
# emit-expr
    movl $44, %eax     # immed 11
   movl %eax, 4(%ebp)
   movl %ebp, %eax
    orl  $5, %eax
   addl $-8, %ebp
    movl %eax, -8(%esp)  # stack save
# emit-expr
# emit-begin
#   body=((begin (begin (vector-length v))))
#   env=((v . -8))
# emit-expr
# emit-begin
#   body=((begin (vector-length v)))
#   env=((v . -8))
# emit-expr
# emit-begin
#   body=((vector-length v))
#   env=((v . -8))
# emit-expr
# emit-expr
# emit-variable-ref
# env=((v . -8))
# var=v
    movl -8(%esp), %eax  # stack load v
# end emit-variable-ref
andl $-8, %eax
movl 0(%eax), %eax
# emit-begin
#   body=()
#   env=((v . -8))
# emit-begin
#   body=()
#   env=((v . -8))
# emit-begin
#   body=()
#   env=((v . -8))
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
