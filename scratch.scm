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
# apply
#    si   =-16
#    env  = ((f102 . -8))
#    expr = (apply f102 ())
# emit-expr f102
# emit-variable-ref
# env=((f102 . -8))
# var=f102
    movl -8(%esp), %eax  # stack load f102
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_834"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_834":
   movl %eax,  -24(%esp)  # stash funcall-oper in closure slot
# emit-expr ()
    movl $63, %eax     # immed ()
# push apply args list onto the stack
    lea  -28(%esp),%esi
_L_835: # while eax<>null? 
    cmp  $63,%eax
    je _L_836
    movl -1(%eax),%ebx
    movl %ebx,(%esi)
    subl $4,%esi
    movl -1(%eax),%eax
    movl 4(%eax), %eax
    jmp _L_835
_L_836:
    movl -24(%esp), %edi   # load new closure to %edi
    add $-16, %esp   # adjust base
# save argument count in eax <- esp-esi-8  bottom of frame
    movl %esp,%eax
    subl %esi,%eax
    subl $8,%eax
    call *-2(%edi)        # call thru closure ptr
    add $16, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_837"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_837:
    addl -12(%esp), %eax  # fx+ arg1 arg2
    ret
    .text
    .align 16, 0x90
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
