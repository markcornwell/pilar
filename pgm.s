# (letrec ((sum (lambda (n ac) (if (fxzero? n) ac (sum (fxsub1 n) (fx+ n ac)))))) (sum 10000 0))
# == vectorize-letrec ==>
# (let ((sum (make-vector 1))) (begin (vector-set! sum 0 (lambda (n ac) (if (fxzero? n) ac ((vector-ref sum 0) (fxsub1 n) (fx+ n ac)))))) ((vector-ref sum 0) 10000 0))
# == close-free-variables ==>
# (let ((sum (make-vector 1))) (begin (begin (vector-set! sum 0 (closure (n ac) (sum) (if (fxzero? n) ac ((vector-ref sum 0) (fxsub1 n) (fx+ n ac)))))) ((vector-ref sum 0) 10000 0)))
# == null transform ==>

# (let ((sum (make-vector 1))) (begin (begin (vector-set! sum 0 (closure (n ac) (sum) (if (fxzero? n) ac ((vector-ref sum 0) (fxsub1 n) (fx+ n ac)))))) ((vector-ref sum 0) 10000 0)))

    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
# emit-let
#  si   = -4
#  env  = ()
#  bindings = ((sum (make-vector 1)))
#  body = (begin (begin (vector-set! sum 0 (closure (n ac) (sum) (if (fxzero? n) ac ((vector-ref sum 0) (fxsub1 n) (fx+ n ac)))))) ((vector-ref sum 0) 10000 0))
# make-vector 1
    movl $4, %eax     # immed 1
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, -4(%esp)
# emit-begin
#   body=((begin (vector-set! sum 0 (closure (n ac) (sum) (if (fxzero? n) ac ((vector-ref sum 0) (fxsub1 n) (fx+ n ac)))))) ((vector-ref sum 0) 10000 0))
#   env=((sum . -4))
# emit-begin
#   body=((vector-set! sum 0 (closure (n ac) (sum) (if (fxzero? n) ac ((vector-ref sum 0) (fxsub1 n) (fx+ n ac))))))
#   env=((sum . -4))
    movl -4(%esp), %eax
    movl %eax, -8(%esp)
    movl $0, %eax     # immed 0
    movl %eax, -12(%esp)
# emit-closure
# si = -16
# env = ((sum . -4))
# expr = (closure (n ac) (sum) (if (fxzero? n) ac ((vector-ref sum 0) (fxsub1 n) (fx+ n ac))))
    movl $_L_196, 0(%ebp)  # closure label
    movl -4(%esp), %eax
   movl  %eax, 4(%ebp)
    movl %ebp, %eax    # return base ptr
    add $2, %eax      # closure tag
    add $8, %ebp      # bump ebp
    jmp _L_197
_L_196:
# tail-begin body=((if (fxzero? n) ac ((vector-ref sum 0) (fxsub1 n) (fx+ n ac))))
    movl -4(%esp), %eax
    cmp $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_198
    movl -8(%esp), %eax
    jmp _L_199
_L_198:
# funcall
#  si   =-12
#  env  = ((ac . -8) (n . -4) (sum . 4) (sum . -4))
#  expr = (funcall (vector-ref sum 0) (fxsub1 n) (fx+ n ac))
    movl -4(%esp), %eax
    addl $-4, %eax
    mov %eax, -20(%esp)    # arg (fxsub1 n)
    movl -8(%esp), %eax
    movl %eax, -24(%esp)  # fx+ push arg1
    movl -4(%esp), %eax
    addl -24(%esp), %eax  # fx+ arg1 arg2
    mov %eax, -24(%esp)    # arg (fx+ n ac)
#  oper = (vector-ref sum 0)
    movl 2(%edi), %eax
    movl %eax, -28(%esp)
    movl $0, %eax     # immed 0
    movl -28(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %edi, -12(%esp)
    movl %eax, %edi
    add $-12, %esp    # adjust base
     call *-2(%edi)
    add $12, %esp    # adjust base
    movl -12(%esp), %edi
_L_199:
# tail-begin body=()
    ret
    .align 4,0x90
_L_197:
    movl -8(%esp), %ebx
    movl -12(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-begin
#   body=()
#   env=((sum . -4))
# emit-begin
#   body=(((vector-ref sum 0) 10000 0))
#   env=((sum . -4))
# funcall
#  si   =-8
#  env  = ((sum . -4))
#  expr = (funcall (vector-ref sum 0) 10000 0)
    movl $40000, %eax     # immed 10000
    mov %eax, -16(%esp)    # arg 10000
    movl $0, %eax     # immed 0
    mov %eax, -20(%esp)    # arg 0
#  oper = (vector-ref sum 0)
    movl -4(%esp), %eax
    movl %eax, -24(%esp)
    movl $0, %eax     # immed 0
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %edi, -8(%esp)
    movl %eax, %edi
    add $-8, %esp    # adjust base
     call *-2(%edi)
    add $8, %esp    # adjust base
    movl -8(%esp), %edi
# emit-begin
#   body=()
#   env=((sum . -4))
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
