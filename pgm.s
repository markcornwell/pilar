# (let ((v (make-vector 1)) (y (cons 1 2))) (vector-set! v 0 y) (cons y (eq? y 0)))

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
# cons arg1=1 arg2=2
    movl $4, %eax     # immediate 1
    movl %eax, -8(%esp)
    movl $8, %eax     # immediate 2
    movl %eax, 4(%ebp)
    movl -8(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or  $1, %eax
    addl $8, %ebp
    movl %eax, -8(%esp)   # stk save
# begin body=((vector-set! v 0 y) (cons y (eq? y 0)))
    movl -4(%esp), %eax   # stk load
    movl %eax, -12(%esp)
    movl $0, %eax     # immediate 0
    movl %eax, -16(%esp)
    movl -8(%esp), %eax   # stk load
    movl -12(%esp), %ebx
    movl -16(%esp), %esi
    movl %eax, 3(%ebx,%esi)
# begin body=((cons y (eq? y 0)))
# cons arg1=y arg2=(eq? y 0)
    movl -8(%esp), %eax   # stk load
    movl %eax, -12(%esp)
# eq? arg1=y arg2=0
    movl -8(%esp), %eax   # stk load
    movl %eax, -16(%esp)
    movl $0, %eax     # immediate 0
    cmp %eax, -16(%esp)
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or  $1, %eax
    addl $8, %ebp
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
