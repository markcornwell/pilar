# (foreign-call "s_foo")
# == explicit-begins  ==>
# (foreign-call "s_foo")
# == eliminate-let*  ==>
# (foreign-call "s_foo")
# == eliminate-shadowing  ==>
# (foreign-call "s_foo")
# == vectorize-letrec  ==>
# (foreign-call "s_foo")
# == eliminate-set!  ==>
# (foreign-call "s_foo")
# == close-free-variables  ==>
# (foreign-call "s_foo")
# == eliminate-quote  ==>
# (foreign-call "s_foo")
# == eliminate-when/unless  ==>
# (foreign-call "s_foo")
# == eliminate-cond  ==>
# (foreign-call "s_foo")
# == external-symbols  ==>
# (foreign-call "s_foo")
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
# emit-expr (foreign-call "s_foo")
    addl $-8,%esp
    add $-4,%esp  # force 16 byte alignment ???
    .extern _s_foo
fcall:
    call _s_foo
fret:
    add $4,%esp   # correct for forcing alignmnet
    subl $-8,%esp
    xorl  %eax, %eax # clean up eax ??? needed ???
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
finish:
    movl 4(%ecx), %ebx
    movl 16(%ecx), %esi
    movl 20(%ecx), %edi
    movl 24(%ecx), %ebp
    movl 28(%ecx), %esp
    ret
