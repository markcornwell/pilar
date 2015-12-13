# (let ((x 12)) (set! x (fxadd1 x)) x)
# == vectorize-letrec  ==>
# (let ((x 12)) (set! x (fxadd1 x)) x)
# == eliminate-set!  ==>
# (let ((x (vector 12))) (begin (vector-set! x 0 (fxadd1 x)) (vector-ref x 0)))
# == close-free-variables  ==>
# (let ((x (vector 12))) (begin (begin (vector-set! x 0 (fxadd1 x)) (vector-ref x 0))))
    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
# emit-expr
# emit-let
#  si   = -8
#  env  = ()
#  bindings = ((x (vector 12)))
#  body = (begin (begin (begin (vector-set! x 0 (fxadd1 x)) (vector-ref x 0))))
# emit-expr
# emit-expr
# make-vector 1
# emit-expr
    movl $4, %eax     # immed 1
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, -8(%esp)
# emit-expr
    movl $48, %eax     # immed 12
    movl  %eax, %ebx
    movl -8(%esp), %eax
    movl %ebx, -1(%eax)
    movl %eax, -8(%esp)  # stack save
# emit-expr
# emit-begin
#   body=((begin (begin (vector-set! x 0 (fxadd1 x)) (vector-ref x 0))))
#   env=((x . -8))
# emit-expr
# emit-begin
#   body=((begin (vector-set! x 0 (fxadd1 x)) (vector-ref x 0)))
#   env=((x . -8))
# emit-expr
# emit-begin
#   body=((vector-set! x 0 (fxadd1 x)) (vector-ref x 0))
#   env=((x . -8))
# emit-expr
# emit-expr
# emit-variable-ref
# env=((x . -8))
# var=x
    movl -8(%esp), %eax  # stack load x
# end emit-variable-ref
    movl %eax, -12(%esp)
# emit-expr
    movl $0, %eax     # immed 0
    movl %eax, -16(%esp)
# emit-expr
# emit-expr
# emit-variable-ref
# env=((x . -8))
# var=x
    movl -8(%esp), %eax  # stack load x
# end emit-variable-ref
     addl $4, %eax
    movl -12(%esp), %ebx
    movl -16(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-begin
#   body=((vector-ref x 0))
#   env=((x . -8))
# emit-expr
# emit-expr
# emit-variable-ref
# env=((x . -8))
# var=x
    movl -8(%esp), %eax  # stack load x
# end emit-variable-ref
    movl %eax, -12(%esp)
# emit-expr
    movl $0, %eax     # immed 0
    movl -12(%esp), %esi
    movl -1(%eax,%esi), %eax
# emit-begin
#   body=()
#   env=((x . -8))
# emit-begin
#   body=()
#   env=((x . -8))
# emit-begin
#   body=()
#   env=((x . -8))
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
