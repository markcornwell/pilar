# (let ((f (lambda args 12))) (f 10))
# == explicit-begins  ==>
# (let ((f (lambda args 12))) (f 10))
# == eliminate-let*  ==>
# (let ((f (lambda args 12))) (f 10))
# == eliminate-shadowing  ==>
# (let ((f (lambda args 12))) (f 10))
# == vectorize-letrec  ==>
# (let ((f (lambda args 12))) (f 10))
# == eliminate-set!  ==>
# (let ((f (lambda args (let () 12)))) (f 10))
# == close-free-variables  ==>
# (let ((f (closure args () (let () 12)))) (f 10))
# == eliminate-quote  ==>
# (let ((f (closure args () (let () 12)))) (f 10))
# == eliminate-when/unless  ==>
# (let ((f (closure args () (let () 12)))) (f 10))
# == eliminate-cond  ==>
# (let ((f (closure args () (let () 12)))) (f 10))
# == external-symbols  ==>
# (let ((f (closure args () (let () 12)))) (f 10))
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
# emit-expr (let ((f (closure args () (let () 12)))) (f 10))
# emit-let
#  si   = -8
#  env  = ()
#  bindings = ((f (closure args () (let () 12))))
#  body = (f 10)
# emit-expr (closure args () (let () 12))
# emit-closure
# si = -8
# env = ()
# expr = (closure args () (let () 12))
    movl $_L_3099, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_3100            # jump around closure body
_L_3099:
# check argument count
    cmp $0,%eax
    jge _L_3101
# invoke error handler eh_argcount_min
    .extern eh$uargcount$umin
    movl eh$uargcount$umin, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_3101:
# emit-build-varargs-list
    movl $63, %esi       # args <- () 
    lea -4(%esp),%edi    # edi <- esp-4
    subl %eax, %edi      # edi <- esp-4-eax    addr of arg[K+N] on stack
_L_3103:
    lea -4(%esp),%ebx    # addr of arg[K] on stack
    cmp %edi, %ebx       # while edi <> esp+(si+4)
    je _L_3102
    movl (%edi),%ebx     # arg i -> car     <<<------
    movl %ebx, 0(%ebp)
    movl %esi, 4(%ebp)  # esi -> cdr
    movl %ebp, %esi
    addl $1, %esi       # tag as pair
    addl $8,%ebp         # bump heap ptr
    subl $4,%edi         # move to next previous arg from the end
    jmp _L_3103
_L_3102:
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
_L_3100:
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
    je "_L_3104"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_3104":
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
