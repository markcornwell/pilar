# (letrec ((f (lambda (x) (g x x))) (g (lambda (x y) (fx+ x y)))) (f 12))
# == annotate ==>
# (letrec ((f (code (x) (g) (g x x))) (g (code (x y) () (fx+ x y)))) (f 12))
# == transform ==>

#|
(codes ((f53 (code (x) (g) (g x x)))
        (f52 (code (x y) () (fx+ x y))))
 (letrec ((f (closure f53 g))
          (g (closure f52)))
  (f 12)))
|#

# emit-codes expr=(codes ((f53 (code (x) (g) (g x x))) (f52 (code (x y) () (fx+ x y)))) (letrec ((f (closure f53 g)) (g (closure f52))) (f 12)))
#  bindings=((f53 (code (x) (g) (g x x))) (f52 (code (x y) () (fx+ x y))))
#  lvars=(f53 f52)
#  codes=((code (x) (g) (g x x)) (code (x y) () (fx+ x y)))
#  labels=("_L_97" "_L_96")
#  env=((f53 . "_L_97") (f52 . "_L_96"))
#  ---- >>>>> emit-codes start ----
# emit-code (code (x) (g) (g x x))
    .text
    .align 4,0x90
    .globl _L_97
_L_97:
# fmls = (x)
# frev = (g)
# body = ((g x x))
# env  = ((g . 4) (f53 . "_L_97") (f52 . "_L_96"))
# tail-begin body=((g x x))
# funcall
#  si   =-8
#  env  = ((x . -4) (g . 4) (f53 . "_L_97") (f52 . "_L_96"))
#  expr = (funcall g x x)   <<<--- this repeated variable is odd
    movl -4(%esp), %eax
    mov %eax, -16(%esp)    # arg
    movl -4(%esp), %eax
    mov %eax, -20(%esp)    # arg
    movl 2(%edi), %eax
    movl %edi, -8(%esp)
    movl %eax, %edi
    add $-8, %esp    # adjust base
     call *-2(%edi)    # <<-------------- BLOWS UP HERE - EXC_BAD_ACCESS  addr 0xfffffffe
    add $8, %esp    # adjust base
    movl -8(%esp), %edi
# tail-begin body=()
    ret
    ret   # from lambda
# emit-code (code (x y) () (fx+ x y))
    .text
    .align 4,0x90
    .globl _L_96
_L_96:
# fmls = (x y)
# frev = ()
# body = ((fx+ x y))
# env  = ((f53 . "_L_97") (f52 . "_L_96"))
# tail-begin body=((fx+ x y))
    movl -8(%esp), %eax
    movl %eax, -12(%esp)  # fx+ push arg1
    movl -4(%esp), %eax
    addl -12(%esp), %eax  # fx+ arg1 arg2
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
#  env  = ((f53 . "_L_97") (f52 . "_L_96"))
#  bindings = ((f (closure f53 g)) (g (closure f52)))
#  body = (begin (f 12))
# closure
#  si   =-4
#  env  =((f53 . "_L_97") (f52 . "_L_96"))
#  expr =(closure f53 g)   <<------- Problem might be I need to initialize a closure variable in the frame.
   movl $_L_97, 0(%ebp)  # closure label
   movl %ebp, %eax    # return base ptr
   add $2, %eax      # closure tag
   add $8, %ebp      # bump ebp
    movl %eax, -4(%esp)
# closure
#  si   =-8
#  env  =((f53 . "_L_97") (f52 . "_L_96"))
#  expr =(closure f52)
   movl $_L_96, 0(%ebp)  # closure label
   movl %ebp, %eax    # return base ptr
   add $2, %eax      # closure tag
   add $8, %ebp      # bump ebp
    movl %eax, -8(%esp)
# emit-begin
#   body=((f 12))
#   env=((g . -8) (f . -4) (f53 . "_L_97") (f52 . "_L_96"))
# funcall
#  si   =-12
#  env  = ((g . -8) (f . -4) (f53 . "_L_97") (f52 . "_L_96"))
#  expr = (funcall f 12)
    movl $48, %eax     # immed 12
    mov %eax, -20(%esp)    # arg
    movl -4(%esp), %eax
    movl %edi, -12(%esp)
    movl %eax, %edi
    add $-12, %esp    # adjust base
     call *-2(%edi)
    add $12, %esp    # adjust base
    movl -12(%esp), %edi
# emit-begin
#   body=()
#   env=((g . -8) (f . -4) (f53 . "_L_97") (f52 . "_L_96"))
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
