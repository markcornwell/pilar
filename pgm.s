# (begin (let ((p (open-output-file "stst.tmp"))) (display "Hello World!" p) (close-output-port p) (let ((p (open-input-file "stst.tmp"))) (read-char p))))
# == explicit-begins  ==>
# (begin (let ((p (open-output-file "stst.tmp"))) (begin (display "Hello World!" p) (close-output-port p) (let ((p (open-input-file "stst.tmp"))) (read-char p)))))
# == eliminate-let*  ==>
# (begin (let ((p (open-output-file "stst.tmp"))) (begin (display "Hello World!" p) (close-output-port p) (let ((p (open-input-file "stst.tmp"))) (read-char p)))))
# == uniquify-variables  ==>
# (begin (let ((f6664 (open-output-file "stst.tmp"))) (begin (display "Hello World!" f6664) (close-output-port f6664) (let ((f6666 (open-input-file "stst.tmp"))) (read-char f6666)))))
# == vectorize-letrec  ==>
# (begin (let ((f6664 (open-output-file "stst.tmp"))) (begin (display "Hello World!" f6664) (close-output-port f6664) (let ((f6666 (open-input-file "stst.tmp"))) (read-char f6666)))))
# == eliminate-set!  ==>
# (begin (let ((f6664 (open-output-file "stst.tmp"))) (begin (display "Hello World!" f6664) (close-output-port f6664) (let ((f6666 (open-input-file "stst.tmp"))) (read-char f6666)))))
# == close-free-variables  ==>
# (begin (let ((f6664 (open-output-file "stst.tmp"))) (begin (display "Hello World!" f6664) (close-output-port f6664) (let ((f6666 (open-input-file "stst.tmp"))) (read-char f6666)))))
# == eliminate-quote  ==>
# (begin (let ((f6664 (open-output-file "stst.tmp"))) (begin (display "Hello World!" f6664) (close-output-port f6664) (let ((f6666 (open-input-file "stst.tmp"))) (read-char f6666)))))
# == eliminate-when/unless  ==>
# (begin (let ((f6664 (open-output-file "stst.tmp"))) (begin (display "Hello World!" f6664) (close-output-port f6664) (let ((f6666 (open-input-file "stst.tmp"))) (read-char f6666)))))
# == eliminate-cond  ==>
# (begin (let ((f6664 (open-output-file "stst.tmp"))) (begin (display "Hello World!" f6664) (close-output-port f6664) (let ((f6666 (open-input-file "stst.tmp"))) (read-char f6666)))))
# == external-symbols  ==>
# (begin (let ((f6664 ((primitive-ref open-output-file) "stst.tmp"))) (begin ((primitive-ref display) "Hello World!" f6664) ((primitive-ref close-output-port) f6664) (let ((f6666 ((primitive-ref open-input-file) "stst.tmp"))) ((primitive-ref read-char) f6666)))))
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
# emit-expr (begin (let ((f6664 ((primitive-ref open-output-file) "stst.tmp"))) (begin ((primitive-ref display) "Hello World!" f6664) ((primitive-ref close-output-port) f6664) (let ((f6666 ((primitive-ref open-input-file) "stst.tmp"))) ((primitive-ref read-char) f6666)))))
# emit-begin
#   expr=(begin (let ((f6664 ((primitive-ref open-output-file) "stst.tmp"))) (begin ((primitive-ref display) "Hello World!" f6664) ((primitive-ref close-output-port) f6664) (let ((f6666 ((primitive-ref open-input-file) "stst.tmp"))) ((primitive-ref read-char) f6666)))))
#   env=()
# emit-expr (let ((f6664 ((primitive-ref open-output-file) "stst.tmp"))) (begin ((primitive-ref display) "Hello World!" f6664) ((primitive-ref close-output-port) f6664) (let ((f6666 ((primitive-ref open-input-file) "stst.tmp"))) ((primitive-ref read-char) f6666))))
# emit-let
#  si   = -8
#  env  = ()
#  bindings = ((f6664 ((primitive-ref open-output-file) "stst.tmp")))
#  body = (begin ((primitive-ref display) "Hello World!" f6664) ((primitive-ref close-output-port) f6664) (let ((f6666 ((primitive-ref open-input-file) "stst.tmp"))) ((primitive-ref read-char) f6666)))
# emit-expr ((primitive-ref open-output-file) "stst.tmp")
# funcall
#    si   =-8
#    env  = ()
#    expr = (funcall (primitive-ref open-output-file) "stst.tmp")
# emit-expr (primitive-ref open-output-file)
    .extern mrc_open$moutput$mfile
    movl mrc_open$moutput$mfile,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_40409"
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_40409":
   movl %eax,  -16(%esp)  # stash funcall-oper in closure slot
# emit-expr "stst.tmp"
# string literal
    jmp _L_40411
    .align 8,0x90
