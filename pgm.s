# (letrec ((e (lambda (x) (if (fxzero? x) #t (o (fxsub1 x))))) (o (lambda (x) (if (fxzero? x) #f (e (fxsub1 x)))))) (e 25))

# emit-letrec expr=(letrec ((e (lambda (x) (if (fxzero? x) #t (o (fxsub1 x))))) (o (lambda (x) (if (fxzero? x) #f (e (fxsub1 x)))))) (e 25))
#  bindings=((e (lambda (x) (if (fxzero? x) #t (o (fxsub1 x))))) (o (lambda (x) (if (fxzero? x) #f (e (fxsub1 x))))))
#  lvars=(e o)
#  lambdas=((lambda (x) (if (fxzero? x) #t (o (fxsub1 x)))) (lambda (x) (if (fxzero? x) #f (e (fxsub1 x)))))
#  labels=("L_23" "L_22")
#  env=((e . "L_23") (o . "L_22"))
#  ---- >>>>> emit-lambdas start ----
    .text
    .align 4,0x90
    .globl L_23
L_23:
    movl -4(%esp), %eax   # stk load
    cmp $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je L_24
    movl $111, %eax     # immediate
    jmp L_25
L_24:
    movl -4(%esp), %eax   # stk load
    addl $-4, %eax
    mov %eax, -12(%esp)    # arg
    lea -4(%esp), %esp    # adjust base
    call L_22   # app  
    lea 4(%esp), %esp    # adjust base
L_25:
    ret   # from lambda
    .text
    .align 4,0x90
    .globl L_22
L_22:
    movl -4(%esp), %eax   # stk load
    cmp $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je L_26
    movl $47, %eax     # immediate
    jmp L_27
L_26:
    movl -4(%esp), %eax   # stk load
    addl $-4, %eax
    mov %eax, -12(%esp)    # arg
    lea -4(%esp), %esp    # adjust base
    call L_23   # app  
    lea 4(%esp), %esp    # adjust base
L_27:
    ret   # from lambda
#  ---- <<<<<  emit-lambdas end ------
    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
    movl $100, %eax     # immediate
    mov %eax, -8(%esp)    # arg
    call L_23   # app  
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
