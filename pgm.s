# (foreign-call "s_write" 1 "hello world" 11)
# == explicit-begins  ==>
# (foreign-call "s_write" 1 "hello world" 11)
# == eliminate-let*  ==>
# (foreign-call "s_write" 1 "hello world" 11)
# == eliminate-shadowing  ==>
# (foreign-call "s_write" 1 "hello world" 11)
# == vectorize-letrec  ==>
# (foreign-call "s_write" 1 "hello world" 11)
# == eliminate-set!  ==>
# (foreign-call "s_write" 1 "hello world" 11)
# == close-free-variables  ==>
# (foreign-call "s_write" 1 "hello world" 11)
# == eliminate-quote  ==>
# (foreign-call "s_write" 1 "hello world" 11)
# == eliminate-when/unless  ==>
# (foreign-call "s_write" 1 "hello world" 11)
# == eliminate-cond  ==>
# (foreign-call "s_write" 1 "hello world" 11)
# == external-symbols  ==>
# (foreign-call "s_write" 1 "hello world" 11)
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
# emit-expr (foreign-call "s_write" 1 "hello world" 11)
    movl %ecx,-8(%esp)
# emit-expr 11
    movl $44, %eax     # immed 11
    movl %eax, -32(%esp)
# emit-expr "hello world"
# string literal
    jmp _L_361
    .align 8,0x90
_L_360 :
    .int 44
    .ascii "hello world"
_L_361:
    movl $_L_360, %eax
    orl $6, %eax
    movl %eax, -36(%esp)
# emit-expr 1
    movl $4, %eax     # immed 1
    movl %eax, -40(%esp)
    addl $-44,%esp
    .extern _s_write
fcall:
    call _s_write
fret:
    subl $-44,%esp
    movl -8(%esp),%ecx
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
