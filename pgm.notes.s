# (let ((n 12)) (let ((f (lambda () n))) (f)))
# == annotate ==>
# (let ((n 12)) (let ((f (code () (n) n))) (f)))
# == transform ==>
#|
(codes ((f27 (code () (n) n)))
 (let ((n 12))
  (let ((f (closure f27 n)))   <<--- when we create the closure, do we need to copy in the value of n ???
   (f))))
|#
# emit-codes expr=(codes ((f27 (code () (n) n))) (let ((n 12)) (let ((f (closure f27 n))) (f))))
#  bindings=((f27 (code () (n) n)))
#  lvars=(f27)
#  codes=((code () (n) n))
#  labels=("_L_33")
#  env=((f27 . "_L_33"))
#  ---- >>>>> emit-codes start ----
# emit-code (code () (n) n)
    .text
    .align 4,0x90
    .globl _L_33
_L_33:
# fmls = ()
# frev = (n)
# body = (n)
# env  = ((n . 4) (f27 . "_L_33"))    <<------- in this env we have (n . 4) residing in a closure frame
# tail-begin body=(n)
    movl 2(%edi), %eax   #  <<------- 4 + -2 = 2 where n lives in the closure frame
# tail-begin body=()
    ret          # <<------------------- these 2 ret statements are annoying; 
    ret   # from lambda   <<------------ is from lambda on always redundant???
#  ---- <<<<< emit-codes end ------
    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
# emit-let
#  si   = -4
#  env  = ((f27 . "_L_33"))
#  bindings = ((n 12))
#  body = (begin (let ((f (closure f27 n))) (f)))
    movl $48, %eax     # immed 12
    movl %eax, -4(%esp)
# emit-begin
#   body=((let ((f (closure f27 n))) (f)))
#   env=((n . -4) (f27 . "_L_33"))
# emit-let
#  si   = -8
#  env  = ((n . -4) (f27 . "_L_33"))     <<---- whoever passed env to let decided to put n at -4
#  bindings = ((f (closure f27 n)))
#  body = (begin (f))
# closure
#  si   =-8
#  env  =((n . -4) (f27 . "_L_33"))
#  expr =(closure f27 n)
   movl $_L_33, 0(%ebp)  # closure label  <<----- looks like we need to copy (n . -4) value to free-var1 slot right after this!
   movl %ebp, %eax    # return base ptr
   add $2, %eax      # closure tag
   add $8, %ebp      # bump ebp
    movl %eax, -8(%esp)
# emit-begin
#   body=((f))
#   env=((f . -8) (n . -4) (f27 . "_L_33"))  ;; <<------- who put (n . -4) into the environment???
# funcall
#  si   =-12
#  env  = ((f . -8) (n . -4) (f27 . "_L_33"))
#  expr = (funcall f)
    movl -8(%esp), %eax
    movl %edi, -12(%esp)
    movl %eax, %edi
    add $-12, %esp    # adjust base
     call *-2(%edi)
    add $12, %esp    # adjust base
    movl -12(%esp), %edi
# emit-begin
#   body=()
#   env=((f . -8) (n . -4) (f27 . "_L_33"))
# emit-begin
#   body=()
#   env=((n . -4) (f27 . "_L_33"))   <------ I see n at -4 instead of in the closure where it should be; WTF???
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
