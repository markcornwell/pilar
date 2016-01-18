# (string-ref #t -1)
# == explicit-begins  ==>
# (string-ref #t -1)
# == eliminate-let*  ==>
# (string-ref #t -1)
# == eliminate-shadowing  ==>
# (string-ref #t -1)
# == vectorize-letrec  ==>
# (string-ref #t -1)
# == eliminate-set!  ==>
# (string-ref #t -1)
# == close-free-variables  ==>
# (string-ref #t -1)
# == eliminate-quote  ==>
# (string-ref #t -1)
# == eliminate-when/unless  ==>
# (string-ref #t -1)
# == eliminate-cond  ==>
# (string-ref #t -1)
# == external-symbols  ==>
# (string-ref #t -1)
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
# emit-expr (string-ref #t -1)
# emit-expr #t
    movl $111, %eax     # immed #t
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_12938
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $0, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12938:
    movl %eax, -8(%esp)
# emit-expr -1
    movl $-4, %eax     # immed -1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_12939"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12939:
# check bounds on string index
    movl -8(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_12941
    cmp  $0,%eax
    jge _L_12940
_L_12941:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_12940:
    sar $2, %eax
    movl -8(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
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
