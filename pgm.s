# (letrec ((f 12)) f)
# == eliminate-multi-element-body  ==>
# (letrec ((f 12)) f)
# == eliminate-let*  ==>
# (letrec ((f 12)) f)
# == eliminate-variable-name-shadowing  ==>
# (letrec ((f 12)) f)
# == vectorize-letrec  ==>
# (let ((f (make-vector 1))) (begin ((vector-set! f 0 12)) (vector-ref f 0)))
# == eliminate-set!  ==>
# (let ((f (make-vector 1))) (begin ((vector-set! f 0 12)) (vector-ref f 0)))
# == close-free-variables  ==>
# (let ((f (make-vector 1))) (begin ((vector-set! f 0 12)) (vector-ref f 0)))
# == eliminate-quote  ==>
# (let ((f (make-vector 1))) (begin ((vector-set! f 0 12)) (vector-ref f 0)))
    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
# emit-expr
# emit-let
#  si   = -8
#  env  = ()
#  bindings = ((f (make-vector 1)))
#  body = (begin ((vector-set! f 0 12)) (vector-ref f 0))
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
    movl %eax, -8(%esp)  # stack save
# emit-expr
# emit-begin
#   body=(((vector-set! f 0 12)) (vector-ref f 0))
#   env=((f . -8))
# emit-expr
# funcall
#    si   =-12
#    env  = ((f . -8))
#    expr = (funcall (vector-set! f 0 12))
# emit-expr
# emit-expr
# emit-variable-ref
# env=((f . -8))
# var=f
    movl -8(%esp), %eax  # stack load f
# end emit-variable-ref
    movl %eax, -20(%esp)
# emit-expr
    movl $0, %eax     # immed 0
    movl %eax, -24(%esp)
# emit-expr
    movl $48, %eax     # immed 12
    movl -20(%esp), %ebx
    movl -24(%esp), %esi
    movl %eax, -1(%ebx,%esi)
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp    # adjust base
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp    # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-begin
#   body=((vector-ref f 0))
#   env=((f . -8))
# emit-expr
# emit-expr
# emit-variable-ref
# env=((f . -8))
# var=f
    movl -8(%esp), %eax  # stack load f
# end emit-variable-ref
    movl %eax, -12(%esp)
# emit-expr
    movl $0, %eax     # immed 0
    movl -12(%esp), %esi
    movl -1(%eax,%esi), %eax
# emit-begin
#   body=()
#   env=((f . -8))
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
