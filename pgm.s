# (let ((f (lambda args 12))) (f))
# == explicit-begins  ==>
# (let ((f (lambda args 12))) (f))
# == eliminate-let*  ==>
# (let ((f (lambda args 12))) (f))
# == eliminate-shadowing  ==>
# (let ((f (lambda args 12))) (f))
# == vectorize-letrec  ==>
# (let ((f (lambda args 12))) (f))
# == eliminate-set!  ==>
# (let ((f (lambda args (let () 12)))) (f))
# == close-free-variables  ==>
# (let ((f (closure args () (let () 12)))) (f))
# == eliminate-quote  ==>
# (let ((f (closure args () (let () 12)))) (f))
# == eliminate-when/unless  ==>
# (let ((f (closure args () (let () 12)))) (f))
# == eliminate-cond  ==>
# (let ((f (closure args () (let () 12)))) (f))
# == external-symbols  ==>
# (let ((f (closure args () (let () 12)))) (f))
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
# emit-expr (let ((f (closure args () (let () 12)))) (f))
# emit-let
#  si   = -8
#  env  = ()
#  bindings = ((f (closure args () (let () 12))))
#  body = (f)
# emit-expr (closure args () (let () 12))
# emit-closure
# si = -8
# env = ()
# expr = (closure args () (let () 12))
    movl $_L_2320, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_2321            # jump around closure body
_L_2320:
# check argument count
    cmp $0,%eax
    jge _L_2322
# invoke error handler eh_argcount_min
    .extern eh$uargcount$umin
    movl eh$uargcount$umin, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_2322:
# emit-build-varargs-list
    movl $63, %esi       # args <- () 
    lea -8(%eax),%edi    # edi <- exp-8-eax
    subl %esp, %edi
_L_2324:
    lea -8(%esp),%ebx
    cmp %edi, %ebx       # while edi <> esp-si
    je _L_2323
    movl (%edi),%ebx     # arg i -> car
    movl %ebx, 0(%ebp)
    movl %esi, 4(%ebp)  # esi -> cdr
    movl %ebp, %esi
    addl $1, %esi       # bump heap ptr
    addl $8,%ebp
    subl $4,%edi
    jmp _L_2324
_L_2323:
    movl %esi, -8(%esp)  # set args
# emit-tail-expr
# si=-12
# env=((args . -8))
# expr=(let () 12)
# emit-tail-let
#  si   = -12
#  env  = ((args . -8))
#  bindings = ()
#  body = 12
# emit-tail-expr
# si=-12
# env=((args . -8))
# expr=12
    movl $48, %eax     # immed 12
    ret                  # immediate tail return
    .align 4,0x90
_L_2321:
    movl %eax, -8(%esp)  # stack save
# emit-expr (f)
# funcall
#    si   =-12
#    env  = ((f . -8))
#    expr = (funcall f)
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
    je "_L_2325"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_2325":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $0,%eax   # save arg count
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
