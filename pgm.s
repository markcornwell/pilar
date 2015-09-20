# (let ((v0 (make-vector 2))) (let ((v1 (make-vector 2))) (vector-set! v0 0 100) (vector-set! v0 1 200) (vector-set! v1 0 300) (vector-set! v1 1 400) (cons v0 v1)))

    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
    movl $8, %eax     # immediate 2
    movl %eax, 0(%ebp)
    movl %eax, %ebx
    movl %ebp, %eax
    orl  $5, %eax
    addl $3, %ebx
    andl $-8, %ebx
    addl %ebx, %ebp
    movl %eax, -4(%esp)   # stk save
# begin body=((let ((v1 (make-vector 2))) (vector-set! v0 0 100) (vector-set! v0 1 200) (vector-set! v1 0 300) (vector-set! v1 1 400) (cons v0 v1)))
    movl $8, %eax     # immediate 2
    movl %eax, 0(%ebp)
    movl %eax, %ebx
    movl %ebp, %eax
    orl  $5, %eax
    addl $3, %ebx
    andl $-8, %ebx
    addl %ebx, %ebp
    movl %eax, -8(%esp)   # stk save
# begin body=((vector-set! v0 0 100) (vector-set! v0 1 200) (vector-set! v1 0 300) (vector-set! v1 1 400) (cons v0 v1))
    movl -4(%esp), %eax   # stk load
    movl %eax, -12(%esp)
    movl $0, %eax     # immediate 0
    movl %eax, -16(%esp)
    movl $400, %eax     # immediate 100
    movl -12(%esp), %ebx
    movl -16(%esp), %esi
    movl %eax, 3(%ebx,%esi)
# begin body=((vector-set! v0 1 200) (vector-set! v1 0 300) (vector-set! v1 1 400) (cons v0 v1))
    movl -4(%esp), %eax   # stk load
    movl %eax, -12(%esp)
    movl $4, %eax     # immediate 1
    movl %eax, -16(%esp)
    movl $800, %eax     # immediate 200
    movl -12(%esp), %ebx
    movl -16(%esp), %esi
    movl %eax, 3(%ebx,%esi)
# begin body=((vector-set! v1 0 300) (vector-set! v1 1 400) (cons v0 v1))
    movl -8(%esp), %eax   # stk load
    movl %eax, -12(%esp)
    movl $0, %eax     # immediate 0
    movl %eax, -16(%esp)
    movl $1200, %eax     # immediate 300
    movl -12(%esp), %ebx
    movl -16(%esp), %esi
    movl %eax, 3(%ebx,%esi)
# begin body=((vector-set! v1 1 400) (cons v0 v1))
    movl -8(%esp), %eax   # stk load
    movl %eax, -12(%esp)
    movl $4, %eax     # immediate 1
    movl %eax, -16(%esp)
    movl $1600, %eax     # immediate 400
    movl -12(%esp), %ebx
    movl -16(%esp), %esi
    movl %eax, 3(%ebx,%esi)
# begin body=((cons v0 v1))
# cons arg1=v0 arg2=v1
    movl -4(%esp), %eax   # stk load
    movl %eax, -12(%esp)
    movl -8(%esp), %eax   # stk load
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or  $1, %eax
    addl $8, %ebp
# begin body=()
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
