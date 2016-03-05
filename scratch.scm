# (begin (let ((p (open-output-file "stst.tmp" (quote replace)))) (display "Hello World!" p) (close-output-port p)) (let ((p (open-input-file "stst.tmp"))) (define loop (lambda () (let ((x (read-char p))) (if (eof-object? x) (begin (close-input-port p) (quote ())) (begin (display x) (loop)))))) (loop)) (exit))
# == explicit-begins  ==>
# (begin (let ((p (open-output-file "stst.tmp" (quote replace)))) (begin (display "Hello World!" p) (close-output-port p))) (let ((p (open-input-file "stst.tmp"))) (begin (define loop (lambda () (let ((x (read-char p))) (if (eof-object? x) (begin (close-input-port p) (quote ())) (begin (display x) (loop)))))) (loop))) (exit))
# == elim-local-defines  ==>

(begin (let ((p (open-output-file "stst.tmp" (quote replace))))
	 (begin (display "Hello World!" p) (close-output-port p)))
       (let ((p (open-input-file "stst.tmp")))
	 (begin
	   (define loop
	     (lambda ()
	       (let ((x (read-char p)))
		 (if (eof-object? x)
		     (begin
		       (close-input-port p)
		       (quote ()))
		     (begin
		       (display x)
		       (loop))))))
	   (loop)))
       (exit))

# == eliminate-let*  ==>
# (begin (let ((p (open-output-file "stst.tmp" (quote replace)))) (begin (display "Hello World!" p) (close-output-port p))) (let ((p (open-input-file "stst.tmp"))) (begin (define loop (lambda () (let ((x (read-char p))) (if (eof-object? x) (begin (close-input-port p) (quote ())) (begin (display x) (loop)))))) (loop))) (exit))
# == uniquify-variables  ==>
# (begin (let ((f305 (open-output-file "stst.tmp" (quote replace)))) (begin (display "Hello World!" f305) (close-output-port f305))) (let ((f306 (open-input-file "stst.tmp"))) (begin (define loop (lambda () (let ((f310 (read-char f306))) (if (eof-object? f310) (begin (close-input-port f306) (quote ())) (begin (display f310) (loop)))))) (loop))) (exit))
# == vectorize-letrec  ==>
# (begin (let ((f305 (open-output-file "stst.tmp" (quote replace)))) (begin (display "Hello World!" f305) (close-output-port f305))) (let ((f306 (open-input-file "stst.tmp"))) (begin (define loop (lambda () (let ((f310 (read-char f306))) (if (eof-object? f310) (begin (close-input-port f306) (quote ())) (begin (display f310) (loop)))))) (loop))) (exit))
# == eliminate-set!  ==>
# (begin (let ((f305 (open-output-file "stst.tmp" (quote replace)))) (begin (display "Hello World!" f305) (close-output-port f305))) (let ((f306 (open-input-file "stst.tmp"))) (begin (define loop (lambda () (let () (let ((f310 (read-char f306))) (if (eof-object? f310) (begin (close-input-port f306) (quote ())) (begin (display f310) (loop))))))) (loop))) (exit))
# == close-free-variables  ==>
# (begin (let ((f305 (open-output-file "stst.tmp" (quote replace)))) (begin (display "Hello World!" f305) (close-output-port f305))) (let ((f306 (open-input-file "stst.tmp"))) (begin (define loop (closure () (f306 loop) (let () (let ((f310 (read-char f306))) (if (eof-object? f310) (begin (close-input-port f306) (quote ())) (begin (display f310) (loop))))))) (loop))) (exit))
# == eliminate-quote  ==>
# (begin (let ((f305 (open-output-file "stst.tmp" (string->symbol "replace")))) (begin (display "Hello World!" f305) (close-output-port f305))) (let ((f306 (open-input-file "stst.tmp"))) (begin (define loop (closure () (f306 loop) (let () (let ((f310 (read-char f306))) (if (eof-object? f310) (begin (close-input-port f306) ()) (begin (display f310) (loop))))))) (loop))) (exit))
# == eliminate-when/unless  ==>
# (begin (let ((f305 (open-output-file "stst.tmp" (string->symbol "replace")))) (begin (display "Hello World!" f305) (close-output-port f305))) (let ((f306 (open-input-file "stst.tmp"))) (begin (define loop (closure () (f306 loop) (let () (let ((f310 (read-char f306))) (if (eof-object? f310) (begin (close-input-port f306) ()) (begin (display f310) (loop))))))) (loop))) (exit))
# == eliminate-cond  ==>
# (begin (let ((f305 (open-output-file "stst.tmp" (string->symbol "replace")))) (begin (display "Hello World!" f305) (close-output-port f305))) (let ((f306 (open-input-file "stst.tmp"))) (begin (define loop (closure () (f306 loop) (let () (let ((f310 (read-char f306))) (if (eof-object? f310) (begin (close-input-port f306) ()) (begin (display f310) (loop))))))) (loop))) (exit))
# == external-symbols  ==>
# (begin (let ((f305 ((primitive-ref open-output-file) "stst.tmp" ((primitive-ref string->symbol) "replace")))) (begin ((primitive-ref display) "Hello World!" f305) ((primitive-ref close-output-port) f305))) (let ((f306 ((primitive-ref open-input-file) "stst.tmp"))) (begin (define loop (closure () (f306 loop) (let () (let ((f310 ((primitive-ref read-char) f306))) (if (eof-object? f310) (begin ((primitive-ref close-input-port) f306) ()) (begin ((primitive-ref display) f310) (loop))))))) (loop))) ((primitive-ref exit)))
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
# emit-expr (begin (let ((f305 ((primitive-ref open-output-file) "stst.tmp" ((primitive-ref string->symbol) "replace")))) (begin ((primitive-ref display) "Hello World!" f305) ((primitive-ref close-output-port) f305))) (let ((f306 ((primitive-ref open-input-file) "stst.tmp"))) (begin (define loop (closure () (f306 loop) (let () (let ((f310 ((primitive-ref read-char) f306))) (if (eof-object? f310) (begin ((primitive-ref close-input-port) f306) ()) (begin ((primitive-ref display) f310) (loop))))))) (loop))) ((primitive-ref exit)))
# emit-begin
#   expr=(begin (let ((f305 ((primitive-ref open-output-file) "stst.tmp" ((primitive-ref string->symbol) "replace")))) (begin ((primitive-ref display) "Hello World!" f305) ((primitive-ref close-output-port) f305))) (let ((f306 ((primitive-ref open-input-file) "stst.tmp"))) (begin (define loop (closure () (f306 loop) (let () (let ((f310 ((primitive-ref read-char) f306))) (if (eof-object? f310) (begin ((primitive-ref close-input-port) f306) ()) (begin ((primitive-ref display) f310) (loop))))))) (loop))) ((primitive-ref exit)))
#   env=()
# emit-expr (let ((f305 ((primitive-ref open-output-file) "stst.tmp" ((primitive-ref string->symbol) "replace")))) (begin ((primitive-ref display) "Hello World!" f305) ((primitive-ref close-output-port) f305)))
# emit-let
#  si   = -8
#  env  = ()
#  bindings = ((f305 ((primitive-ref open-output-file) "stst.tmp" ((primitive-ref string->symbol) "replace"))))
#  body = (begin ((primitive-ref display) "Hello World!" f305) ((primitive-ref close-output-port) f305))
# emit-expr ((primitive-ref open-output-file) "stst.tmp" ((primitive-ref string->symbol) "replace"))
# funcall
#    si   =-8
#    env  = ()
#    expr = (funcall (primitive-ref open-output-file) "stst.tmp" ((primitive-ref string->symbol) "replace"))
# emit-expr (primitive-ref open-output-file)
    .extern mrc_open$moutput$mfile
    movl mrc_open$moutput$mfile,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je _L_1768
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
_L_1768:
   movl %eax,  -16(%esp)  # stash funcall-oper in closure slot
