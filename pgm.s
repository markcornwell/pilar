# (let ((v (make-vector 1))) (vector-set! v 0 #t) v)

    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
    movl $4, %eax     # immediate 1
    movl %eax, 0(%ebp)
    movl %eax, %ebx
    movl %ebp, %eax
    orl  $5, %eax
    addl $11, %ebx
    andl $-8, %ebx
    addl %ebx, %ebp
    movl %eax, -4(%esp)   # stk save
# begin body=((vector-set! v 0 #t) v)
    movl -4(%esp), %eax   # stk load
    movl %eax, -8(%esp)
    movl $0, %eax     # immediate 0
    movl %eax, -12(%esp)
    movl $111, %eax     # immediate #t
    movl -8(%esp), %ebx
    movl -12(%esp), %ecx
    movl %eax, -5(%ebx,%ecx)
# begin body=(v)
    movl -4(%esp), %eax   # stk load
# begin body=()
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
