# (begin (write (quote (1 2 3))) (exit))
# == explicit-begins  ==>
# (begin (write (quote (1 2 3))) (exit))
# == eliminate-let*  ==>
# (begin (write (quote (1 2 3))) (exit))
# == uniquify-variables  ==>
# (begin (write (quote (1 2 3))) (exit))
# == vectorize-letrec  ==>
# (begin (write (quote (1 2 3))) (exit))
# == eliminate-set!  ==>
# (begin (write (quote (1 2 3))) (exit))
# == close-free-variables  ==>
# (begin (write (quote (1 2 3))) (exit))
# == eliminate-quote  ==>
# (begin (write (cons 1 (cons 2 (cons 3 ())))) (exit))
# == eliminate-when/unless  ==>
# (begin (write (cons 1 (cons 2 (cons 3 ())))) (exit))
# == eliminate-cond  ==>
# (begin (write (cons 1 (cons 2 (cons 3 ())))) (exit))
# == external-symbols  ==>
# (begin ((primitive-ref write) (cons 1 (cons 2 (cons 3 ())))) ((primitive-ref exit)))
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
# emit-expr (begin ((primitive-ref write) (cons 1 (cons 2 (cons 3 ())))) ((primitive-ref exit)))
# emit-begin
#   expr=(begin ((primitive-ref write) (cons 1 (cons 2 (cons 3 ())))) ((primitive-ref exit)))
#   env=()
# emit-expr ((primitive-ref write) (cons 1 (cons 2 (cons 3 ()))))
# funcall
#    si   =-8
#    env  = ()
#    expr = (funcall (primitive-ref write) (cons 1 (cons 2 (cons 3 ()))))
# emit-expr (primitive-ref write)
    .extern write
    movl write,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33427"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33427":
   movl %eax,  -16(%esp)  # stash funcall-oper in closure slot
# emit-expr (cons 1 (cons 2 (cons 3 ())))
# cons arg1=1 arg2=(cons 2 (cons 3 ()))
# emit-expr 1
    movl $4, %eax     # immed 1
    movl %eax, -20(%esp)
# emit-expr (cons 2 (cons 3 ()))
# cons arg1=2 arg2=(cons 3 ())
# emit-expr 2
    movl $8, %eax     # immed 2
    movl %eax, -24(%esp)
# emit-expr (cons 3 ())
# cons arg1=3 arg2=()
# emit-expr 3
    movl $12, %eax     # immed 3
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
    movl %eax, 4(%ebp)
    movl -24(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl %eax, 4(%ebp)
    movl -20(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    mov %eax, -20(%esp)  # arg (cons 1 (cons 2 (cons 3 ())))
    movl -16(%esp), %edi   # load new closure to %edi
    add $-8, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $8, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-expr (begin ((primitive-ref exit)))
# emit-begin
#   expr=(begin ((primitive-ref exit)))
#   env=()
# emit-expr ((primitive-ref exit))
# funcall
#    si   =-8
#    env  = ()
#    expr = (funcall (primitive-ref exit))
# emit-expr (primitive-ref exit)
    .extern exit
    movl exit,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33428"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33428":
   movl %eax,  -16(%esp)  # stash funcall-oper in closure slot
    movl -16(%esp), %edi   # load new closure to %edi
    add $-8, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $8, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=()
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
