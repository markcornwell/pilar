yahweh:pilar mark$ make
echo "(test-all)" | petite compil.scm | tee tests.out
Petite Chez Scheme Version 8.4
Copyright (c) 1985-2011 Cadence Research Systems

> Performing libary extensions tests ...
test 0:42 ... ok
test 1:(list-length (quote (1 2 3))) ... ok
Performing vararg not using rest argument tests ...
test 2:(let ((f (lambda args 12))) (f)) ... ok
test 3:(let ((f (lambda args 12))) (f 10)) ... ok
test 4:(let ((f (lambda args 12))) (f 10 20)) ... ok
test 5:(let ((f (lambda args 12))) (f 10 20 30)) ... ok
test 6:(let ((f (lambda args 12))) (f 10 20 30 40)) ... ok
test 7:(let ((f (lambda args 12))) (f 10 20 30 40 50)) ... ok
test 8:(let ((f (lambda args 12))) (f 10 20 30 40 50 60 70 80 90)) ... ok
test 9:(let ((f (lambda (a0 . args) 12))) (f 10)) ... ok
test 10:(let ((f (lambda (a0 . args) a0))) (f 10)) ... ok
test 11:(let ((f (lambda (a0 . args) 12))) (f 10 20)) ... ok
test 12:(let ((f (lambda (a0 . args) a0))) (f 10 20)) ... ok
test 13:(let ((f (lambda (a0 . args) 12))) (f 10 20 30)) ... ok
test 14:(let ((f (lambda (a0 . args) a0))) (f 10 20 30)) ... ok
test 15:(let ((f (lambda (a0 . args) 12))) (f 10 20 30 40)) ... ok
test 16:(let ((f (lambda (a0 . args) a0))) (f 10 20 30 40)) ... ok
Performing vararg using rest argument tests ...
test 17:(let ((f (lambda args args))) (f)) ... ok
test 18:(let ((f (lambda args args))) (f 10)) ...Exception in test: output mismatch for test 18, expected "(10)\n", got "(())\n"
> 
yahweh:pilar mark$ cat pgm.s
# (let ((f (lambda args args))) (f 10))
# == explicit-begins  ==>
# (let ((f (lambda args args))) (f 10))
# == eliminate-let*  ==>
# (let ((f (lambda args args))) (f 10))
# == eliminate-shadowing  ==>
# (let ((f (lambda args args))) (f 10))
# == vectorize-letrec  ==>
# (let ((f (lambda args args))) (f 10))
# == eliminate-set!  ==>
# (let ((f (lambda args (let () args)))) (f 10))
# == close-free-variables  ==>
# (let ((f (closure args () (let () args)))) (f 10))
# == eliminate-quote  ==>
# (let ((f (closure args () (let () args)))) (f 10))
# == eliminate-when/unless  ==>
# (let ((f (closure args () (let () args)))) (f 10))
# == eliminate-cond  ==>
# (let ((f (closure args () (let () args)))) (f 10))
# == external-symbols  ==>
# (let ((f (closure args () (let () args)))) (f 10))
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
# emit-expr (let ((f (closure args () (let () args)))) (f 10))
# emit-let
#  si   = -8
#  env  = ()
#  bindings = ((f (closure args () (let () args))))
#  body = (f 10)
# emit-expr (closure args () (let () args))
# emit-closure
# si = -8
# env = ()
# expr = (closure args () (let () args))
    movl $_L_14784, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_14785            # jump around closure body
_L_14784:
# check argument count
    cmp $0,%eax
    jge _L_14786
# invoke error handler eh_argcount_min
    .extern eh$uargcount$umin
    movl eh$uargcount$umin, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_14786:
# emit-build-varargs-list
    movl $63,-8(%esp) # args <- () 
_L_14788:
# while (eax > min number of formals)
    cmpl $0,%eax
    je _L_14787
# put args into cdr[new]
    movl -8(%esp),%ebx
    movl %ebx, 4(%ebp)
# put arg[eax] into car[new]
    movl %esp, %ebx
    subl %eax, %ebx
    subl $4, %ebx
    movl 0(%ebx), %ebx
    movl %ebx, 0(%ebp)
    movl %ebp, %ebx
    orl   $1, %ebx
    addl  $8, %ebp
# args <- new
    movl %ebx, -8(%esp)
# decrement eax
    subl $4, %eax
    jmp _L_14788
_L_14787:
# emit-tail-expr
# si=-12
# env=((args . -8))
# expr=(let () args)
# emit-tail-let
#  si   = -12
#  env  = ((args . -8))
#  bindings = ()
#  body = args
# emit-tail-expr
# si=-12
# env=((args . -8))
# expr=args
# emit-tail-variable-ref
# emit-variable-ref
# env=((args . -8))
# var=args
    movl -8(%esp), %eax  # stack load args
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    .align 4,0x90
_L_14785:
    movl %eax, -8(%esp)  # stack save
# emit-expr (f 10)
# funcall
#    si   =-12
#    env  = ((f . -8))
#    expr = (funcall f 10)
# emit-expr f
# emit-variable-ref
# env=((f . -8))
# var=f
    movl -8(%esp), %eax  # stack load f
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_14789"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_14789":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr 10
    movl $40, %eax     # immed 10
    mov %eax, -24(%esp)  # arg 10
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
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
