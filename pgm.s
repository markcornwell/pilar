# (begin (let ((p (open-output-file "stst.tmp"))) (display "Hello World!" p) (close-output-port p) (let ((p (open-input-file "stst.tmp"))) (fill-input-buffer p) (port-last p))))
# == explicit-begins  ==>
# (begin (let ((p (open-output-file "stst.tmp"))) (begin (display "Hello World!" p) (close-output-port p) (let ((p (open-input-file "stst.tmp"))) (begin (fill-input-buffer p) (port-last p))))))
# == eliminate-let*  ==>
# (begin (let ((p (open-output-file "stst.tmp"))) (begin (display "Hello World!" p) (close-output-port p) (let ((p (open-input-file "stst.tmp"))) (begin (fill-input-buffer p) (port-last p))))))
# == uniquify-variables  ==>
# (begin (let ((f6419 (open-output-file "stst.tmp"))) (begin (display "Hello World!" f6419) (close-output-port f6419) (let ((f6421 (open-input-file "stst.tmp"))) (begin (fill-input-buffer f6421) (port-last f6421))))))
# == vectorize-letrec  ==>
# (begin (let ((f6419 (open-output-file "stst.tmp"))) (begin (display "Hello World!" f6419) (close-output-port f6419) (let ((f6421 (open-input-file "stst.tmp"))) (begin (fill-input-buffer f6421) (port-last f6421))))))
# == eliminate-set!  ==>
# (begin (let ((f6419 (open-output-file "stst.tmp"))) (begin (display "Hello World!" f6419) (close-output-port f6419) (let ((f6421 (open-input-file "stst.tmp"))) (begin (fill-input-buffer f6421) (port-last f6421))))))
# == close-free-variables  ==>
# (begin (let ((f6419 (open-output-file "stst.tmp"))) (begin (display "Hello World!" f6419) (close-output-port f6419) (let ((f6421 (open-input-file "stst.tmp"))) (begin (fill-input-buffer f6421) (port-last f6421))))))
# == eliminate-quote  ==>
# (begin (let ((f6419 (open-output-file "stst.tmp"))) (begin (display "Hello World!" f6419) (close-output-port f6419) (let ((f6421 (open-input-file "stst.tmp"))) (begin (fill-input-buffer f6421) (port-last f6421))))))
# == eliminate-when/unless  ==>
# (begin (let ((f6419 (open-output-file "stst.tmp"))) (begin (display "Hello World!" f6419) (close-output-port f6419) (let ((f6421 (open-input-file "stst.tmp"))) (begin (fill-input-buffer f6421) (port-last f6421))))))
# == eliminate-cond  ==>
# (begin (let ((f6419 (open-output-file "stst.tmp"))) (begin (display "Hello World!" f6419) (close-output-port f6419) (let ((f6421 (open-input-file "stst.tmp"))) (begin (fill-input-buffer f6421) (port-last f6421))))))
# == external-symbols  ==>
# (begin (let ((f6419 ((primitive-ref open-output-file) "stst.tmp"))) (begin ((primitive-ref display) "Hello World!" f6419) ((primitive-ref close-output-port) f6419) (let ((f6421 ((primitive-ref open-input-file) "stst.tmp"))) (begin ((primitive-ref fill-input-buffer) f6421) ((primitive-ref port-last) f6421))))))
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
# emit-expr (begin (let ((f6419 ((primitive-ref open-output-file) "stst.tmp"))) (begin ((primitive-ref display) "Hello World!" f6419) ((primitive-ref close-output-port) f6419) (let ((f6421 ((primitive-ref open-input-file) "stst.tmp"))) (begin ((primitive-ref fill-input-buffer) f6421) ((primitive-ref port-last) f6421))))))
# emit-begin
#   expr=(begin (let ((f6419 ((primitive-ref open-output-file) "stst.tmp"))) (begin ((primitive-ref display) "Hello World!" f6419) ((primitive-ref close-output-port) f6419) (let ((f6421 ((primitive-ref open-input-file) "stst.tmp"))) (begin ((primitive-ref fill-input-buffer) f6421) ((primitive-ref port-last) f6421))))))
#   env=()
# emit-expr (let ((f6419 ((primitive-ref open-output-file) "stst.tmp"))) (begin ((primitive-ref display) "Hello World!" f6419) ((primitive-ref close-output-port) f6419) (let ((f6421 ((primitive-ref open-input-file) "stst.tmp"))) (begin ((primitive-ref fill-input-buffer) f6421) ((primitive-ref port-last) f6421)))))
# emit-let
#  si   = -8
#  env  = ()
#  bindings = ((f6419 ((primitive-ref open-output-file) "stst.tmp")))
#  body = (begin ((primitive-ref display) "Hello World!" f6419) ((primitive-ref close-output-port) f6419) (let ((f6421 ((primitive-ref open-input-file) "stst.tmp"))) (begin ((primitive-ref fill-input-buffer) f6421) ((primitive-ref port-last) f6421))))
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
    je "_L_38927"
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_38927":
   movl %eax,  -16(%esp)  # stash funcall-oper in closure slot
