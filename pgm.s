# (pair? (cons 1 2))

    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
    movl $8, %eax     # immediate
    movl %eax, -4(%eax)
    movl $4, %eax     # immediate
    movl %eax, 0(%ebp)
    movl -4(%eax), %eax
    movl %eax, 4(%ebp)
    movl %ebp, %eax
    or  $1, %eax
    addl $8, %ebp
    and $7, %al
    cmp $1, %al
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
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
