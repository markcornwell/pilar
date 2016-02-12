> Performing open-output-file tests ...
test 0:(let ((p (open-output-file "tmp1.txt"))) (port-kind p)) ... ok
test 1:(let ((p (open-output-file "tmp2.txt"))) (port-path p)) ... ok
test 2:(let ((p (open-output-file "tmp3.txt"))) (port-fd p)) ... ok
test 3:(let ((p (open-output-file "tmp4.txt"))) (string? (port-buf p))) ... ok
test 4:(let ((p (open-output-file "tmp5.txt"))) (fx= 1024 (string-length (port-buf p)))) ... ok
test 5:(let ((p (open-output-file "tmp6.txt"))) (port-kind p)) ... ok
test 6:(let ((p (open-output-file "tmp7.txt"))) (vector? p)) ... ok
test 7:(let ((p (open-output-file "tmp8.txt"))) (fx= 6 (vector-length p))) ... ok
test 8:(let ((p (open-output-file "tmp9.txt"))) ((lambda (x) (if (vector? x) (symbol=? (port-kind x) (quote output-port)) #f)) p)) ...sh: line 1: 60961 Segmentation fault: 11  ./stst >&stst.out
Exception in execute: produced program exited abnormally


# (let ((p (open-output-file "tmp9.txt"))) ((lambda (x) (if (vector? x) (symbol=? (port-kind x) (quote output-port)) #f)) p))
# == explicit-begins  ==>
# (let ((p (open-output-file "tmp9.txt"))) ((lambda (x) (if (vector? x) (symbol=? (port-kind x) (quote output-port)) #f)) p))
# == eliminate-let*  ==>
# (let ((p (open-output-file "tmp9.txt"))) ((lambda (x) (if (vector? x) (symbol=? (port-kind x) (quote output-port)) #f)) p))
# == uniquify-variables  ==>
# (let ((f2060 (open-output-file "tmp9.txt"))) ((lambda (f2062) (if (vector? f2062) (symbol=? (port-kind f2062) (quote output-port)) #f)) f2060))
# == vectorize-letrec  ==>
# (let ((f2060 (open-output-file "tmp9.txt"))) ((lambda (f2062) (if (vector? f2062) (symbol=? (port-kind f2062) (quote output-port)) #f)) f2060))
# == eliminate-set!  ==>
# (let ((f2060 (open-output-file "tmp9.txt"))) ((lambda (f2062) (let ((f2062 f2062)) (if (vector? f2062) (symbol=? (port-kind f2062) (quote output-port)) #f))) f2060))
# == close-free-variables  ==>
# (let ((f2060 (open-output-file "tmp9.txt"))) ((closure (f2062) (symbol=? port-kind output-port) (let ((f2062 f2062)) (if (vector? f2062) (symbol=? (port-kind f2062) (quote output-port)) #f))) f2060))
# == eliminate-quote  ==>
# (let ((f2060 (open-output-file "tmp9.txt"))) ((closure (f2062) (symbol=? port-kind output-port) (let ((f2062 f2062)) (if (vector? f2062) (symbol=? (port-kind f2062) (string->symbol "output-port")) #f))) f2060))
# == eliminate-when/unless  ==>
# (let ((f2060 (open-output-file "tmp9.txt"))) ((closure (f2062) (symbol=? port-kind output-port) (let ((f2062 f2062)) (if (vector? f2062) (symbol=? (port-kind f2062) (string->symbol "output-port")) #f))) f2060))
# == eliminate-cond  ==>
# (let ((f2060 (open-output-file "tmp9.txt"))) ((closure (f2062) (symbol=? port-kind output-port) (let ((f2062 f2062)) (if (vector? f2062) (symbol=? (port-kind f2062) (string->symbol "output-port")) #f))) f2060))
# == external-symbols  ==>
# (let ((f2060 ((primitive-ref open-output-file) "tmp9.txt"))) ((closure (f2062) (symbol=? (primitive-ref port-kind) output-port) (let ((f2062 f2062)) (if (vector? f2062) (symbol=? ((primitive-ref port-kind) f2062) ((primitive-ref string->symbol) "output-port")) #f))) f2060))

  <<<<<<<<<<<<<----- This last form looks really hinky.  list of freevars looks wrong. symbol=? port-king output-port are NOT free   <<<<<<<<<<<<<<<<


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
# emit-expr (let ((f2060 ((primitive-ref open-output-file) "tmp9.txt"))) ((closure (f2062) (symbol=? (primitive-ref port-kind) output-port) (let ((f2062 f2062)) (if (vector? f2062) (symbol=? ((primitive-ref port-kind) f2062) ((primitive-ref string->symbol) "output-port")) #f))) f2060))
# emit-let
#  si   = -8
#  env  = ()
#  bindings = ((f2060 ((primitive-ref open-output-file) "tmp9.txt")))
#  body = ((closure (f2062) (symbol=? (primitive-ref port-kind) output-port) (let ((f2062 f2062)) (if (vector? f2062) (symbol=? ((primitive-ref port-kind) f2062) ((primitive-ref string->symbol) "output-port")) #f))) f2060)
# emit-expr ((primitive-ref open-output-file) "tmp9.txt")
# funcall
#    si   =-8
#    env  = ()
#    expr = (funcall (primitive-ref open-output-file) "tmp9.txt")
# emit-expr (primitive-ref open-output-file)
    .extern mrc_open$moutput$mfile
    movl mrc_open$moutput$mfile,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12519"
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12519":
   movl %eax,  -16(%esp)  # stash funcall-oper in closure slot
# emit-expr "tmp9.txt"
# string literal
    jmp _L_12521
    .align 8,0x90
_L_12520 :
    .int 32
    .ascii "tmp9.txt"
_L_12521:
    movl $_L_12520, %eax
    orl $6, %eax
    mov %eax, -20(%esp)  # arg tmp9.txt
    movl -16(%esp), %edi   # load new closure to %edi
    add $-8, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $8, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -8(%esp)  # stack save
# emit-expr ((closure (f2062) (symbol=? (primitive-ref port-kind) output-port) (let ((f2062 f2062)) (if (vector? f2062) (symbol=? ((primitive-ref port-kind) f2062) ((primitive-ref string->symbol) "output-port")) #f))) f2060)
# funcall
#    si   =-12
#    env  = ((f2060 . -8))
#    expr = (funcall (closure (f2062) (symbol=? (primitive-ref port-kind) output-port) (let ((f2062 f2062)) (if (vector? f2062) (symbol=? ((primitive-ref port-kind) f2062) ((primitive-ref string->symbol) "output-port")) #f))) f2060)
# emit-expr (closure (f2062) (symbol=? (primitive-ref port-kind) output-port) (let ((f2062 f2062)) (if (vector? f2062) (symbol=? ((primitive-ref port-kind) f2062) ((primitive-ref string->symbol) "output-port")) #f)))
# emit-closure
# si = -20
# env = ((f2060 . -8))
# expr = (closure (f2062) (symbol=? (primitive-ref port-kind) output-port) (let ((f2062 f2062)) (if (vector? f2062) (symbol=? ((primitive-ref port-kind) f2062) ((primitive-ref string->symbol) "output-port")) #f)))
    movl $_L_12522, 0(%ebp)  # closure label
# WARNING: free var symbol=? not defined in the environmnet
# WARNING: free var (primitive-ref port-kind) not defined in the environmnet
# WARNING: free var output-port not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_12523            # jump around closure body
_L_12522:
# check argument count
    cmp $4,%eax
    je _L_12524
# invoke error handler eh_argcount
    .extern mrc_eh$uargcount
    movl mrc_eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_12524:
# emit-tail-expr
# si=-12
# env=((f2062 . -8) (output-port . 12) ((primitive-ref port-kind) . 8) (symbol=? . 4) (f2060 . -8))
# expr=(let ((f2062 f2062)) (if (vector? f2062) (symbol=? ((primitive-ref port-kind) f2062) ((primitive-ref string->symbol) "output-port")) #f))
# emit-tail-let
#  si   = -12
#  env  = ((f2062 . -8) (output-port . 12) ((primitive-ref port-kind) . 8) (symbol=? . 4) (f2060 . -8))
#  bindings = ((f2062 f2062))
#  body = (if (vector? f2062) (symbol=? ((primitive-ref port-kind) f2062) ((primitive-ref string->symbol) "output-port")) #f)
# emit-expr f2062
# emit-variable-ref
# env=((f2062 . -8) (output-port . 12) ((primitive-ref port-kind) . 8) (symbol=? . 4) (f2060 . -8))
# var=f2062
    movl -8(%esp), %eax  # stack load f2062
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f2062 . -12) (f2062 . -8) (output-port . 12) ((primitive-ref port-kind) . 8) (symbol=? . 4) (f2060 . -8))
# expr=(if (vector? f2062) (symbol=? ((primitive-ref port-kind) f2062) ((primitive-ref string->symbol) "output-port")) #f)
# emit-expr (vector? f2062)
# emit-expr f2062
# emit-variable-ref
# env=((f2062 . -12) (f2062 . -8) (output-port . 12) ((primitive-ref port-kind) . 8) (symbol=? . 4) (f2060 . -8))
# var=f2062
    movl -12(%esp), %eax  # stack load f2062
# end emit-variable-ref
    and $7, %al
    cmp $5, %al
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_12525
# emit-tail-expr
# si=-16
# env=((f2062 . -12) (f2062 . -8) (output-port . 12) ((primitive-ref port-kind) . 8) (symbol=? . 4) (f2060 . -8))
# expr=(symbol=? ((primitive-ref port-kind) f2062) ((primitive-ref string->symbol) "output-port"))
# emit-tail-funcall
#    si   =-16
#    env  = ((f2062 . -12) (f2062 . -8) (output-port . 12) ((primitive-ref port-kind) . 8) (symbol=? . 4) (f2060 . -8))
#    expr = (funcall symbol=? ((primitive-ref port-kind) f2062) ((primitive-ref string->symbol) "output-port"))
# emit-expr symbol=?
# emit-variable-ref
# env=((f2062 . -12) (f2062 . -8) (output-port . 12) ((primitive-ref port-kind) . 8) (symbol=? . 4) (f2060 . -8))
# var=symbol=?
    movl 2(%edi), %eax  # frame load symbol=?
# end emit-variable-ref
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref port-kind) f2062)
# funcall
#    si   =-20
#    env  = ((f2062 . -12) (f2062 . -8) (output-port . 12) ((primitive-ref port-kind) . 8) (symbol=? . 4) (f2060 . -8))
#    expr = (funcall (primitive-ref port-kind) f2062)
# emit-expr (primitive-ref port-kind)
    .extern mrc_port$mkind
    movl mrc_port$mkind,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12527"
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12527":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr f2062
# emit-variable-ref
# env=((f2062 . -12) (f2062 . -8) (output-port . 12) ((primitive-ref port-kind) . 8) (symbol=? . 4) (f2060 . -8))
# var=f2062
    movl -12(%esp), %eax  # stack load f2062