# emit-expr "stst.tmp"
# string literal
    jmp _L_38929
    .align 8,0x90
_L_38928 :
    .int 32
    .ascii "stst.tmp"
_L_38929:
    movl $_L_38928, %eax
    orl $6, %eax
    mov %eax, -20(%esp)  # arg stst.tmp
    movl -16(%esp), %edi   # load new closure to %edi
    add $-8, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $8, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -8(%esp)  # stack save
# emit-expr (begin ((primitive-ref display) "Hello World!" f6419) ((primitive-ref close-output-port) f6419) (let ((f6421 ((primitive-ref open-input-file) "stst.tmp"))) (begin ((primitive-ref fill-input-buffer) f6421) ((primitive-ref port-last) f6421))))
# emit-begin
#   expr=(begin ((primitive-ref display) "Hello World!" f6419) ((primitive-ref close-output-port) f6419) (let ((f6421 ((primitive-ref open-input-file) "stst.tmp"))) (begin ((primitive-ref fill-input-buffer) f6421) ((primitive-ref port-last) f6421))))
#   env=((f6419 . -8))
# emit-expr ((primitive-ref display) "Hello World!" f6419)
# funcall
#    si   =-12
#    env  = ((f6419 . -8))
#    expr = (funcall (primitive-ref display) "Hello World!" f6419)
# emit-expr (primitive-ref display)
    .extern mrc_display
    movl mrc_display,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_38930"
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_38930":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "Hello World!"
# string literal
    jmp _L_38932
    .align 8,0x90
_L_38931 :
    .int 48
    .ascii "Hello World!"
_L_38932:
    movl $_L_38931, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg Hello World!
# emit-expr f6419
# emit-variable-ref
# env=((f6419 . -8))
# var=f6419
    movl -8(%esp), %eax  # stack load f6419
# end emit-variable-ref
    mov %eax, -28(%esp)  # arg f6419
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-expr (begin ((primitive-ref close-output-port) f6419) (let ((f6421 ((primitive-ref open-input-file) "stst.tmp"))) (begin ((primitive-ref fill-input-buffer) f6421) ((primitive-ref port-last) f6421))))
# emit-begin
#   expr=(begin ((primitive-ref close-output-port) f6419) (let ((f6421 ((primitive-ref open-input-file) "stst.tmp"))) (begin ((primitive-ref fill-input-buffer) f6421) ((primitive-ref port-last) f6421))))
#   env=((f6419 . -8))
# emit-expr ((primitive-ref close-output-port) f6419)
# funcall
#    si   =-12
#    env  = ((f6419 . -8))
#    expr = (funcall (primitive-ref close-output-port) f6419)
# emit-expr (primitive-ref close-output-port)
    .extern mrc_close$moutput$mport
    movl mrc_close$moutput$mport,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_38933"
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_38933":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr f6419
# emit-variable-ref
# env=((f6419 . -8))
# var=f6419
    movl -8(%esp), %eax  # stack load f6419
