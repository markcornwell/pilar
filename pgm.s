# (letrec ((f (lambda (x) (g x x))) (g (lambda (x y) (fx+ x y)))) (f 12))
# == transform-toplevel-defs ==>
# (letrec ((f (lambda (x) (g x x))) (g (lambda (x y) (fx+ x y)))) (f 12))
# == transform-letrecs-to-lets ==>
# (let ((f #f) (g #f)) (set! f (lambda (x) (g x x))) (set! g (lambda (x y) (fx+ x y))) beging (f 12))
# == transform-lets-to-lambdas ==>
# ((lambda (f g) (begin (set! f (lambda (x) (g x x))) (set! g (lambda (x y) (fx+ x y))) beging (f 12))) #f #f)
# == transform-variables-to-unique-names ==>
# ((lambda (f.256 g.255) (begin (set! f.256 (lambda (x.257) (g.255 x.257 x.257))) (set! g.255 (lambda (x.259 y.258) (fx+ x.259 y.258))) beging (f.256 12))) #f #f)
# == annotate ==>
# ((code (f.256 g.255) (beging) (begin (set! f.256 (code (x.257) (g.255) (g.255 x.257 x.257))) (set! g.255 (code (x.259 y.258) () (fx+ x.259 y.258))) beging (f.256 12))) #f #f)
# == transform ==>

# (codes ((f237 (code (f.256 g.255) (beging) (begin (set! f.256 (closure f238 g.255)) (set! g.255 (closure f239)) beging (f.256 12)))) (f239 (code (x.259 y.258) () (fx+ x.259 y.258))) (f238 (code (x.257) (g.255) (g.255 x.257 x.257)))) ((closure f237 beging) #f #f))

# emit-codes expr=(codes ((f237 (code (f.256 g.255) (beging) (begin (set! f.256 (closure f238 g.255)) (set! g.255 (closure f239)) beging (f.256 12)))) (f239 (code (x.259 y.258) () (fx+ x.259 y.258))) (f238 (code (x.257) (g.255) (g.255 x.257 x.257)))) ((closure f237 beging) #f #f))
#  bindings=((f237 (code (f.256 g.255) (beging) (begin (set! f.256 (closure f238 g.255)) (set! g.255 (closure f239)) beging (f.256 12)))) (f239 (code (x.259 y.258) () (fx+ x.259 y.258))) (f238 (code (x.257) (g.255) (g.255 x.257 x.257))))
#  lvars=(f237 f239 f238)
#  codes=((code (f.256 g.255) (beging) (begin (set! f.256 (closure f238 g.255)) (set! g.255 (closure f239)) beging (f.256 12))) (code (x.259 y.258) () (fx+ x.259 y.258)) (code (x.257) (g.255) (g.255 x.257 x.257)))
#  labels=("_L_283" "_L_282" "_L_281")
#  env=((f237 . "_L_283") (f239 . "_L_282") (f238 . "_L_281"))
#  ---- >>>>> emit-codes start ----
# emit-code (code (f.256 g.255) (beging) (begin (set! f.256 (closure f238 g.255)) (set! g.255 (closure f239)) beging (f.256 12)))
    .text
    .align 4,0x90
    .globl _L_283
_L_283:
# fmls = (f.256 g.255)
# frev = (beging)
# body = ((begin (set! f.256 (closure f238 g.255)) (set! g.255 (closure f239)) beging (f.256 12)))
# env  = ((beging . 4) (f237 . "_L_283") (f239 . "_L_282") (f238 . "_L_281"))
# tail-begin body=((begin (set! f.256 (closure f238 g.255)) (set! g.255 (closure f239)) beging (f.256 12)))
# emit-begin
#   body=((set! f.256 (closure f238 g.255)) (set! g.255 (closure f239)) beging (f.256 12))
#   env=((g.255 . -8) (f.256 . -4) (beging . 4) (f237 . "_L_283") (f239 . "_L_282") (f238 . "_L_281"))
# set!
   lea -4(%esp), %eax
movl %eax, -12(%esp)
# closure
#  si   =-20
#  env  =((g.255 . -8) (f.256 . -4) (beging . 4) (f237 . "_L_283") (f239 . "_L_282") (f238 . "_L_281"))
#  expr =(closure f238 g.255)
   movl $_L_281, 0(%ebp)  # closure label
    movl -8(%esp), %eax
   movl  %eax, 4(%ebp)
   movl %ebp, %eax    # return base ptr
   add $2, %eax      # closure tag
   add $8, %ebp      # bump ebp
