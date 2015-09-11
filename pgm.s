    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
    movl $-2147483648, %eax
    ret
    .text
    .align 4,0x90
    .globl _scheme_entry
_scheme_entry:
    movl %esp, %ecx
    movl 4(%esp), %esp
    call _L_scheme_entry
    movl %ecx, %esp
    ret
