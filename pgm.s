# (let ((f (lambda (f n) (if (fxzero? n) 1 (fx* n (f (fxsub1 n))))))) (let ((g (lambda (g n) (f (lambda (n) (g g n)) n)))) (g g 5)))
# == annotate ==>
# (let ((f (code (f n) () (if (fxzero? n) 1 (fx* n (f (fxsub1 n))))))) (let ((g (code (g n) (f) (f (code (n) (g) (g g n)) n)))) (g g 5)))
# == transform ==>

# (codes ((f34 (code (f n) () (if (fxzero? n) 1 (fx* n (f (fxsub1 n)))))) (f32 (code (g n) (f) (f (closure f33 g) n))) (f33 (code (n) (g) (g g n)))) (let ((f (closure f34))) (let ((g (closure f32 f))) (g g 5))))

# emit-codes expr=(codes ((f34 (code (f n) () (if (fxzero? n) 1 (fx* n (f (fxsub1 n)))))) (f32 (code (g n) (f) (f (closure f33 g) n))) (f33 (code (n) (g) (g g n)))) (let ((f (closure f34))) (let ((g (closure f32 f))) (g g 5))))
#  bindings=((f34 (code (f n) () (if (fxzero? n) 1 (fx* n (f (fxsub1 n)))))) (f32 (code (g n) (f) (f (closure f33 g) n))) (f33 (code (n) (g) (g g n))))
#  lvars=(f34 f32 f33)
#  codes=((code (f n) () (if (fxzero? n) 1 (fx* n (f (fxsub1 n))))) (code (g n) (f) (f (closure f33 g) n)) (code (n) (g) (g g n)))
#  labels=("_L_42" "_L_41" "_L_40")
#  env=((f34 . "_L_42") (f32 . "_L_41") (f33 . "_L_40"))
#  ---- >>>>> emit-codes start ----
# emit-code (code (f n) () (if (fxzero? n) 1 (fx* n (f (fxsub1 n)))))
    .text
    .align 4,0x90
    .globl _L_42
_L_42:
# fmls = (f n)
# frev = ()
# body = ((if (fxzero? n) 1 (fx* n (f (fxsub1 n)))))
# env  = ((f34 . "_L_42") (f32 . "_L_41") (f33 . "_L_40"))
# tail-begin body=((if (fxzero? n) 1 (fx* n (f (fxsub1 n)))))
    movl -8(%esp), %eax
    cmp $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_43
    movl $4, %eax     # immed 1
    jmp _L_44
_L_43:
# funcall
#  si   =-12
#  env  = ((n . -8) (f . -4) (f34 . "_L_42") (f32 . "_L_41") (f33 . "_L_40"))
#  expr = (funcall f (fxsub1 n))
    movl -8(%esp), %eax
    addl $-4, %eax
    mov %eax, -20(%esp)    # arg
    movl -4(%esp), %eax
    movl %edi, -12(%esp)
    movl %eax, %edi
    add $-12, %esp    # adjust base
     call *-2(%edi)
    add $12, %esp    # adjust base
    movl -12(%esp), %edi
    sar $2, %eax
    movl %eax, -12(%esp)
    movl -8(%esp), %eax
    imul -12(%esp), %eax
_L_44:
# tail-begin body=()
    ret
    ret   # from lambda
# emit-code (code (g n) (f) (f (closure f33 g) n))
    .text
    .align 4,0x90
    .globl _L_41
_L_41:
# fmls = (g n)
# frev = (f)
# body = ((f (closure f33 g) n))
# env  = ((f . 4) (f34 . "_L_42") (f32 . "_L_41") (f33 . "_L_40"))
# tail-begin body=((f (closure f33 g) n))
# funcall
#  si   =-12
#  env  = ((n . -8) (g . -4) (f . 4) (f34 . "_L_42") (f32 . "_L_41") (f33 . "_L_40"))
#  expr = (funcall f (closure f33 g) n)
# closure
#  si   =-20
#  env  =((n . -8) (g . -4) (f . 4) (f34 . "_L_42") (f32 . "_L_41") (f33 . "_L_40"))
#  expr =(closure f33 g)
   movl $_L_40, 0(%ebp)  # closure label
    movl -4(%esp), %eax
   movl  %eax, 4(%ebp)
   movl %ebp, %eax    # return base ptr
   add $2, %eax      # closure tag
   add $8, %ebp      # bump ebp
    mov %eax, -20(%esp)    # arg
    movl -8(%esp), %eax
    mov %eax, -24(%esp)    # arg
    movl 2(%edi), %eax
    movl %edi, -12(%esp)
    movl %eax, %edi
    add $-12, %esp    # adjust base
     call *-2(%edi)
    add $12, %esp    # adjust base
    movl -12(%esp), %edi
