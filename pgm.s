# (make-vector #t)
# == explicit-begins  ==>
# (make-vector #t)
# == eliminate-let*  ==>
# (make-vector #t)
# == eliminate-shadowing  ==>
# (make-vector #t)
# == vectorize-letrec  ==>
# (make-vector #t)
# == eliminate-set!  ==>
# (make-vector #t)
# == close-free-variables  ==>
# (make-vector #t)
# == eliminate-quote  ==>
# (make-vector #t)
# == eliminate-when/unless  ==>
# (make-vector #t)
# == eliminate-cond  ==>
# (make-vector #t)
# == external-symbols  ==>
# (make-vector #t)
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
# emit-expr (make-vector #t)
# make-vector #t
# emit-expr #t
    movl $111, %eax     # immed #t
# check the argument is a fixnum >= 0
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je _L_21559
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $0, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_21559:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
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