# end emit-variable-ref
    mov %eax, -32(%esp)  # arg f2062
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref port-kind) f2062)
# emit-expr ((primitive-ref string->symbol) "output-port")
# funcall
#    si   =-24
#    env  = ((f2062 . -12) (f2062 . -8) (output-port . 12) ((primitive-ref port-kind) . 8) (symbol=? . 4) (f2060 . -8))
#    expr = (funcall (primitive-ref string->symbol) "output-port")
# emit-expr (primitive-ref string->symbol)
    .extern mrc_string$m$gsymbol
    movl mrc_string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12528"
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12528":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr "output-port"
# string literal
    jmp _L_12530
    .align 8,0x90
_L_12529 :
    .int 44
    .ascii "output-port"
_L_12530:
    movl $_L_12529, %eax
    orl $6, %eax
    mov %eax, -36(%esp)  # arg output-port
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -24(%esp)    # arg ((primitive-ref string->symbol) output-port)
    movl -16(%esp), %edi   # load new closure to %edi
# emit-shift-args:  size=3   si=-16  delta=12
    mov -16(%esp), %ebx  # shift frame cell
    mov %ebx, -4(%esp)  # down to base
# emit-shift-args:  size=2   si=-20  delta=12
    mov -20(%esp), %ebx  # shift frame cell
    mov %ebx, -8(%esp)  # down to base
# emit-shift-args:  size=1   si=-24  delta=12
    mov -24(%esp), %ebx  # shift frame cell
    mov %ebx, -12(%esp)  # down to base
# emit-shift-args:  size=0   si=-28  delta=12
    movl $8,%eax   # save arg count
    jmp *-2(%edi)  # tail-funcall
    jmp _L_12526
_L_12525:
# emit-tail-expr
# si=-16
# env=((f2062 . -12) (f2062 . -8) (output-port . 12) ((primitive-ref port-kind) . 8) (symbol=? . 4) (f2060 . -8))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_12526:
    .align 4,0x90
_L_12523:
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_12531"
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_12531":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr f2060
# emit-variable-ref
# env=((f2060 . -8))
# var=f2060
    movl -8(%esp), %eax  # stack load f2060
# end emit-variable-ref
    mov %eax, -24(%esp)  # arg f2060
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