# tail-begin body=()
    ret
    ret   # from lambda
# emit-code (code (n) (g) (g g n))
    .text
    .align 4,0x90
    .globl _L_40
_L_40:
# fmls = (n)
# frev = (g)
# body = ((g g n))
# env  = ((g . 4) (f34 . "_L_42") (f32 . "_L_41") (f33 . "_L_40"))
# tail-begin body=((g g n))
# funcall
#  si   =-8
#  env  = ((n . -4) (g . 4) (f34 . "_L_42") (f32 . "_L_41") (f33 . "_L_40"))
#  expr = (funcall g g n)
    movl 2(%edi), %eax
    mov %eax, -16(%esp)    # arg
    movl -4(%esp), %eax
    mov %eax, -20(%esp)    # arg
    movl 2(%edi), %eax
    movl %edi, -8(%esp)
    movl %eax, %edi
    add $-8, %esp    # adjust base
     call *-2(%edi)
    add $8, %esp    # adjust base
    movl -8(%esp), %edi
# tail-begin body=()
    ret
    ret   # from lambda
#  ---- <<<<< emit-codes end ------
    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
# emit-let
#  si   = -4
#  env  = ((f34 . "_L_42") (f32 . "_L_41") (f33 . "_L_40"))
#  bindings = ((f (closure f34)))
#  body = (begin (let ((g (closure f32 f))) (g g 5)))
# closure
#  si   =-4
#  env  =((f34 . "_L_42") (f32 . "_L_41") (f33 . "_L_40"))
#  expr =(closure f34)
   movl $_L_42, 0(%ebp)  # closure label
   movl %ebp, %eax    # return base ptr
   add $2, %eax      # closure tag
   add $8, %ebp      # bump ebp
    movl %eax, -4(%esp)
# emit-begin
#   body=((let ((g (closure f32 f))) (g g 5)))
#   env=((f . -4) (f34 . "_L_42") (f32 . "_L_41") (f33 . "_L_40"))
# emit-let
#  si   = -8
#  env  = ((f . -4) (f34 . "_L_42") (f32 . "_L_41") (f33 . "_L_40"))
#  bindings = ((g (closure f32 f)))
#  body = (begin (g g 5))
# closure
#  si   =-8
#  env  =((f . -4) (f34 . "_L_42") (f32 . "_L_41") (f33 . "_L_40"))
#  expr =(closure f32 f)
   movl $_L_41, 0(%ebp)  # closure label
    movl -4(%esp), %eax
   movl  %eax, 4(%ebp)
   movl %ebp, %eax    # return base ptr
   add $2, %eax      # closure tag
   add $8, %ebp      # bump ebp
    movl %eax, -8(%esp)
# emit-begin
#   body=((g g 5))
#   env=((g . -8) (f . -4) (f34 . "_L_42") (f32 . "_L_41") (f33 . "_L_40"))
# funcall
#  si   =-12
#  env  = ((g . -8) (f . -4) (f34 . "_L_42") (f32 . "_L_41") (f33 . "_L_40"))
#  expr = (funcall g g 5)
    movl -8(%esp), %eax
    mov %eax, -20(%esp)    # arg
    movl $20, %eax     # immed 5
    mov %eax, -24(%esp)    # arg
    movl -8(%esp), %eax
    movl %edi, -12(%esp)
    movl %eax, %edi
    add $-12, %esp    # adjust base
     call *-2(%edi)
    add $12, %esp    # adjust base
    movl -12(%esp), %edi
# emit-begin
#   body=()
#   env=((g . -8) (f . -4) (f34 . "_L_42") (f32 . "_L_41") (f33 . "_L_40"))
# emit-begin
#   body=()
#   env=((f . -4) (f34 . "_L_42") (f32 . "_L_41") (f33 . "_L_40"))
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
