# (or 1 2 3)
# == eliminate-multi-element-body  ==>
# (or 1 2 3)
# == eliminate-let*  ==>
# (or 1 2 3)
# == eliminate-variable-name-shadowing  ==>
# (or 1 2 3)
# == vectorize-letrec  ==>
# (or 1 2 3)
# == eliminate-set!  ==>
# (or 1 2 3)
# == close-free-variables  ==>
# (or 1 2 3)
# == eliminate-quote  ==>
# (or 1 2 3)
    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
# emit-expr
# emit-expr
# emit-expr
    movl $4, %eax     # immed 1
    cmp $47, %al
    je _L_42
# emit-expr
    movl $111, %eax     # immed #t
    jmp _L_43
_L_42:
# emit-expr
# emit-expr
# emit-expr
    movl $8, %eax     # immed 2
    cmp $47, %al
    je _L_44
# emit-expr
    movl $111, %eax     # immed #t
    jmp _L_45
_L_44:
# emit-expr
# emit-expr
    movl $12, %eax     # immed 3
_L_45:
_L_43:
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