_L_40410 :
    .int 32
    .ascii "stst.tmp"
_L_40411:
    movl $_L_40410, %eax
    orl $6, %eax
    mov %eax, -20(%esp)  # arg stst.tmp
    movl -16(%esp), %edi   # load new closure to %edi
    add $-8, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $8, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -8(%esp)  # stack save
# emit-expr (begin ((primitive-ref display) "Hello World!" f6664) ((primitive-ref close-output-port) f6664) (let ((f6666 ((primitive-ref open-input-file) "stst.tmp"))) ((primitive-ref read-char) f6666)))
# emit-begin
#   expr=(begin ((primitive-ref display) "Hello World!" f6664) ((primitive-ref close-output-port) f6664) (let ((f6666 ((primitive-ref open-input-file) "stst.tmp"))) ((primitive-ref read-char) f6666)))
#   env=((f6664 . -8))
# emit-expr ((primitive-ref display) "Hello World!" f6664)
# funcall
#    si   =-12
#    env  = ((f6664 . -8))
#    expr = (funcall (primitive-ref display) "Hello World!" f6664)
# emit-expr (primitive-ref display)
    .extern mrc_display
    movl mrc_display,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_40412"
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_40412":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "Hello World!"
# string literal
    jmp _L_40414
    .align 8,0x90
_L_40413 :
    .int 48
    .ascii "Hello World!"
_L_40414:
    movl $_L_40413, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg Hello World!
# emit-expr f6664
# emit-variable-ref
# env=((f6664 . -8))
# var=f6664
    movl -8(%esp), %eax  # stack load f6664
# end emit-variable-ref
    mov %eax, -28(%esp)  # arg f6664
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-expr (begin ((primitive-ref close-output-port) f6664) (let ((f6666 ((primitive-ref open-input-file) "stst.tmp"))) ((primitive-ref read-char) f6666)))
# emit-begin
#   expr=(begin ((primitive-ref close-output-port) f6664) (let ((f6666 ((primitive-ref open-input-file) "stst.tmp"))) ((primitive-ref read-char) f6666)))
#   env=((f6664 . -8))
# emit-expr ((primitive-ref close-output-port) f6664)
# funcall
#    si   =-12
#    env  = ((f6664 . -8))
#    expr = (funcall (primitive-ref close-output-port) f6664)
# emit-expr (primitive-ref close-output-port)
    .extern mrc_close$moutput$mport
    movl mrc_close$moutput$mport,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_40415"
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_40415":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr f6664
# emit-variable-ref
# env=((f6664 . -8))
# var=f6664
    movl -8(%esp), %eax  # stack load f6664
# end emit-variable-ref
    mov %eax, -24(%esp)  # arg f6664
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-expr (begin (let ((f6666 ((primitive-ref open-input-file) "stst.tmp"))) ((primitive-ref read-char) f6666)))
# emit-begin
#   expr=(begin (let ((f6666 ((primitive-ref open-input-file) "stst.tmp"))) ((primitive-ref read-char) f6666)))
#   env=((f6664 . -8))
# emit-expr (let ((f6666 ((primitive-ref open-input-file) "stst.tmp"))) ((primitive-ref read-char) f6666))
# emit-let
#  si   = -12
#  env  = ((f6664 . -8))
#  bindings = ((f6666 ((primitive-ref open-input-file) "stst.tmp")))
#  body = ((primitive-ref read-char) f6666)
# emit-expr ((primitive-ref open-input-file) "stst.tmp")
# funcall
#    si   =-12
#    env  = ((f6664 . -8))
#    expr = (funcall (primitive-ref open-input-file) "stst.tmp")
# emit-expr (primitive-ref open-input-file)
    .extern mrc_open$minput$mfile
    movl mrc_open$minput$mfile,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_40416"
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_40416":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "stst.tmp"
# string literal
    jmp _L_40418
    .align 8,0x90
_L_40417 :
    .int 32
    .ascii "stst.tmp"
_L_40418:
    movl $_L_40417, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg stst.tmp
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)  # stack save
# emit-expr ((primitive-ref read-char) f6666)
# funcall
#    si   =-16
#    env  = ((f6666 . -12) (f6664 . -8))
#    expr = (funcall (primitive-ref read-char) f6666)
# emit-expr (primitive-ref read-char)
    .extern mrc_read$mchar
    movl mrc_read$mchar,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_40419"
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_40419":
   movl %eax,  -24(%esp)  # stash funcall-oper in closure slot
# emit-expr f6666
# emit-variable-ref
# env=((f6666 . -12) (f6664 . -8))
# var=f6666
    movl -12(%esp), %eax  # stack load f6666
# end emit-variable-ref
    mov %eax, -28(%esp)  # arg f6666
    movl -24(%esp), %edi   # load new closure to %edi
    add $-16, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $16, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f6664 . -8))
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
