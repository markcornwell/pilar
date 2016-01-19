# -536870912
# == explicit-begins  ==>
# -536870912
# == eliminate-let*  ==>
# -536870912
# == eliminate-shadowing  ==>
# -536870912
# == vectorize-letrec  ==>
# -536870912
# == eliminate-set!  ==>
# -536870912
# == close-free-variables  ==>
# -536870912
# == eliminate-quote  ==>
# -536870912
# == eliminate-when/unless  ==>
# -536870912
# == eliminate-cond  ==>
# -536870912
# == external-symbols  ==>
# -536870912
# emit-scheme-entry
    .text
    .align 16, 0x90
    .globl _L_scheme_entry
_L_scheme_entry:
    movl $0, %edi  # dummy for debugging
    .global base_init_callback
    .extern base_init
    addl $-4,%esp
    jmp base_init
base_init_callback:
    addl $4,%esp
# emit-expr -536870912
    movl $-2147483648, %eax     # immed -536870912
    ret
    .text
    .align 16, 0x90
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
