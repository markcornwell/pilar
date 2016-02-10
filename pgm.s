# (let ((p (current-output-port))) (write-char #\w) (port-ndx p))
# == explicit-begins  ==>
# (let ((p (current-output-port))) (begin (write-char #\w) (port-ndx p)))
# == eliminate-let*  ==>
# (let ((p (current-output-port))) (begin (write-char #\w) (port-ndx p)))
# == uniquify-variables  ==>
# (let ((f8604 (current-output-port))) (begin (write-char #\w) (port-ndx f8604)))
# == vectorize-letrec  ==>
# (let ((f8604 (current-output-port))) (begin (write-char #\w) (port-ndx f8604)))
# == eliminate-set!  ==>
# (let ((f8604 (current-output-port))) (begin (write-char #\w) (port-ndx f8604)))
# == close-free-variables  ==>
# (let ((f8604 (current-output-port))) (begin (write-char #\w) (port-ndx f8604)))
# == eliminate-quote  ==>
# (let ((f8604 (current-output-port))) (begin (write-char #\w) (port-ndx f8604)))
# == eliminate-when/unless  ==>
# (let ((f8604 (current-output-port))) (begin (write-char #\w) (port-ndx f8604)))
# == eliminate-cond  ==>
# (let ((f8604 (current-output-port))) (begin (write-char #\w) (port-ndx f8604)))
# == external-symbols  ==>
# (let ((f8604 ((primitive-ref current-output-port)))) (begin ((primitive-ref write-char) #\w) ((primitive-ref port-ndx) f8604)))
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
# emit-expr (let ((f8604 ((primitive-ref current-output-port)))) (begin ((primitive-ref write-char) #\w) ((primitive-ref port-ndx) f8604)))
# emit-let
#  si   = -8
#  env  = ()
#  bindings = ((f8604 ((primitive-ref current-output-port))))
#  body = (begin ((primitive-ref write-char) #\w) ((primitive-ref port-ndx) f8604))
# emit-expr ((primitive-ref current-output-port))
# funcall
#    si   =-8
#    env  = ()
#    expr = (funcall (primitive-ref current-output-port))
# emit-expr (primitive-ref current-output-port)
    .extern current$moutput$mport
    movl current$moutput$mport,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_71115"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_71115":
   movl %eax,  -16(%esp)  # stash funcall-oper in closure slot
    movl -16(%esp), %edi   # load new closure to %edi
    add $-8, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $8, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -8(%esp)  # stack save
# emit-expr (begin ((primitive-ref write-char) #\w) ((primitive-ref port-ndx) f8604))
# emit-begin
#   expr=(begin ((primitive-ref write-char) #\w) ((primitive-ref port-ndx) f8604))
#   env=((f8604 . -8))
# emit-expr ((primitive-ref write-char) #\w)
# funcall
#    si   =-12
#    env  = ((f8604 . -8))
#    expr = (funcall (primitive-ref write-char) #\w)
# emit-expr (primitive-ref write-char)
    .extern write$mchar
    movl write$mchar,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_71116"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_71116":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr #\w
    movl $30479, %eax     # immed #\w
    mov %eax, -24(%esp)  # arg w
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-expr (begin ((primitive-ref port-ndx) f8604))
# emit-begin
#   expr=(begin ((primitive-ref port-ndx) f8604))
#   env=((f8604 . -8))
# emit-expr ((primitive-ref port-ndx) f8604)
# funcall
#    si   =-12
#    env  = ((f8604 . -8))
#    expr = (funcall (primitive-ref port-ndx) f8604)
# emit-expr (primitive-ref port-ndx)
    .extern port$mndx
    movl port$mndx,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_71117"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_71117":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr f8604
# emit-variable-ref
# env=((f8604 . -8))
# var=f8604
    movl -8(%esp), %eax  # stack load f8604
# end emit-variable-ref
    mov %eax, -24(%esp)  # arg f8604
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f8604 . -8))
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
