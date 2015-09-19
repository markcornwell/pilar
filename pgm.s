# (let ((v (make-vector 2))) (vector-set! v 0 v) (vector-set! v 1 v) (eq? (vector-ref v 0) (vector-ref v 1)))

    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
    movl $8, %eax     # immediate 2
    movl %eax, 0(%ebp)
    movl %eax, %ebx
    movl %ebp, %eax
    orl  $5, %eax
    addl $11, %ebx
    andl $-8, %ebx
    addl %ebx, %ebp
    movl %eax, -4(%esp)   # stk save
# begin body=((vector-set! v 0 v) (vector-set! v 1 v) (eq? (vector-ref v 0) (vector-ref v 1)))
    movl -4(%esp), %eax   # stk load
    movl %eax, -8(%esp)
    movl $0, %eax     # immediate 0
    movl %eax, -12(%esp)
    movl -4(%esp), %eax   # stk load
    movl -8(%esp), %ebx
    movl -12(%esp), %esi
    movl %eax, 3(%ebx,%esi)
# begin body=((vector-set! v 1 v) (eq? (vector-ref v 0) (vector-ref v 1)))
    movl -4(%esp), %eax   # stk load
    movl %eax, -8(%esp)
    movl $4, %eax     # immediate 1
    movl %eax, -12(%esp)
    movl -4(%esp), %eax   # stk load
    movl -8(%esp), %ebx
    movl -12(%esp), %esi
    movl %eax, 3(%ebx,%esi)
# begin body=((eq? (vector-ref v 0) (vector-ref v 1)))