movl -12(%esp), %ebx
movl %eax, 0(%ebx)
# emit-begin
#   body=((set! g.255 (closure f239)) beging (f.256 12))
#   env=((g.255 . -8) (f.256 . -4) (beging . 4) (f237 . "_L_283") (f239 . "_L_282") (f238 . "_L_281"))
# set!
   lea -8(%esp), %eax
movl %eax, -12(%esp)
# closure
#  si   =-20
#  env  =((g.255 . -8) (f.256 . -4) (beging . 4) (f237 . "_L_283") (f239 . "_L_282") (f238 . "_L_281"))
#  expr =(closure f239)
   movl $_L_282, 0(%ebp)  # closure label
   movl %ebp, %eax    # return base ptr
   add $2, %eax      # closure tag
   add $8, %ebp      # bump ebp
movl -12(%esp), %ebx
movl %eax, 0(%ebx)
# emit-begin
#   body=(beging (f.256 12))
#   env=((g.255 . -8) (f.256 . -4) (beging . 4) (f237 . "_L_283") (f239 . "_L_282") (f238 . "_L_281"))
    movl 2(%edi), %eax
# emit-begin
#   body=((f.256 12))
#   env=((g.255 . -8) (f.256 . -4) (beging . 4) (f237 . "_L_283") (f239 . "_L_282") (f238 . "_L_281"))
# funcall
#  si   =-12
#  env  = ((g.255 . -8) (f.256 . -4) (beging . 4) (f237 . "_L_283") (f239 . "_L_282") (f238 . "_L_281"))
#  expr = (funcall f.256 12)
    movl $48, %eax     # immed 12
    mov %eax, -20(%esp)    # arg 12
#  oper = f.256
    movl -4(%esp), %eax
    movl %edi, -12(%esp)
    movl %eax, %edi
    add $-12, %esp    # adjust base
     call *-2(%edi)
    add $12, %esp    # adjust base
    movl -12(%esp), %edi
# emit-begin
#   body=()
#   env=((g.255 . -8) (f.256 . -4) (beging . 4) (f237 . "_L_283") (f239 . "_L_282") (f238 . "_L_281"))
# tail-begin body=()
    ret
    ret   # from lambda
# emit-code (code (x.259 y.258) () (fx+ x.259 y.258))
    .text
    .align 4,0x90
    .globl _L_282
_L_282:
# fmls = (x.259 y.258)
# frev = ()
# body = ((fx+ x.259 y.258))
# env  = ((f237 . "_L_283") (f239 . "_L_282") (f238 . "_L_281"))
# tail-begin body=((fx+ x.259 y.258))
    movl -8(%esp), %eax
    movl %eax, -12(%esp)  # fx+ push arg1
    movl -4(%esp), %eax
    addl -12(%esp), %eax  # fx+ arg1 arg2
# tail-begin body=()
    ret
    ret   # from lambda
# emit-code (code (x.257) (g.255) (g.255 x.257 x.257))
    .text
    .align 4,0x90
    .globl _L_281
_L_281:
# fmls = (x.257)
# frev = (g.255)
# body = ((g.255 x.257 x.257))
# env  = ((g.255 . 4) (f237 . "_L_283") (f239 . "_L_282") (f238 . "_L_281"))
# tail-begin body=((g.255 x.257 x.257))
# funcall
#  si   =-8
#  env  = ((x.257 . -4) (g.255 . 4) (f237 . "_L_283") (f239 . "_L_282") (f238 . "_L_281"))
#  expr = (funcall g.255 x.257 x.257)
    movl -4(%esp), %eax
    mov %eax, -16(%esp)    # arg x.257
    movl -4(%esp), %eax
    mov %eax, -20(%esp)    # arg x.257
#  oper = g.255
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
# funcall
#  si   =-4
#  env  = ((f237 . "_L_283") (f239 . "_L_282") (f238 . "_L_281"))
#  expr = (funcall (closure f237 beging) #f #f)
    movl $47, %eax     # immed #f
    mov %eax, -12(%esp)    # arg #f
    movl $47, %eax     # immed #f
    mov %eax, -16(%esp)    # arg #f
#  oper = (closure f237 beging)
# closure
#  si   =-20
#  env  =((f237 . "_L_283") (f239 . "_L_282") (f238 . "_L_281"))
#  expr =(closure f237 beging)
   movl $_L_283, 0(%ebp)  # closure label
   movl %ebp, %eax    # return base ptr
   add $2, %eax      # closure tag
   add $8, %ebp      # bump ebp
    movl %edi, -4(%esp)
    movl %eax, %edi
    add $-4, %esp    # adjust base
     call *-2(%edi)
    add $4, %esp    # adjust base
    movl -4(%esp), %edi
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