# emit-expr "stst.tmp"
# string literal
    jmp _L_1770
    .align 8,0x90
_L_1769 :
    .int 32
    .ascii "stst.tmp"
_L_1770:
    movl $_L_1769, %eax
    orl $6, %eax
    mov %eax, -20(%esp)  # arg stst.tmp
# emit-expr ((primitive-ref string->symbol) "replace")
# funcall
#    si   =-24
#    env  = ()
#    expr = (funcall (primitive-ref string->symbol) "replace")
# emit-expr (primitive-ref string->symbol)
    .extern mrc_string$m$gsymbol
    movl mrc_string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je _L_1771
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
_L_1771:
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr "replace"
# string literal
    jmp _L_1773
    .align 8,0x90
_L_1772 :
    .int 28
    .ascii "replace"
_L_1773:
    movl $_L_1772, %eax
    orl $6, %eax
    mov %eax, -36(%esp)  # arg replace
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -24(%esp)  # arg ((primitive-ref string->symbol) replace)
    movl -16(%esp), %edi   # load new closure to %edi
    add $-8, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $8, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -8(%esp)  # stack save
# emit-expr (begin ((primitive-ref display) "Hello World!" f305) ((primitive-ref close-output-port) f305))
# emit-begin
#   expr=(begin ((primitive-ref display) "Hello World!" f305) ((primitive-ref close-output-port) f305))
#   env=((f305 . -8))
# emit-expr ((primitive-ref display) "Hello World!" f305)
# funcall
#    si   =-12
#    env  = ((f305 . -8))
#    expr = (funcall (primitive-ref display) "Hello World!" f305)
# emit-expr (primitive-ref display)
    .extern mrc_display
    movl mrc_display,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je _L_1774
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
_L_1774:
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "Hello World!"
# string literal
    jmp _L_1776
    .align 8,0x90
_L_1775 :
    .int 48
    .ascii "Hello World!"
