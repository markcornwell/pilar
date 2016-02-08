
echo "(test-all)" | petite compil.scm | tee tests.out
Petite Chez Scheme Version 8.4
Copyright (c) 1985-2011 Cadence Research Systems

> Performing nontail apply tests ...
test 0:(let ((f (lambda () 12))) (fx+ (apply f (quote ())) 1)) ... ok
test 1:(let ((f (lambda (x) (fx+ x 12)))) (fx+ (apply f 13 (quote ())) 1)) ... ok
test 2:(let ((f (lambda (x) (fx+ x 12)))) (fx+ (apply f (cons 13 (quote ()))) 1)) ...sh: line 1:  1131 Segmentation fault: 11  ./stst >&stst.out
Exception in execute: produced program exited abnormally

yahweh:pilar mark$ cat pgm.s
# (let ((f (lambda (x) (fx+ x 12)))) (fx+ (apply f (cons 13 (quote ()))) 1))
# == explicit-begins  ==>
# (let ((f (lambda (x) (fx+ x 12)))) (fx+ (apply f (cons 13 (quote ()))) 1))
# == eliminate-let*  ==>
# (let ((f (lambda (x) (fx+ x 12)))) (fx+ (apply f (cons 13 (quote ()))) 1))
# == uniquify-variables  ==>
# (let ((f309 (lambda (f310) (fx+ f310 12)))) (fx+ (apply f309 (cons 13 (quote ()))) 1))
# == vectorize-letrec  ==>
# (let ((f309 (lambda (f310) (fx+ f310 12)))) (fx+ (apply f309 (cons 13 (quote ()))) 1))
# == eliminate-set!  ==>
# (let ((f309 (lambda (f310) (let ((f310 f310)) (fx+ f310 12))))) (fx+ (apply f309 (cons 13 (quote ()))) 1))
# == close-free-variables  ==>
# (let ((f309 (closure (f310) () (let ((f310 f310)) (fx+ f310 12))))) (fx+ (apply f309 (cons 13 (quote ()))) 1))
# == eliminate-quote  ==>
# (let ((f309 (closure (f310) () (let ((f310 f310)) (fx+ f310 12))))) (fx+ (apply f309 (cons 13 ())) 1))
# == eliminate-when/unless  ==>
# (let ((f309 (closure (f310) () (let ((f310 f310)) (fx+ f310 12))))) (fx+ (apply f309 (cons 13 ())) 1))
# == eliminate-cond  ==>
# (let ((f309 (closure (f310) () (let ((f310 f310)) (fx+ f310 12))))) (fx+ (apply f309 (cons 13 ())) 1))
# == external-symbols  ==>
# (let ((f309 (closure (f310) () (let ((f310 f310)) (fx+ f310 12))))) (fx+ (apply f309 (cons 13 ())) 1))
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
# emit-expr (let ((f309 (closure (f310) () (let ((f310 f310)) (fx+ f310 12))))) (fx+ (apply f309 (cons 13 ())) 1))
# emit-let
#  si   = -8
#  env  = ()
#  bindings = ((f309 (closure (f310) () (let ((f310 f310)) (fx+ f310 12)))))
#  body = (fx+ (apply f309 (cons 13 ())) 1)
# emit-expr (closure (f310) () (let ((f310 f310)) (fx+ f310 12)))
# emit-closure
# si = -8
# env = ()
# expr = (closure (f310) () (let ((f310 f310)) (fx+ f310 12)))
    movl $_L_2508, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_2509            # jump around closure body
_L_2508:
# check argument count
    cmp $4,%eax
    je _L_2510
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_2510:
# emit-tail-expr
# si=-12
# env=((f310 . -8))
# expr=(let ((f310 f310)) (fx+ f310 12))
# emit-tail-let
#  si   = -12
#  env  = ((f310 . -8))
#  bindings = ((f310 f310))
#  body = (fx+ f310 12)
# emit-expr f310
# emit-variable-ref
# env=((f310 . -8))
# var=f310
    movl -8(%esp), %eax  # stack load f310
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f310 . -12) (f310 . -8))
# expr=(fx+ f310 12)
# tail primcall
# emit-expr 12
    movl $48, %eax     # immed 12
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2511"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2511:
    movl %eax, -16(%esp)  # fx+ push arg1
# emit-expr f310
# emit-variable-ref
# env=((f310 . -12) (f310 . -8))
# var=f310
    movl -12(%esp), %eax  # stack load f310
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2512"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2512:
    addl -16(%esp), %eax  # fx+ arg1 arg2
#return from tail (fx+ f310 12)
    ret
    .align 4,0x90
_L_2509:
    movl %eax, -8(%esp)  # stack save
# emit-expr (fx+ (apply f309 (cons 13 ())) 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2513"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2513:
    movl %eax, -12(%esp)  # fx+ push arg1
# emit-expr (apply f309 (cons 13 ()))
# apply
#    si   =-16
#    env  = ((f309 . -8))
#    expr = (apply f309 (cons 13 ()))
# emit-expr f309
# emit-variable-ref
# env=((f309 . -8))
# var=f309
    movl -8(%esp), %eax  # stack load f309
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_2514"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2514":
   movl %eax,  -24(%esp)  # stash funcall-oper in closure slot
# emit-expr (cons 13 ())
# cons arg1=13 arg2=()
# emit-expr 13
    movl $52, %eax     # immed 13
    movl %eax, -28(%esp)
# emit-expr ()
    movl $63, %eax     # immed ()
    movl %eax, 4(%ebp)
    movl -28(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
# push apply args list onto the stack
    lea  -28(%esp),%esi
_L_2515: # while eax<>null? 
    cmp  $63,%eax
    je _L_2516
    movl -1(%eax),%ebx
    movl %ebx,(%esi)
    subl $4,%esi
    movl -1(%eax),%eax
    movl 4(%eax), %eax   ;; <<<---- BLOWS HERE
    jmp _L_2515
_L_2516:
    movl -24(%esp), %edi   # load new closure to %edi
    add $-16, %esp   # adjust base
# save argument count in eax <- esp-esi-8  bottom of frame
    movl %esp,%eax
    subl %esi,%eax
    subl $12,%eax
    call *-2(%edi)        # call thru closure ptr
    add $16, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_2517"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_2517:
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
yahweh:pilar mark$ 
