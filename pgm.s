# (letrec () 12)
# == eliminate-multi-element-body  ==>
# (letrec () 12)
# == eliminate-variable-name-shadowing  ==>
# (letrec () 12)
# == vectorize-letrec  ==>
# (let () (begin) 12)
# == eliminate-set!  ==>
# (let () (begin))
# == close-free-variables  ==>
# (let () (begin))
    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
# emit-expr
# emit-let
#  si   = -8
#  env  = ()
#  bindings = ()
#  body = (begin)
# emit-expr
# emit-begin
#   body=()
#   env=()
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
