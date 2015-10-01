# (let ((f (lambda () 12))) (f))
# == annotate ==>
# (let ((f (code () () 12))) (f))
# == transform ==>

# (codes ((f7 (code () () 12))) (let ((f (closure f7))) (f)))

# emit-codes expr=(codes ((f7 (code () () 12))) (let ((f (closure f7))) (f)))
#  bindings=((f7 (code () () 12)))
#  lvars=(f7)
#  codes=((code () () 12))
#  labels=("_L_7")
#  env=((f7 . "_L_7"))
#  ---- >>>>> emit-codes start ----
# emit-code (code () () 12)
    .text
    .align 4,0x90
    .globl _L_7
_L_7:
# fmls = ()
# frev = ()
# body = (12)
# env  = ((f7 . "_L_7"))
# tail-begin body=(12)
    movl $48, %eax     # immed 12
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
#  env  = ((f7 . "_L_7"))
#  bindings = ((f (closure f7)))
#  body = (begin (f))
   movl $_L_7, 0(%ebp)
   movl %ebp, %eax
   add $2, %eax
   add $8, %ebp
    movl %eax, -4(%esp)
# emit-begin
#   body=((f))
#   env=((f . -4) (f7 . "_L_7"))
    movl %edi, -8(%esp)
    lea -16(%esp), %edi
    lea -8(%esp), %esp    # adjust base
    call *-6(%edi)
    lea 8(%esp), %esp    # adjust base
    movl -8(%esp), %edi
# emit-begin
#   body=()
#   env=((f . -4) (f7 . "_L_7"))
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
