# (foreign-call "s_write" 1 "hello world" 10)
# == explicit-begins  ==>
# (foreign-call "s_write" 1 "hello world" 10)
# == eliminate-let*  ==>
# (foreign-call "s_write" 1 "hello world" 10)
# == eliminate-shadowing  ==>
# (foreign-call "s_write" 1 "hello world" 10)
# == vectorize-letrec  ==>
# (foreign-call "s_write" 1 "hello world" 10)
# == eliminate-set!  ==>
# (foreign-call "s_write" 1 "hello world" 10)
# == close-free-variables  ==>
# (foreign-call "s_write" 1 "hello world" 10)
# == eliminate-quote  ==>
# (foreign-call "s_write" 1 "hello world" 10)
# == eliminate-when/unless  ==>
# (foreign-call "s_write" 1 "hello world" 10)
# == eliminate-cond  ==>
# (foreign-call "s_write" 1 "hello world" 10)
# == external-symbols  ==>
# (foreign-call "s_write" 1 "hello world" 10)
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
# emit-expr (foreign-call "s_write" 1 "hello world" 10)
    movl %ecx,-8(%esp)
    movl %esp,-12(%esp)
# emit-expr 10
    movl $40, %eax     # immed 10
    movl %eax, -16(%esp)
# emit-expr "hello world"
# string literal
    jmp _L_271
    .align 8,0x90
_L_270 :
    .int 44
    .ascii "hello world"
_L_271:
    movl $_L_270, %eax
    orl $6, %eax
    movl %eax, -20(%esp)
# emit-expr 1
    movl $4, %eax     # immed 1
    movl %eax, -24(%esp)
    leal -24(%esp),%edi
    movl %edi,%esi
    andl $-16,%esi
    movl 0(%edi),%eax
    movl %eax,0(%esi)
    movl 4(%edi),%eax
    movl %eax,4(%esi)
    movl 8(%edi),%eax
    movl %eax,8(%esi)
    movl 12(%edi),%eax
    movl %eax,12(%esi)
    movl %esi,%esp
    .extern _s_write
fcall:
    call _s_write
fret:
    movl -12(%esi),%esp
    movl -8(%esp),%ecx     # <<<---- BAD ADDRESS 
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
