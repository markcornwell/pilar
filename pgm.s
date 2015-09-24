# (let ((s (make-string 5))) (string-set! s 0 #\a) (string-set! s 1 #\b) (string-set! s 2 #\c) (string-set! s 3 #\d) (string-set! s 4 #\e) (string-ref s 3))

    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
    movl $20, %eax     # immediate 5
    movl %eax, 0(%ebp)
    movl %eax, %esi
    sar  $2, %esi
    add  $3, %esi
    or   $-4, %esi
    add $4, %esi
    movl %ebp, %eax
    add $6, %eax
    movl (%ebp,%esi), %ebp
    movl %eax, -4(%esp)
# begin body=((string-set! s 0 #\a) (string-set! s 1 #\b) (string-set! s 2 #\c) (string-set! s 3 #\d) (string-set! s 4 #\e) (string-ref s 3))
#       env=((s . -4))
    movl -4(%esp), %eax
    movl %eax, -8(%esp)
    movl $0, %eax     # immediate 0
    movl %eax, -12(%esp)
    movl $24847, %eax     # immediate #\a
    movl -8(%esp), %ebx
    movl -12(%esp), %esi
    sar $2, %esi
    movb  %ah, -2(%ebx,%esi)
# begin body=((string-set! s 1 #\b) (string-set! s 2 #\c) (string-set! s 3 #\d) (string-set! s 4 #\e) (string-ref s 3))
#       env=((s . -4))
    movl -4(%esp), %eax
    movl %eax, -8(%esp)
    movl $4, %eax     # immediate 1
    movl %eax, -12(%esp)
    movl $25103, %eax     # immediate #\b
    movl -8(%esp), %ebx
    movl -12(%esp), %esi
    sar $2, %esi
    movb  %ah, -2(%ebx,%esi)
# begin body=((string-set! s 2 #\c) (string-set! s 3 #\d) (string-set! s 4 #\e) (string-ref s 3))
#       env=((s . -4))
    movl -4(%esp), %eax
    movl %eax, -8(%esp)
    movl $8, %eax     # immediate 2
    movl %eax, -12(%esp)
    movl $25359, %eax     # immediate #\c
    movl -8(%esp), %ebx
    movl -12(%esp), %esi
    sar $2, %esi
    movb  %ah, -2(%ebx,%esi)
# begin body=((string-set! s 3 #\d) (string-set! s 4 #\e) (string-ref s 3))
#       env=((s . -4))
    movl -4(%esp), %eax
    movl %eax, -8(%esp)
    movl $12, %eax     # immediate 3
    movl %eax, -12(%esp)
    movl $25615, %eax     # immediate #\d
    movl -8(%esp), %ebx
    movl -12(%esp), %esi
    sar $2, %esi
    movb  %ah, -2(%ebx,%esi)
# begin body=((string-set! s 4 #\e) (string-ref s 3))
#       env=((s . -4))
    movl -4(%esp), %eax
    movl %eax, -8(%esp)
    movl $16, %eax     # immediate 4
    movl %eax, -12(%esp)
    movl $25871, %eax     # immediate #\e
    movl -8(%esp), %ebx
    movl -12(%esp), %esi
    sar $2, %esi
    movb  %ah, -2(%ebx,%esi)
# begin body=((string-ref s 3))
#       env=((s . -4))
    movl -4(%esp), %eax
    movl %eax, -8(%esp)
    movl $12, %eax     # immediate 3
    sar $2, %eax
    movl -8(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# begin body=()
#       env=((s . -4))
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
