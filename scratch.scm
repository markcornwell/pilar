
> Performing exit tests ...
test 0:(foreign-call "exit" 0) ... ok
test 1:(foreign-call "exit" 1) ... ok
Performing write tests ...
test 2:(foreign-call "s_nop") ... ok
test 3:(foreign-call "s_42") ... ok
test 4:(foreign-call "s_true") ... ok
test 5:(foreign-call "s_false") ... ok
test 6:(foreign-call "s_once" 0) ... ok
test 7:(foreign-call "s_once" 1) ...Exception in test: output mismatch for test 7, expected "1\n", got "0\n"

# (foreign-call "s_once" 1)
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
# emit-expr (foreign-call "s_once" 1)
# emit-expr 1
    movl $4, %eax     # immed 1
    movl %eax, -4(%esp)
    addl $-12,%esp  
    .extern _s_once
fcall:
    call _s_once
fret:
    subl $-12,%esp
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