# end emit-variable-ref
    mov %eax, -24(%esp)  # arg f6419
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-expr (begin (let ((f6421 ((primitive-ref open-input-file) "stst.tmp"))) (begin ((primitive-ref fill-input-buffer) f6421) ((primitive-ref port-last) f6421))))
# emit-begin
#   expr=(begin (let ((f6421 ((primitive-ref open-input-file) "stst.tmp"))) (begin ((primitive-ref fill-input-buffer) f6421) ((primitive-ref port-last) f6421))))
#   env=((f6419 . -8))
# emit-expr (let ((f6421 ((primitive-ref open-input-file) "stst.tmp"))) (begin ((primitive-ref fill-input-buffer) f6421) ((primitive-ref port-last) f6421)))
# emit-let
#  si   = -12
#  env  = ((f6419 . -8))
#  bindings = ((f6421 ((primitive-ref open-input-file) "stst.tmp")))
#  body = (begin ((primitive-ref fill-input-buffer) f6421) ((primitive-ref port-last) f6421))
# emit-expr ((primitive-ref open-input-file) "stst.tmp")
# funcall
#    si   =-12
#    env  = ((f6419 . -8))
#    expr = (funcall (primitive-ref open-input-file) "stst.tmp")
# emit-expr (primitive-ref open-input-file)
    .extern mrc_open$minput$mfile
    movl mrc_open$minput$mfile,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_38934"
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_38934":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "stst.tmp"
# string literal
    jmp _L_38936
    .align 8,0x90
_L_38935 :
    .int 32
    .ascii "stst.tmp"
_L_38936:
    movl $_L_38935, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg stst.tmp
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)  # stack save
# emit-expr (begin ((primitive-ref fill-input-buffer) f6421) ((primitive-ref port-last) f6421))
# emit-begin
#   expr=(begin ((primitive-ref fill-input-buffer) f6421) ((primitive-ref port-last) f6421))
#   env=((f6421 . -12) (f6419 . -8))
# emit-expr ((primitive-ref fill-input-buffer) f6421)
# funcall
#    si   =-16
#    env  = ((f6421 . -12) (f6419 . -8))
#    expr = (funcall (primitive-ref fill-input-buffer) f6421)
# emit-expr (primitive-ref fill-input-buffer)
    .extern mrc_fill$minput$mbuffer
    movl mrc_fill$minput$mbuffer,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_38937"
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_38937":
   movl %eax,  -24(%esp)  # stash funcall-oper in closure slot
# emit-expr f6421
# emit-variable-ref
# env=((f6421 . -12) (f6419 . -8))
# var=f6421
    movl -12(%esp), %eax  # stack load f6421
# end emit-variable-ref
    mov %eax, -28(%esp)  # arg f6421
    movl -24(%esp), %edi   # load new closure to %edi
    add $-16, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $16, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-expr (begin ((primitive-ref port-last) f6421))
# emit-begin
#   expr=(begin ((primitive-ref port-last) f6421))
#   env=((f6421 . -12) (f6419 . -8))
# emit-expr ((primitive-ref port-last) f6421)
# funcall
#    si   =-16
#    env  = ((f6421 . -12) (f6419 . -8))
#    expr = (funcall (primitive-ref port-last) f6421)
# emit-expr (primitive-ref port-last)
    .extern mrc_port$mlast
    movl mrc_port$mlast,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_38938"
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_38938":
   movl %eax,  -24(%esp)  # stash funcall-oper in closure slot
# emit-expr f6421
# emit-variable-ref
# env=((f6421 . -12) (f6419 . -8))
# var=f6421
    movl -12(%esp), %eax  # stack load f6421
# end emit-variable-ref
    mov %eax, -28(%esp)  # arg f6421
    movl -24(%esp), %edi   # load new closure to %edi
    add $-16, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $16, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f6421 . -12) (f6419 . -8))
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f6419 . -8))
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