_L_1776:
    movl $_L_1775, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg Hello World!
# emit-expr f305
# emit-variable-ref
# env=((f305 . -8))
# var=f305
    movl -8(%esp), %eax  # stack load f305
# end emit-variable-ref
    mov %eax, -28(%esp)  # arg f305
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-expr (begin ((primitive-ref close-output-port) f305))
# emit-begin
#   expr=(begin ((primitive-ref close-output-port) f305))
#   env=((f305 . -8))
# emit-expr ((primitive-ref close-output-port) f305)
# funcall
#    si   =-12
#    env  = ((f305 . -8))
#    expr = (funcall (primitive-ref close-output-port) f305)
# emit-expr (primitive-ref close-output-port)
    .extern mrc_close$moutput$mport
    movl mrc_close$moutput$mport,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je _L_1777
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
_L_1777:
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr f305
# emit-variable-ref
# env=((f305 . -8))
# var=f305
    movl -8(%esp), %eax  # stack load f305
# end emit-variable-ref
    mov %eax, -24(%esp)  # arg f305
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f305 . -8))
# emit-expr (begin (let ((f306 ((primitive-ref open-input-file) "stst.tmp"))) (begin (define loop (closure () (f306 loop) (let () (let ((f310 ((primitive-ref read-char) f306))) (if (eof-object? f310) (begin ((primitive-ref close-input-port) f306) ()) (begin ((primitive-ref display) f310) (loop))))))) (loop))) ((primitive-ref exit)))
# emit-begin
#   expr=(begin (let ((f306 ((primitive-ref open-input-file) "stst.tmp"))) (begin (define loop (closure () (f306 loop) (let () (let ((f310 ((primitive-ref read-char) f306))) (if (eof-object? f310) (begin ((primitive-ref close-input-port) f306) ()) (begin ((primitive-ref display) f310) (loop))))))) (loop))) ((primitive-ref exit)))
#   env=()
# emit-expr (let ((f306 ((primitive-ref open-input-file) "stst.tmp"))) (begin (define loop (closure () (f306 loop) (let () (let ((f310 ((primitive-ref read-char) f306))) (if (eof-object? f310) (begin ((primitive-ref close-input-port) f306) ()) (begin ((primitive-ref display) f310) (loop))))))) (loop)))
# emit-let
#  si   = -8
#  env  = ()
#  bindings = ((f306 ((primitive-ref open-input-file) "stst.tmp")))
#  body = (begin (define loop (closure () (f306 loop) (let () (let ((f310 ((primitive-ref read-char) f306))) (if (eof-object? f310) (begin ((primitive-ref close-input-port) f306) ()) (begin ((primitive-ref display) f310) (loop))))))) (loop))
# emit-expr ((primitive-ref open-input-file) "stst.tmp")
# funcall
#    si   =-8
#    env  = ()
#    expr = (funcall (primitive-ref open-input-file) "stst.tmp")
# emit-expr (primitive-ref open-input-file)
    .extern mrc_open$minput$mfile
    movl mrc_open$minput$mfile,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je _L_1778
# invoke error handler funcall_non_procedure
    .extern mrc_eh$uprocedure
    movl mrc_eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
_L_1778:
   movl %eax,  -16(%esp)  # stash funcall-oper in closure slot
# emit-expr "stst.tmp"
# string literal
    jmp _L_1780
    .align 8,0x90
_L_1779 :
    .int 32
    .ascii "stst.tmp"
_L_1780:
    movl $_L_1779, %eax
    orl $6, %eax
    mov %eax, -20(%esp)  # arg stst.tmp
    movl -16(%esp), %edi   # load new closure to %edi
    add $-8, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $8, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -8(%esp)  # stack save
# emit-expr (begin (define loop (closure () (f306 loop) (let () (let ((f310 ((primitive-ref read-char) f306))) (if (eof-object? f310) (begin ((primitive-ref close-input-port) f306) ()) (begin ((primitive-ref display) f310) (loop))))))) (loop))
# emit-begin
#   expr=(begin (define loop (closure () (f306 loop) (let () (let ((f310 ((primitive-ref read-char) f306))) (if (eof-object? f310) (begin ((primitive-ref close-input-port) f306) ()) (begin ((primitive-ref display) f310) (loop))))))) (loop))
#   env=((f306 . -8))
# emit-expr (define loop (closure () (f306 loop) (let () (let ((f310 ((primitive-ref read-char) f306))) (if (eof-object? f310) (begin ((primitive-ref close-input-port) f306) ()) (begin ((primitive-ref display) f310) (loop)))))))
# funcall
#    si   =-12
#    env  = ((f306 . -8))
#    expr = (funcall define loop (closure () (f306 loop) (let () (let ((f310 ((primitive-ref read-char) f306))) (if (eof-object? f310) (begin ((primitive-ref close-input-port) f306) ()) (begin ((primitive-ref display) f310) (loop)))))))
# emit-expr define
