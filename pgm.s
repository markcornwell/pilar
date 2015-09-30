# (let ((f (lambda () 12))) (f))

# =>

# (codes ((f7 (code () () 12)) (f6 (code (x) () x)) (f5 (code (x) () x)) (f4 (code (x) () x)) (f3 (code (x) () x)) (f2 (code (x) () x)) (f1 (code (x) () x)) (f0 (code (x) () x))) (let ((f (closure f7))) (f)))

# emit-codes expr=(codes ((f7 (code () () 12)) (f6 (code (x) () x)) (f5 (code (x) () x)) (f4 (code (x) () x)) (f3 (code (x) () x)) (f2 (code (x) () x)) (f1 (code (x) () x)) (f0 (code (x) () x))) (let ((f (closure f7))) (f)))
#  bindings=((f7 (code () () 12)) (f6 (code (x) () x)) (f5 (code (x) () x)) (f4 (code (x) () x)) (f3 (code (x) () x)) (f2 (code (x) () x)) (f1 (code (x) () x)) (f0 (code (x) () x)))
#  lvars=(f7 f6 f5 f4 f3 f2 f1 f0)
#  codes=((code () () 12) (code (x) () x) (code (x) () x) (code (x) () x) (code (x) () x) (code (x) () x) (code (x) () x) (code (x) () x))
#  labels=("_L_49" "_L_48" "_L_47" "_L_46" "_L_45" "_L_44" "_L_43" "_L_42")
#  env=((f7 . "_L_49") (f6 . "_L_48") (f5 . "_L_47") (f4 . "_L_46") (f3 . "_L_45") (f2 . "_L_44") (f1 . "_L_43") (f0 . "_L_42"))
#  ---- >>>>> emit-codes start ----
# emit-code (code () () 12)
    .text
    .align 4,0x90
    .globl _L_49
_L_49:
# fmls = ()
# frev = ()
# body = (12)
# env  = ((f7 . "_L_49") (f6 . "_L_48") (f5 . "_L_47") (f4 . "_L_46") (f3 . "_L_45") (f2 . "_L_44") (f1 . "_L_43") (f0 . "_L_42"))
# tail-begin body=(12)
    movl $48, %eax     # immed 12
# tail-begin body=()
    ret
    ret   # from lambda
# emit-code (code (x) () x)
    .text
    .align 4,0x90
    .globl _L_48
_L_48:
# fmls = (x)
# frev = ()
# body = (x)
# env  = ((f7 . "_L_49") (f6 . "_L_48") (f5 . "_L_47") (f4 . "_L_46") (f3 . "_L_45") (f2 . "_L_44") (f1 . "_L_43") (f0 . "_L_42"))
# tail-begin body=(x)
    movl -4(%esp), %eax
# tail-begin body=()
    ret
    ret   # from lambda
# emit-code (code (x) () x)
    .text
    .align 4,0x90
    .globl _L_47
_L_47:
# fmls = (x)
# frev = ()
# body = (x)
# env  = ((f7 . "_L_49") (f6 . "_L_48") (f5 . "_L_47") (f4 . "_L_46") (f3 . "_L_45") (f2 . "_L_44") (f1 . "_L_43") (f0 . "_L_42"))
# tail-begin body=(x)
    movl -4(%esp), %eax
# tail-begin body=()
    ret
    ret   # from lambda
# emit-code (code (x) () x)
    .text
    .align 4,0x90
    .globl _L_46
_L_46:
# fmls = (x)
# frev = ()
# body = (x)
# env  = ((f7 . "_L_49") (f6 . "_L_48") (f5 . "_L_47") (f4 . "_L_46") (f3 . "_L_45") (f2 . "_L_44") (f1 . "_L_43") (f0 . "_L_42"))
# tail-begin body=(x)
    movl -4(%esp), %eax
# tail-begin body=()
    ret
    ret   # from lambda
# emit-code (code (x) () x)
    .text
    .align 4,0x90
    .globl _L_45
_L_45:
# fmls = (x)
# frev = ()
# body = (x)
# env  = ((f7 . "_L_49") (f6 . "_L_48") (f5 . "_L_47") (f4 . "_L_46") (f3 . "_L_45") (f2 . "_L_44") (f1 . "_L_43") (f0 . "_L_42"))
# tail-begin body=(x)
    movl -4(%esp), %eax
# tail-begin body=()
    ret
    ret   # from lambda
# emit-code (code (x) () x)
    .text
    .align 4,0x90
    .globl _L_44
_L_44:
# fmls = (x)
# frev = ()
# body = (x)
# env  = ((f7 . "_L_49") (f6 . "_L_48") (f5 . "_L_47") (f4 . "_L_46") (f3 . "_L_45") (f2 . "_L_44") (f1 . "_L_43") (f0 . "_L_42"))
# tail-begin body=(x)
    movl -4(%esp), %eax
# tail-begin body=()
    ret
    ret   # from lambda
# emit-code (code (x) () x)
    .text
    .align 4,0x90
    .globl _L_43
_L_43:
# fmls = (x)
# frev = ()
# body = (x)
# env  = ((f7 . "_L_49") (f6 . "_L_48") (f5 . "_L_47") (f4 . "_L_46") (f3 . "_L_45") (f2 . "_L_44") (f1 . "_L_43") (f0 . "_L_42"))
# tail-begin body=(x)
    movl -4(%esp), %eax
# tail-begin body=()
    ret
    ret   # from lambda
# emit-code (code (x) () x)
    .text
    .align 4,0x90
    .globl _L_42
_L_42:
# fmls = (x)
# frev = ()
# body = (x)
# env  = ((f7 . "_L_49") (f6 . "_L_48") (f5 . "_L_47") (f4 . "_L_46") (f3 . "_L_45") (f2 . "_L_44") (f1 . "_L_43") (f0 . "_L_42"))
# tail-begin body=(x)
    movl -4(%esp), %eax
# tail-begin body=()
    ret
    ret   # from lambda
#  ---- <<<<< emit-codes end ------
    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
   movl $_L_49, 0(%ebp)
   movl %ebp, %eax
   add $2, %eax
   add $8, %ebp
    movl %eax, -4(%esp)
# begin body=((f))
#       env=((f . -4) (f7 . "_L_49") (f6 . "_L_48") (f5 . "_L_47") (f4 . "_L_46") (f3 . "_L_45") (f2 . "_L_44") (f1 . "_L_43") (f0 . "_L_42"))
