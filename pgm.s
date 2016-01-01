# (symbols)
# == explicit-begins  ==>
# (symbols)
# == eliminate-let*  ==>
# (symbols)
# == eliminate-shadowing  ==>
# (symbols)
# == vectorize-letrec  ==>
# (symbols)
# == eliminate-set!  ==>
# (symbols)
# == close-free-variables  ==>
# (symbols)
# == eliminate-quote  ==>
# (symbols)
# == eliminate-when/unless  ==>
# (symbols)
# == eliminate-cond  ==>
<<<<<<< HEAD
# (symbols)
# == external-symbols  ==>
# ((primitive-ref symbols))
=======
# -536870912
# == external-symbols  ==>
# -536870912
>>>>>>> separate-compilation
# emit-scheme-entry
    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
    movl $0, %edi  # dummy for debugging
    .global base_init_callback
    .extern base_init
    addl $-4,%esp
    jmp base_init
base_init_callback:
    addl $4,%esp
<<<<<<< HEAD
# emit-expr ((primitive-ref symbols))
# funcall
#    si   =-8
#    env  = ()
#    expr = (funcall (primitive-ref symbols))
# emit-expr (primitive-ref symbols)
    .extern symbols
    movl symbols,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in closure slot
    movl -16(%esp), %edi   # load new closure to %edi
    add $-8, %esp   # adjust base
    call *-2(%edi)        # call thru closure ptr
    add $8, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
=======
# emit-expr -536870912
    movl $-2147483648, %eax     # immed -536870912
>>>>>>> separate-compilation
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
