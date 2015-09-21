# (let ((v0 (make-vector 2))) (vector-set! v0 0 100) (vector-set! v0 1 200) (cons #t v0))

    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
# make-vector 2
    movl $8, %eax     # immediate 2
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $15, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, -4(%esp)   # stk save
# begin body=((vector-set! v0 0 100) (vector-set! v0 1 200) (cons #t v0))
#       env=((v0 . -4))
    movl -4(%esp), %eax   # stk load
    movl %eax, -8(%esp)
    movl $0, %eax     # immediate 0
    movl %eax, -12(%esp)
    movl $400, %eax     # immediate 100
    movl -8(%esp), %ebx
    movl -12(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# begin body=((vector-set! v0 1 200) (cons #t v0))
#       env=((v0 . -4))
    movl -4(%esp), %eax   # stk load
    movl %eax, -8(%esp)
    movl $4, %eax     # immediate 1
    movl %eax, -12(%esp)
    movl $800, %eax     # immediate 200
    movl -8(%esp), %ebx
    movl -12(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# begin body=((cons #t v0))
#       env=((v0 . -4))
# cons arg1=#t arg2=v0
    movl $111, %eax     # immediate #t
    movl %eax, -8(%esp)
    movl -4(%esp), %eax   # stk load
    movl %eax, 4(%ebp)
    movl -8(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or  $1, %al
    addl $8, %ebp
# begin body=()
#       env=((v0 . -4))
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
