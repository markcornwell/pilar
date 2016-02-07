# (let ((f (lambda () 12))) (fx+ (apply f (quote ())) 1))
# == explicit-begins  ==>
# (let ((f (lambda () 12))) (fx+ (apply f (quote ())) 1))
# == eliminate-let*  ==>
# (let ((f (lambda () 12))) (fx+ (apply f (quote ())) 1))
# == uniquify-variables  ==>
# (let ((f102 (lambda () 12))) (fx+ (apply f102 (quote ())) 1))
# == vectorize-letrec  ==>
# (let ((f102 (lambda () 12))) (fx+ (apply f102 (quote ())) 1))
# == eliminate-set!  ==>
# (let ((f102 (lambda () (let () 12)))) (fx+ (apply f102 (quote ())) 1))
# == close-free-variables  ==>
# (let ((f102 (closure () () (let () 12)))) (fx+ (apply f102 (quote ())) 1))
# == eliminate-quote  ==>
# (let ((f102 (closure () () (let () 12)))) (fx+ (apply f102 ()) 1))
# == eliminate-when/unless  ==>
# (let ((f102 (closure () () (let () 12)))) (fx+ (apply f102 ()) 1))
# == eliminate-cond  ==>
# (let ((f102 (closure () () (let () 12)))) (fx+ (apply f102 ()) 1))
# == external-symbols  ==>
# (let ((f102 (closure () () (let () 12)))) (fx+ (apply f102 ()) 1))
# emit-scheme-entry
    .text
    .align 16, 0x90
    .globl _L_scheme_entry
_L_scheme_entry:
    movl $0, %edi  # dummy for debugging
    .global base_init_callback
    .extern base_init
    addl $-4,%esp
    jmp base_init
base_init_callback:
    addl $4,%esp
# emit-expr (let ((f102 (closure () () (let () 12)))) (fx+ (apply f102 ()) 1))
# emit-let
#  si   = -8
#  env  = ()
#  bindings = ((f102 (closure () () (let () 12))))
#  body = (fx+ (apply f102 ()) 1)
# emit-expr (closure () () (let () 12))
# emit-closure
# si = -8
# env = ()
# expr = (closure () () (let () 12))
    movl $_L_830, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_831            # jump around closure body
_L_830:
# check argument count
    cmp $0,%eax
    je _L_832
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_832:
# emit-tail-expr
# si=-8
# env=()
# expr=(let () 12)
# emit-tail-let
#  si   = -8
#  env  = ()
#  bindings = ()
#  body = 12
# emit-tail-expr
# si=-8
# env=()
# expr=12
    movl $48, %eax     # immed 12
    ret                  # immediate tail return
    .align 4,0x90
_L_831:
    movl %eax, -8(%esp)  # stack save
# emit-expr (fx+ (apply f102 ()) 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_833"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_833:
    movl %eax, -12(%esp)  # fx+ push arg1
# emit-expr (apply f102 ())
# funcall
#    si   =-16
#    env  = ((f102 . -8))
#    expr = (funcall apply f102 ())
# emit-expr apply
