     .data
     .global "symbols"
     .align 8
symbols:
     .int 0xFF
     .global "string$e$q"
     .align 8
string$e$q:
     .int 0xFF
     .global "string$m$gsymbol"
     .align 8
string$m$gsymbol:
     .int 0xFF
     .global "append1"
     .align 8
append1:
     .int 0xFF
     .global "list$mref"
     .align 8
list$mref:
     .int 0xFF
     .global "list$mlength"
     .align 8
list$mlength:
     .int 0xFF
     .global "vector"
     .align 8
vector:
     .int 0xFF
     .global "string"
     .align 8
string:
     .int 0xFF
     .global "error"
     .align 8
error:
     .int 0xFF
     .global "primitives"
     .align 8
primitives:
     .int 0xFF
     .global "eh$uprocedure"
     .align 8
eh$uprocedure:
     .int 0xFF
     .global "eh$uargcount"
     .align 8
eh$uargcount:
     .int 0xFF
     .global "eh$uargcount$umin"
     .align 8
eh$uargcount$umin:
     .int 0xFF
     .global "eh$ufixnum"
     .align 8
eh$ufixnum:
     .int 0xFF
     .global "eh$ustring"
     .align 8
eh$ustring:
     .int 0xFF
     .global "eh$ucharacter"
     .align 8
eh$ucharacter:
     .int 0xFF
     .global "eh$upair"
     .align 8
eh$upair:
     .int 0xFF
     .global "eh$uvector"
     .align 8
eh$uvector:
     .int 0xFF
     .global "eh$ulength"
     .align 8
eh$ulength:
     .int 0xFF
     .global "eh$uvector$uindex"
     .align 8
eh$uvector$uindex:
     .int 0xFF
     .global "eh$ustring$uindex"
     .align 8
eh$ustring$uindex:
     .int 0xFF
     .text
     .global base_init
     .align 4
base_init:
# == explicit-begins  ==>
# (let ((interned-symbols (cons (make-symbol "nil" ()) ()))) (lambda () interned-symbols))
# == eliminate-let*  ==>
# (let ((interned-symbols (cons (make-symbol "nil" ()) ()))) (lambda () interned-symbols))
# == uniquify-variables  ==>
# (let ((f0 (cons (make-symbol "nil" ()) ()))) (lambda () f0))
# == vectorize-letrec  ==>
# (let ((f0 (cons (make-symbol "nil" ()) ()))) (lambda () f0))
# == eliminate-set!  ==>
# (let ((f0 (cons (make-symbol "nil" ()) ()))) (lambda () (let () f0)))
# == close-free-variables  ==>
# (let ((f0 (cons (make-symbol "nil" ()) ()))) (closure () (f0) (let () f0)))
# == eliminate-quote  ==>
# (let ((f0 (cons (make-symbol "nil" ()) ()))) (closure () (f0) (let () f0)))
# == eliminate-when/unless  ==>
# (let ((f0 (cons (make-symbol "nil" ()) ()))) (closure () (f0) (let () f0)))
# == eliminate-cond  ==>
# (let ((f0 (cons (make-symbol "nil" ()) ()))) (closure () (f0) (let () f0)))
# == external-symbols  ==>
# (let ((f0 (cons (make-symbol "nil" ()) ()))) (closure () (f0) (let () f0)))
# emit-expr (let ((f0 (cons (make-symbol "nil" ()) ()))) (closure () (f0) (let () f0)))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f0 (cons (make-symbol "nil" ()) ())))
#  body = (closure () (f0) (let () f0))
# emit-expr (cons (make-symbol "nil" ()) ())
# cons arg1=(make-symbol "nil" ()) arg2=()
# emit-expr (make-symbol "nil" ())
# make-symbol arg1="nil" arg2=()
# emit-expr "nil"
# string literal
    jmp _L_1
    .align 8,0x90
_L_0 :
    .int 12
    .ascii "nil"
_L_1:
    movl $_L_0, %eax
    orl $6, %eax
    movl %eax, 0(%esp)
# emit-expr ()
    movl $63, %eax     # immed ()
    movl %eax, 4(%ebp)
    movl 0(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $3, %eax
    add  $8, %ebp
# make-symbol end
    movl %eax, 0(%esp)
# emit-expr ()
    movl $63, %eax     # immed ()
    movl %eax, 4(%ebp)
    movl 0(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl %eax, 0(%esp)  # stack save
# emit-expr (closure () (f0) (let () f0))
# emit-closure
# si = -4
# env = ((f0 . 0))
# expr = (closure () (f0) (let () f0))
    movl $_L_2, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f0 . 0))
# var=f0
    movl 0(%esp), %eax  # stack load f0
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f0
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_3            # jump around closure body
_L_2:
# check argument count
    cmp $0,%eax
    je _L_4
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_4:
# emit-tail-expr
# si=-8
# env=((f0 . 4) (f0 . 0))
# expr=(let () f0)
# emit-tail-let
#  si   = -8
#  env  = ((f0 . 4) (f0 . 0))
#  bindings = ()
#  body = f0
# emit-tail-expr
# si=-8
# env=((f0 . 4) (f0 . 0))
# expr=f0
# emit-tail-variable-ref
# emit-variable-ref
# env=((f0 . 4) (f0 . 0))
# var=f0
    movl 2(%edi), %eax  # frame load f0
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    .align 4,0x90
_L_3:
     movl %eax, symbols
# == explicit-begins  ==>
# (letrec ((slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if (si= s1 s2 i) (si<n= s1 s2 (fx+ i 1) n) #f)))) (ss= (lambda (s1 s2) (if (slen= s1 s2) (si<n= s1 s2 0 (string-length s1)) #f)))) ss=)
# == eliminate-let*  ==>
# (letrec ((slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if (si= s1 s2 i) (si<n= s1 s2 (fx+ i 1) n) #f)))) (ss= (lambda (s1 s2) (if (slen= s1 s2) (si<n= s1 s2 0 (string-length s1)) #f)))) ss=)
# == uniquify-variables  ==>
# (letrec ((f4 (lambda (f25 f26) (fx= (string-length f25) (string-length f26)))) (f3 (lambda (f22 f23 f24) (char=? (string-ref f22 f24) (string-ref f23 f24)))) (f2 (lambda (f18 f19 f20 f21) (if (fx= f20 f21) #t (if (f3 f18 f19 f20) (f2 f18 f19 (fx+ f20 1) f21) #f)))) (f1 (lambda (f16 f17) (if (f4 f16 f17) (f2 f16 f17 0 (string-length f16)) #f)))) f1)
# == vectorize-letrec  ==>
# (let ((f4 (make-vector 1)) (f3 (make-vector 1)) (f2 (make-vector 1)) (f1 (make-vector 1))) (begin (begin (vector-set! f4 0 (lambda (f25 f26) (fx= (string-length f25) (string-length f26)))) (vector-set! f3 0 (lambda (f22 f23 f24) (char=? (string-ref f22 f24) (string-ref f23 f24)))) (vector-set! f2 0 (lambda (f18 f19 f20 f21) (if (fx= f20 f21) #t (if ((vector-ref f3 0) f18 f19 f20) ((vector-ref f2 0) f18 f19 (fx+ f20 1) f21) #f)))) (vector-set! f1 0 (lambda (f16 f17) (if ((vector-ref f4 0) f16 f17) ((vector-ref f2 0) f16 f17 0 (string-length f16)) #f)))) (vector-ref f1 0)))
# == eliminate-set!  ==>
# (let ((f4 (make-vector 1)) (f3 (make-vector 1)) (f2 (make-vector 1)) (f1 (make-vector 1))) (begin (begin (vector-set! f4 0 (lambda (f25 f26) (let ((f25 f25) (f26 f26)) (fx= (string-length f25) (string-length f26))))) (vector-set! f3 0 (lambda (f22 f23 f24) (let ((f22 f22) (f23 f23) (f24 f24)) (char=? (string-ref f22 f24) (string-ref f23 f24))))) (vector-set! f2 0 (lambda (f18 f19 f20 f21) (let ((f18 f18) (f19 f19) (f20 f20) (f21 f21)) (if (fx= f20 f21) #t (if ((vector-ref f3 0) f18 f19 f20) ((vector-ref f2 0) f18 f19 (fx+ f20 1) f21) #f))))) (vector-set! f1 0 (lambda (f16 f17) (let ((f16 f16) (f17 f17)) (if ((vector-ref f4 0) f16 f17) ((vector-ref f2 0) f16 f17 0 (string-length f16)) #f))))) (vector-ref f1 0)))
# == close-free-variables  ==>
# (let ((f4 (make-vector 1)) (f3 (make-vector 1)) (f2 (make-vector 1)) (f1 (make-vector 1))) (begin (begin (vector-set! f4 0 (closure (f25 f26) () (let ((f25 f25) (f26 f26)) (fx= (string-length f25) (string-length f26))))) (vector-set! f3 0 (closure (f22 f23 f24) () (let ((f22 f22) (f23 f23) (f24 f24)) (char=? (string-ref f22 f24) (string-ref f23 f24))))) (vector-set! f2 0 (closure (f18 f19 f20 f21) (f3 f2) (let ((f18 f18) (f19 f19) (f20 f20) (f21 f21)) (if (fx= f20 f21) #t (if ((vector-ref f3 0) f18 f19 f20) ((vector-ref f2 0) f18 f19 (fx+ f20 1) f21) #f))))) (vector-set! f1 0 (closure (f16 f17) (f4 f2) (let ((f16 f16) (f17 f17)) (if ((vector-ref f4 0) f16 f17) ((vector-ref f2 0) f16 f17 0 (string-length f16)) #f))))) (vector-ref f1 0)))
# == eliminate-quote  ==>
# (let ((f4 (make-vector 1)) (f3 (make-vector 1)) (f2 (make-vector 1)) (f1 (make-vector 1))) (begin (begin (vector-set! f4 0 (closure (f25 f26) () (let ((f25 f25) (f26 f26)) (fx= (string-length f25) (string-length f26))))) (vector-set! f3 0 (closure (f22 f23 f24) () (let ((f22 f22) (f23 f23) (f24 f24)) (char=? (string-ref f22 f24) (string-ref f23 f24))))) (vector-set! f2 0 (closure (f18 f19 f20 f21) (f3 f2) (let ((f18 f18) (f19 f19) (f20 f20) (f21 f21)) (if (fx= f20 f21) #t (if ((vector-ref f3 0) f18 f19 f20) ((vector-ref f2 0) f18 f19 (fx+ f20 1) f21) #f))))) (vector-set! f1 0 (closure (f16 f17) (f4 f2) (let ((f16 f16) (f17 f17)) (if ((vector-ref f4 0) f16 f17) ((vector-ref f2 0) f16 f17 0 (string-length f16)) #f))))) (vector-ref f1 0)))
# == eliminate-when/unless  ==>
# (let ((f4 (make-vector 1)) (f3 (make-vector 1)) (f2 (make-vector 1)) (f1 (make-vector 1))) (begin (begin (vector-set! f4 0 (closure (f25 f26) () (let ((f25 f25) (f26 f26)) (fx= (string-length f25) (string-length f26))))) (vector-set! f3 0 (closure (f22 f23 f24) () (let ((f22 f22) (f23 f23) (f24 f24)) (char=? (string-ref f22 f24) (string-ref f23 f24))))) (vector-set! f2 0 (closure (f18 f19 f20 f21) (f3 f2) (let ((f18 f18) (f19 f19) (f20 f20) (f21 f21)) (if (fx= f20 f21) #t (if ((vector-ref f3 0) f18 f19 f20) ((vector-ref f2 0) f18 f19 (fx+ f20 1) f21) #f))))) (vector-set! f1 0 (closure (f16 f17) (f4 f2) (let ((f16 f16) (f17 f17)) (if ((vector-ref f4 0) f16 f17) ((vector-ref f2 0) f16 f17 0 (string-length f16)) #f))))) (vector-ref f1 0)))
# == eliminate-cond  ==>
# (let ((f4 (make-vector 1)) (f3 (make-vector 1)) (f2 (make-vector 1)) (f1 (make-vector 1))) (begin (begin (vector-set! f4 0 (closure (f25 f26) () (let ((f25 f25) (f26 f26)) (fx= (string-length f25) (string-length f26))))) (vector-set! f3 0 (closure (f22 f23 f24) () (let ((f22 f22) (f23 f23) (f24 f24)) (char=? (string-ref f22 f24) (string-ref f23 f24))))) (vector-set! f2 0 (closure (f18 f19 f20 f21) (f3 f2) (let ((f18 f18) (f19 f19) (f20 f20) (f21 f21)) (if (fx= f20 f21) #t (if ((vector-ref f3 0) f18 f19 f20) ((vector-ref f2 0) f18 f19 (fx+ f20 1) f21) #f))))) (vector-set! f1 0 (closure (f16 f17) (f4 f2) (let ((f16 f16) (f17 f17)) (if ((vector-ref f4 0) f16 f17) ((vector-ref f2 0) f16 f17 0 (string-length f16)) #f))))) (vector-ref f1 0)))
# == external-symbols  ==>
# (let ((f4 (make-vector 1)) (f3 (make-vector 1)) (f2 (make-vector 1)) (f1 (make-vector 1))) (begin (begin (vector-set! f4 0 (closure (f25 f26) () (let ((f25 f25) (f26 f26)) (fx= (string-length f25) (string-length f26))))) (vector-set! f3 0 (closure (f22 f23 f24) () (let ((f22 f22) (f23 f23) (f24 f24)) (char=? (string-ref f22 f24) (string-ref f23 f24))))) (vector-set! f2 0 (closure (f18 f19 f20 f21) (f3 f2) (let ((f18 f18) (f19 f19) (f20 f20) (f21 f21)) (if (fx= f20 f21) #t (if ((vector-ref f3 0) f18 f19 f20) ((vector-ref f2 0) f18 f19 (fx+ f20 1) f21) #f))))) (vector-set! f1 0 (closure (f16 f17) (f4 f2) (let ((f16 f16) (f17 f17)) (if ((vector-ref f4 0) f16 f17) ((vector-ref f2 0) f16 f17 0 (string-length f16)) #f))))) (vector-ref f1 0)))
# emit-expr (let ((f4 (make-vector 1)) (f3 (make-vector 1)) (f2 (make-vector 1)) (f1 (make-vector 1))) (begin (begin (vector-set! f4 0 (closure (f25 f26) () (let ((f25 f25) (f26 f26)) (fx= (string-length f25) (string-length f26))))) (vector-set! f3 0 (closure (f22 f23 f24) () (let ((f22 f22) (f23 f23) (f24 f24)) (char=? (string-ref f22 f24) (string-ref f23 f24))))) (vector-set! f2 0 (closure (f18 f19 f20 f21) (f3 f2) (let ((f18 f18) (f19 f19) (f20 f20) (f21 f21)) (if (fx= f20 f21) #t (if ((vector-ref f3 0) f18 f19 f20) ((vector-ref f2 0) f18 f19 (fx+ f20 1) f21) #f))))) (vector-set! f1 0 (closure (f16 f17) (f4 f2) (let ((f16 f16) (f17 f17)) (if ((vector-ref f4 0) f16 f17) ((vector-ref f2 0) f16 f17 0 (string-length f16)) #f))))) (vector-ref f1 0)))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f4 (make-vector 1)) (f3 (make-vector 1)) (f2 (make-vector 1)) (f1 (make-vector 1)))
#  body = (begin (begin (vector-set! f4 0 (closure (f25 f26) () (let ((f25 f25) (f26 f26)) (fx= (string-length f25) (string-length f26))))) (vector-set! f3 0 (closure (f22 f23 f24) () (let ((f22 f22) (f23 f23) (f24 f24)) (char=? (string-ref f22 f24) (string-ref f23 f24))))) (vector-set! f2 0 (closure (f18 f19 f20 f21) (f3 f2) (let ((f18 f18) (f19 f19) (f20 f20) (f21 f21)) (if (fx= f20 f21) #t (if ((vector-ref f3 0) f18 f19 f20) ((vector-ref f2 0) f18 f19 (fx+ f20 1) f21) #f))))) (vector-set! f1 0 (closure (f16 f17) (f4 f2) (let ((f16 f16) (f17 f17)) (if ((vector-ref f4 0) f16 f17) ((vector-ref f2 0) f16 f17 0 (string-length f16)) #f))))) (vector-ref f1 0))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_6
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_6:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_7"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_7:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_8
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, -4(%esp)  # stack save
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_10
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_10:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, -8(%esp)  # stack save
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_11"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_11:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_12
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_12:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, -12(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f4 0 (closure (f25 f26) () (let ((f25 f25) (f26 f26)) (fx= (string-length f25) (string-length f26))))) (vector-set! f3 0 (closure (f22 f23 f24) () (let ((f22 f22) (f23 f23) (f24 f24)) (char=? (string-ref f22 f24) (string-ref f23 f24))))) (vector-set! f2 0 (closure (f18 f19 f20 f21) (f3 f2) (let ((f18 f18) (f19 f19) (f20 f20) (f21 f21)) (if (fx= f20 f21) #t (if ((vector-ref f3 0) f18 f19 f20) ((vector-ref f2 0) f18 f19 (fx+ f20 1) f21) #f))))) (vector-set! f1 0 (closure (f16 f17) (f4 f2) (let ((f16 f16) (f17 f17)) (if ((vector-ref f4 0) f16 f17) ((vector-ref f2 0) f16 f17 0 (string-length f16)) #f))))) (vector-ref f1 0))
# emit-begin
#   expr=(begin (begin (vector-set! f4 0 (closure (f25 f26) () (let ((f25 f25) (f26 f26)) (fx= (string-length f25) (string-length f26))))) (vector-set! f3 0 (closure (f22 f23 f24) () (let ((f22 f22) (f23 f23) (f24 f24)) (char=? (string-ref f22 f24) (string-ref f23 f24))))) (vector-set! f2 0 (closure (f18 f19 f20 f21) (f3 f2) (let ((f18 f18) (f19 f19) (f20 f20) (f21 f21)) (if (fx= f20 f21) #t (if ((vector-ref f3 0) f18 f19 f20) ((vector-ref f2 0) f18 f19 (fx+ f20 1) f21) #f))))) (vector-set! f1 0 (closure (f16 f17) (f4 f2) (let ((f16 f16) (f17 f17)) (if ((vector-ref f4 0) f16 f17) ((vector-ref f2 0) f16 f17 0 (string-length f16)) #f))))) (vector-ref f1 0))
#   env=((f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# emit-expr (begin (vector-set! f4 0 (closure (f25 f26) () (let ((f25 f25) (f26 f26)) (fx= (string-length f25) (string-length f26))))) (vector-set! f3 0 (closure (f22 f23 f24) () (let ((f22 f22) (f23 f23) (f24 f24)) (char=? (string-ref f22 f24) (string-ref f23 f24))))) (vector-set! f2 0 (closure (f18 f19 f20 f21) (f3 f2) (let ((f18 f18) (f19 f19) (f20 f20) (f21 f21)) (if (fx= f20 f21) #t (if ((vector-ref f3 0) f18 f19 f20) ((vector-ref f2 0) f18 f19 (fx+ f20 1) f21) #f))))) (vector-set! f1 0 (closure (f16 f17) (f4 f2) (let ((f16 f16) (f17 f17)) (if ((vector-ref f4 0) f16 f17) ((vector-ref f2 0) f16 f17 0 (string-length f16)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f4 0 (closure (f25 f26) () (let ((f25 f25) (f26 f26)) (fx= (string-length f25) (string-length f26))))) (vector-set! f3 0 (closure (f22 f23 f24) () (let ((f22 f22) (f23 f23) (f24 f24)) (char=? (string-ref f22 f24) (string-ref f23 f24))))) (vector-set! f2 0 (closure (f18 f19 f20 f21) (f3 f2) (let ((f18 f18) (f19 f19) (f20 f20) (f21 f21)) (if (fx= f20 f21) #t (if ((vector-ref f3 0) f18 f19 f20) ((vector-ref f2 0) f18 f19 (fx+ f20 1) f21) #f))))) (vector-set! f1 0 (closure (f16 f17) (f4 f2) (let ((f16 f16) (f17 f17)) (if ((vector-ref f4 0) f16 f17) ((vector-ref f2 0) f16 f17 0 (string-length f16)) #f)))))
#   env=((f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# emit-expr (vector-set! f4 0 (closure (f25 f26) () (let ((f25 f25) (f26 f26)) (fx= (string-length f25) (string-length f26)))))
# emit-expr f4
# emit-variable-ref
# env=((f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f4
    movl 0(%esp), %eax  # stack load f4
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_13
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_13:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_14"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_14:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_16
    cmp  $0,%eax
    jge _L_15
_L_16:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_15:
    movl %eax, -20(%esp)
# emit-expr (closure (f25 f26) () (let ((f25 f25) (f26 f26)) (fx= (string-length f25) (string-length f26))))
# emit-closure
# si = -24
# env = ((f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# expr = (closure (f25 f26) () (let ((f25 f25) (f26 f26)) (fx= (string-length f25) (string-length f26))))
    movl $_L_17, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_18            # jump around closure body
_L_17:
# check argument count
    cmp $8,%eax
    je _L_19
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_19:
# emit-tail-expr
# si=-16
# env=((f26 . -12) (f25 . -8) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# expr=(let ((f25 f25) (f26 f26)) (fx= (string-length f25) (string-length f26)))
# emit-tail-let
#  si   = -16
#  env  = ((f26 . -12) (f25 . -8) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
#  bindings = ((f25 f25) (f26 f26))
#  body = (fx= (string-length f25) (string-length f26))
# emit-expr f25
# emit-variable-ref
# env=((f26 . -12) (f25 . -8) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f25
    movl -8(%esp), %eax  # stack load f25
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f26
# emit-variable-ref
# env=((f26 . -12) (f25 . -8) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f26
    movl -12(%esp), %eax  # stack load f26
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f26 . -20) (f25 . -16) (f26 . -12) (f25 . -8) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# expr=(fx= (string-length f25) (string-length f26))
# tail primcall
# emit-expr (string-length f26)
# emit-expr f26
# emit-variable-ref
# env=((f26 . -20) (f25 . -16) (f26 . -12) (f25 . -8) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f26
    movl -20(%esp), %eax  # stack load f26
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_20
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_20:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_21"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_21:
    movl %eax, -24(%esp)
# emit-expr (string-length f25)
# emit-expr f25
# emit-variable-ref
# env=((f26 . -20) (f25 . -16) (f26 . -12) (f25 . -8) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f25
    movl -16(%esp), %eax  # stack load f25
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_22
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_22:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_23"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_23:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (fx= (string-length f25) (string-length f26))
    ret
    .align 4,0x90
_L_18:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3 0 (closure (f22 f23 f24) () (let ((f22 f22) (f23 f23) (f24 f24)) (char=? (string-ref f22 f24) (string-ref f23 f24))))) (vector-set! f2 0 (closure (f18 f19 f20 f21) (f3 f2) (let ((f18 f18) (f19 f19) (f20 f20) (f21 f21)) (if (fx= f20 f21) #t (if ((vector-ref f3 0) f18 f19 f20) ((vector-ref f2 0) f18 f19 (fx+ f20 1) f21) #f))))) (vector-set! f1 0 (closure (f16 f17) (f4 f2) (let ((f16 f16) (f17 f17)) (if ((vector-ref f4 0) f16 f17) ((vector-ref f2 0) f16 f17 0 (string-length f16)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f3 0 (closure (f22 f23 f24) () (let ((f22 f22) (f23 f23) (f24 f24)) (char=? (string-ref f22 f24) (string-ref f23 f24))))) (vector-set! f2 0 (closure (f18 f19 f20 f21) (f3 f2) (let ((f18 f18) (f19 f19) (f20 f20) (f21 f21)) (if (fx= f20 f21) #t (if ((vector-ref f3 0) f18 f19 f20) ((vector-ref f2 0) f18 f19 (fx+ f20 1) f21) #f))))) (vector-set! f1 0 (closure (f16 f17) (f4 f2) (let ((f16 f16) (f17 f17)) (if ((vector-ref f4 0) f16 f17) ((vector-ref f2 0) f16 f17 0 (string-length f16)) #f)))))
#   env=((f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# emit-expr (vector-set! f3 0 (closure (f22 f23 f24) () (let ((f22 f22) (f23 f23) (f24 f24)) (char=? (string-ref f22 f24) (string-ref f23 f24)))))
# emit-expr f3
# emit-variable-ref
# env=((f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f3
    movl -4(%esp), %eax  # stack load f3
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_24
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_27
    cmp  $0,%eax
    jge _L_26
_L_27:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_26:
    movl %eax, -20(%esp)
# emit-expr (closure (f22 f23 f24) () (let ((f22 f22) (f23 f23) (f24 f24)) (char=? (string-ref f22 f24) (string-ref f23 f24))))
# emit-closure
# si = -24
# env = ((f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# expr = (closure (f22 f23 f24) () (let ((f22 f22) (f23 f23) (f24 f24)) (char=? (string-ref f22 f24) (string-ref f23 f24))))
    movl $_L_28, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_29            # jump around closure body
_L_28:
# check argument count
    cmp $12,%eax
    je _L_30
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_30:
# emit-tail-expr
# si=-20
# env=((f24 . -16) (f23 . -12) (f22 . -8) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# expr=(let ((f22 f22) (f23 f23) (f24 f24)) (char=? (string-ref f22 f24) (string-ref f23 f24)))
# emit-tail-let
#  si   = -20
#  env  = ((f24 . -16) (f23 . -12) (f22 . -8) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
#  bindings = ((f22 f22) (f23 f23) (f24 f24))
#  body = (char=? (string-ref f22 f24) (string-ref f23 f24))
# emit-expr f22
# emit-variable-ref
# env=((f24 . -16) (f23 . -12) (f22 . -8) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f22
    movl -8(%esp), %eax  # stack load f22
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr f23
# emit-variable-ref
# env=((f24 . -16) (f23 . -12) (f22 . -8) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f23
    movl -12(%esp), %eax  # stack load f23
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f24
# emit-variable-ref
# env=((f24 . -16) (f23 . -12) (f22 . -8) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f24
    movl -16(%esp), %eax  # stack load f24
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((f24 . -28) (f23 . -24) (f22 . -20) (f24 . -16) (f23 . -12) (f22 . -8) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# expr=(char=? (string-ref f22 f24) (string-ref f23 f24))
# tail primcall
# char= c1=(string-ref f22 f24) c2=(string-ref f23 f24)
# emit-expr (string-ref f22 f24)
# emit-expr f22
# emit-variable-ref
# env=((f24 . -28) (f23 . -24) (f22 . -20) (f24 . -16) (f23 . -12) (f22 . -8) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f22
    movl -20(%esp), %eax  # stack load f22
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_31
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_31:
    movl %eax, -32(%esp)
# emit-expr f24
# emit-variable-ref
# env=((f24 . -28) (f23 . -24) (f22 . -20) (f24 . -16) (f23 . -12) (f22 . -8) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f24
    movl -28(%esp), %eax  # stack load f24
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32:
# check bounds on string index
    movl -32(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_34
    cmp  $0,%eax
    jge _L_33
_L_34:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33:
    sar $2, %eax
    movl -32(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_35"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_35:
    movb %ah, -32(%esp)
# emit-expr (string-ref f23 f24)
# emit-expr f23
# emit-variable-ref
# env=((f24 . -28) (f23 . -24) (f22 . -20) (f24 . -16) (f23 . -12) (f22 . -8) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f23
    movl -24(%esp), %eax  # stack load f23
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_36
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_36:
    movl %eax, -36(%esp)
# emit-expr f24
# emit-variable-ref
# env=((f24 . -28) (f23 . -24) (f22 . -20) (f24 . -16) (f23 . -12) (f22 . -8) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f24
    movl -28(%esp), %eax  # stack load f24
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_37"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_37:
# check bounds on string index
    movl -36(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_39
    cmp  $0,%eax
    jge _L_38
_L_39:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_38:
    sar $2, %eax
    movl -36(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_40"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_40:
    cmp %ah, -32(%esp)
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (char=? (string-ref f22 f24) (string-ref f23 f24))
    ret
    .align 4,0x90
_L_29:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f2 0 (closure (f18 f19 f20 f21) (f3 f2) (let ((f18 f18) (f19 f19) (f20 f20) (f21 f21)) (if (fx= f20 f21) #t (if ((vector-ref f3 0) f18 f19 f20) ((vector-ref f2 0) f18 f19 (fx+ f20 1) f21) #f))))) (vector-set! f1 0 (closure (f16 f17) (f4 f2) (let ((f16 f16) (f17 f17)) (if ((vector-ref f4 0) f16 f17) ((vector-ref f2 0) f16 f17 0 (string-length f16)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f2 0 (closure (f18 f19 f20 f21) (f3 f2) (let ((f18 f18) (f19 f19) (f20 f20) (f21 f21)) (if (fx= f20 f21) #t (if ((vector-ref f3 0) f18 f19 f20) ((vector-ref f2 0) f18 f19 (fx+ f20 1) f21) #f))))) (vector-set! f1 0 (closure (f16 f17) (f4 f2) (let ((f16 f16) (f17 f17)) (if ((vector-ref f4 0) f16 f17) ((vector-ref f2 0) f16 f17 0 (string-length f16)) #f)))))
#   env=((f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# emit-expr (vector-set! f2 0 (closure (f18 f19 f20 f21) (f3 f2) (let ((f18 f18) (f19 f19) (f20 f20) (f21 f21)) (if (fx= f20 f21) #t (if ((vector-ref f3 0) f18 f19 f20) ((vector-ref f2 0) f18 f19 (fx+ f20 1) f21) #f)))))
# emit-expr f2
# emit-variable-ref
# env=((f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f2
    movl -8(%esp), %eax  # stack load f2
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_41
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_41:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_42"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_42:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_44
    cmp  $0,%eax
    jge _L_43
_L_44:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_43:
    movl %eax, -20(%esp)
# emit-expr (closure (f18 f19 f20 f21) (f3 f2) (let ((f18 f18) (f19 f19) (f20 f20) (f21 f21)) (if (fx= f20 f21) #t (if ((vector-ref f3 0) f18 f19 f20) ((vector-ref f2 0) f18 f19 (fx+ f20 1) f21) #f))))
# emit-closure
# si = -24
# env = ((f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# expr = (closure (f18 f19 f20 f21) (f3 f2) (let ((f18 f18) (f19 f19) (f20 f20) (f21 f21)) (if (fx= f20 f21) #t (if ((vector-ref f3 0) f18 f19 f20) ((vector-ref f2 0) f18 f19 (fx+ f20 1) f21) #f))))
    movl $_L_45, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f3
    movl -4(%esp), %eax  # stack load f3
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f3
# emit-variable-ref
# env=((f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f2
    movl -8(%esp), %eax  # stack load f2
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f2
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_46            # jump around closure body
_L_45:
# check argument count
    cmp $16,%eax
    je _L_47
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_47:
# emit-tail-expr
# si=-24
# env=((f21 . -20) (f20 . -16) (f19 . -12) (f18 . -8) (f2 . 8) (f3 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# expr=(let ((f18 f18) (f19 f19) (f20 f20) (f21 f21)) (if (fx= f20 f21) #t (if ((vector-ref f3 0) f18 f19 f20) ((vector-ref f2 0) f18 f19 (fx+ f20 1) f21) #f)))
# emit-tail-let
#  si   = -24
#  env  = ((f21 . -20) (f20 . -16) (f19 . -12) (f18 . -8) (f2 . 8) (f3 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
#  bindings = ((f18 f18) (f19 f19) (f20 f20) (f21 f21))
#  body = (if (fx= f20 f21) #t (if ((vector-ref f3 0) f18 f19 f20) ((vector-ref f2 0) f18 f19 (fx+ f20 1) f21) #f))
# emit-expr f18
# emit-variable-ref
# env=((f21 . -20) (f20 . -16) (f19 . -12) (f18 . -8) (f2 . 8) (f3 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f18
    movl -8(%esp), %eax  # stack load f18
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f19
# emit-variable-ref
# env=((f21 . -20) (f20 . -16) (f19 . -12) (f18 . -8) (f2 . 8) (f3 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f19
    movl -12(%esp), %eax  # stack load f19
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-expr f20
# emit-variable-ref
# env=((f21 . -20) (f20 . -16) (f19 . -12) (f18 . -8) (f2 . 8) (f3 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f20
    movl -16(%esp), %eax  # stack load f20
# end emit-variable-ref
    movl %eax, -32(%esp)  # stack save
# emit-expr f21
# emit-variable-ref
# env=((f21 . -20) (f20 . -16) (f19 . -12) (f18 . -8) (f2 . 8) (f3 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f21
    movl -20(%esp), %eax  # stack load f21
# end emit-variable-ref
    movl %eax, -36(%esp)  # stack save
# emit-tail-expr
# si=-40
# env=((f21 . -36) (f20 . -32) (f19 . -28) (f18 . -24) (f21 . -20) (f20 . -16) (f19 . -12) (f18 . -8) (f2 . 8) (f3 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# expr=(if (fx= f20 f21) #t (if ((vector-ref f3 0) f18 f19 f20) ((vector-ref f2 0) f18 f19 (fx+ f20 1) f21) #f))
# emit-expr (fx= f20 f21)
# emit-expr f21
# emit-variable-ref
# env=((f21 . -36) (f20 . -32) (f19 . -28) (f18 . -24) (f21 . -20) (f20 . -16) (f19 . -12) (f18 . -8) (f2 . 8) (f3 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f21
    movl -36(%esp), %eax  # stack load f21
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_50"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_50:
    movl %eax, -40(%esp)
# emit-expr f20
# emit-variable-ref
# env=((f21 . -36) (f20 . -32) (f19 . -28) (f18 . -24) (f21 . -20) (f20 . -16) (f19 . -12) (f18 . -8) (f2 . 8) (f3 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f20
    movl -32(%esp), %eax  # stack load f20
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_51"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_51:
    cmp -40(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_48
# emit-tail-expr
# si=-40
# env=((f21 . -36) (f20 . -32) (f19 . -28) (f18 . -24) (f21 . -20) (f20 . -16) (f19 . -12) (f18 . -8) (f2 . 8) (f3 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# expr=#t
    movl $111, %eax     # immed #t
    ret                  # immediate tail return
    jmp _L_49
_L_48:
# emit-tail-expr
# si=-40
# env=((f21 . -36) (f20 . -32) (f19 . -28) (f18 . -24) (f21 . -20) (f20 . -16) (f19 . -12) (f18 . -8) (f2 . 8) (f3 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# expr=(if ((vector-ref f3 0) f18 f19 f20) ((vector-ref f2 0) f18 f19 (fx+ f20 1) f21) #f)
# emit-expr ((vector-ref f3 0) f18 f19 f20)
# funcall
#    si   =-40
#    env  = ((f21 . -36) (f20 . -32) (f19 . -28) (f18 . -24) (f21 . -20) (f20 . -16) (f19 . -12) (f18 . -8) (f2 . 8) (f3 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
#    expr = (funcall (vector-ref f3 0) f18 f19 f20)
# emit-expr (vector-ref f3 0)
# emit-expr f3
# emit-variable-ref
# env=((f21 . -36) (f20 . -32) (f19 . -28) (f18 . -24) (f21 . -20) (f20 . -16) (f19 . -12) (f18 . -8) (f2 . 8) (f3 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f3
    movl 2(%edi), %eax  # frame load f3
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_54
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_54:
    movl %eax, -48(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_55"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_55:
# check bounds on vector index
    movl -48(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_57
    cmp  $0,%eax
    jge _L_56
_L_57:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_56:
    movl -48(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_58"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_58":
   movl %eax,  -48(%esp)  # stash funcall-oper in closure slot
# emit-expr f18
# emit-variable-ref
# env=((f21 . -36) (f20 . -32) (f19 . -28) (f18 . -24) (f21 . -20) (f20 . -16) (f19 . -12) (f18 . -8) (f2 . 8) (f3 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f18
    movl -24(%esp), %eax  # stack load f18
# end emit-variable-ref
    mov %eax, -52(%esp)  # arg f18
# emit-expr f19
# emit-variable-ref
# env=((f21 . -36) (f20 . -32) (f19 . -28) (f18 . -24) (f21 . -20) (f20 . -16) (f19 . -12) (f18 . -8) (f2 . 8) (f3 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f19
    movl -28(%esp), %eax  # stack load f19
# end emit-variable-ref
    mov %eax, -56(%esp)  # arg f19
# emit-expr f20
# emit-variable-ref
# env=((f21 . -36) (f20 . -32) (f19 . -28) (f18 . -24) (f21 . -20) (f20 . -16) (f19 . -12) (f18 . -8) (f2 . 8) (f3 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f20
    movl -32(%esp), %eax  # stack load f20
# end emit-variable-ref
    mov %eax, -60(%esp)  # arg f20
    movl -48(%esp), %edi   # load new closure to %edi
    add $-40, %esp   # adjust base
    movl $12,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $40, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_52
# emit-tail-expr
# si=-40
# env=((f21 . -36) (f20 . -32) (f19 . -28) (f18 . -24) (f21 . -20) (f20 . -16) (f19 . -12) (f18 . -8) (f2 . 8) (f3 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# expr=((vector-ref f2 0) f18 f19 (fx+ f20 1) f21)
# emit-tail-funcall
#    si   =-40
#    env  = ((f21 . -36) (f20 . -32) (f19 . -28) (f18 . -24) (f21 . -20) (f20 . -16) (f19 . -12) (f18 . -8) (f2 . 8) (f3 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
#    expr = (funcall (vector-ref f2 0) f18 f19 (fx+ f20 1) f21)
# emit-expr (vector-ref f2 0)
# emit-expr f2
# emit-variable-ref
# env=((f21 . -36) (f20 . -32) (f19 . -28) (f18 . -24) (f21 . -20) (f20 . -16) (f19 . -12) (f18 . -8) (f2 . 8) (f3 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f2
    movl 6(%edi), %eax  # frame load f2
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_59
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_59:
    movl %eax, -40(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_60"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_60:
# check bounds on vector index
    movl -40(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_62
    cmp  $0,%eax
    jge _L_61
_L_62:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_61:
    movl -40(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -40(%esp)  # stash funcall-oper in next closure slot
# emit-expr f18
# emit-variable-ref
# env=((f21 . -36) (f20 . -32) (f19 . -28) (f18 . -24) (f21 . -20) (f20 . -16) (f19 . -12) (f18 . -8) (f2 . 8) (f3 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f18
    movl -24(%esp), %eax  # stack load f18
# end emit-variable-ref
    mov %eax, -44(%esp)    # arg f18
# emit-expr f19
# emit-variable-ref
# env=((f21 . -36) (f20 . -32) (f19 . -28) (f18 . -24) (f21 . -20) (f20 . -16) (f19 . -12) (f18 . -8) (f2 . 8) (f3 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f19
    movl -28(%esp), %eax  # stack load f19
# end emit-variable-ref
    mov %eax, -48(%esp)    # arg f19
# emit-expr (fx+ f20 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_63"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_63:
    movl %eax, -52(%esp)  # fx+ push arg1
# emit-expr f20
# emit-variable-ref
# env=((f21 . -36) (f20 . -32) (f19 . -28) (f18 . -24) (f21 . -20) (f20 . -16) (f19 . -12) (f18 . -8) (f2 . 8) (f3 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f20
    movl -32(%esp), %eax  # stack load f20
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_64"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_64:
    addl -52(%esp), %eax  # fx+ arg1 arg2
    mov %eax, -52(%esp)    # arg (fx+ f20 1)
# emit-expr f21
# emit-variable-ref
# env=((f21 . -36) (f20 . -32) (f19 . -28) (f18 . -24) (f21 . -20) (f20 . -16) (f19 . -12) (f18 . -8) (f2 . 8) (f3 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f21
    movl -36(%esp), %eax  # stack load f21
# end emit-variable-ref
    mov %eax, -56(%esp)    # arg f21
    movl -40(%esp), %edi   # load new closure to %edi
# emit-shift-args:  size=5   si=-40  delta=36
    mov -40(%esp), %ebx  # shift frame cell
    mov %ebx, -4(%esp)  # down to base
# emit-shift-args:  size=4   si=-44  delta=36
    mov -44(%esp), %ebx  # shift frame cell
    mov %ebx, -8(%esp)  # down to base
# emit-shift-args:  size=3   si=-48  delta=36
    mov -48(%esp), %ebx  # shift frame cell
    mov %ebx, -12(%esp)  # down to base
# emit-shift-args:  size=2   si=-52  delta=36
    mov -52(%esp), %ebx  # shift frame cell
    mov %ebx, -16(%esp)  # down to base
# emit-shift-args:  size=1   si=-56  delta=36
    mov -56(%esp), %ebx  # shift frame cell
    mov %ebx, -20(%esp)  # down to base
# emit-shift-args:  size=0   si=-60  delta=36
    movl $16,%eax   # save arg count
    jmp *-2(%edi)  # tail-funcall
    jmp _L_53
_L_52:
# emit-tail-expr
# si=-40
# env=((f21 . -36) (f20 . -32) (f19 . -28) (f18 . -24) (f21 . -20) (f20 . -16) (f19 . -12) (f18 . -8) (f2 . 8) (f3 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_53:
_L_49:
    .align 4,0x90
_L_46:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1 0 (closure (f16 f17) (f4 f2) (let ((f16 f16) (f17 f17)) (if ((vector-ref f4 0) f16 f17) ((vector-ref f2 0) f16 f17 0 (string-length f16)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f1 0 (closure (f16 f17) (f4 f2) (let ((f16 f16) (f17 f17)) (if ((vector-ref f4 0) f16 f17) ((vector-ref f2 0) f16 f17 0 (string-length f16)) #f)))))
#   env=((f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# emit-expr (vector-set! f1 0 (closure (f16 f17) (f4 f2) (let ((f16 f16) (f17 f17)) (if ((vector-ref f4 0) f16 f17) ((vector-ref f2 0) f16 f17 0 (string-length f16)) #f))))
# emit-expr f1
# emit-variable-ref
# env=((f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f1
    movl -12(%esp), %eax  # stack load f1
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_65
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_65:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_66"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_66:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_68
    cmp  $0,%eax
    jge _L_67
_L_68:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_67:
    movl %eax, -20(%esp)
# emit-expr (closure (f16 f17) (f4 f2) (let ((f16 f16) (f17 f17)) (if ((vector-ref f4 0) f16 f17) ((vector-ref f2 0) f16 f17 0 (string-length f16)) #f)))
# emit-closure
# si = -24
# env = ((f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# expr = (closure (f16 f17) (f4 f2) (let ((f16 f16) (f17 f17)) (if ((vector-ref f4 0) f16 f17) ((vector-ref f2 0) f16 f17 0 (string-length f16)) #f)))
    movl $_L_69, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f4
    movl 0(%esp), %eax  # stack load f4
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f4
# emit-variable-ref
# env=((f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f2
    movl -8(%esp), %eax  # stack load f2
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f2
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_70            # jump around closure body
_L_69:
# check argument count
    cmp $8,%eax
    je _L_71
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_71:
# emit-tail-expr
# si=-16
# env=((f17 . -12) (f16 . -8) (f2 . 8) (f4 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# expr=(let ((f16 f16) (f17 f17)) (if ((vector-ref f4 0) f16 f17) ((vector-ref f2 0) f16 f17 0 (string-length f16)) #f))
# emit-tail-let
#  si   = -16
#  env  = ((f17 . -12) (f16 . -8) (f2 . 8) (f4 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
#  bindings = ((f16 f16) (f17 f17))
#  body = (if ((vector-ref f4 0) f16 f17) ((vector-ref f2 0) f16 f17 0 (string-length f16)) #f)
# emit-expr f16
# emit-variable-ref
# env=((f17 . -12) (f16 . -8) (f2 . 8) (f4 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f16
    movl -8(%esp), %eax  # stack load f16
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f17
# emit-variable-ref
# env=((f17 . -12) (f16 . -8) (f2 . 8) (f4 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f17
    movl -12(%esp), %eax  # stack load f17
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f17 . -20) (f16 . -16) (f17 . -12) (f16 . -8) (f2 . 8) (f4 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# expr=(if ((vector-ref f4 0) f16 f17) ((vector-ref f2 0) f16 f17 0 (string-length f16)) #f)
# emit-expr ((vector-ref f4 0) f16 f17)
# funcall
#    si   =-24
#    env  = ((f17 . -20) (f16 . -16) (f17 . -12) (f16 . -8) (f2 . 8) (f4 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
#    expr = (funcall (vector-ref f4 0) f16 f17)
# emit-expr (vector-ref f4 0)
# emit-expr f4
# emit-variable-ref
# env=((f17 . -20) (f16 . -16) (f17 . -12) (f16 . -8) (f2 . 8) (f4 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f4
    movl 2(%edi), %eax  # frame load f4
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_74
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_74:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_75"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_75:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_77
    cmp  $0,%eax
    jge _L_76
_L_77:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_76:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_78"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_78":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f16
# emit-variable-ref
# env=((f17 . -20) (f16 . -16) (f17 . -12) (f16 . -8) (f2 . 8) (f4 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f16
    movl -16(%esp), %eax  # stack load f16
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f16
# emit-expr f17
# emit-variable-ref
# env=((f17 . -20) (f16 . -16) (f17 . -12) (f16 . -8) (f2 . 8) (f4 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f17
    movl -20(%esp), %eax  # stack load f17
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg f17
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_72
# emit-tail-expr
# si=-24
# env=((f17 . -20) (f16 . -16) (f17 . -12) (f16 . -8) (f2 . 8) (f4 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# expr=((vector-ref f2 0) f16 f17 0 (string-length f16))
# emit-tail-funcall
#    si   =-24
#    env  = ((f17 . -20) (f16 . -16) (f17 . -12) (f16 . -8) (f2 . 8) (f4 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
#    expr = (funcall (vector-ref f2 0) f16 f17 0 (string-length f16))
# emit-expr (vector-ref f2 0)
# emit-expr f2
# emit-variable-ref
# env=((f17 . -20) (f16 . -16) (f17 . -12) (f16 . -8) (f2 . 8) (f4 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f2
    movl 6(%edi), %eax  # frame load f2
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_79
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_79:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_80"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_80:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_82
    cmp  $0,%eax
    jge _L_81
_L_82:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_81:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr f16
# emit-variable-ref
# env=((f17 . -20) (f16 . -16) (f17 . -12) (f16 . -8) (f2 . 8) (f4 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f16
    movl -16(%esp), %eax  # stack load f16
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f16
# emit-expr f17
# emit-variable-ref
# env=((f17 . -20) (f16 . -16) (f17 . -12) (f16 . -8) (f2 . 8) (f4 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f17
    movl -20(%esp), %eax  # stack load f17
# end emit-variable-ref
    mov %eax, -32(%esp)    # arg f17
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -36(%esp)    # arg 0
# emit-expr (string-length f16)
# emit-expr f16
# emit-variable-ref
# env=((f17 . -20) (f16 . -16) (f17 . -12) (f16 . -8) (f2 . 8) (f4 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f16
    movl -16(%esp), %eax  # stack load f16
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_83
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_83:
    movl -6(%eax), %eax
    mov %eax, -40(%esp)    # arg (string-length f16)
    movl -24(%esp), %edi   # load new closure to %edi
# emit-shift-args:  size=5   si=-24  delta=20
    mov -24(%esp), %ebx  # shift frame cell
    mov %ebx, -4(%esp)  # down to base
# emit-shift-args:  size=4   si=-28  delta=20
    mov -28(%esp), %ebx  # shift frame cell
    mov %ebx, -8(%esp)  # down to base
# emit-shift-args:  size=3   si=-32  delta=20
    mov -32(%esp), %ebx  # shift frame cell
    mov %ebx, -12(%esp)  # down to base
# emit-shift-args:  size=2   si=-36  delta=20
    mov -36(%esp), %ebx  # shift frame cell
    mov %ebx, -16(%esp)  # down to base
# emit-shift-args:  size=1   si=-40  delta=20
    mov -40(%esp), %ebx  # shift frame cell
    mov %ebx, -20(%esp)  # down to base
# emit-shift-args:  size=0   si=-44  delta=20
    movl $16,%eax   # save arg count
    jmp *-2(%edi)  # tail-funcall
    jmp _L_73
_L_72:
# emit-tail-expr
# si=-24
# env=((f17 . -20) (f16 . -16) (f17 . -12) (f16 . -8) (f2 . 8) (f4 . 4) (f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_73:
    .align 4,0x90
_L_70:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# emit-expr (begin (vector-ref f1 0))
# emit-begin
#   expr=(begin (vector-ref f1 0))
#   env=((f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# emit-expr (vector-ref f1 0)
# emit-expr f1
# emit-variable-ref
# env=((f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
# var=f1
    movl -12(%esp), %eax  # stack load f1
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_84
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_84:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_85"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_85:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_87
    cmp  $0,%eax
    jge _L_86
_L_87:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_86:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f1 . -12) (f2 . -8) (f3 . -4) (f4 . 0))
     movl %eax, string$e$q
# == explicit-begins  ==>
# (letrec ((str->sym (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let* ((new-sym (make-symbol str #f)) (new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym)) (str->sym str (cdr symlist))))))) (lambda (str) (str->sym str (symbols))))
# == eliminate-let*  ==>
# (letrec ((str->sym (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) (str->sym str (cdr symlist))))))) (lambda (str) (str->sym str (symbols))))
# == uniquify-variables  ==>
# (letrec ((f27 (lambda (f36 f37) (if (string=? f36 (symbol->string (car f37))) (car f37) (if (null? (cdr f37)) (let ((f41 (make-symbol f36 #f))) (let ((f43 (cons f41 ()))) (begin (set-cdr! f37 f43) f41))) (f27 f36 (cdr f37))))))) (lambda (f45) (f27 f45 (symbols))))
# == vectorize-letrec  ==>
# (let ((f27 (make-vector 1))) (begin (begin (vector-set! f27 0 (lambda (f36 f37) (if (string=? f36 (symbol->string (car f37))) (car f37) (if (null? (cdr f37)) (let ((f41 (make-symbol f36 #f))) (let ((f43 (cons f41 ()))) (begin (set-cdr! f37 f43) f41))) ((vector-ref f27 0) f36 (cdr f37))))))) (lambda (f45) ((vector-ref f27 0) f45 (symbols)))))
# == eliminate-set!  ==>
# (let ((f27 (make-vector 1))) (begin (begin (vector-set! f27 0 (lambda (f36 f37) (let ((f36 f36) (f37 f37)) (if (string=? f36 (symbol->string (car f37))) (car f37) (if (null? (cdr f37)) (let ((f41 (make-symbol f36 #f))) (let ((f43 (cons f41 ()))) (begin (set-cdr! f37 f43) f41))) ((vector-ref f27 0) f36 (cdr f37)))))))) (lambda (f45) (let ((f45 f45)) ((vector-ref f27 0) f45 (symbols))))))
# == close-free-variables  ==>
# (let ((f27 (make-vector 1))) (begin (begin (vector-set! f27 0 (closure (f36 f37) (string=? f27) (let ((f36 f36) (f37 f37)) (if (string=? f36 (symbol->string (car f37))) (car f37) (if (null? (cdr f37)) (let ((f41 (make-symbol f36 #f))) (let ((f43 (cons f41 ()))) (begin (set-cdr! f37 f43) f41))) ((vector-ref f27 0) f36 (cdr f37)))))))) (closure (f45) (f27 symbols) (let ((f45 f45)) ((vector-ref f27 0) f45 (symbols))))))
# == eliminate-quote  ==>
# (let ((f27 (make-vector 1))) (begin (begin (vector-set! f27 0 (closure (f36 f37) (string=? f27) (let ((f36 f36) (f37 f37)) (if (string=? f36 (symbol->string (car f37))) (car f37) (if (null? (cdr f37)) (let ((f41 (make-symbol f36 #f))) (let ((f43 (cons f41 ()))) (begin (set-cdr! f37 f43) f41))) ((vector-ref f27 0) f36 (cdr f37)))))))) (closure (f45) (f27 symbols) (let ((f45 f45)) ((vector-ref f27 0) f45 (symbols))))))
# == eliminate-when/unless  ==>
# (let ((f27 (make-vector 1))) (begin (begin (vector-set! f27 0 (closure (f36 f37) (string=? f27) (let ((f36 f36) (f37 f37)) (if (string=? f36 (symbol->string (car f37))) (car f37) (if (null? (cdr f37)) (let ((f41 (make-symbol f36 #f))) (let ((f43 (cons f41 ()))) (begin (set-cdr! f37 f43) f41))) ((vector-ref f27 0) f36 (cdr f37)))))))) (closure (f45) (f27 symbols) (let ((f45 f45)) ((vector-ref f27 0) f45 (symbols))))))
# == eliminate-cond  ==>
# (let ((f27 (make-vector 1))) (begin (begin (vector-set! f27 0 (closure (f36 f37) (string=? f27) (let ((f36 f36) (f37 f37)) (if (string=? f36 (symbol->string (car f37))) (car f37) (if (null? (cdr f37)) (let ((f41 (make-symbol f36 #f))) (let ((f43 (cons f41 ()))) (begin (set-cdr! f37 f43) f41))) ((vector-ref f27 0) f36 (cdr f37)))))))) (closure (f45) (f27 symbols) (let ((f45 f45)) ((vector-ref f27 0) f45 (symbols))))))
# == external-symbols  ==>
# (let ((f27 (make-vector 1))) (begin (begin (vector-set! f27 0 (closure (f36 f37) ((primitive-ref string=?) f27) (let ((f36 f36) (f37 f37)) (if ((primitive-ref string=?) f36 (symbol->string (car f37))) (car f37) (if (null? (cdr f37)) (let ((f41 (make-symbol f36 #f))) (let ((f43 (cons f41 ()))) (begin (set-cdr! f37 f43) f41))) ((vector-ref f27 0) f36 (cdr f37)))))))) (closure (f45) (f27 (primitive-ref symbols)) (let ((f45 f45)) ((vector-ref f27 0) f45 ((primitive-ref symbols)))))))
# emit-expr (let ((f27 (make-vector 1))) (begin (begin (vector-set! f27 0 (closure (f36 f37) ((primitive-ref string=?) f27) (let ((f36 f36) (f37 f37)) (if ((primitive-ref string=?) f36 (symbol->string (car f37))) (car f37) (if (null? (cdr f37)) (let ((f41 (make-symbol f36 #f))) (let ((f43 (cons f41 ()))) (begin (set-cdr! f37 f43) f41))) ((vector-ref f27 0) f36 (cdr f37)))))))) (closure (f45) (f27 (primitive-ref symbols)) (let ((f45 f45)) ((vector-ref f27 0) f45 ((primitive-ref symbols)))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f27 (make-vector 1)))
#  body = (begin (begin (vector-set! f27 0 (closure (f36 f37) ((primitive-ref string=?) f27) (let ((f36 f36) (f37 f37)) (if ((primitive-ref string=?) f36 (symbol->string (car f37))) (car f37) (if (null? (cdr f37)) (let ((f41 (make-symbol f36 #f))) (let ((f43 (cons f41 ()))) (begin (set-cdr! f37 f43) f41))) ((vector-ref f27 0) f36 (cdr f37)))))))) (closure (f45) (f27 (primitive-ref symbols)) (let ((f45 f45)) ((vector-ref f27 0) f45 ((primitive-ref symbols))))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_88"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_88:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_89
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_89:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f27 0 (closure (f36 f37) ((primitive-ref string=?) f27) (let ((f36 f36) (f37 f37)) (if ((primitive-ref string=?) f36 (symbol->string (car f37))) (car f37) (if (null? (cdr f37)) (let ((f41 (make-symbol f36 #f))) (let ((f43 (cons f41 ()))) (begin (set-cdr! f37 f43) f41))) ((vector-ref f27 0) f36 (cdr f37)))))))) (closure (f45) (f27 (primitive-ref symbols)) (let ((f45 f45)) ((vector-ref f27 0) f45 ((primitive-ref symbols))))))
# emit-begin
#   expr=(begin (begin (vector-set! f27 0 (closure (f36 f37) ((primitive-ref string=?) f27) (let ((f36 f36) (f37 f37)) (if ((primitive-ref string=?) f36 (symbol->string (car f37))) (car f37) (if (null? (cdr f37)) (let ((f41 (make-symbol f36 #f))) (let ((f43 (cons f41 ()))) (begin (set-cdr! f37 f43) f41))) ((vector-ref f27 0) f36 (cdr f37)))))))) (closure (f45) (f27 (primitive-ref symbols)) (let ((f45 f45)) ((vector-ref f27 0) f45 ((primitive-ref symbols))))))
#   env=((f27 . 0))
# emit-expr (begin (vector-set! f27 0 (closure (f36 f37) ((primitive-ref string=?) f27) (let ((f36 f36) (f37 f37)) (if ((primitive-ref string=?) f36 (symbol->string (car f37))) (car f37) (if (null? (cdr f37)) (let ((f41 (make-symbol f36 #f))) (let ((f43 (cons f41 ()))) (begin (set-cdr! f37 f43) f41))) ((vector-ref f27 0) f36 (cdr f37))))))))
# emit-begin
#   expr=(begin (vector-set! f27 0 (closure (f36 f37) ((primitive-ref string=?) f27) (let ((f36 f36) (f37 f37)) (if ((primitive-ref string=?) f36 (symbol->string (car f37))) (car f37) (if (null? (cdr f37)) (let ((f41 (make-symbol f36 #f))) (let ((f43 (cons f41 ()))) (begin (set-cdr! f37 f43) f41))) ((vector-ref f27 0) f36 (cdr f37))))))))
#   env=((f27 . 0))
# emit-expr (vector-set! f27 0 (closure (f36 f37) ((primitive-ref string=?) f27) (let ((f36 f36) (f37 f37)) (if ((primitive-ref string=?) f36 (symbol->string (car f37))) (car f37) (if (null? (cdr f37)) (let ((f41 (make-symbol f36 #f))) (let ((f43 (cons f41 ()))) (begin (set-cdr! f37 f43) f41))) ((vector-ref f27 0) f36 (cdr f37)))))))
# emit-expr f27
# emit-variable-ref
# env=((f27 . 0))
# var=f27
    movl 0(%esp), %eax  # stack load f27
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_90
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_90:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_91"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_91:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_93
    cmp  $0,%eax
    jge _L_92
_L_93:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_92:
    movl %eax, -8(%esp)
# emit-expr (closure (f36 f37) ((primitive-ref string=?) f27) (let ((f36 f36) (f37 f37)) (if ((primitive-ref string=?) f36 (symbol->string (car f37))) (car f37) (if (null? (cdr f37)) (let ((f41 (make-symbol f36 #f))) (let ((f43 (cons f41 ()))) (begin (set-cdr! f37 f43) f41))) ((vector-ref f27 0) f36 (cdr f37))))))
# emit-closure
# si = -12
# env = ((f27 . 0))
# expr = (closure (f36 f37) ((primitive-ref string=?) f27) (let ((f36 f36) (f37 f37)) (if ((primitive-ref string=?) f36 (symbol->string (car f37))) (car f37) (if (null? (cdr f37)) (let ((f41 (make-symbol f36 #f))) (let ((f43 (cons f41 ()))) (begin (set-cdr! f37 f43) f41))) ((vector-ref f27 0) f36 (cdr f37))))))
    movl $_L_94, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref string=?) not defined in the environmnet
# emit-variable-ref
# env=((f27 . 0))
# var=f27
    movl 0(%esp), %eax  # stack load f27
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f27
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_95            # jump around closure body
_L_94:
# check argument count
    cmp $8,%eax
    je _L_96
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_96:
# emit-tail-expr
# si=-16
# env=((f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
# expr=(let ((f36 f36) (f37 f37)) (if ((primitive-ref string=?) f36 (symbol->string (car f37))) (car f37) (if (null? (cdr f37)) (let ((f41 (make-symbol f36 #f))) (let ((f43 (cons f41 ()))) (begin (set-cdr! f37 f43) f41))) ((vector-ref f27 0) f36 (cdr f37)))))
# emit-tail-let
#  si   = -16
#  env  = ((f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
#  bindings = ((f36 f36) (f37 f37))
#  body = (if ((primitive-ref string=?) f36 (symbol->string (car f37))) (car f37) (if (null? (cdr f37)) (let ((f41 (make-symbol f36 #f))) (let ((f43 (cons f41 ()))) (begin (set-cdr! f37 f43) f41))) ((vector-ref f27 0) f36 (cdr f37))))
# emit-expr f36
# emit-variable-ref
# env=((f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
# var=f36
    movl -8(%esp), %eax  # stack load f36
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f37
# emit-variable-ref
# env=((f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
# var=f37
    movl -12(%esp), %eax  # stack load f37
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f37 . -20) (f36 . -16) (f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
# expr=(if ((primitive-ref string=?) f36 (symbol->string (car f37))) (car f37) (if (null? (cdr f37)) (let ((f41 (make-symbol f36 #f))) (let ((f43 (cons f41 ()))) (begin (set-cdr! f37 f43) f41))) ((vector-ref f27 0) f36 (cdr f37))))
# emit-expr ((primitive-ref string=?) f36 (symbol->string (car f37)))
# funcall
#    si   =-24
#    env  = ((f37 . -20) (f36 . -16) (f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
#    expr = (funcall (primitive-ref string=?) f36 (symbol->string (car f37)))
# emit-expr (primitive-ref string=?)
    .extern string$e$q
    movl string$e$q,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_99"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_99":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f36
# emit-variable-ref
# env=((f37 . -20) (f36 . -16) (f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
# var=f36
    movl -16(%esp), %eax  # stack load f36
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f36
# emit-expr (symbol->string (car f37))
# symbol->string (car f37)
# emit-expr (car f37)
# emit-expr f37
# emit-variable-ref
# env=((f37 . -20) (f36 . -16) (f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
# var=f37
    movl -20(%esp), %eax  # stack load f37
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_100
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_100:
    movl -1(%eax), %eax
    movl -3(%eax), %eax
    mov %eax, -40(%esp)  # arg (symbol->string (car f37))
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_97
# emit-tail-expr
# si=-24
# env=((f37 . -20) (f36 . -16) (f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
# expr=(car f37)
# tail primcall
# emit-expr f37
# emit-variable-ref
# env=((f37 . -20) (f36 . -16) (f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
# var=f37
    movl -20(%esp), %eax  # stack load f37
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_101
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_101:
    movl -1(%eax), %eax
#return from tail (car f37)
    ret
    jmp _L_98
_L_97:
# emit-tail-expr
# si=-24
# env=((f37 . -20) (f36 . -16) (f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
# expr=(if (null? (cdr f37)) (let ((f41 (make-symbol f36 #f))) (let ((f43 (cons f41 ()))) (begin (set-cdr! f37 f43) f41))) ((vector-ref f27 0) f36 (cdr f37)))
# emit-expr (null? (cdr f37))
# emit-expr (cdr f37)
# emit-expr f37
# emit-variable-ref
# env=((f37 . -20) (f36 . -16) (f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
# var=f37
    movl -20(%esp), %eax  # stack load f37
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_104
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_104:
    movl 3(%eax), %eax
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_102
# emit-tail-expr
# si=-24
# env=((f37 . -20) (f36 . -16) (f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
# expr=(let ((f41 (make-symbol f36 #f))) (let ((f43 (cons f41 ()))) (begin (set-cdr! f37 f43) f41)))
# emit-tail-let
#  si   = -24
#  env  = ((f37 . -20) (f36 . -16) (f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
#  bindings = ((f41 (make-symbol f36 #f)))
#  body = (let ((f43 (cons f41 ()))) (begin (set-cdr! f37 f43) f41))
# emit-expr (make-symbol f36 #f)
# make-symbol arg1=f36 arg2=#f
# emit-expr f36
# emit-variable-ref
# env=((f37 . -20) (f36 . -16) (f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
# var=f36
    movl -16(%esp), %eax  # stack load f36
# end emit-variable-ref
    movl %eax, -24(%esp)
# emit-expr #f
    movl $47, %eax     # immed #f
    movl %eax, 4(%ebp)
    movl -24(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $3, %eax
    add  $8, %ebp
# make-symbol end
    movl %eax, -24(%esp)  # stack save
# emit-tail-expr
# si=-28
# env=((f41 . -24) (f37 . -20) (f36 . -16) (f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
# expr=(let ((f43 (cons f41 ()))) (begin (set-cdr! f37 f43) f41))
# emit-tail-let
#  si   = -28
#  env  = ((f41 . -24) (f37 . -20) (f36 . -16) (f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
#  bindings = ((f43 (cons f41 ())))
#  body = (begin (set-cdr! f37 f43) f41)
# emit-expr (cons f41 ())
# cons arg1=f41 arg2=()
# emit-expr f41
# emit-variable-ref
# env=((f41 . -24) (f37 . -20) (f36 . -16) (f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
# var=f41
    movl -24(%esp), %eax  # stack load f41
# end emit-variable-ref
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
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((f43 . -28) (f41 . -24) (f37 . -20) (f36 . -16) (f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
# expr=(begin (set-cdr! f37 f43) f41)
# tail-begin (begin (set-cdr! f37 f43) f41)
#   env=((f43 . -28) (f41 . -24) (f37 . -20) (f36 . -16) (f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
# emit-expr (set-cdr! f37 f43)
# emit-expr f37
# emit-variable-ref
# env=((f43 . -28) (f41 . -24) (f37 . -20) (f36 . -16) (f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
# var=f37
    movl -20(%esp), %eax  # stack load f37
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_105
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_105:
    movl %eax, -32(%esp)
# emit-expr f43
# emit-variable-ref
# env=((f43 . -28) (f41 . -24) (f37 . -20) (f36 . -16) (f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
# var=f43
    movl -28(%esp), %eax  # stack load f43
# end emit-variable-ref
    movl -32(%esp), %ebx
    movl %eax, 3(%ebx)
# emit-tail-expr
# si=-32
# env=((f43 . -28) (f41 . -24) (f37 . -20) (f36 . -16) (f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
# expr=(begin f41)
# tail-begin (begin f41)
#   env=((f43 . -28) (f41 . -24) (f37 . -20) (f36 . -16) (f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
# emit-tail-expr
# si=-32
# env=((f43 . -28) (f41 . -24) (f37 . -20) (f36 . -16) (f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
# expr=f41
# emit-tail-variable-ref
# emit-variable-ref
# env=((f43 . -28) (f41 . -24) (f37 . -20) (f36 . -16) (f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
# var=f41
    movl -24(%esp), %eax  # stack load f41
# end emit-variable-ref
    ret
# end emit-tail-variable ref
     ret   # return thru stack
    jmp _L_103
_L_102:
# emit-tail-expr
# si=-24
# env=((f37 . -20) (f36 . -16) (f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
# expr=((vector-ref f27 0) f36 (cdr f37))
# emit-tail-funcall
#    si   =-24
#    env  = ((f37 . -20) (f36 . -16) (f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
#    expr = (funcall (vector-ref f27 0) f36 (cdr f37))
# emit-expr (vector-ref f27 0)
# emit-expr f27
# emit-variable-ref
# env=((f37 . -20) (f36 . -16) (f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
# var=f27
    movl 6(%edi), %eax  # frame load f27
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_106
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_106:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_107"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_107:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_109
    cmp  $0,%eax
    jge _L_108
_L_109:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_108:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr f36
# emit-variable-ref
# env=((f37 . -20) (f36 . -16) (f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
# var=f36
    movl -16(%esp), %eax  # stack load f36
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f36
# emit-expr (cdr f37)
# emit-expr f37
# emit-variable-ref
# env=((f37 . -20) (f36 . -16) (f37 . -12) (f36 . -8) (f27 . 8) ((primitive-ref string=?) . 4) (f27 . 0))
# var=f37
    movl -20(%esp), %eax  # stack load f37
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_110
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_110:
    movl 3(%eax), %eax
    mov %eax, -32(%esp)    # arg (cdr f37)
    movl -24(%esp), %edi   # load new closure to %edi
# emit-shift-args:  size=3   si=-24  delta=20
    mov -24(%esp), %ebx  # shift frame cell
    mov %ebx, -4(%esp)  # down to base
# emit-shift-args:  size=2   si=-28  delta=20
    mov -28(%esp), %ebx  # shift frame cell
    mov %ebx, -8(%esp)  # down to base
# emit-shift-args:  size=1   si=-32  delta=20
    mov -32(%esp), %ebx  # shift frame cell
    mov %ebx, -12(%esp)  # down to base
# emit-shift-args:  size=0   si=-36  delta=20
    movl $8,%eax   # save arg count
    jmp *-2(%edi)  # tail-funcall
_L_103:
_L_98:
    .align 4,0x90
_L_95:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f27 . 0))
# emit-expr (begin (closure (f45) (f27 (primitive-ref symbols)) (let ((f45 f45)) ((vector-ref f27 0) f45 ((primitive-ref symbols))))))
# emit-begin
#   expr=(begin (closure (f45) (f27 (primitive-ref symbols)) (let ((f45 f45)) ((vector-ref f27 0) f45 ((primitive-ref symbols))))))
#   env=((f27 . 0))
# emit-expr (closure (f45) (f27 (primitive-ref symbols)) (let ((f45 f45)) ((vector-ref f27 0) f45 ((primitive-ref symbols)))))
# emit-closure
# si = -4
# env = ((f27 . 0))
# expr = (closure (f45) (f27 (primitive-ref symbols)) (let ((f45 f45)) ((vector-ref f27 0) f45 ((primitive-ref symbols)))))
    movl $_L_111, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f27 . 0))
# var=f27
    movl 0(%esp), %eax  # stack load f27
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f27
# WARNING: free var (primitive-ref symbols) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_112            # jump around closure body
_L_111:
# check argument count
    cmp $4,%eax
    je _L_113
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_113:
# emit-tail-expr
# si=-12
# env=((f45 . -8) ((primitive-ref symbols) . 8) (f27 . 4) (f27 . 0))
# expr=(let ((f45 f45)) ((vector-ref f27 0) f45 ((primitive-ref symbols))))
# emit-tail-let
#  si   = -12
#  env  = ((f45 . -8) ((primitive-ref symbols) . 8) (f27 . 4) (f27 . 0))
#  bindings = ((f45 f45))
#  body = ((vector-ref f27 0) f45 ((primitive-ref symbols)))
# emit-expr f45
# emit-variable-ref
# env=((f45 . -8) ((primitive-ref symbols) . 8) (f27 . 4) (f27 . 0))
# var=f45
    movl -8(%esp), %eax  # stack load f45
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f45 . -12) (f45 . -8) ((primitive-ref symbols) . 8) (f27 . 4) (f27 . 0))
# expr=((vector-ref f27 0) f45 ((primitive-ref symbols)))
# emit-tail-funcall
#    si   =-16
#    env  = ((f45 . -12) (f45 . -8) ((primitive-ref symbols) . 8) (f27 . 4) (f27 . 0))
#    expr = (funcall (vector-ref f27 0) f45 ((primitive-ref symbols)))
# emit-expr (vector-ref f27 0)
# emit-expr f27
# emit-variable-ref
# env=((f45 . -12) (f45 . -8) ((primitive-ref symbols) . 8) (f27 . 4) (f27 . 0))
# var=f27
    movl 2(%edi), %eax  # frame load f27
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_114
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_114:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_115"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_115:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_117
    cmp  $0,%eax
    jge _L_116
_L_117:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_116:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f45
# emit-variable-ref
# env=((f45 . -12) (f45 . -8) ((primitive-ref symbols) . 8) (f27 . 4) (f27 . 0))
# var=f45
    movl -12(%esp), %eax  # stack load f45
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f45
# emit-expr ((primitive-ref symbols))
# funcall
#    si   =-24
#    env  = ((f45 . -12) (f45 . -8) ((primitive-ref symbols) . 8) (f27 . 4) (f27 . 0))
#    expr = (funcall (primitive-ref symbols))
# emit-expr (primitive-ref symbols)
    .extern symbols
    movl symbols,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_118"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_118":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -24(%esp)    # arg ((primitive-ref symbols))
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
    .align 4,0x90
_L_112:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f27 . 0))
     movl %eax, string$m$gsymbol
# == explicit-begins  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == eliminate-let*  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == uniquify-variables  ==>
# (lambda (f46 f47) (if (null? f46) (cons e nil) (cons (car f46) (append1 (cdr f46) f47))))
# == vectorize-letrec  ==>
# (lambda (f46 f47) (if (null? f46) (cons e nil) (cons (car f46) (append1 (cdr f46) f47))))
# == eliminate-set!  ==>
# (lambda (f46 f47) (let ((f46 f46) (f47 f47)) (if (null? f46) (cons e nil) (cons (car f46) (append1 (cdr f46) f47)))))
# == close-free-variables  ==>
# (closure (f46 f47) (e nil append1) (let ((f46 f46) (f47 f47)) (if (null? f46) (cons e nil) (cons (car f46) (append1 (cdr f46) f47)))))
# == eliminate-quote  ==>
# (closure (f46 f47) (e nil append1) (let ((f46 f46) (f47 f47)) (if (null? f46) (cons e nil) (cons (car f46) (append1 (cdr f46) f47)))))
# == eliminate-when/unless  ==>
# (closure (f46 f47) (e nil append1) (let ((f46 f46) (f47 f47)) (if (null? f46) (cons e nil) (cons (car f46) (append1 (cdr f46) f47)))))
# == eliminate-cond  ==>
# (closure (f46 f47) (e nil append1) (let ((f46 f46) (f47 f47)) (if (null? f46) (cons e nil) (cons (car f46) (append1 (cdr f46) f47)))))
# == external-symbols  ==>
# (closure (f46 f47) (e nil (primitive-ref append1)) (let ((f46 f46) (f47 f47)) (if (null? f46) (cons e nil) (cons (car f46) ((primitive-ref append1) (cdr f46) f47)))))
# emit-expr (closure (f46 f47) (e nil (primitive-ref append1)) (let ((f46 f46) (f47 f47)) (if (null? f46) (cons e nil) (cons (car f46) ((primitive-ref append1) (cdr f46) f47)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f46 f47) (e nil (primitive-ref append1)) (let ((f46 f46) (f47 f47)) (if (null? f46) (cons e nil) (cons (car f46) ((primitive-ref append1) (cdr f46) f47)))))
    movl $_L_119, 0(%ebp)  # closure label
# WARNING: free var e not defined in the environmnet
# WARNING: free var nil not defined in the environmnet
# WARNING: free var (primitive-ref append1) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_120            # jump around closure body
_L_119:
# check argument count
    cmp $8,%eax
    je _L_121
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_121:
# emit-tail-expr
# si=-16
# env=((f47 . -12) (f46 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(let ((f46 f46) (f47 f47)) (if (null? f46) (cons e nil) (cons (car f46) ((primitive-ref append1) (cdr f46) f47))))
# emit-tail-let
#  si   = -16
#  env  = ((f47 . -12) (f46 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
#  bindings = ((f46 f46) (f47 f47))
#  body = (if (null? f46) (cons e nil) (cons (car f46) ((primitive-ref append1) (cdr f46) f47)))
# emit-expr f46
# emit-variable-ref
# env=((f47 . -12) (f46 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f46
    movl -8(%esp), %eax  # stack load f46
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f47
# emit-variable-ref
# env=((f47 . -12) (f46 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f47
    movl -12(%esp), %eax  # stack load f47
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f47 . -20) (f46 . -16) (f47 . -12) (f46 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(if (null? f46) (cons e nil) (cons (car f46) ((primitive-ref append1) (cdr f46) f47)))
# emit-expr (null? f46)
# emit-expr f46
# emit-variable-ref
# env=((f47 . -20) (f46 . -16) (f47 . -12) (f46 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f46
    movl -16(%esp), %eax  # stack load f46
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_122
# emit-tail-expr
# si=-24
# env=((f47 . -20) (f46 . -16) (f47 . -12) (f46 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(cons e nil)
# tail primcall
# cons arg1=e arg2=nil
# emit-expr e
# emit-variable-ref
# env=((f47 . -20) (f46 . -16) (f47 . -12) (f46 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=e
    movl 2(%edi), %eax  # frame load e
# end emit-variable-ref
    movl %eax, -24(%esp)
# emit-expr nil
# emit-variable-ref
# env=((f47 . -20) (f46 . -16) (f47 . -12) (f46 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=nil
    movl 6(%edi), %eax  # frame load nil
# end emit-variable-ref
    movl %eax, 4(%ebp)
    movl -24(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
#return from tail (cons e nil)
    ret
    jmp _L_123
_L_122:
# emit-tail-expr
# si=-24
# env=((f47 . -20) (f46 . -16) (f47 . -12) (f46 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(cons (car f46) ((primitive-ref append1) (cdr f46) f47))
# tail primcall
# cons arg1=(car f46) arg2=((primitive-ref append1) (cdr f46) f47)
# emit-expr (car f46)
# emit-expr f46
# emit-variable-ref
# env=((f47 . -20) (f46 . -16) (f47 . -12) (f46 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f46
    movl -16(%esp), %eax  # stack load f46
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_124
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_124:
    movl -1(%eax), %eax
    movl %eax, -24(%esp)
# emit-expr ((primitive-ref append1) (cdr f46) f47)
# funcall
#    si   =-28
#    env  = ((f47 . -20) (f46 . -16) (f47 . -12) (f46 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
#    expr = (funcall (primitive-ref append1) (cdr f46) f47)
# emit-expr (primitive-ref append1)
    .extern append1
    movl append1,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_125"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_125":
   movl %eax,  -36(%esp)  # stash funcall-oper in closure slot
# emit-expr (cdr f46)
# emit-expr f46
# emit-variable-ref
# env=((f47 . -20) (f46 . -16) (f47 . -12) (f46 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f46
    movl -16(%esp), %eax  # stack load f46
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_126
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_126:
    movl 3(%eax), %eax
    mov %eax, -40(%esp)  # arg (cdr f46)
# emit-expr f47
# emit-variable-ref
# env=((f47 . -20) (f46 . -16) (f47 . -12) (f46 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f47
    movl -20(%esp), %eax  # stack load f47
# end emit-variable-ref
    mov %eax, -44(%esp)  # arg f47
    movl -36(%esp), %edi   # load new closure to %edi
    add $-28, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $28, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, 4(%ebp)
    movl -24(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
#return from tail (cons (car f46) ((primitive-ref append1) (cdr f46) f47))
    ret
_L_123:
    .align 4,0x90
_L_120:
     movl %eax, append1
# == explicit-begins  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == eliminate-let*  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == uniquify-variables  ==>
# (lambda (f48 f49) (if (fx= f49 0) (car f48) (list-ref (cdr f48) (fx- f49 1))))
# == vectorize-letrec  ==>
# (lambda (f48 f49) (if (fx= f49 0) (car f48) (list-ref (cdr f48) (fx- f49 1))))
# == eliminate-set!  ==>
# (lambda (f48 f49) (let ((f48 f48) (f49 f49)) (if (fx= f49 0) (car f48) (list-ref (cdr f48) (fx- f49 1)))))
# == close-free-variables  ==>
# (closure (f48 f49) (list-ref) (let ((f48 f48) (f49 f49)) (if (fx= f49 0) (car f48) (list-ref (cdr f48) (fx- f49 1)))))
# == eliminate-quote  ==>
# (closure (f48 f49) (list-ref) (let ((f48 f48) (f49 f49)) (if (fx= f49 0) (car f48) (list-ref (cdr f48) (fx- f49 1)))))
# == eliminate-when/unless  ==>
# (closure (f48 f49) (list-ref) (let ((f48 f48) (f49 f49)) (if (fx= f49 0) (car f48) (list-ref (cdr f48) (fx- f49 1)))))
# == eliminate-cond  ==>
# (closure (f48 f49) (list-ref) (let ((f48 f48) (f49 f49)) (if (fx= f49 0) (car f48) (list-ref (cdr f48) (fx- f49 1)))))
# == external-symbols  ==>
# (closure (f48 f49) ((primitive-ref list-ref)) (let ((f48 f48) (f49 f49)) (if (fx= f49 0) (car f48) ((primitive-ref list-ref) (cdr f48) (fx- f49 1)))))
# emit-expr (closure (f48 f49) ((primitive-ref list-ref)) (let ((f48 f48) (f49 f49)) (if (fx= f49 0) (car f48) ((primitive-ref list-ref) (cdr f48) (fx- f49 1)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f48 f49) ((primitive-ref list-ref)) (let ((f48 f48) (f49 f49)) (if (fx= f49 0) (car f48) ((primitive-ref list-ref) (cdr f48) (fx- f49 1)))))
    movl $_L_127, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_128            # jump around closure body
_L_127:
# check argument count
    cmp $8,%eax
    je _L_129
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_129:
# emit-tail-expr
# si=-16
# env=((f49 . -12) (f48 . -8) ((primitive-ref list-ref) . 4))
# expr=(let ((f48 f48) (f49 f49)) (if (fx= f49 0) (car f48) ((primitive-ref list-ref) (cdr f48) (fx- f49 1))))
# emit-tail-let
#  si   = -16
#  env  = ((f49 . -12) (f48 . -8) ((primitive-ref list-ref) . 4))
#  bindings = ((f48 f48) (f49 f49))
#  body = (if (fx= f49 0) (car f48) ((primitive-ref list-ref) (cdr f48) (fx- f49 1)))
# emit-expr f48
# emit-variable-ref
# env=((f49 . -12) (f48 . -8) ((primitive-ref list-ref) . 4))
# var=f48
    movl -8(%esp), %eax  # stack load f48
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f49
# emit-variable-ref
# env=((f49 . -12) (f48 . -8) ((primitive-ref list-ref) . 4))
# var=f49
    movl -12(%esp), %eax  # stack load f49
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f49 . -20) (f48 . -16) (f49 . -12) (f48 . -8) ((primitive-ref list-ref) . 4))
# expr=(if (fx= f49 0) (car f48) ((primitive-ref list-ref) (cdr f48) (fx- f49 1)))
# emit-expr (fx= f49 0)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_132"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_132:
    movl %eax, -24(%esp)
# emit-expr f49
# emit-variable-ref
# env=((f49 . -20) (f48 . -16) (f49 . -12) (f48 . -8) ((primitive-ref list-ref) . 4))
# var=f49
    movl -20(%esp), %eax  # stack load f49
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_133"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_133:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_130
# emit-tail-expr
# si=-24
# env=((f49 . -20) (f48 . -16) (f49 . -12) (f48 . -8) ((primitive-ref list-ref) . 4))
# expr=(car f48)
# tail primcall
# emit-expr f48
# emit-variable-ref
# env=((f49 . -20) (f48 . -16) (f49 . -12) (f48 . -8) ((primitive-ref list-ref) . 4))
# var=f48
    movl -16(%esp), %eax  # stack load f48
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_134
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_134:
    movl -1(%eax), %eax
#return from tail (car f48)
    ret
    jmp _L_131
_L_130:
# emit-tail-expr
# si=-24
# env=((f49 . -20) (f48 . -16) (f49 . -12) (f48 . -8) ((primitive-ref list-ref) . 4))
# expr=((primitive-ref list-ref) (cdr f48) (fx- f49 1))
# emit-tail-funcall
#    si   =-24
#    env  = ((f49 . -20) (f48 . -16) (f49 . -12) (f48 . -8) ((primitive-ref list-ref) . 4))
#    expr = (funcall (primitive-ref list-ref) (cdr f48) (fx- f49 1))
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr (cdr f48)
# emit-expr f48
# emit-variable-ref
# env=((f49 . -20) (f48 . -16) (f49 . -12) (f48 . -8) ((primitive-ref list-ref) . 4))
# var=f48
    movl -16(%esp), %eax  # stack load f48
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_135
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_135:
    movl 3(%eax), %eax
    mov %eax, -28(%esp)    # arg (cdr f48)
# emit-expr (fx- f49 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_136"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_136:
    movl %eax, -32(%esp)
# emit-expr f49
# emit-variable-ref
# env=((f49 . -20) (f48 . -16) (f49 . -12) (f48 . -8) ((primitive-ref list-ref) . 4))
# var=f49
    movl -20(%esp), %eax  # stack load f49
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_137"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_137:
    subl -32(%esp), %eax
    mov %eax, -32(%esp)    # arg (fx- f49 1)
    movl -24(%esp), %edi   # load new closure to %edi
# emit-shift-args:  size=3   si=-24  delta=20
    mov -24(%esp), %ebx  # shift frame cell
    mov %ebx, -4(%esp)  # down to base
# emit-shift-args:  size=2   si=-28  delta=20
    mov -28(%esp), %ebx  # shift frame cell
    mov %ebx, -8(%esp)  # down to base
# emit-shift-args:  size=1   si=-32  delta=20
    mov -32(%esp), %ebx  # shift frame cell
    mov %ebx, -12(%esp)  # down to base
# emit-shift-args:  size=0   si=-36  delta=20
    movl $8,%eax   # save arg count
    jmp *-2(%edi)  # tail-funcall
_L_131:
    .align 4,0x90
_L_128:
     movl %eax, list$mref
# == explicit-begins  ==>
# (lambda (l) (if (null? l) 0 (fxadd1 (list-length (cdr l)))))
# == eliminate-let*  ==>
# (lambda (l) (if (null? l) 0 (fxadd1 (list-length (cdr l)))))
# == uniquify-variables  ==>
# (lambda (f50) (if (null? f50) 0 (fxadd1 (list-length (cdr f50)))))
# == vectorize-letrec  ==>
# (lambda (f50) (if (null? f50) 0 (fxadd1 (list-length (cdr f50)))))
# == eliminate-set!  ==>
# (lambda (f50) (let ((f50 f50)) (if (null? f50) 0 (fxadd1 (list-length (cdr f50))))))
# == close-free-variables  ==>
# (closure (f50) (list-length) (let ((f50 f50)) (if (null? f50) 0 (fxadd1 (list-length (cdr f50))))))
# == eliminate-quote  ==>
# (closure (f50) (list-length) (let ((f50 f50)) (if (null? f50) 0 (fxadd1 (list-length (cdr f50))))))
# == eliminate-when/unless  ==>
# (closure (f50) (list-length) (let ((f50 f50)) (if (null? f50) 0 (fxadd1 (list-length (cdr f50))))))
# == eliminate-cond  ==>
# (closure (f50) (list-length) (let ((f50 f50)) (if (null? f50) 0 (fxadd1 (list-length (cdr f50))))))
# == external-symbols  ==>
# (closure (f50) ((primitive-ref list-length)) (let ((f50 f50)) (if (null? f50) 0 (fxadd1 ((primitive-ref list-length) (cdr f50))))))
# emit-expr (closure (f50) ((primitive-ref list-length)) (let ((f50 f50)) (if (null? f50) 0 (fxadd1 ((primitive-ref list-length) (cdr f50))))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f50) ((primitive-ref list-length)) (let ((f50 f50)) (if (null? f50) 0 (fxadd1 ((primitive-ref list-length) (cdr f50))))))
    movl $_L_138, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref list-length) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_139            # jump around closure body
_L_138:
# check argument count
    cmp $4,%eax
    je _L_140
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_140:
# emit-tail-expr
# si=-12
# env=((f50 . -8) ((primitive-ref list-length) . 4))
# expr=(let ((f50 f50)) (if (null? f50) 0 (fxadd1 ((primitive-ref list-length) (cdr f50)))))
# emit-tail-let
#  si   = -12
#  env  = ((f50 . -8) ((primitive-ref list-length) . 4))
#  bindings = ((f50 f50))
#  body = (if (null? f50) 0 (fxadd1 ((primitive-ref list-length) (cdr f50))))
# emit-expr f50
# emit-variable-ref
# env=((f50 . -8) ((primitive-ref list-length) . 4))
# var=f50
    movl -8(%esp), %eax  # stack load f50
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f50 . -12) (f50 . -8) ((primitive-ref list-length) . 4))
# expr=(if (null? f50) 0 (fxadd1 ((primitive-ref list-length) (cdr f50))))
# emit-expr (null? f50)
# emit-expr f50
# emit-variable-ref
# env=((f50 . -12) (f50 . -8) ((primitive-ref list-length) . 4))
# var=f50
    movl -12(%esp), %eax  # stack load f50
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_141
# emit-tail-expr
# si=-16
# env=((f50 . -12) (f50 . -8) ((primitive-ref list-length) . 4))
# expr=0
    movl $0, %eax     # immed 0
    ret                  # immediate tail return
    jmp _L_142
_L_141:
# emit-tail-expr
# si=-16
# env=((f50 . -12) (f50 . -8) ((primitive-ref list-length) . 4))
# expr=(fxadd1 ((primitive-ref list-length) (cdr f50)))
# tail primcall
# emit-expr ((primitive-ref list-length) (cdr f50))
# funcall
#    si   =-16
#    env  = ((f50 . -12) (f50 . -8) ((primitive-ref list-length) . 4))
#    expr = (funcall (primitive-ref list-length) (cdr f50))
# emit-expr (primitive-ref list-length)
    .extern list$mlength
    movl list$mlength,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_143"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_143":
   movl %eax,  -24(%esp)  # stash funcall-oper in closure slot
# emit-expr (cdr f50)
# emit-expr f50
# emit-variable-ref
# env=((f50 . -12) (f50 . -8) ((primitive-ref list-length) . 4))
# var=f50
    movl -12(%esp), %eax  # stack load f50
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_144
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_144:
    movl 3(%eax), %eax
    mov %eax, -28(%esp)  # arg (cdr f50)
    movl -24(%esp), %edi   # load new closure to %edi
    add $-16, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $16, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_145"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_145:
     addl $4, %eax
#return from tail (fxadd1 ((primitive-ref list-length) (cdr f50)))
    ret
_L_142:
    .align 4,0x90
_L_139:
     movl %eax, list$mlength
# == explicit-begins  ==>
# (letrec ((fill-vector (lambda (v k args) (if (null? args) v (begin (vector-set! v k (car args)) (fill-vector v (fxadd1 k) (cdr args))))))) (lambda args (let ((v (make-vector (list-length args)))) (fill-vector v 0 args))))
# == eliminate-let*  ==>
# (letrec ((fill-vector (lambda (v k args) (if (null? args) v (begin (vector-set! v k (car args)) (fill-vector v (fxadd1 k) (cdr args))))))) (lambda args (let ((v (make-vector (list-length args)))) (fill-vector v 0 args))))
# == uniquify-variables  ==>
# (letrec ((f51 (lambda (f55 f56 f57) (if (null? f57) f55 (begin (vector-set! f55 f56 (car f57)) (f51 f55 (fxadd1 f56) (cdr f57))))))) (lambda f61 (let ((f63 (make-vector (list-length f61)))) (f51 f63 0 f61))))
# == vectorize-letrec  ==>
# (let ((f51 (make-vector 1))) (begin (begin (vector-set! f51 0 (lambda (f55 f56 f57) (if (null? f57) f55 (begin (vector-set! f55 f56 (car f57)) ((vector-ref f51 0) f55 (fxadd1 f56) (cdr f57))))))) (lambda f61 (let ((f63 (make-vector (list-length f61)))) ((vector-ref f51 0) f63 0 f61)))))
# == eliminate-set!  ==>
# (let ((f51 (make-vector 1))) (begin (begin (vector-set! f51 0 (lambda (f55 f56 f57) (let ((f55 f55) (f56 f56) (f57 f57)) (if (null? f57) f55 (begin (vector-set! f55 f56 (car f57)) ((vector-ref f51 0) f55 (fxadd1 f56) (cdr f57)))))))) (lambda f61 (let () (let ((f63 (make-vector (list-length f61)))) ((vector-ref f51 0) f63 0 f61))))))
# == close-free-variables  ==>
# (let ((f51 (make-vector 1))) (begin (begin (vector-set! f51 0 (closure (f55 f56 f57) (f51) (let ((f55 f55) (f56 f56) (f57 f57)) (if (null? f57) f55 (begin (vector-set! f55 f56 (car f57)) ((vector-ref f51 0) f55 (fxadd1 f56) (cdr f57)))))))) (closure f61 (f51) (let () (let ((f63 (make-vector (list-length f61)))) ((vector-ref f51 0) f63 0 f61))))))
# == eliminate-quote  ==>
# (let ((f51 (make-vector 1))) (begin (begin (vector-set! f51 0 (closure (f55 f56 f57) (f51) (let ((f55 f55) (f56 f56) (f57 f57)) (if (null? f57) f55 (begin (vector-set! f55 f56 (car f57)) ((vector-ref f51 0) f55 (fxadd1 f56) (cdr f57)))))))) (closure f61 (f51) (let () (let ((f63 (make-vector (list-length f61)))) ((vector-ref f51 0) f63 0 f61))))))
# == eliminate-when/unless  ==>
# (let ((f51 (make-vector 1))) (begin (begin (vector-set! f51 0 (closure (f55 f56 f57) (f51) (let ((f55 f55) (f56 f56) (f57 f57)) (if (null? f57) f55 (begin (vector-set! f55 f56 (car f57)) ((vector-ref f51 0) f55 (fxadd1 f56) (cdr f57)))))))) (closure f61 (f51) (let () (let ((f63 (make-vector (list-length f61)))) ((vector-ref f51 0) f63 0 f61))))))
# == eliminate-cond  ==>
# (let ((f51 (make-vector 1))) (begin (begin (vector-set! f51 0 (closure (f55 f56 f57) (f51) (let ((f55 f55) (f56 f56) (f57 f57)) (if (null? f57) f55 (begin (vector-set! f55 f56 (car f57)) ((vector-ref f51 0) f55 (fxadd1 f56) (cdr f57)))))))) (closure f61 (f51) (let () (let ((f63 (make-vector (list-length f61)))) ((vector-ref f51 0) f63 0 f61))))))
# == external-symbols  ==>
# (let ((f51 (make-vector 1))) (begin (begin (vector-set! f51 0 (closure (f55 f56 f57) (f51) (let ((f55 f55) (f56 f56) (f57 f57)) (if (null? f57) f55 (begin (vector-set! f55 f56 (car f57)) ((vector-ref f51 0) f55 (fxadd1 f56) (cdr f57)))))))) (closure f61 (f51) (let () (let ((f63 (make-vector ((primitive-ref list-length) f61)))) ((vector-ref f51 0) f63 0 f61))))))
# emit-expr (let ((f51 (make-vector 1))) (begin (begin (vector-set! f51 0 (closure (f55 f56 f57) (f51) (let ((f55 f55) (f56 f56) (f57 f57)) (if (null? f57) f55 (begin (vector-set! f55 f56 (car f57)) ((vector-ref f51 0) f55 (fxadd1 f56) (cdr f57)))))))) (closure f61 (f51) (let () (let ((f63 (make-vector ((primitive-ref list-length) f61)))) ((vector-ref f51 0) f63 0 f61))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f51 (make-vector 1)))
#  body = (begin (begin (vector-set! f51 0 (closure (f55 f56 f57) (f51) (let ((f55 f55) (f56 f56) (f57 f57)) (if (null? f57) f55 (begin (vector-set! f55 f56 (car f57)) ((vector-ref f51 0) f55 (fxadd1 f56) (cdr f57)))))))) (closure f61 (f51) (let () (let ((f63 (make-vector ((primitive-ref list-length) f61)))) ((vector-ref f51 0) f63 0 f61)))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_146"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_146:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_147
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_147:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f51 0 (closure (f55 f56 f57) (f51) (let ((f55 f55) (f56 f56) (f57 f57)) (if (null? f57) f55 (begin (vector-set! f55 f56 (car f57)) ((vector-ref f51 0) f55 (fxadd1 f56) (cdr f57)))))))) (closure f61 (f51) (let () (let ((f63 (make-vector ((primitive-ref list-length) f61)))) ((vector-ref f51 0) f63 0 f61)))))
# emit-begin
#   expr=(begin (begin (vector-set! f51 0 (closure (f55 f56 f57) (f51) (let ((f55 f55) (f56 f56) (f57 f57)) (if (null? f57) f55 (begin (vector-set! f55 f56 (car f57)) ((vector-ref f51 0) f55 (fxadd1 f56) (cdr f57)))))))) (closure f61 (f51) (let () (let ((f63 (make-vector ((primitive-ref list-length) f61)))) ((vector-ref f51 0) f63 0 f61)))))
#   env=((f51 . 0))
# emit-expr (begin (vector-set! f51 0 (closure (f55 f56 f57) (f51) (let ((f55 f55) (f56 f56) (f57 f57)) (if (null? f57) f55 (begin (vector-set! f55 f56 (car f57)) ((vector-ref f51 0) f55 (fxadd1 f56) (cdr f57))))))))
# emit-begin
#   expr=(begin (vector-set! f51 0 (closure (f55 f56 f57) (f51) (let ((f55 f55) (f56 f56) (f57 f57)) (if (null? f57) f55 (begin (vector-set! f55 f56 (car f57)) ((vector-ref f51 0) f55 (fxadd1 f56) (cdr f57))))))))
#   env=((f51 . 0))
# emit-expr (vector-set! f51 0 (closure (f55 f56 f57) (f51) (let ((f55 f55) (f56 f56) (f57 f57)) (if (null? f57) f55 (begin (vector-set! f55 f56 (car f57)) ((vector-ref f51 0) f55 (fxadd1 f56) (cdr f57)))))))
# emit-expr f51
# emit-variable-ref
# env=((f51 . 0))
# var=f51
    movl 0(%esp), %eax  # stack load f51
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_148
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_148:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_149"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_149:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_151
    cmp  $0,%eax
    jge _L_150
_L_151:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_150:
    movl %eax, -8(%esp)
# emit-expr (closure (f55 f56 f57) (f51) (let ((f55 f55) (f56 f56) (f57 f57)) (if (null? f57) f55 (begin (vector-set! f55 f56 (car f57)) ((vector-ref f51 0) f55 (fxadd1 f56) (cdr f57))))))
# emit-closure
# si = -12
# env = ((f51 . 0))
# expr = (closure (f55 f56 f57) (f51) (let ((f55 f55) (f56 f56) (f57 f57)) (if (null? f57) f55 (begin (vector-set! f55 f56 (car f57)) ((vector-ref f51 0) f55 (fxadd1 f56) (cdr f57))))))
    movl $_L_152, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f51 . 0))
# var=f51
    movl 0(%esp), %eax  # stack load f51
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f51
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_153            # jump around closure body
_L_152:
# check argument count
    cmp $12,%eax
    je _L_154
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_154:
# emit-tail-expr
# si=-20
# env=((f57 . -16) (f56 . -12) (f55 . -8) (f51 . 4) (f51 . 0))
# expr=(let ((f55 f55) (f56 f56) (f57 f57)) (if (null? f57) f55 (begin (vector-set! f55 f56 (car f57)) ((vector-ref f51 0) f55 (fxadd1 f56) (cdr f57)))))
# emit-tail-let
#  si   = -20
#  env  = ((f57 . -16) (f56 . -12) (f55 . -8) (f51 . 4) (f51 . 0))
#  bindings = ((f55 f55) (f56 f56) (f57 f57))
#  body = (if (null? f57) f55 (begin (vector-set! f55 f56 (car f57)) ((vector-ref f51 0) f55 (fxadd1 f56) (cdr f57))))
# emit-expr f55
# emit-variable-ref
# env=((f57 . -16) (f56 . -12) (f55 . -8) (f51 . 4) (f51 . 0))
# var=f55
    movl -8(%esp), %eax  # stack load f55
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr f56
# emit-variable-ref
# env=((f57 . -16) (f56 . -12) (f55 . -8) (f51 . 4) (f51 . 0))
# var=f56
    movl -12(%esp), %eax  # stack load f56
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f57
# emit-variable-ref
# env=((f57 . -16) (f56 . -12) (f55 . -8) (f51 . 4) (f51 . 0))
# var=f57
    movl -16(%esp), %eax  # stack load f57
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((f57 . -28) (f56 . -24) (f55 . -20) (f57 . -16) (f56 . -12) (f55 . -8) (f51 . 4) (f51 . 0))
# expr=(if (null? f57) f55 (begin (vector-set! f55 f56 (car f57)) ((vector-ref f51 0) f55 (fxadd1 f56) (cdr f57))))
# emit-expr (null? f57)
# emit-expr f57
# emit-variable-ref
# env=((f57 . -28) (f56 . -24) (f55 . -20) (f57 . -16) (f56 . -12) (f55 . -8) (f51 . 4) (f51 . 0))
# var=f57
    movl -28(%esp), %eax  # stack load f57
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_155
# emit-tail-expr
# si=-32
# env=((f57 . -28) (f56 . -24) (f55 . -20) (f57 . -16) (f56 . -12) (f55 . -8) (f51 . 4) (f51 . 0))
# expr=f55
# emit-tail-variable-ref
# emit-variable-ref
# env=((f57 . -28) (f56 . -24) (f55 . -20) (f57 . -16) (f56 . -12) (f55 . -8) (f51 . 4) (f51 . 0))
# var=f55
    movl -20(%esp), %eax  # stack load f55
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    jmp _L_156
_L_155:
# emit-tail-expr
# si=-32
# env=((f57 . -28) (f56 . -24) (f55 . -20) (f57 . -16) (f56 . -12) (f55 . -8) (f51 . 4) (f51 . 0))
# expr=(begin (vector-set! f55 f56 (car f57)) ((vector-ref f51 0) f55 (fxadd1 f56) (cdr f57)))
# tail-begin (begin (vector-set! f55 f56 (car f57)) ((vector-ref f51 0) f55 (fxadd1 f56) (cdr f57)))
#   env=((f57 . -28) (f56 . -24) (f55 . -20) (f57 . -16) (f56 . -12) (f55 . -8) (f51 . 4) (f51 . 0))
# emit-expr (vector-set! f55 f56 (car f57))
# emit-expr f55
# emit-variable-ref
# env=((f57 . -28) (f56 . -24) (f55 . -20) (f57 . -16) (f56 . -12) (f55 . -8) (f51 . 4) (f51 . 0))
# var=f55
    movl -20(%esp), %eax  # stack load f55
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_157
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_157:
    movl %eax, -32(%esp)
# emit-expr f56
# emit-variable-ref
# env=((f57 . -28) (f56 . -24) (f55 . -20) (f57 . -16) (f56 . -12) (f55 . -8) (f51 . 4) (f51 . 0))
# var=f56
    movl -24(%esp), %eax  # stack load f56
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_158"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_158:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_160
    cmp  $0,%eax
    jge _L_159
_L_160:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_159:
    movl %eax, -36(%esp)
# emit-expr (car f57)
# emit-expr f57
# emit-variable-ref
# env=((f57 . -28) (f56 . -24) (f55 . -20) (f57 . -16) (f56 . -12) (f55 . -8) (f51 . 4) (f51 . 0))
# var=f57
    movl -28(%esp), %eax  # stack load f57
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_161
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_161:
    movl -1(%eax), %eax
    movl -32(%esp), %ebx
    movl -36(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-tail-expr
# si=-32
# env=((f57 . -28) (f56 . -24) (f55 . -20) (f57 . -16) (f56 . -12) (f55 . -8) (f51 . 4) (f51 . 0))
# expr=(begin ((vector-ref f51 0) f55 (fxadd1 f56) (cdr f57)))
# tail-begin (begin ((vector-ref f51 0) f55 (fxadd1 f56) (cdr f57)))
#   env=((f57 . -28) (f56 . -24) (f55 . -20) (f57 . -16) (f56 . -12) (f55 . -8) (f51 . 4) (f51 . 0))
# emit-tail-expr
# si=-32
# env=((f57 . -28) (f56 . -24) (f55 . -20) (f57 . -16) (f56 . -12) (f55 . -8) (f51 . 4) (f51 . 0))
# expr=((vector-ref f51 0) f55 (fxadd1 f56) (cdr f57))
# emit-tail-funcall
#    si   =-32
#    env  = ((f57 . -28) (f56 . -24) (f55 . -20) (f57 . -16) (f56 . -12) (f55 . -8) (f51 . 4) (f51 . 0))
#    expr = (funcall (vector-ref f51 0) f55 (fxadd1 f56) (cdr f57))
# emit-expr (vector-ref f51 0)
# emit-expr f51
# emit-variable-ref
# env=((f57 . -28) (f56 . -24) (f55 . -20) (f57 . -16) (f56 . -12) (f55 . -8) (f51 . 4) (f51 . 0))
# var=f51
    movl 2(%edi), %eax  # frame load f51
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_162
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_162:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_163"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_163:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_165
    cmp  $0,%eax
    jge _L_164
_L_165:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_164:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -32(%esp)  # stash funcall-oper in next closure slot
# emit-expr f55
# emit-variable-ref
# env=((f57 . -28) (f56 . -24) (f55 . -20) (f57 . -16) (f56 . -12) (f55 . -8) (f51 . 4) (f51 . 0))
# var=f55
    movl -20(%esp), %eax  # stack load f55
# end emit-variable-ref
    mov %eax, -36(%esp)    # arg f55
# emit-expr (fxadd1 f56)
# emit-expr f56
# emit-variable-ref
# env=((f57 . -28) (f56 . -24) (f55 . -20) (f57 . -16) (f56 . -12) (f55 . -8) (f51 . 4) (f51 . 0))
# var=f56
    movl -24(%esp), %eax  # stack load f56
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_166"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_166:
     addl $4, %eax
    mov %eax, -40(%esp)    # arg (fxadd1 f56)
# emit-expr (cdr f57)
# emit-expr f57
# emit-variable-ref
# env=((f57 . -28) (f56 . -24) (f55 . -20) (f57 . -16) (f56 . -12) (f55 . -8) (f51 . 4) (f51 . 0))
# var=f57
    movl -28(%esp), %eax  # stack load f57
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_167
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_167:
    movl 3(%eax), %eax
    mov %eax, -44(%esp)    # arg (cdr f57)
    movl -32(%esp), %edi   # load new closure to %edi
# emit-shift-args:  size=4   si=-32  delta=28
    mov -32(%esp), %ebx  # shift frame cell
    mov %ebx, -4(%esp)  # down to base
# emit-shift-args:  size=3   si=-36  delta=28
    mov -36(%esp), %ebx  # shift frame cell
    mov %ebx, -8(%esp)  # down to base
# emit-shift-args:  size=2   si=-40  delta=28
    mov -40(%esp), %ebx  # shift frame cell
    mov %ebx, -12(%esp)  # down to base
# emit-shift-args:  size=1   si=-44  delta=28
    mov -44(%esp), %ebx  # shift frame cell
    mov %ebx, -16(%esp)  # down to base
# emit-shift-args:  size=0   si=-48  delta=28
    movl $12,%eax   # save arg count
    jmp *-2(%edi)  # tail-funcall
     ret   # return thru stack
_L_156:
    .align 4,0x90
_L_153:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f51 . 0))
# emit-expr (begin (closure f61 (f51) (let () (let ((f63 (make-vector ((primitive-ref list-length) f61)))) ((vector-ref f51 0) f63 0 f61)))))
# emit-begin
#   expr=(begin (closure f61 (f51) (let () (let ((f63 (make-vector ((primitive-ref list-length) f61)))) ((vector-ref f51 0) f63 0 f61)))))
#   env=((f51 . 0))
# emit-expr (closure f61 (f51) (let () (let ((f63 (make-vector ((primitive-ref list-length) f61)))) ((vector-ref f51 0) f63 0 f61))))
# emit-closure
# si = -4
# env = ((f51 . 0))
# expr = (closure f61 (f51) (let () (let ((f63 (make-vector ((primitive-ref list-length) f61)))) ((vector-ref f51 0) f63 0 f61))))
    movl $_L_168, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f51 . 0))
# var=f51
    movl 0(%esp), %eax  # stack load f51
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f51
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_169            # jump around closure body
_L_168:
# check argument count
    cmp $0,%eax
    jge _L_170
# invoke error handler eh_argcount_min
    .extern eh$uargcount$umin
    movl eh$uargcount$umin, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_170:
# emit-build-varargs-list
    movl $63, %esi       # args <- () 
    lea -4(%esp),%edi    # edi <- esp-4
    subl %eax, %edi      # edi <- esp-4-eax    addr of arg[K+N] on stack
_L_172:
    lea -4(%esp),%ebx    # addr of arg[K] on stack
    cmp %edi, %ebx       # while edi <> esp+(si+4)
    je _L_171
    movl (%edi),%ebx     # arg i -> car
    movl %ebx, 0(%ebp)
    movl %esi, 4(%ebp)  # esi -> cdr
    movl %ebp, %esi
    addl $1, %esi       # tag as pair
    addl $8,%ebp         # bump heap ptr
    addl $4,%edi         # move to next previous arg from the end
    jmp _L_172
_L_171:
    movl %esi, -8(%esp)  # set args
# emit-tail-expr
# si=-12
# env=((f61 . -8) (f51 . 4) (f51 . 0))
# expr=(let () (let ((f63 (make-vector ((primitive-ref list-length) f61)))) ((vector-ref f51 0) f63 0 f61)))
# emit-tail-let
#  si   = -12
#  env  = ((f61 . -8) (f51 . 4) (f51 . 0))
#  bindings = ()
#  body = (let ((f63 (make-vector ((primitive-ref list-length) f61)))) ((vector-ref f51 0) f63 0 f61))
# emit-tail-expr
# si=-12
# env=((f61 . -8) (f51 . 4) (f51 . 0))
# expr=(let ((f63 (make-vector ((primitive-ref list-length) f61)))) ((vector-ref f51 0) f63 0 f61))
# emit-tail-let
#  si   = -12
#  env  = ((f61 . -8) (f51 . 4) (f51 . 0))
#  bindings = ((f63 (make-vector ((primitive-ref list-length) f61))))
#  body = ((vector-ref f51 0) f63 0 f61)
# emit-expr (make-vector ((primitive-ref list-length) f61))
# make-vector ((primitive-ref list-length) f61)
# emit-expr ((primitive-ref list-length) f61)
# funcall
#    si   =-12
#    env  = ((f61 . -8) (f51 . 4) (f51 . 0))
#    expr = (funcall (primitive-ref list-length) f61)
# emit-expr (primitive-ref list-length)
    .extern list$mlength
    movl list$mlength,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_173"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_173":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr f61
# emit-variable-ref
# env=((f61 . -8) (f51 . 4) (f51 . 0))
# var=f61
    movl -8(%esp), %eax  # stack load f61
# end emit-variable-ref
    mov %eax, -24(%esp)  # arg f61
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_174"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_174:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_175
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_175:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f63 . -12) (f61 . -8) (f51 . 4) (f51 . 0))
# expr=((vector-ref f51 0) f63 0 f61)
# emit-tail-funcall
#    si   =-16
#    env  = ((f63 . -12) (f61 . -8) (f51 . 4) (f51 . 0))
#    expr = (funcall (vector-ref f51 0) f63 0 f61)
# emit-expr (vector-ref f51 0)
# emit-expr f51
# emit-variable-ref
# env=((f63 . -12) (f61 . -8) (f51 . 4) (f51 . 0))
# var=f51
    movl 2(%edi), %eax  # frame load f51
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_176
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_176:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_177"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_177:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_179
    cmp  $0,%eax
    jge _L_178
_L_179:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_178:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f63
# emit-variable-ref
# env=((f63 . -12) (f61 . -8) (f51 . 4) (f51 . 0))
# var=f63
    movl -12(%esp), %eax  # stack load f63
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f63
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -24(%esp)    # arg 0
# emit-expr f61
# emit-variable-ref
# env=((f63 . -12) (f61 . -8) (f51 . 4) (f51 . 0))
# var=f61
    movl -8(%esp), %eax  # stack load f61
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f61
    movl -16(%esp), %edi   # load new closure to %edi
# emit-shift-args:  size=4   si=-16  delta=12
    mov -16(%esp), %ebx  # shift frame cell
    mov %ebx, -4(%esp)  # down to base
# emit-shift-args:  size=3   si=-20  delta=12
    mov -20(%esp), %ebx  # shift frame cell
    mov %ebx, -8(%esp)  # down to base
# emit-shift-args:  size=2   si=-24  delta=12
    mov -24(%esp), %ebx  # shift frame cell
    mov %ebx, -12(%esp)  # down to base
# emit-shift-args:  size=1   si=-28  delta=12
    mov -28(%esp), %ebx  # shift frame cell
    mov %ebx, -16(%esp)  # down to base
# emit-shift-args:  size=0   si=-32  delta=12
    movl $12,%eax   # save arg count
    jmp *-2(%edi)  # tail-funcall
    .align 4,0x90
_L_169:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f51 . 0))
     movl %eax, vector
# == explicit-begins  ==>
# (letrec ((fill-string (lambda (s k args) (if (null? args) s (begin (string-set! s k (car args)) (fill-string s (fxadd1 k) (cdr args))))))) (lambda args (let ((s (make-string (list-length args)))) (fill-string s 0 args))))
# == eliminate-let*  ==>
# (letrec ((fill-string (lambda (s k args) (if (null? args) s (begin (string-set! s k (car args)) (fill-string s (fxadd1 k) (cdr args))))))) (lambda args (let ((s (make-string (list-length args)))) (fill-string s 0 args))))
# == uniquify-variables  ==>
# (letrec ((f64 (lambda (f68 f69 f70) (if (null? f70) f68 (begin (string-set! f68 f69 (car f70)) (f64 f68 (fxadd1 f69) (cdr f70))))))) (lambda f74 (let ((f76 (make-string (list-length f74)))) (f64 f76 0 f74))))
# == vectorize-letrec  ==>
# (let ((f64 (make-vector 1))) (begin (begin (vector-set! f64 0 (lambda (f68 f69 f70) (if (null? f70) f68 (begin (string-set! f68 f69 (car f70)) ((vector-ref f64 0) f68 (fxadd1 f69) (cdr f70))))))) (lambda f74 (let ((f76 (make-string (list-length f74)))) ((vector-ref f64 0) f76 0 f74)))))
# == eliminate-set!  ==>
# (let ((f64 (make-vector 1))) (begin (begin (vector-set! f64 0 (lambda (f68 f69 f70) (let ((f68 f68) (f69 f69) (f70 f70)) (if (null? f70) f68 (begin (string-set! f68 f69 (car f70)) ((vector-ref f64 0) f68 (fxadd1 f69) (cdr f70)))))))) (lambda f74 (let () (let ((f76 (make-string (list-length f74)))) ((vector-ref f64 0) f76 0 f74))))))
# == close-free-variables  ==>
# (let ((f64 (make-vector 1))) (begin (begin (vector-set! f64 0 (closure (f68 f69 f70) (f64) (let ((f68 f68) (f69 f69) (f70 f70)) (if (null? f70) f68 (begin (string-set! f68 f69 (car f70)) ((vector-ref f64 0) f68 (fxadd1 f69) (cdr f70)))))))) (closure f74 (f64) (let () (let ((f76 (make-string (list-length f74)))) ((vector-ref f64 0) f76 0 f74))))))
# == eliminate-quote  ==>
# (let ((f64 (make-vector 1))) (begin (begin (vector-set! f64 0 (closure (f68 f69 f70) (f64) (let ((f68 f68) (f69 f69) (f70 f70)) (if (null? f70) f68 (begin (string-set! f68 f69 (car f70)) ((vector-ref f64 0) f68 (fxadd1 f69) (cdr f70)))))))) (closure f74 (f64) (let () (let ((f76 (make-string (list-length f74)))) ((vector-ref f64 0) f76 0 f74))))))
# == eliminate-when/unless  ==>
# (let ((f64 (make-vector 1))) (begin (begin (vector-set! f64 0 (closure (f68 f69 f70) (f64) (let ((f68 f68) (f69 f69) (f70 f70)) (if (null? f70) f68 (begin (string-set! f68 f69 (car f70)) ((vector-ref f64 0) f68 (fxadd1 f69) (cdr f70)))))))) (closure f74 (f64) (let () (let ((f76 (make-string (list-length f74)))) ((vector-ref f64 0) f76 0 f74))))))
# == eliminate-cond  ==>
# (let ((f64 (make-vector 1))) (begin (begin (vector-set! f64 0 (closure (f68 f69 f70) (f64) (let ((f68 f68) (f69 f69) (f70 f70)) (if (null? f70) f68 (begin (string-set! f68 f69 (car f70)) ((vector-ref f64 0) f68 (fxadd1 f69) (cdr f70)))))))) (closure f74 (f64) (let () (let ((f76 (make-string (list-length f74)))) ((vector-ref f64 0) f76 0 f74))))))
# == external-symbols  ==>
# (let ((f64 (make-vector 1))) (begin (begin (vector-set! f64 0 (closure (f68 f69 f70) (f64) (let ((f68 f68) (f69 f69) (f70 f70)) (if (null? f70) f68 (begin (string-set! f68 f69 (car f70)) ((vector-ref f64 0) f68 (fxadd1 f69) (cdr f70)))))))) (closure f74 (f64) (let () (let ((f76 (make-string ((primitive-ref list-length) f74)))) ((vector-ref f64 0) f76 0 f74))))))
# emit-expr (let ((f64 (make-vector 1))) (begin (begin (vector-set! f64 0 (closure (f68 f69 f70) (f64) (let ((f68 f68) (f69 f69) (f70 f70)) (if (null? f70) f68 (begin (string-set! f68 f69 (car f70)) ((vector-ref f64 0) f68 (fxadd1 f69) (cdr f70)))))))) (closure f74 (f64) (let () (let ((f76 (make-string ((primitive-ref list-length) f74)))) ((vector-ref f64 0) f76 0 f74))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f64 (make-vector 1)))
#  body = (begin (begin (vector-set! f64 0 (closure (f68 f69 f70) (f64) (let ((f68 f68) (f69 f69) (f70 f70)) (if (null? f70) f68 (begin (string-set! f68 f69 (car f70)) ((vector-ref f64 0) f68 (fxadd1 f69) (cdr f70)))))))) (closure f74 (f64) (let () (let ((f76 (make-string ((primitive-ref list-length) f74)))) ((vector-ref f64 0) f76 0 f74)))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_180"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_180:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_181
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_181:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f64 0 (closure (f68 f69 f70) (f64) (let ((f68 f68) (f69 f69) (f70 f70)) (if (null? f70) f68 (begin (string-set! f68 f69 (car f70)) ((vector-ref f64 0) f68 (fxadd1 f69) (cdr f70)))))))) (closure f74 (f64) (let () (let ((f76 (make-string ((primitive-ref list-length) f74)))) ((vector-ref f64 0) f76 0 f74)))))
# emit-begin
#   expr=(begin (begin (vector-set! f64 0 (closure (f68 f69 f70) (f64) (let ((f68 f68) (f69 f69) (f70 f70)) (if (null? f70) f68 (begin (string-set! f68 f69 (car f70)) ((vector-ref f64 0) f68 (fxadd1 f69) (cdr f70)))))))) (closure f74 (f64) (let () (let ((f76 (make-string ((primitive-ref list-length) f74)))) ((vector-ref f64 0) f76 0 f74)))))
#   env=((f64 . 0))
# emit-expr (begin (vector-set! f64 0 (closure (f68 f69 f70) (f64) (let ((f68 f68) (f69 f69) (f70 f70)) (if (null? f70) f68 (begin (string-set! f68 f69 (car f70)) ((vector-ref f64 0) f68 (fxadd1 f69) (cdr f70))))))))
# emit-begin
#   expr=(begin (vector-set! f64 0 (closure (f68 f69 f70) (f64) (let ((f68 f68) (f69 f69) (f70 f70)) (if (null? f70) f68 (begin (string-set! f68 f69 (car f70)) ((vector-ref f64 0) f68 (fxadd1 f69) (cdr f70))))))))
#   env=((f64 . 0))
# emit-expr (vector-set! f64 0 (closure (f68 f69 f70) (f64) (let ((f68 f68) (f69 f69) (f70 f70)) (if (null? f70) f68 (begin (string-set! f68 f69 (car f70)) ((vector-ref f64 0) f68 (fxadd1 f69) (cdr f70)))))))
# emit-expr f64
# emit-variable-ref
# env=((f64 . 0))
# var=f64
    movl 0(%esp), %eax  # stack load f64
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_182
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_182:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_183"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_183:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_185
    cmp  $0,%eax
    jge _L_184
_L_185:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_184:
    movl %eax, -8(%esp)
# emit-expr (closure (f68 f69 f70) (f64) (let ((f68 f68) (f69 f69) (f70 f70)) (if (null? f70) f68 (begin (string-set! f68 f69 (car f70)) ((vector-ref f64 0) f68 (fxadd1 f69) (cdr f70))))))
# emit-closure
# si = -12
# env = ((f64 . 0))
# expr = (closure (f68 f69 f70) (f64) (let ((f68 f68) (f69 f69) (f70 f70)) (if (null? f70) f68 (begin (string-set! f68 f69 (car f70)) ((vector-ref f64 0) f68 (fxadd1 f69) (cdr f70))))))
    movl $_L_186, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f64 . 0))
# var=f64
    movl 0(%esp), %eax  # stack load f64
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f64
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_187            # jump around closure body
_L_186:
# check argument count
    cmp $12,%eax
    je _L_188
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_188:
# emit-tail-expr
# si=-20
# env=((f70 . -16) (f69 . -12) (f68 . -8) (f64 . 4) (f64 . 0))
# expr=(let ((f68 f68) (f69 f69) (f70 f70)) (if (null? f70) f68 (begin (string-set! f68 f69 (car f70)) ((vector-ref f64 0) f68 (fxadd1 f69) (cdr f70)))))
# emit-tail-let
#  si   = -20
#  env  = ((f70 . -16) (f69 . -12) (f68 . -8) (f64 . 4) (f64 . 0))
#  bindings = ((f68 f68) (f69 f69) (f70 f70))
#  body = (if (null? f70) f68 (begin (string-set! f68 f69 (car f70)) ((vector-ref f64 0) f68 (fxadd1 f69) (cdr f70))))
# emit-expr f68
# emit-variable-ref
# env=((f70 . -16) (f69 . -12) (f68 . -8) (f64 . 4) (f64 . 0))
# var=f68
    movl -8(%esp), %eax  # stack load f68
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr f69
# emit-variable-ref
# env=((f70 . -16) (f69 . -12) (f68 . -8) (f64 . 4) (f64 . 0))
# var=f69
    movl -12(%esp), %eax  # stack load f69
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f70
# emit-variable-ref
# env=((f70 . -16) (f69 . -12) (f68 . -8) (f64 . 4) (f64 . 0))
# var=f70
    movl -16(%esp), %eax  # stack load f70
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((f70 . -28) (f69 . -24) (f68 . -20) (f70 . -16) (f69 . -12) (f68 . -8) (f64 . 4) (f64 . 0))
# expr=(if (null? f70) f68 (begin (string-set! f68 f69 (car f70)) ((vector-ref f64 0) f68 (fxadd1 f69) (cdr f70))))
# emit-expr (null? f70)
# emit-expr f70
# emit-variable-ref
# env=((f70 . -28) (f69 . -24) (f68 . -20) (f70 . -16) (f69 . -12) (f68 . -8) (f64 . 4) (f64 . 0))
# var=f70
    movl -28(%esp), %eax  # stack load f70
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_189
# emit-tail-expr
# si=-32
# env=((f70 . -28) (f69 . -24) (f68 . -20) (f70 . -16) (f69 . -12) (f68 . -8) (f64 . 4) (f64 . 0))
# expr=f68
# emit-tail-variable-ref
# emit-variable-ref
# env=((f70 . -28) (f69 . -24) (f68 . -20) (f70 . -16) (f69 . -12) (f68 . -8) (f64 . 4) (f64 . 0))
# var=f68
    movl -20(%esp), %eax  # stack load f68
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    jmp _L_190
_L_189:
# emit-tail-expr
# si=-32
# env=((f70 . -28) (f69 . -24) (f68 . -20) (f70 . -16) (f69 . -12) (f68 . -8) (f64 . 4) (f64 . 0))
# expr=(begin (string-set! f68 f69 (car f70)) ((vector-ref f64 0) f68 (fxadd1 f69) (cdr f70)))
# tail-begin (begin (string-set! f68 f69 (car f70)) ((vector-ref f64 0) f68 (fxadd1 f69) (cdr f70)))
#   env=((f70 . -28) (f69 . -24) (f68 . -20) (f70 . -16) (f69 . -12) (f68 . -8) (f64 . 4) (f64 . 0))
# emit-expr (string-set! f68 f69 (car f70))
# emit-expr f68
# emit-variable-ref
# env=((f70 . -28) (f69 . -24) (f68 . -20) (f70 . -16) (f69 . -12) (f68 . -8) (f64 . 4) (f64 . 0))
# var=f68
    movl -20(%esp), %eax  # stack load f68
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_191
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_191:
    movl %eax, -32(%esp)
# emit-expr f69
# emit-variable-ref
# env=((f70 . -28) (f69 . -24) (f68 . -20) (f70 . -16) (f69 . -12) (f68 . -8) (f64 . 4) (f64 . 0))
# var=f69
    movl -24(%esp), %eax  # stack load f69
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_192"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_192:
# check bounds on string index
    movl -32(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_194
    cmp  $0,%eax
    jge _L_193
_L_194:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_193:
    movl %eax, -36(%esp)
# emit-expr (car f70)
# emit-expr f70
# emit-variable-ref
# env=((f70 . -28) (f69 . -24) (f68 . -20) (f70 . -16) (f69 . -12) (f68 . -8) (f64 . 4) (f64 . 0))
# var=f70
    movl -28(%esp), %eax  # stack load f70
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_195
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_195:
    movl -1(%eax), %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_196"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_196:
    movl -32(%esp), %ebx
    movl -36(%esp), %esi
    sar $2, %esi
    movb  %ah, -2(%ebx,%esi)
# emit-tail-expr
# si=-32
# env=((f70 . -28) (f69 . -24) (f68 . -20) (f70 . -16) (f69 . -12) (f68 . -8) (f64 . 4) (f64 . 0))
# expr=(begin ((vector-ref f64 0) f68 (fxadd1 f69) (cdr f70)))
# tail-begin (begin ((vector-ref f64 0) f68 (fxadd1 f69) (cdr f70)))
#   env=((f70 . -28) (f69 . -24) (f68 . -20) (f70 . -16) (f69 . -12) (f68 . -8) (f64 . 4) (f64 . 0))
# emit-tail-expr
# si=-32
# env=((f70 . -28) (f69 . -24) (f68 . -20) (f70 . -16) (f69 . -12) (f68 . -8) (f64 . 4) (f64 . 0))
# expr=((vector-ref f64 0) f68 (fxadd1 f69) (cdr f70))
# emit-tail-funcall
#    si   =-32
#    env  = ((f70 . -28) (f69 . -24) (f68 . -20) (f70 . -16) (f69 . -12) (f68 . -8) (f64 . 4) (f64 . 0))
#    expr = (funcall (vector-ref f64 0) f68 (fxadd1 f69) (cdr f70))
# emit-expr (vector-ref f64 0)
# emit-expr f64
# emit-variable-ref
# env=((f70 . -28) (f69 . -24) (f68 . -20) (f70 . -16) (f69 . -12) (f68 . -8) (f64 . 4) (f64 . 0))
# var=f64
    movl 2(%edi), %eax  # frame load f64
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_197
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_197:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_198"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_198:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_200
    cmp  $0,%eax
    jge _L_199
_L_200:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_199:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -32(%esp)  # stash funcall-oper in next closure slot
# emit-expr f68
# emit-variable-ref
# env=((f70 . -28) (f69 . -24) (f68 . -20) (f70 . -16) (f69 . -12) (f68 . -8) (f64 . 4) (f64 . 0))
# var=f68
    movl -20(%esp), %eax  # stack load f68
# end emit-variable-ref
    mov %eax, -36(%esp)    # arg f68
# emit-expr (fxadd1 f69)
# emit-expr f69
# emit-variable-ref
# env=((f70 . -28) (f69 . -24) (f68 . -20) (f70 . -16) (f69 . -12) (f68 . -8) (f64 . 4) (f64 . 0))
# var=f69
    movl -24(%esp), %eax  # stack load f69
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_201"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_201:
     addl $4, %eax
    mov %eax, -40(%esp)    # arg (fxadd1 f69)
# emit-expr (cdr f70)
# emit-expr f70
# emit-variable-ref
# env=((f70 . -28) (f69 . -24) (f68 . -20) (f70 . -16) (f69 . -12) (f68 . -8) (f64 . 4) (f64 . 0))
# var=f70
    movl -28(%esp), %eax  # stack load f70
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_202
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_202:
    movl 3(%eax), %eax
    mov %eax, -44(%esp)    # arg (cdr f70)
    movl -32(%esp), %edi   # load new closure to %edi
# emit-shift-args:  size=4   si=-32  delta=28
    mov -32(%esp), %ebx  # shift frame cell
    mov %ebx, -4(%esp)  # down to base
# emit-shift-args:  size=3   si=-36  delta=28
    mov -36(%esp), %ebx  # shift frame cell
    mov %ebx, -8(%esp)  # down to base
# emit-shift-args:  size=2   si=-40  delta=28
    mov -40(%esp), %ebx  # shift frame cell
    mov %ebx, -12(%esp)  # down to base
# emit-shift-args:  size=1   si=-44  delta=28
    mov -44(%esp), %ebx  # shift frame cell
    mov %ebx, -16(%esp)  # down to base
# emit-shift-args:  size=0   si=-48  delta=28
    movl $12,%eax   # save arg count
    jmp *-2(%edi)  # tail-funcall
     ret   # return thru stack
_L_190:
    .align 4,0x90
_L_187:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f64 . 0))
# emit-expr (begin (closure f74 (f64) (let () (let ((f76 (make-string ((primitive-ref list-length) f74)))) ((vector-ref f64 0) f76 0 f74)))))
# emit-begin
#   expr=(begin (closure f74 (f64) (let () (let ((f76 (make-string ((primitive-ref list-length) f74)))) ((vector-ref f64 0) f76 0 f74)))))
#   env=((f64 . 0))
# emit-expr (closure f74 (f64) (let () (let ((f76 (make-string ((primitive-ref list-length) f74)))) ((vector-ref f64 0) f76 0 f74))))
# emit-closure
# si = -4
# env = ((f64 . 0))
# expr = (closure f74 (f64) (let () (let ((f76 (make-string ((primitive-ref list-length) f74)))) ((vector-ref f64 0) f76 0 f74))))
    movl $_L_203, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f64 . 0))
# var=f64
    movl 0(%esp), %eax  # stack load f64
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f64
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_204            # jump around closure body
_L_203:
# check argument count
    cmp $0,%eax
    jge _L_205
# invoke error handler eh_argcount_min
    .extern eh$uargcount$umin
    movl eh$uargcount$umin, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_205:
# emit-build-varargs-list
    movl $63, %esi       # args <- () 
    lea -4(%esp),%edi    # edi <- esp-4
    subl %eax, %edi      # edi <- esp-4-eax    addr of arg[K+N] on stack
_L_207:
    lea -4(%esp),%ebx    # addr of arg[K] on stack
    cmp %edi, %ebx       # while edi <> esp+(si+4)
    je _L_206
    movl (%edi),%ebx     # arg i -> car
    movl %ebx, 0(%ebp)
    movl %esi, 4(%ebp)  # esi -> cdr
    movl %ebp, %esi
    addl $1, %esi       # tag as pair
    addl $8,%ebp         # bump heap ptr
    addl $4,%edi         # move to next previous arg from the end
    jmp _L_207
_L_206:
    movl %esi, -8(%esp)  # set args
# emit-tail-expr
# si=-12
# env=((f74 . -8) (f64 . 4) (f64 . 0))
# expr=(let () (let ((f76 (make-string ((primitive-ref list-length) f74)))) ((vector-ref f64 0) f76 0 f74)))
# emit-tail-let
#  si   = -12
#  env  = ((f74 . -8) (f64 . 4) (f64 . 0))
#  bindings = ()
#  body = (let ((f76 (make-string ((primitive-ref list-length) f74)))) ((vector-ref f64 0) f76 0 f74))
# emit-tail-expr
# si=-12
# env=((f74 . -8) (f64 . 4) (f64 . 0))
# expr=(let ((f76 (make-string ((primitive-ref list-length) f74)))) ((vector-ref f64 0) f76 0 f74))
# emit-tail-let
#  si   = -12
#  env  = ((f74 . -8) (f64 . 4) (f64 . 0))
#  bindings = ((f76 (make-string ((primitive-ref list-length) f74))))
#  body = ((vector-ref f64 0) f76 0 f74)
# emit-expr (make-string ((primitive-ref list-length) f74))
# make-string len=((primitive-ref list-length) f74)
# emit-expr ((primitive-ref list-length) f74)
# funcall
#    si   =-12
#    env  = ((f74 . -8) (f64 . 4) (f64 . 0))
#    expr = (funcall (primitive-ref list-length) f74)
# emit-expr (primitive-ref list-length)
    .extern list$mlength
    movl list$mlength,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_208"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_208":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr f74
# emit-variable-ref
# env=((f74 . -8) (f64 . 4) (f64 . 0))
# var=f74
    movl -8(%esp), %eax  # stack load f74
# end emit-variable-ref
    mov %eax, -24(%esp)  # arg f74
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_209"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_209:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_210
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_210:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl $6, %eax
    sar $2, %esi
    add $4, %esi
    add $7, %esi
    andl $-8, %esi
    add  %esi, %ebp
# make-string end
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f76 . -12) (f74 . -8) (f64 . 4) (f64 . 0))
# expr=((vector-ref f64 0) f76 0 f74)
# emit-tail-funcall
#    si   =-16
#    env  = ((f76 . -12) (f74 . -8) (f64 . 4) (f64 . 0))
#    expr = (funcall (vector-ref f64 0) f76 0 f74)
# emit-expr (vector-ref f64 0)
# emit-expr f64
# emit-variable-ref
# env=((f76 . -12) (f74 . -8) (f64 . 4) (f64 . 0))
# var=f64
    movl 2(%edi), %eax  # frame load f64
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_211
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_211:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_212"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_212:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_214
    cmp  $0,%eax
    jge _L_213
_L_214:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_213:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f76
# emit-variable-ref
# env=((f76 . -12) (f74 . -8) (f64 . 4) (f64 . 0))
# var=f76
    movl -12(%esp), %eax  # stack load f76
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f76
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -24(%esp)    # arg 0
# emit-expr f74
# emit-variable-ref
# env=((f76 . -12) (f74 . -8) (f64 . 4) (f64 . 0))
# var=f74
    movl -8(%esp), %eax  # stack load f74
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f74
    movl -16(%esp), %edi   # load new closure to %edi
# emit-shift-args:  size=4   si=-16  delta=12
    mov -16(%esp), %ebx  # shift frame cell
    mov %ebx, -4(%esp)  # down to base
# emit-shift-args:  size=3   si=-20  delta=12
    mov -20(%esp), %ebx  # shift frame cell
    mov %ebx, -8(%esp)  # down to base
# emit-shift-args:  size=2   si=-24  delta=12
    mov -24(%esp), %ebx  # shift frame cell
    mov %ebx, -12(%esp)  # down to base
# emit-shift-args:  size=1   si=-28  delta=12
    mov -28(%esp), %ebx  # shift frame cell
    mov %ebx, -16(%esp)  # down to base
# emit-shift-args:  size=0   si=-32  delta=12
    movl $12,%eax   # save arg count
    jmp *-2(%edi)  # tail-funcall
    .align 4,0x90
_L_204:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f64 . 0))
     movl %eax, string
# == explicit-begins  ==>
# (let* ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s)))) (write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))
# == eliminate-let*  ==>
# (let ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s))))) (let ((write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1)))))
# == uniquify-variables  ==>
# (let ((f77 (lambda (f78) (foreign-call "s_write" 2 f78 (string-length f78))))) (let ((f86 (lambda (f87 f88) (begin (f77 "error:") (f77 (symbol->string f87)) (f77 ": ") (f77 f88) (f77 "\n"))))) (lambda (f91 f92) (begin (f86 f91 f92) (foreign-call "s_exit" 1)))))
# == vectorize-letrec  ==>
# (let ((f77 (lambda (f78) (foreign-call "s_write" 2 f78 (string-length f78))))) (let ((f86 (lambda (f87 f88) (begin (f77 "error:") (f77 (symbol->string f87)) (f77 ": ") (f77 f88) (f77 "\n"))))) (lambda (f91 f92) (begin (f86 f91 f92) (foreign-call "s_exit" 1)))))
# == eliminate-set!  ==>
# (let ((f77 (lambda (f78) (let ((f78 f78)) (foreign-call "s_write" 2 f78 (string-length f78)))))) (let ((f86 (lambda (f87 f88) (let ((f87 f87) (f88 f88)) (begin (f77 "error:") (f77 (symbol->string f87)) (f77 ": ") (f77 f88) (f77 "\n")))))) (lambda (f91 f92) (let ((f91 f91) (f92 f92)) (begin (f86 f91 f92) (foreign-call "s_exit" 1))))))
# == close-free-variables  ==>
# (let ((f77 (closure (f78) () (let ((f78 f78)) (foreign-call "s_write" 2 f78 (string-length f78)))))) (let ((f86 (closure (f87 f88) (f77 f77 f77 f77 f77) (let ((f87 f87) (f88 f88)) (begin (f77 "error:") (f77 (symbol->string f87)) (f77 ": ") (f77 f88) (f77 "\n")))))) (closure (f91 f92) (f86) (let ((f91 f91) (f92 f92)) (begin (f86 f91 f92) (foreign-call "s_exit" 1))))))
# == eliminate-quote  ==>
# (let ((f77 (closure (f78) () (let ((f78 f78)) (foreign-call "s_write" 2 f78 (string-length f78)))))) (let ((f86 (closure (f87 f88) (f77 f77 f77 f77 f77) (let ((f87 f87) (f88 f88)) (begin (f77 "error:") (f77 (symbol->string f87)) (f77 ": ") (f77 f88) (f77 "\n")))))) (closure (f91 f92) (f86) (let ((f91 f91) (f92 f92)) (begin (f86 f91 f92) (foreign-call "s_exit" 1))))))
# == eliminate-when/unless  ==>
# (let ((f77 (closure (f78) () (let ((f78 f78)) (foreign-call "s_write" 2 f78 (string-length f78)))))) (let ((f86 (closure (f87 f88) (f77 f77 f77 f77 f77) (let ((f87 f87) (f88 f88)) (begin (f77 "error:") (f77 (symbol->string f87)) (f77 ": ") (f77 f88) (f77 "\n")))))) (closure (f91 f92) (f86) (let ((f91 f91) (f92 f92)) (begin (f86 f91 f92) (foreign-call "s_exit" 1))))))
# == eliminate-cond  ==>
# (let ((f77 (closure (f78) () (let ((f78 f78)) (foreign-call "s_write" 2 f78 (string-length f78)))))) (let ((f86 (closure (f87 f88) (f77 f77 f77 f77 f77) (let ((f87 f87) (f88 f88)) (begin (f77 "error:") (f77 (symbol->string f87)) (f77 ": ") (f77 f88) (f77 "\n")))))) (closure (f91 f92) (f86) (let ((f91 f91) (f92 f92)) (begin (f86 f91 f92) (foreign-call "s_exit" 1))))))
# == external-symbols  ==>
# (let ((f77 (closure (f78) () (let ((f78 f78)) (foreign-call "s_write" 2 f78 (string-length f78)))))) (let ((f86 (closure (f87 f88) (f77 f77 f77 f77 f77) (let ((f87 f87) (f88 f88)) (begin (f77 "error:") (f77 (symbol->string f87)) (f77 ": ") (f77 f88) (f77 "\n")))))) (closure (f91 f92) (f86) (let ((f91 f91) (f92 f92)) (begin (f86 f91 f92) (foreign-call "s_exit" 1))))))
# emit-expr (let ((f77 (closure (f78) () (let ((f78 f78)) (foreign-call "s_write" 2 f78 (string-length f78)))))) (let ((f86 (closure (f87 f88) (f77 f77 f77 f77 f77) (let ((f87 f87) (f88 f88)) (begin (f77 "error:") (f77 (symbol->string f87)) (f77 ": ") (f77 f88) (f77 "\n")))))) (closure (f91 f92) (f86) (let ((f91 f91) (f92 f92)) (begin (f86 f91 f92) (foreign-call "s_exit" 1))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f77 (closure (f78) () (let ((f78 f78)) (foreign-call "s_write" 2 f78 (string-length f78))))))
#  body = (let ((f86 (closure (f87 f88) (f77 f77 f77 f77 f77) (let ((f87 f87) (f88 f88)) (begin (f77 "error:") (f77 (symbol->string f87)) (f77 ": ") (f77 f88) (f77 "\n")))))) (closure (f91 f92) (f86) (let ((f91 f91) (f92 f92)) (begin (f86 f91 f92) (foreign-call "s_exit" 1)))))
# emit-expr (closure (f78) () (let ((f78 f78)) (foreign-call "s_write" 2 f78 (string-length f78))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f78) () (let ((f78 f78)) (foreign-call "s_write" 2 f78 (string-length f78))))
    movl $_L_215, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_216            # jump around closure body
_L_215:
# check argument count
    cmp $4,%eax
    je _L_217
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_217:
# emit-tail-expr
# si=-12
# env=((f78 . -8))
# expr=(let ((f78 f78)) (foreign-call "s_write" 2 f78 (string-length f78)))
# emit-tail-let
#  si   = -12
#  env  = ((f78 . -8))
#  bindings = ((f78 f78))
#  body = (foreign-call "s_write" 2 f78 (string-length f78))
# emit-expr f78
# emit-variable-ref
# env=((f78 . -8))
# var=f78
    movl -8(%esp), %eax  # stack load f78
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f78 . -12) (f78 . -8))
# expr=(foreign-call "s_write" 2 f78 (string-length f78))
    movl %ecx,-16(%esp)
    movl %esp,-20(%esp)
# emit-expr (string-length f78)
# emit-expr f78
# emit-variable-ref
# env=((f78 . -12) (f78 . -8))
# var=f78
    movl -12(%esp), %eax  # stack load f78
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_218
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_218:
    movl -6(%eax), %eax
    movl %eax, -24(%esp)
# emit-expr f78
# emit-variable-ref
# env=((f78 . -12) (f78 . -8))
# var=f78
    movl -12(%esp), %eax  # stack load f78
# end emit-variable-ref
    movl %eax, -28(%esp)
# emit-expr 2
    movl $8, %eax     # immed 2
    movl %eax, -32(%esp)
    leal -32(%esp),%edi
    movl %edi,%esi
    andl $-16,%esi
    movl 0(%edi),%eax
    movl %eax,0(%esi)
    movl 4(%edi),%eax
    movl %eax,4(%esi)
    movl 8(%edi),%eax
    movl %eax,8(%esi)
    movl 12(%edi),%eax
    movl %eax,12(%esi)
    movl %esi,%esp
    .extern _s_write
    call _s_write
    movl 12(%esi),%esp
    movl -16(%esp),%ecx
     ret
    .align 4,0x90
_L_216:
    movl %eax, 0(%esp)  # stack save
# emit-expr (let ((f86 (closure (f87 f88) (f77 f77 f77 f77 f77) (let ((f87 f87) (f88 f88)) (begin (f77 "error:") (f77 (symbol->string f87)) (f77 ": ") (f77 f88) (f77 "\n")))))) (closure (f91 f92) (f86) (let ((f91 f91) (f92 f92)) (begin (f86 f91 f92) (foreign-call "s_exit" 1)))))
# emit-let
#  si   = -4
#  env  = ((f77 . 0))
#  bindings = ((f86 (closure (f87 f88) (f77 f77 f77 f77 f77) (let ((f87 f87) (f88 f88)) (begin (f77 "error:") (f77 (symbol->string f87)) (f77 ": ") (f77 f88) (f77 "\n"))))))
#  body = (closure (f91 f92) (f86) (let ((f91 f91) (f92 f92)) (begin (f86 f91 f92) (foreign-call "s_exit" 1))))
# emit-expr (closure (f87 f88) (f77 f77 f77 f77 f77) (let ((f87 f87) (f88 f88)) (begin (f77 "error:") (f77 (symbol->string f87)) (f77 ": ") (f77 f88) (f77 "\n"))))
# emit-closure
# si = -4
# env = ((f77 . 0))
# expr = (closure (f87 f88) (f77 f77 f77 f77 f77) (let ((f87 f87) (f88 f88)) (begin (f77 "error:") (f77 (symbol->string f87)) (f77 ": ") (f77 f88) (f77 "\n"))))
    movl $_L_219, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f77 . 0))
# var=f77
    movl 0(%esp), %eax  # stack load f77
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f77
# emit-variable-ref
# env=((f77 . 0))
# var=f77
    movl 0(%esp), %eax  # stack load f77
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f77
# emit-variable-ref
# env=((f77 . 0))
# var=f77
    movl 0(%esp), %eax  # stack load f77
# end emit-variable-ref
   movl  %eax, 12(%ebp)  # f77
# emit-variable-ref
# env=((f77 . 0))
# var=f77
    movl 0(%esp), %eax  # stack load f77
# end emit-variable-ref
   movl  %eax, 16(%ebp)  # f77
# emit-variable-ref
# env=((f77 . 0))
# var=f77
    movl 0(%esp), %eax  # stack load f77
# end emit-variable-ref
   movl  %eax, 20(%ebp)  # f77
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $24, %ebp     # bump ebp
    jmp _L_220            # jump around closure body
_L_219:
# check argument count
    cmp $8,%eax
    je _L_221
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_221:
# emit-tail-expr
# si=-16
# env=((f88 . -12) (f87 . -8) (f77 . 20) (f77 . 16) (f77 . 12) (f77 . 8) (f77 . 4) (f77 . 0))
# expr=(let ((f87 f87) (f88 f88)) (begin (f77 "error:") (f77 (symbol->string f87)) (f77 ": ") (f77 f88) (f77 "\n")))
# emit-tail-let
#  si   = -16
#  env  = ((f88 . -12) (f87 . -8) (f77 . 20) (f77 . 16) (f77 . 12) (f77 . 8) (f77 . 4) (f77 . 0))
#  bindings = ((f87 f87) (f88 f88))
#  body = (begin (f77 "error:") (f77 (symbol->string f87)) (f77 ": ") (f77 f88) (f77 "\n"))
# emit-expr f87
# emit-variable-ref
# env=((f88 . -12) (f87 . -8) (f77 . 20) (f77 . 16) (f77 . 12) (f77 . 8) (f77 . 4) (f77 . 0))
# var=f87
    movl -8(%esp), %eax  # stack load f87
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f88
# emit-variable-ref
# env=((f88 . -12) (f87 . -8) (f77 . 20) (f77 . 16) (f77 . 12) (f77 . 8) (f77 . 4) (f77 . 0))
# var=f88
    movl -12(%esp), %eax  # stack load f88
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f88 . -20) (f87 . -16) (f88 . -12) (f87 . -8) (f77 . 20) (f77 . 16) (f77 . 12) (f77 . 8) (f77 . 4) (f77 . 0))
# expr=(begin (f77 "error:") (f77 (symbol->string f87)) (f77 ": ") (f77 f88) (f77 "\n"))
# tail-begin (begin (f77 "error:") (f77 (symbol->string f87)) (f77 ": ") (f77 f88) (f77 "\n"))
#   env=((f88 . -20) (f87 . -16) (f88 . -12) (f87 . -8) (f77 . 20) (f77 . 16) (f77 . 12) (f77 . 8) (f77 . 4) (f77 . 0))
# emit-expr (f77 "error:")
# funcall
#    si   =-24
#    env  = ((f88 . -20) (f87 . -16) (f88 . -12) (f87 . -8) (f77 . 20) (f77 . 16) (f77 . 12) (f77 . 8) (f77 . 4) (f77 . 0))
#    expr = (funcall f77 "error:")
# emit-expr f77
# emit-variable-ref
# env=((f88 . -20) (f87 . -16) (f88 . -12) (f87 . -8) (f77 . 20) (f77 . 16) (f77 . 12) (f77 . 8) (f77 . 4) (f77 . 0))
# var=f77
    movl 18(%edi), %eax  # frame load f77
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_222"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_222":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr "error:"
# string literal
    jmp _L_224
    .align 8,0x90
_L_223 :
    .int 24
    .ascii "error:"
_L_224:
    movl $_L_223, %eax
    orl $6, %eax
    mov %eax, -36(%esp)  # arg error:
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f88 . -20) (f87 . -16) (f88 . -12) (f87 . -8) (f77 . 20) (f77 . 16) (f77 . 12) (f77 . 8) (f77 . 4) (f77 . 0))
# expr=(begin (f77 (symbol->string f87)) (f77 ": ") (f77 f88) (f77 "\n"))
# tail-begin (begin (f77 (symbol->string f87)) (f77 ": ") (f77 f88) (f77 "\n"))
#   env=((f88 . -20) (f87 . -16) (f88 . -12) (f87 . -8) (f77 . 20) (f77 . 16) (f77 . 12) (f77 . 8) (f77 . 4) (f77 . 0))
# emit-expr (f77 (symbol->string f87))
# funcall
#    si   =-24
#    env  = ((f88 . -20) (f87 . -16) (f88 . -12) (f87 . -8) (f77 . 20) (f77 . 16) (f77 . 12) (f77 . 8) (f77 . 4) (f77 . 0))
#    expr = (funcall f77 (symbol->string f87))
# emit-expr f77
# emit-variable-ref
# env=((f88 . -20) (f87 . -16) (f88 . -12) (f87 . -8) (f77 . 20) (f77 . 16) (f77 . 12) (f77 . 8) (f77 . 4) (f77 . 0))
# var=f77
    movl 18(%edi), %eax  # frame load f77
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_225"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_225":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr (symbol->string f87)
# symbol->string f87
# emit-expr f87
# emit-variable-ref
# env=((f88 . -20) (f87 . -16) (f88 . -12) (f87 . -8) (f77 . 20) (f77 . 16) (f77 . 12) (f77 . 8) (f77 . 4) (f77 . 0))
# var=f87
    movl -16(%esp), %eax  # stack load f87
# end emit-variable-ref
    movl -3(%eax), %eax
    mov %eax, -36(%esp)  # arg (symbol->string f87)
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f88 . -20) (f87 . -16) (f88 . -12) (f87 . -8) (f77 . 20) (f77 . 16) (f77 . 12) (f77 . 8) (f77 . 4) (f77 . 0))
# expr=(begin (f77 ": ") (f77 f88) (f77 "\n"))
# tail-begin (begin (f77 ": ") (f77 f88) (f77 "\n"))
#   env=((f88 . -20) (f87 . -16) (f88 . -12) (f87 . -8) (f77 . 20) (f77 . 16) (f77 . 12) (f77 . 8) (f77 . 4) (f77 . 0))
# emit-expr (f77 ": ")
# funcall
#    si   =-24
#    env  = ((f88 . -20) (f87 . -16) (f88 . -12) (f87 . -8) (f77 . 20) (f77 . 16) (f77 . 12) (f77 . 8) (f77 . 4) (f77 . 0))
#    expr = (funcall f77 ": ")
# emit-expr f77
# emit-variable-ref
# env=((f88 . -20) (f87 . -16) (f88 . -12) (f87 . -8) (f77 . 20) (f77 . 16) (f77 . 12) (f77 . 8) (f77 . 4) (f77 . 0))
# var=f77
    movl 18(%edi), %eax  # frame load f77
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_226"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_226":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr ": "
# string literal
    jmp _L_228
    .align 8,0x90
_L_227 :
    .int 8
    .ascii ": "
_L_228:
    movl $_L_227, %eax
    orl $6, %eax
    mov %eax, -36(%esp)  # arg : 
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f88 . -20) (f87 . -16) (f88 . -12) (f87 . -8) (f77 . 20) (f77 . 16) (f77 . 12) (f77 . 8) (f77 . 4) (f77 . 0))
# expr=(begin (f77 f88) (f77 "\n"))
# tail-begin (begin (f77 f88) (f77 "\n"))
#   env=((f88 . -20) (f87 . -16) (f88 . -12) (f87 . -8) (f77 . 20) (f77 . 16) (f77 . 12) (f77 . 8) (f77 . 4) (f77 . 0))
# emit-expr (f77 f88)
# funcall
#    si   =-24
#    env  = ((f88 . -20) (f87 . -16) (f88 . -12) (f87 . -8) (f77 . 20) (f77 . 16) (f77 . 12) (f77 . 8) (f77 . 4) (f77 . 0))
#    expr = (funcall f77 f88)
# emit-expr f77
# emit-variable-ref
# env=((f88 . -20) (f87 . -16) (f88 . -12) (f87 . -8) (f77 . 20) (f77 . 16) (f77 . 12) (f77 . 8) (f77 . 4) (f77 . 0))
# var=f77
    movl 18(%edi), %eax  # frame load f77
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_229"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_229":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f88
# emit-variable-ref
# env=((f88 . -20) (f87 . -16) (f88 . -12) (f87 . -8) (f77 . 20) (f77 . 16) (f77 . 12) (f77 . 8) (f77 . 4) (f77 . 0))
# var=f88
    movl -20(%esp), %eax  # stack load f88
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f88
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f88 . -20) (f87 . -16) (f88 . -12) (f87 . -8) (f77 . 20) (f77 . 16) (f77 . 12) (f77 . 8) (f77 . 4) (f77 . 0))
# expr=(begin (f77 "\n"))
# tail-begin (begin (f77 "\n"))
#   env=((f88 . -20) (f87 . -16) (f88 . -12) (f87 . -8) (f77 . 20) (f77 . 16) (f77 . 12) (f77 . 8) (f77 . 4) (f77 . 0))
# emit-tail-expr
# si=-24
# env=((f88 . -20) (f87 . -16) (f88 . -12) (f87 . -8) (f77 . 20) (f77 . 16) (f77 . 12) (f77 . 8) (f77 . 4) (f77 . 0))
# expr=(f77 "\n")
# emit-tail-funcall
#    si   =-24
#    env  = ((f88 . -20) (f87 . -16) (f88 . -12) (f87 . -8) (f77 . 20) (f77 . 16) (f77 . 12) (f77 . 8) (f77 . 4) (f77 . 0))
#    expr = (funcall f77 "\n")
# emit-expr f77
# emit-variable-ref
# env=((f88 . -20) (f87 . -16) (f88 . -12) (f87 . -8) (f77 . 20) (f77 . 16) (f77 . 12) (f77 . 8) (f77 . 4) (f77 . 0))
# var=f77
    movl 18(%edi), %eax  # frame load f77
# end emit-variable-ref
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr "\n"
# string literal
    jmp _L_231
    .align 8,0x90
_L_230 :
    .int 4
    .ascii "\n"
_L_231:
    movl $_L_230, %eax
    orl $6, %eax
    mov %eax, -28(%esp)    # arg 

    movl -24(%esp), %edi   # load new closure to %edi
# emit-shift-args:  size=2   si=-24  delta=20
    mov -24(%esp), %ebx  # shift frame cell
    mov %ebx, -4(%esp)  # down to base
# emit-shift-args:  size=1   si=-28  delta=20
    mov -28(%esp), %ebx  # shift frame cell
    mov %ebx, -8(%esp)  # down to base
# emit-shift-args:  size=0   si=-32  delta=20
    movl $4,%eax   # save arg count
    jmp *-2(%edi)  # tail-funcall
     ret   # return thru stack
    .align 4,0x90
_L_220:
    movl %eax, -4(%esp)  # stack save
# emit-expr (closure (f91 f92) (f86) (let ((f91 f91) (f92 f92)) (begin (f86 f91 f92) (foreign-call "s_exit" 1))))
# emit-closure
# si = -8
# env = ((f86 . -4) (f77 . 0))
# expr = (closure (f91 f92) (f86) (let ((f91 f91) (f92 f92)) (begin (f86 f91 f92) (foreign-call "s_exit" 1))))
    movl $_L_232, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f86 . -4) (f77 . 0))
# var=f86
    movl -4(%esp), %eax  # stack load f86
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f86
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_233            # jump around closure body
_L_232:
# check argument count
    cmp $8,%eax
    je _L_234
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_234:
# emit-tail-expr
# si=-16
# env=((f92 . -12) (f91 . -8) (f86 . 4) (f86 . -4) (f77 . 0))
# expr=(let ((f91 f91) (f92 f92)) (begin (f86 f91 f92) (foreign-call "s_exit" 1)))
# emit-tail-let
#  si   = -16
#  env  = ((f92 . -12) (f91 . -8) (f86 . 4) (f86 . -4) (f77 . 0))
#  bindings = ((f91 f91) (f92 f92))
#  body = (begin (f86 f91 f92) (foreign-call "s_exit" 1))
# emit-expr f91
# emit-variable-ref
# env=((f92 . -12) (f91 . -8) (f86 . 4) (f86 . -4) (f77 . 0))
# var=f91
    movl -8(%esp), %eax  # stack load f91
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f92
# emit-variable-ref
# env=((f92 . -12) (f91 . -8) (f86 . 4) (f86 . -4) (f77 . 0))
# var=f92
    movl -12(%esp), %eax  # stack load f92
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f92 . -20) (f91 . -16) (f92 . -12) (f91 . -8) (f86 . 4) (f86 . -4) (f77 . 0))
# expr=(begin (f86 f91 f92) (foreign-call "s_exit" 1))
# tail-begin (begin (f86 f91 f92) (foreign-call "s_exit" 1))
#   env=((f92 . -20) (f91 . -16) (f92 . -12) (f91 . -8) (f86 . 4) (f86 . -4) (f77 . 0))
# emit-expr (f86 f91 f92)
# funcall
#    si   =-24
#    env  = ((f92 . -20) (f91 . -16) (f92 . -12) (f91 . -8) (f86 . 4) (f86 . -4) (f77 . 0))
#    expr = (funcall f86 f91 f92)
# emit-expr f86
# emit-variable-ref
# env=((f92 . -20) (f91 . -16) (f92 . -12) (f91 . -8) (f86 . 4) (f86 . -4) (f77 . 0))
# var=f86
    movl 2(%edi), %eax  # frame load f86
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_235"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_235":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f91
# emit-variable-ref
# env=((f92 . -20) (f91 . -16) (f92 . -12) (f91 . -8) (f86 . 4) (f86 . -4) (f77 . 0))
# var=f91
    movl -16(%esp), %eax  # stack load f91
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f91
# emit-expr f92
# emit-variable-ref
# env=((f92 . -20) (f91 . -16) (f92 . -12) (f91 . -8) (f86 . 4) (f86 . -4) (f77 . 0))
# var=f92
    movl -20(%esp), %eax  # stack load f92
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg f92
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f92 . -20) (f91 . -16) (f92 . -12) (f91 . -8) (f86 . 4) (f86 . -4) (f77 . 0))
# expr=(begin (foreign-call "s_exit" 1))
# tail-begin (begin (foreign-call "s_exit" 1))
#   env=((f92 . -20) (f91 . -16) (f92 . -12) (f91 . -8) (f86 . 4) (f86 . -4) (f77 . 0))
# emit-tail-expr
# si=-24
# env=((f92 . -20) (f91 . -16) (f92 . -12) (f91 . -8) (f86 . 4) (f86 . -4) (f77 . 0))
# expr=(foreign-call "s_exit" 1)
    movl %ecx,-24(%esp)
    movl %esp,-28(%esp)
# emit-expr 1
    movl $4, %eax     # immed 1
    movl %eax, -32(%esp)
    leal -32(%esp),%edi
    movl %edi,%esi
    andl $-16,%esi
    movl 0(%edi),%eax
    movl %eax,0(%esi)
    movl 4(%edi),%eax
    movl %eax,4(%esi)
    movl %esi,%esp
    .extern _s_exit
    call _s_exit
    movl 4(%esi),%esp
    movl -24(%esp),%ecx
     ret
     ret   # return thru stack
    .align 4,0x90
_L_233:
     movl %eax, error
# == explicit-begins  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == eliminate-let*  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == uniquify-variables  ==>
# (let ((f93 (quote ()))) (begin (set! f93 (cons (quote procedure?) f93)) (set! f93 (cons (quote cdr) f93)) (set! f93 (cons (quote car) f93)) (set! f93 (cons (quote symbol-value) f93)) (set! f93 (cons (quote symbol->string) f93)) (set! f93 (cons (quote make-symbol) f93)) (set! f93 (cons (quote symbol?) f93)) (set! f93 (cons (quote string-set!) f93)) (set! f93 (cons (quote string-ref) f93)) (set! f93 (cons (quote string-length) f93)) (set! f93 (cons (quote string?) f93)) (set! f93 (cons (quote make-string) f93)) (set! f93 (cons (quote vector-ref) f93)) (set! f93 (cons (quote vector-set!) f93)) (set! f93 (cons (quote vector-length) f93)) (set! f93 (cons (quote make-vector) f93)) (set! f93 (cons (quote vector?) f93)) (set! f93 (cons (quote set-cdr!) f93)) (set! f93 (cons (quote set-car!) f93)) (set! f93 (cons (quote cdr) f93)) (set! f93 (cons (quote car) f93)) (set! f93 (cons (quote cons) f93)) (set! f93 (cons (quote pair?) f93)) (set! f93 (cons (quote fx*) f93)) (set! f93 (cons (quote fx-) f93)) (set! f93 (cons (quote fx+) f93)) (set! f93 (cons (quote fx>=) f93)) (set! f93 (cons (quote fx>) f93)) (set! f93 (cons (quote fx<=) f93)) (set! f93 (cons (quote fx<) f93)) (set! f93 (cons (quote fx=) f93)) (set! f93 (cons (quote fxzero?) f93)) (set! f93 (cons (quote fxsub1) f93)) (set! f93 (cons (quote fxadd1) f93)) (set! f93 (cons (quote fxlogor) f93)) (set! f93 (cons (quote fxlogand) f93)) (set! f93 (cons (quote fxlognot) f93)) (set! f93 (cons (quote char=?) f93)) (set! f93 (cons (quote eq?) f93)) (set! f93 (cons (quote not) f93)) (set! f93 (cons (quote boolean?) f93)) (set! f93 (cons (quote fixnum?) f93)) (set! f93 (cons (quote char?) f93)) (set! f93 (cons (quote null?) f93)) (set! f93 (cons (quote char->fixnum) f93)) (set! f93 (cons (quote fixnum->char) f93)) (lambda () f93)))
# == vectorize-letrec  ==>
# (let ((f93 (quote ()))) (begin (set! f93 (cons (quote procedure?) f93)) (set! f93 (cons (quote cdr) f93)) (set! f93 (cons (quote car) f93)) (set! f93 (cons (quote symbol-value) f93)) (set! f93 (cons (quote symbol->string) f93)) (set! f93 (cons (quote make-symbol) f93)) (set! f93 (cons (quote symbol?) f93)) (set! f93 (cons (quote string-set!) f93)) (set! f93 (cons (quote string-ref) f93)) (set! f93 (cons (quote string-length) f93)) (set! f93 (cons (quote string?) f93)) (set! f93 (cons (quote make-string) f93)) (set! f93 (cons (quote vector-ref) f93)) (set! f93 (cons (quote vector-set!) f93)) (set! f93 (cons (quote vector-length) f93)) (set! f93 (cons (quote make-vector) f93)) (set! f93 (cons (quote vector?) f93)) (set! f93 (cons (quote set-cdr!) f93)) (set! f93 (cons (quote set-car!) f93)) (set! f93 (cons (quote cdr) f93)) (set! f93 (cons (quote car) f93)) (set! f93 (cons (quote cons) f93)) (set! f93 (cons (quote pair?) f93)) (set! f93 (cons (quote fx*) f93)) (set! f93 (cons (quote fx-) f93)) (set! f93 (cons (quote fx+) f93)) (set! f93 (cons (quote fx>=) f93)) (set! f93 (cons (quote fx>) f93)) (set! f93 (cons (quote fx<=) f93)) (set! f93 (cons (quote fx<) f93)) (set! f93 (cons (quote fx=) f93)) (set! f93 (cons (quote fxzero?) f93)) (set! f93 (cons (quote fxsub1) f93)) (set! f93 (cons (quote fxadd1) f93)) (set! f93 (cons (quote fxlogor) f93)) (set! f93 (cons (quote fxlogand) f93)) (set! f93 (cons (quote fxlognot) f93)) (set! f93 (cons (quote char=?) f93)) (set! f93 (cons (quote eq?) f93)) (set! f93 (cons (quote not) f93)) (set! f93 (cons (quote boolean?) f93)) (set! f93 (cons (quote fixnum?) f93)) (set! f93 (cons (quote char?) f93)) (set! f93 (cons (quote null?) f93)) (set! f93 (cons (quote char->fixnum) f93)) (set! f93 (cons (quote fixnum->char) f93)) (lambda () f93)))
# == eliminate-set!  ==>
# (let ((f93 (vector (quote ())))) (begin (vector-set! f93 0 (cons (quote procedure?) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote cdr) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote car) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote symbol-value) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote symbol->string) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote make-symbol) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote symbol?) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote string-set!) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote string-ref) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote string-length) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote string?) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote make-string) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote vector-ref) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote vector-set!) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote vector-length) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote make-vector) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote vector?) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote set-cdr!) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote set-car!) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote cdr) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote car) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote cons) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote pair?) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fx*) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fx-) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fx+) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fx>=) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fx>) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fx<=) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fx<) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fx=) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fxzero?) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fxsub1) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fxadd1) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fxlogor) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fxlogand) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fxlognot) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote char=?) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote eq?) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote not) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote boolean?) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fixnum?) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote char?) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote null?) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote char->fixnum) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fixnum->char) (vector-ref f93 0))) (lambda () (let () (vector-ref f93 0)))))
# == close-free-variables  ==>
# (let ((f93 (vector (quote ())))) (begin (vector-set! f93 0 (cons (quote procedure?) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote cdr) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote car) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote symbol-value) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote symbol->string) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote make-symbol) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote symbol?) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote string-set!) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote string-ref) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote string-length) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote string?) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote make-string) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote vector-ref) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote vector-set!) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote vector-length) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote make-vector) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote vector?) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote set-cdr!) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote set-car!) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote cdr) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote car) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote cons) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote pair?) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fx*) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fx-) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fx+) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fx>=) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fx>) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fx<=) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fx<) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fx=) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fxzero?) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fxsub1) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fxadd1) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fxlogor) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fxlogand) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fxlognot) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote char=?) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote eq?) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote not) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote boolean?) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fixnum?) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote char?) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote null?) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote char->fixnum) (vector-ref f93 0))) (vector-set! f93 0 (cons (quote fixnum->char) (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0)))))
# == eliminate-quote  ==>
# (let ((f93 (vector ()))) (begin (vector-set! f93 0 (cons (string->symbol "procedure?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "car") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "symbol-value") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "symbol->string") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "make-symbol") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "symbol?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "string-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "string-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "string-length") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "string?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "car") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "not") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0)))))
# == eliminate-when/unless  ==>
# (let ((f93 (vector ()))) (begin (vector-set! f93 0 (cons (string->symbol "procedure?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "car") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "symbol-value") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "symbol->string") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "make-symbol") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "symbol?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "string-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "string-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "string-length") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "string?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "car") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "not") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0)))))
# == eliminate-cond  ==>
# (let ((f93 (vector ()))) (begin (vector-set! f93 0 (cons (string->symbol "procedure?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "car") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "symbol-value") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "symbol->string") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "make-symbol") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "symbol?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "string-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "string-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "string-length") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "string?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "car") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "not") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons (string->symbol "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0)))))
# == external-symbols  ==>
# (let ((f93 ((primitive-ref vector) ()))) (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0)))))
# emit-expr (let ((f93 ((primitive-ref vector) ()))) (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0)))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f93 ((primitive-ref vector) ())))
#  body = (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-expr ((primitive-ref vector) ())
# funcall
#    si   =0
#    env  = ()
#    expr = (funcall (primitive-ref vector) ())
# emit-expr (primitive-ref vector)
    .extern vector
    movl vector,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_236"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_236":
   movl %eax,  -8(%esp)  # stash funcall-oper in closure slot
# emit-expr ()
    movl $63, %eax     # immed ()
    mov %eax, -12(%esp)  # arg ()
    movl -8(%esp), %edi   # load new closure to %edi
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_237
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_237:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_238"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_238:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_240
    cmp  $0,%eax
    jge _L_239
_L_240:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_239:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "procedure?") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "procedure?")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "procedure?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_241"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_241":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "procedure?"
# string literal
    jmp _L_243
    .align 8,0x90
_L_242 :
    .int 40
    .ascii "procedure?"
_L_243:
    movl $_L_242, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg procedure?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_244
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_244:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_245"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_245:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_247
    cmp  $0,%eax
    jge _L_246
_L_247:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_246:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_248
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_248:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_249"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_249:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_251
    cmp  $0,%eax
    jge _L_250
_L_251:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_250:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "cdr") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "cdr")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cdr")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_252"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_252":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_254
    .align 8,0x90
_L_253 :
    .int 12
    .ascii "cdr"
_L_254:
    movl $_L_253, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cdr
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_255
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_255:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_256"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_256:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_258
    cmp  $0,%eax
    jge _L_257
_L_258:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_257:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_259
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_259:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_260"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_260:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_262
    cmp  $0,%eax
    jge _L_261
_L_262:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_261:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "car") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "car")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "car")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_263"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_263":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_265
    .align 8,0x90
_L_264 :
    .int 12
    .ascii "car"
_L_265:
    movl $_L_264, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg car
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_266
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_266:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_267"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_267:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_269
    cmp  $0,%eax
    jge _L_268
_L_269:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_268:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_270
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_270:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_271"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_271:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_273
    cmp  $0,%eax
    jge _L_272
_L_273:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_272:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "symbol-value") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "symbol-value")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol-value")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_274"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_274":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol-value"
# string literal
    jmp _L_276
    .align 8,0x90
_L_275 :
    .int 48
    .ascii "symbol-value"
_L_276:
    movl $_L_275, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol-value
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_277
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_277:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_278"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_278:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_280
    cmp  $0,%eax
    jge _L_279
_L_280:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_279:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_281
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_281:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_282"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_282:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_284
    cmp  $0,%eax
    jge _L_283
_L_284:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_283:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "symbol->string") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "symbol->string")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol->string")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_285"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_285":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol->string"
# string literal
    jmp _L_287
    .align 8,0x90
_L_286 :
    .int 56
    .ascii "symbol->string"
_L_287:
    movl $_L_286, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol->string
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_288
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_288:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_289"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_289:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_291
    cmp  $0,%eax
    jge _L_290
_L_291:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_290:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_292
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_292:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_293"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_293:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_295
    cmp  $0,%eax
    jge _L_294
_L_295:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_294:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "make-symbol") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "make-symbol")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-symbol")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_296"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_296":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-symbol"
# string literal
    jmp _L_298
    .align 8,0x90
_L_297 :
    .int 44
    .ascii "make-symbol"
_L_298:
    movl $_L_297, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-symbol
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_299
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_299:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_300"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_300:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_302
    cmp  $0,%eax
    jge _L_301
_L_302:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_301:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_303
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_303:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_304"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_304:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_306
    cmp  $0,%eax
    jge _L_305
_L_306:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_305:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "symbol?") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "symbol?")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_307"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_307":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol?"
# string literal
    jmp _L_309
    .align 8,0x90
_L_308 :
    .int 28
    .ascii "symbol?"
_L_309:
    movl $_L_308, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_310
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_310:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_311"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_311:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_313
    cmp  $0,%eax
    jge _L_312
_L_313:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_312:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_314
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_314:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_315"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_315:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_317
    cmp  $0,%eax
    jge _L_316
_L_317:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_316:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "string-set!") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "string-set!")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-set!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_318"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_318":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-set!"
# string literal
    jmp _L_320
    .align 8,0x90
_L_319 :
    .int 44
    .ascii "string-set!"
_L_320:
    movl $_L_319, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-set!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_321
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_321:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_322"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_322:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_324
    cmp  $0,%eax
    jge _L_323
_L_324:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_323:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_325
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_325:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_326"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_326:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_328
    cmp  $0,%eax
    jge _L_327
_L_328:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_327:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "string-ref") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "string-ref")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-ref")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_329"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_329":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-ref"
# string literal
    jmp _L_331
    .align 8,0x90
_L_330 :
    .int 40
    .ascii "string-ref"
_L_331:
    movl $_L_330, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-ref
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_332
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_332:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_333"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_333:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_335
    cmp  $0,%eax
    jge _L_334
_L_335:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_334:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_336
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_336:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_337"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_337:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_339
    cmp  $0,%eax
    jge _L_338
_L_339:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_338:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-length") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "string-length") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "string-length")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-length")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_340"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_340":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-length"
# string literal
    jmp _L_342
    .align 8,0x90
_L_341 :
    .int 52
    .ascii "string-length"
_L_342:
    movl $_L_341, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-length
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_343
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_343:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_344"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_344:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_346
    cmp  $0,%eax
    jge _L_345
_L_346:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_345:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_347
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_347:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_348"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_348:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_350
    cmp  $0,%eax
    jge _L_349
_L_350:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_349:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string?") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "string?") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "string?")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_351"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_351":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string?"
# string literal
    jmp _L_353
    .align 8,0x90
_L_352 :
    .int 28
    .ascii "string?"
_L_353:
    movl $_L_352, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_354
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_354:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_355"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_355:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_357
    cmp  $0,%eax
    jge _L_356
_L_357:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_356:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_358
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_358:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_359"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_359:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_361
    cmp  $0,%eax
    jge _L_360
_L_361:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_360:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-string") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "make-string") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "make-string")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-string")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_362"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_362":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-string"
# string literal
    jmp _L_364
    .align 8,0x90
_L_363 :
    .int 44
    .ascii "make-string"
_L_364:
    movl $_L_363, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-string
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_365
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_365:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_366"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_366:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_368
    cmp  $0,%eax
    jge _L_367
_L_368:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_367:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_369
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_369:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_370"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_370:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_372
    cmp  $0,%eax
    jge _L_371
_L_372:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_371:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "vector-ref") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "vector-ref")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-ref")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_373"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_373":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-ref"
# string literal
    jmp _L_375
    .align 8,0x90
_L_374 :
    .int 40
    .ascii "vector-ref"
_L_375:
    movl $_L_374, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-ref
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_376
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_376:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_377"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_377:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_379
    cmp  $0,%eax
    jge _L_378
_L_379:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_378:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_380
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_380:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_381"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_381:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_383
    cmp  $0,%eax
    jge _L_382
_L_383:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_382:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "vector-set!") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "vector-set!")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-set!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_384"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_384":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-set!"
# string literal
    jmp _L_386
    .align 8,0x90
_L_385 :
    .int 44
    .ascii "vector-set!"
_L_386:
    movl $_L_385, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-set!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_387
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_387:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_388"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_388:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_390
    cmp  $0,%eax
    jge _L_389
_L_390:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_389:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_391
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_391:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_392"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_392:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_394
    cmp  $0,%eax
    jge _L_393
_L_394:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_393:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "vector-length") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "vector-length")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-length")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_395"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_395":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-length"
# string literal
    jmp _L_397
    .align 8,0x90
_L_396 :
    .int 52
    .ascii "vector-length"
_L_397:
    movl $_L_396, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-length
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_398
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_398:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_399"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_399:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_401
    cmp  $0,%eax
    jge _L_400
_L_401:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_400:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_402
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_402:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_403"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_403:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_405
    cmp  $0,%eax
    jge _L_404
_L_405:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_404:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "make-vector") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "make-vector")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-vector")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_406"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_406":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-vector"
# string literal
    jmp _L_408
    .align 8,0x90
_L_407 :
    .int 44
    .ascii "make-vector"
_L_408:
    movl $_L_407, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-vector
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_409
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_409:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_410"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_410:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_412
    cmp  $0,%eax
    jge _L_411
_L_412:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_411:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_413
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_413:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_414"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_414:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_416
    cmp  $0,%eax
    jge _L_415
_L_416:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_415:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector?") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "vector?") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "vector?")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_417"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_417":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector?"
# string literal
    jmp _L_419
    .align 8,0x90
_L_418 :
    .int 28
    .ascii "vector?"
_L_419:
    movl $_L_418, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_420
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_420:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_421"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_421:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_423
    cmp  $0,%eax
    jge _L_422
_L_423:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_422:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_424
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_424:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_425"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_425:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_427
    cmp  $0,%eax
    jge _L_426
_L_427:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_426:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "set-cdr!") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "set-cdr!")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "set-cdr!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_428"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_428":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-cdr!"
# string literal
    jmp _L_430
    .align 8,0x90
_L_429 :
    .int 32
    .ascii "set-cdr!"
_L_430:
    movl $_L_429, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg set-cdr!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_431
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_431:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_432"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_432:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_434
    cmp  $0,%eax
    jge _L_433
_L_434:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_433:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_435
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_435:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_436"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_436:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_438
    cmp  $0,%eax
    jge _L_437
_L_438:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_437:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "set-car!") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "set-car!")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "set-car!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_439"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_439":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-car!"
# string literal
    jmp _L_441
    .align 8,0x90
_L_440 :
    .int 32
    .ascii "set-car!"
_L_441:
    movl $_L_440, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg set-car!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_442
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_442:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_443"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_443:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_445
    cmp  $0,%eax
    jge _L_444
_L_445:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_444:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_446
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_446:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_447"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_447:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_449
    cmp  $0,%eax
    jge _L_448
_L_449:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_448:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cdr") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "cdr") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "cdr")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cdr")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_450"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_450":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_452
    .align 8,0x90
_L_451 :
    .int 12
    .ascii "cdr"
_L_452:
    movl $_L_451, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cdr
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_453
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_453:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_454"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_454:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_456
    cmp  $0,%eax
    jge _L_455
_L_456:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_455:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_457
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_457:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_458"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_458:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_460
    cmp  $0,%eax
    jge _L_459
_L_460:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_459:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "car") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "car") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "car")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "car")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_461"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_461":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_463
    .align 8,0x90
_L_462 :
    .int 12
    .ascii "car"
_L_463:
    movl $_L_462, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg car
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_464
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_464:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_465"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_465:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_467
    cmp  $0,%eax
    jge _L_466
_L_467:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_466:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_468
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_468:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_469"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_469:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_471
    cmp  $0,%eax
    jge _L_470
_L_471:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_470:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cons") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "cons") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "cons")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cons")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_472"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_472":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cons"
# string literal
    jmp _L_474
    .align 8,0x90
_L_473 :
    .int 16
    .ascii "cons"
_L_474:
    movl $_L_473, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cons
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_475
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_475:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_476"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_476:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_478
    cmp  $0,%eax
    jge _L_477
_L_478:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_477:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_479
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_479:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_480"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_480:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_482
    cmp  $0,%eax
    jge _L_481
_L_482:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_481:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "pair?") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "pair?") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "pair?")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "pair?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_483"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_483":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "pair?"
# string literal
    jmp _L_485
    .align 8,0x90
_L_484 :
    .int 20
    .ascii "pair?"
_L_485:
    movl $_L_484, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg pair?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_486
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_486:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_487"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_487:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_489
    cmp  $0,%eax
    jge _L_488
_L_489:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_488:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_490
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_490:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_491"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_491:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_493
    cmp  $0,%eax
    jge _L_492
_L_493:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_492:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx*") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "fx*") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "fx*")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx*")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_494"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_494":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx*"
# string literal
    jmp _L_496
    .align 8,0x90
_L_495 :
    .int 12
    .ascii "fx*"
_L_496:
    movl $_L_495, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx*
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_497
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_497:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_498"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_498:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_500
    cmp  $0,%eax
    jge _L_499
_L_500:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_499:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_501
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_501:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_502"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_502:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_504
    cmp  $0,%eax
    jge _L_503
_L_504:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_503:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx-") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "fx-") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "fx-")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx-")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_505"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_505":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx-"
# string literal
    jmp _L_507
    .align 8,0x90
_L_506 :
    .int 12
    .ascii "fx-"
_L_507:
    movl $_L_506, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx-
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_508
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_508:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_509"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_509:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_511
    cmp  $0,%eax
    jge _L_510
_L_511:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_510:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_512
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_512:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_513"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_513:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_515
    cmp  $0,%eax
    jge _L_514
_L_515:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_514:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx+") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "fx+") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "fx+")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx+")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_516"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_516":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx+"
# string literal
    jmp _L_518
    .align 8,0x90
_L_517 :
    .int 12
    .ascii "fx+"
_L_518:
    movl $_L_517, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx+
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_519
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_519:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_520"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_520:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_522
    cmp  $0,%eax
    jge _L_521
_L_522:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_521:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_523
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_523:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_524"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_524:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_526
    cmp  $0,%eax
    jge _L_525
_L_526:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_525:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "fx>=") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "fx>=")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx>=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_527"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_527":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>="
# string literal
    jmp _L_529
    .align 8,0x90
_L_528 :
    .int 16
    .ascii "fx>="
_L_529:
    movl $_L_528, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx>=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_530
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_530:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_531"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_531:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_533
    cmp  $0,%eax
    jge _L_532
_L_533:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_532:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_534
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_534:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_535"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_535:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_537
    cmp  $0,%eax
    jge _L_536
_L_537:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_536:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx>") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "fx>") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "fx>")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx>")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_538"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_538":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>"
# string literal
    jmp _L_540
    .align 8,0x90
_L_539 :
    .int 12
    .ascii "fx>"
_L_540:
    movl $_L_539, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx>
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_541
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_541:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_542"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_542:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_544
    cmp  $0,%eax
    jge _L_543
_L_544:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_543:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_545
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_545:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_546"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_546:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_548
    cmp  $0,%eax
    jge _L_547
_L_548:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_547:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "fx<=") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "fx<=")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx<=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_549"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_549":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<="
# string literal
    jmp _L_551
    .align 8,0x90
_L_550 :
    .int 16
    .ascii "fx<="
_L_551:
    movl $_L_550, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx<=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_552
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_552:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_553"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_553:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_555
    cmp  $0,%eax
    jge _L_554
_L_555:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_554:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_556
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_556:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_557"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_557:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_559
    cmp  $0,%eax
    jge _L_558
_L_559:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_558:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx<") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "fx<") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "fx<")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx<")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_560"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_560":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<"
# string literal
    jmp _L_562
    .align 8,0x90
_L_561 :
    .int 12
    .ascii "fx<"
_L_562:
    movl $_L_561, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx<
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_563
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_563:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_564"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_564:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_566
    cmp  $0,%eax
    jge _L_565
_L_566:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_565:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_567
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_567:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_568"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_568:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_570
    cmp  $0,%eax
    jge _L_569
_L_570:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_569:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx=") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "fx=") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "fx=")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_571"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_571":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx="
# string literal
    jmp _L_573
    .align 8,0x90
_L_572 :
    .int 12
    .ascii "fx="
_L_573:
    movl $_L_572, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_574
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_574:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_575"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_575:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_577
    cmp  $0,%eax
    jge _L_576
_L_577:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_576:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_578
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_578:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_579"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_579:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_581
    cmp  $0,%eax
    jge _L_580
_L_581:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_580:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "fxzero?") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "fxzero?")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxzero?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_582"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_582":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxzero?"
# string literal
    jmp _L_584
    .align 8,0x90
_L_583 :
    .int 28
    .ascii "fxzero?"
_L_584:
    movl $_L_583, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxzero?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_585
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_585:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_586"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_586:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_588
    cmp  $0,%eax
    jge _L_587
_L_588:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_587:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_589
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_589:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_590"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_590:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_592
    cmp  $0,%eax
    jge _L_591
_L_592:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_591:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "fxsub1") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "fxsub1")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxsub1")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_593"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_593":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxsub1"
# string literal
    jmp _L_595
    .align 8,0x90
_L_594 :
    .int 24
    .ascii "fxsub1"
_L_595:
    movl $_L_594, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxsub1
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_596
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_596:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_597"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_597:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_599
    cmp  $0,%eax
    jge _L_598
_L_599:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_598:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_600
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_600:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_601"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_601:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_603
    cmp  $0,%eax
    jge _L_602
_L_603:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_602:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "fxadd1") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "fxadd1")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxadd1")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_604"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_604":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxadd1"
# string literal
    jmp _L_606
    .align 8,0x90
_L_605 :
    .int 24
    .ascii "fxadd1"
_L_606:
    movl $_L_605, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxadd1
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_607
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_607:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_608"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_608:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_610
    cmp  $0,%eax
    jge _L_609
_L_610:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_609:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_611
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_611:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_612"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_612:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_614
    cmp  $0,%eax
    jge _L_613
_L_614:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_613:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "fxlogor") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "fxlogor")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlogor")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_615"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_615":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogor"
# string literal
    jmp _L_617
    .align 8,0x90
_L_616 :
    .int 28
    .ascii "fxlogor"
_L_617:
    movl $_L_616, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlogor
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_618
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_618:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_619"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_619:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_621
    cmp  $0,%eax
    jge _L_620
_L_621:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_620:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_622
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_622:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_623"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_623:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_625
    cmp  $0,%eax
    jge _L_624
_L_625:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_624:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "fxlogand") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "fxlogand")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlogand")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_626"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_626":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogand"
# string literal
    jmp _L_628
    .align 8,0x90
_L_627 :
    .int 32
    .ascii "fxlogand"
_L_628:
    movl $_L_627, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlogand
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_629
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_629:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_630"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_630:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_632
    cmp  $0,%eax
    jge _L_631
_L_632:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_631:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_633
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_633:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_634"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_634:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_636
    cmp  $0,%eax
    jge _L_635
_L_636:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_635:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "fxlognot") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "fxlognot")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlognot")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_637"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_637":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlognot"
# string literal
    jmp _L_639
    .align 8,0x90
_L_638 :
    .int 32
    .ascii "fxlognot"
_L_639:
    movl $_L_638, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlognot
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_640
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_640:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_641"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_641:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_643
    cmp  $0,%eax
    jge _L_642
_L_643:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_642:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_644
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_644:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_645"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_645:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_647
    cmp  $0,%eax
    jge _L_646
_L_647:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_646:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char=?") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "char=?") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "char=?")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char=?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_648"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_648":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char=?"
# string literal
    jmp _L_650
    .align 8,0x90
_L_649 :
    .int 24
    .ascii "char=?"
_L_650:
    movl $_L_649, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char=?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_651
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_651:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_652"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_652:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_654
    cmp  $0,%eax
    jge _L_653
_L_654:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_653:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_655
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_655:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_656"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_656:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_658
    cmp  $0,%eax
    jge _L_657
_L_658:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_657:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "eq?") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "eq?") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "eq?")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "eq?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_659"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_659":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "eq?"
# string literal
    jmp _L_661
    .align 8,0x90
_L_660 :
    .int 12
    .ascii "eq?"
_L_661:
    movl $_L_660, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg eq?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_662
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_662:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_663"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_663:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_665
    cmp  $0,%eax
    jge _L_664
_L_665:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_664:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_666
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_666:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_667"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_667:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_669
    cmp  $0,%eax
    jge _L_668
_L_669:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_668:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "not") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "not") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "not")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "not")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_670"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_670":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "not"
# string literal
    jmp _L_672
    .align 8,0x90
_L_671 :
    .int 12
    .ascii "not"
_L_672:
    movl $_L_671, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg not
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_673
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_673:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_674"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_674:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_676
    cmp  $0,%eax
    jge _L_675
_L_676:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_675:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_677
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_677:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_678"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_678:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_680
    cmp  $0,%eax
    jge _L_679
_L_680:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_679:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "boolean?") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "boolean?")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "boolean?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_681"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_681":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "boolean?"
# string literal
    jmp _L_683
    .align 8,0x90
_L_682 :
    .int 32
    .ascii "boolean?"
_L_683:
    movl $_L_682, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg boolean?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_684
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_684:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_685"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_687
    cmp  $0,%eax
    jge _L_686
_L_687:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_688
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_688:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_689"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_689:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_691
    cmp  $0,%eax
    jge _L_690
_L_691:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_690:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "fixnum?") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "fixnum?")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fixnum?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_692"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_692":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum?"
# string literal
    jmp _L_694
    .align 8,0x90
_L_693 :
    .int 28
    .ascii "fixnum?"
_L_694:
    movl $_L_693, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fixnum?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_695
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_695:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_696"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_696:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_698
    cmp  $0,%eax
    jge _L_697
_L_698:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_697:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_699
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_699:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_700"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_700:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_702
    cmp  $0,%eax
    jge _L_701
_L_702:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_701:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char?") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "char?") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "char?")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_703"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_703":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char?"
# string literal
    jmp _L_705
    .align 8,0x90
_L_704 :
    .int 20
    .ascii "char?"
_L_705:
    movl $_L_704, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_706
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_706:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_707"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_707:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_709
    cmp  $0,%eax
    jge _L_708
_L_709:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_708:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_710
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_710:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_711"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_711:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_713
    cmp  $0,%eax
    jge _L_712
_L_713:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_712:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "null?") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "null?") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "null?")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "null?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_714"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_714":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "null?"
# string literal
    jmp _L_716
    .align 8,0x90
_L_715 :
    .int 20
    .ascii "null?"
_L_716:
    movl $_L_715, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg null?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_717
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_717:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_718"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_718:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_720
    cmp  $0,%eax
    jge _L_719
_L_720:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_719:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))) (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_721
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_721:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_722"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_722:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_724
    cmp  $0,%eax
    jge _L_723
_L_724:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_723:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "char->fixnum") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "char->fixnum")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char->fixnum")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_725"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_725":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char->fixnum"
# string literal
    jmp _L_727
    .align 8,0x90
_L_726 :
    .int 48
    .ascii "char->fixnum"
_L_727:
    movl $_L_726, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char->fixnum
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_728
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_728:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_729"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_729:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_731
    cmp  $0,%eax
    jge _L_730
_L_731:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_730:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))) (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (vector-set! f93 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0)))
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_732
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_732:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_733"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_733:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_735
    cmp  $0,%eax
    jge _L_734
_L_735:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_734:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f93 0))
# cons arg1=((primitive-ref string->symbol) "fixnum->char") arg2=(vector-ref f93 0)
# emit-expr ((primitive-ref string->symbol) "fixnum->char")
# funcall
#    si   =-12
#    env  = ((f93 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fixnum->char")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_736"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_736":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum->char"
# string literal
    jmp _L_738
    .align 8,0x90
_L_737 :
    .int 48
    .ascii "fixnum->char"
_L_738:
    movl $_L_737, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fixnum->char
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f93 0)
# emit-expr f93
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_739
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_739:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_740"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_740:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_742
    cmp  $0,%eax
    jge _L_741
_L_742:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_741:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (closure () (f93) (let () (vector-ref f93 0))))
# emit-begin
#   expr=(begin (closure () (f93) (let () (vector-ref f93 0))))
#   env=((f93 . 0))
# emit-expr (closure () (f93) (let () (vector-ref f93 0)))
# emit-closure
# si = -4
# env = ((f93 . 0))
# expr = (closure () (f93) (let () (vector-ref f93 0)))
    movl $_L_743, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f93 . 0))
# var=f93
    movl 0(%esp), %eax  # stack load f93
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f93
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_744            # jump around closure body
_L_743:
# check argument count
    cmp $0,%eax
    je _L_745
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_745:
# emit-tail-expr
# si=-8
# env=((f93 . 4) (f93 . 0))
# expr=(let () (vector-ref f93 0))
# emit-tail-let
#  si   = -8
#  env  = ((f93 . 4) (f93 . 0))
#  bindings = ()
#  body = (vector-ref f93 0)
# emit-tail-expr
# si=-8
# env=((f93 . 4) (f93 . 0))
# expr=(vector-ref f93 0)
# tail primcall
# emit-expr f93
# emit-variable-ref
# env=((f93 . 4) (f93 . 0))
# var=f93
    movl 2(%edi), %eax  # frame load f93
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_746
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_746:
    movl %eax, -8(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_747"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_747:
# check bounds on vector index
    movl -8(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_749
    cmp  $0,%eax
    jge _L_748
_L_749:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_748:
    movl -8(%esp), %esi
    movl -1(%eax,%esi), %eax
#return from tail (vector-ref f93 0)
    ret
    .align 4,0x90
_L_744:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f93 . 0))
     movl %eax, primitives
# == explicit-begins  ==>
# (lambda () (error (quote funcall) "arg 1 must be a procedure"))
# == eliminate-let*  ==>
# (lambda () (error (quote funcall) "arg 1 must be a procedure"))
# == uniquify-variables  ==>
# (lambda () (error (quote funcall) "arg 1 must be a procedure"))
# == vectorize-letrec  ==>
# (lambda () (error (quote funcall) "arg 1 must be a procedure"))
# == eliminate-set!  ==>
# (lambda () (let () (error (quote funcall) "arg 1 must be a procedure")))
# == close-free-variables  ==>
# (closure () (error funcall) (let () (error (quote funcall) "arg 1 must be a procedure")))
# == eliminate-quote  ==>
# (closure () (error funcall) (let () (error (string->symbol "funcall") "arg 1 must be a procedure")))
# == eliminate-when/unless  ==>
# (closure () (error funcall) (let () (error (string->symbol "funcall") "arg 1 must be a procedure")))
# == eliminate-cond  ==>
# (closure () (error funcall) (let () (error (string->symbol "funcall") "arg 1 must be a procedure")))
# == external-symbols  ==>
# (closure () ((primitive-ref error) funcall) (let () ((primitive-ref error) ((primitive-ref string->symbol) "funcall") "arg 1 must be a procedure")))
# emit-expr (closure () ((primitive-ref error) funcall) (let () ((primitive-ref error) ((primitive-ref string->symbol) "funcall") "arg 1 must be a procedure")))
# emit-closure
# si = 0
# env = ()
# expr = (closure () ((primitive-ref error) funcall) (let () ((primitive-ref error) ((primitive-ref string->symbol) "funcall") "arg 1 must be a procedure")))
    movl $_L_750, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_751            # jump around closure body
_L_750:
# check argument count
    cmp $0,%eax
    je _L_752
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_752:
# emit-tail-expr
# si=-8
# env=((funcall . 8) ((primitive-ref error) . 4))
# expr=(let () ((primitive-ref error) ((primitive-ref string->symbol) "funcall") "arg 1 must be a procedure"))
# emit-tail-let
#  si   = -8
#  env  = ((funcall . 8) ((primitive-ref error) . 4))
#  bindings = ()
#  body = ((primitive-ref error) ((primitive-ref string->symbol) "funcall") "arg 1 must be a procedure")
# emit-tail-expr
# si=-8
# env=((funcall . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref string->symbol) "funcall") "arg 1 must be a procedure")
# emit-tail-funcall
#    si   =-8
#    env  = ((funcall . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref string->symbol) "funcall") "arg 1 must be a procedure")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -8(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref string->symbol) "funcall")
# funcall
#    si   =-12
#    env  = ((funcall . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref string->symbol) "funcall")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_753"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_753":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_755
    .align 8,0x90
_L_754 :
    .int 28
    .ascii "funcall"
_L_755:
    movl $_L_754, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg funcall
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -12(%esp)    # arg ((primitive-ref string->symbol) funcall)
# emit-expr "arg 1 must be a procedure"
# string literal
    jmp _L_757
    .align 8,0x90
_L_756 :
    .int 100
    .ascii "arg 1 must be a procedure"
_L_757:
    movl $_L_756, %eax
    orl $6, %eax
    mov %eax, -16(%esp)    # arg arg 1 must be a procedure
    movl -8(%esp), %edi   # load new closure to %edi
# emit-shift-args:  size=3   si=-8  delta=4
    mov -8(%esp), %ebx  # shift frame cell
    mov %ebx, -4(%esp)  # down to base
# emit-shift-args:  size=2   si=-12  delta=4
    mov -12(%esp), %ebx  # shift frame cell
    mov %ebx, -8(%esp)  # down to base
# emit-shift-args:  size=1   si=-16  delta=4
    mov -16(%esp), %ebx  # shift frame cell
    mov %ebx, -12(%esp)  # down to base
# emit-shift-args:  size=0   si=-20  delta=4
    movl $8,%eax   # save arg count
    jmp *-2(%edi)  # tail-funcall
    .align 4,0x90
_L_751:
     movl %eax, eh$uprocedure
# == explicit-begins  ==>
# (lambda () (error (quote funcall) "wrong number of args"))
# == eliminate-let*  ==>
# (lambda () (error (quote funcall) "wrong number of args"))
# == uniquify-variables  ==>
# (lambda () (error (quote funcall) "wrong number of args"))
# == vectorize-letrec  ==>
# (lambda () (error (quote funcall) "wrong number of args"))
# == eliminate-set!  ==>
# (lambda () (let () (error (quote funcall) "wrong number of args")))
# == close-free-variables  ==>
# (closure () (error funcall) (let () (error (quote funcall) "wrong number of args")))
# == eliminate-quote  ==>
# (closure () (error funcall) (let () (error (string->symbol "funcall") "wrong number of args")))
# == eliminate-when/unless  ==>
# (closure () (error funcall) (let () (error (string->symbol "funcall") "wrong number of args")))
# == eliminate-cond  ==>
# (closure () (error funcall) (let () (error (string->symbol "funcall") "wrong number of args")))
# == external-symbols  ==>
# (closure () ((primitive-ref error) funcall) (let () ((primitive-ref error) ((primitive-ref string->symbol) "funcall") "wrong number of args")))
# emit-expr (closure () ((primitive-ref error) funcall) (let () ((primitive-ref error) ((primitive-ref string->symbol) "funcall") "wrong number of args")))
# emit-closure
# si = 0
# env = ()
# expr = (closure () ((primitive-ref error) funcall) (let () ((primitive-ref error) ((primitive-ref string->symbol) "funcall") "wrong number of args")))
    movl $_L_758, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_759            # jump around closure body
_L_758:
# check argument count
    cmp $0,%eax
    je _L_760
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_760:
# emit-tail-expr
# si=-8
# env=((funcall . 8) ((primitive-ref error) . 4))
# expr=(let () ((primitive-ref error) ((primitive-ref string->symbol) "funcall") "wrong number of args"))
# emit-tail-let
#  si   = -8
#  env  = ((funcall . 8) ((primitive-ref error) . 4))
#  bindings = ()
#  body = ((primitive-ref error) ((primitive-ref string->symbol) "funcall") "wrong number of args")
# emit-tail-expr
# si=-8
# env=((funcall . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref string->symbol) "funcall") "wrong number of args")
# emit-tail-funcall
#    si   =-8
#    env  = ((funcall . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref string->symbol) "funcall") "wrong number of args")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -8(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref string->symbol) "funcall")
# funcall
#    si   =-12
#    env  = ((funcall . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref string->symbol) "funcall")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_761"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_761":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_763
    .align 8,0x90
_L_762 :
    .int 28
    .ascii "funcall"
_L_763:
    movl $_L_762, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg funcall
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -12(%esp)    # arg ((primitive-ref string->symbol) funcall)
# emit-expr "wrong number of args"
# string literal
    jmp _L_765
    .align 8,0x90
_L_764 :
    .int 80
    .ascii "wrong number of args"
_L_765:
    movl $_L_764, %eax
    orl $6, %eax
    mov %eax, -16(%esp)    # arg wrong number of args
    movl -8(%esp), %edi   # load new closure to %edi
# emit-shift-args:  size=3   si=-8  delta=4
    mov -8(%esp), %ebx  # shift frame cell
    mov %ebx, -4(%esp)  # down to base
# emit-shift-args:  size=2   si=-12  delta=4
    mov -12(%esp), %ebx  # shift frame cell
    mov %ebx, -8(%esp)  # down to base
# emit-shift-args:  size=1   si=-16  delta=4
    mov -16(%esp), %ebx  # shift frame cell
    mov %ebx, -12(%esp)  # down to base
# emit-shift-args:  size=0   si=-20  delta=4
    movl $8,%eax   # save arg count
    jmp *-2(%edi)  # tail-funcall
    .align 4,0x90
_L_759:
     movl %eax, eh$uargcount
# == explicit-begins  ==>
# (lambda () (error (quote funcall) "too few args"))
# == eliminate-let*  ==>
# (lambda () (error (quote funcall) "too few args"))
# == uniquify-variables  ==>
# (lambda () (error (quote funcall) "too few args"))
# == vectorize-letrec  ==>
# (lambda () (error (quote funcall) "too few args"))
# == eliminate-set!  ==>
# (lambda () (let () (error (quote funcall) "too few args")))
# == close-free-variables  ==>
# (closure () (error funcall) (let () (error (quote funcall) "too few args")))
# == eliminate-quote  ==>
# (closure () (error funcall) (let () (error (string->symbol "funcall") "too few args")))
# == eliminate-when/unless  ==>
# (closure () (error funcall) (let () (error (string->symbol "funcall") "too few args")))
# == eliminate-cond  ==>
# (closure () (error funcall) (let () (error (string->symbol "funcall") "too few args")))
# == external-symbols  ==>
# (closure () ((primitive-ref error) funcall) (let () ((primitive-ref error) ((primitive-ref string->symbol) "funcall") "too few args")))
# emit-expr (closure () ((primitive-ref error) funcall) (let () ((primitive-ref error) ((primitive-ref string->symbol) "funcall") "too few args")))
# emit-closure
# si = 0
# env = ()
# expr = (closure () ((primitive-ref error) funcall) (let () ((primitive-ref error) ((primitive-ref string->symbol) "funcall") "too few args")))
    movl $_L_766, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_767            # jump around closure body
_L_766:
# check argument count
    cmp $0,%eax
    je _L_768
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_768:
# emit-tail-expr
# si=-8
# env=((funcall . 8) ((primitive-ref error) . 4))
# expr=(let () ((primitive-ref error) ((primitive-ref string->symbol) "funcall") "too few args"))
# emit-tail-let
#  si   = -8
#  env  = ((funcall . 8) ((primitive-ref error) . 4))
#  bindings = ()
#  body = ((primitive-ref error) ((primitive-ref string->symbol) "funcall") "too few args")
# emit-tail-expr
# si=-8
# env=((funcall . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref string->symbol) "funcall") "too few args")
# emit-tail-funcall
#    si   =-8
#    env  = ((funcall . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref string->symbol) "funcall") "too few args")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -8(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref string->symbol) "funcall")
# funcall
#    si   =-12
#    env  = ((funcall . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref string->symbol) "funcall")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_769"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_769":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_771
    .align 8,0x90
_L_770 :
    .int 28
    .ascii "funcall"
_L_771:
    movl $_L_770, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg funcall
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -12(%esp)    # arg ((primitive-ref string->symbol) funcall)
# emit-expr "too few args"
# string literal
    jmp _L_773
    .align 8,0x90
_L_772 :
    .int 48
    .ascii "too few args"
_L_773:
    movl $_L_772, %eax
    orl $6, %eax
    mov %eax, -16(%esp)    # arg too few args
    movl -8(%esp), %edi   # load new closure to %edi
# emit-shift-args:  size=3   si=-8  delta=4
    mov -8(%esp), %ebx  # shift frame cell
    mov %ebx, -4(%esp)  # down to base
# emit-shift-args:  size=2   si=-12  delta=4
    mov -12(%esp), %ebx  # shift frame cell
    mov %ebx, -8(%esp)  # down to base
# emit-shift-args:  size=1   si=-16  delta=4
    mov -16(%esp), %ebx  # shift frame cell
    mov %ebx, -12(%esp)  # down to base
# emit-shift-args:  size=0   si=-20  delta=4
    movl $8,%eax   # save arg count
    jmp *-2(%edi)  # tail-funcall
    .align 4,0x90
_L_767:
     movl %eax, eh$uargcount$umin
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == uniquify-variables  ==>
# (lambda (f94) (error (list-ref (primitives) f94) "arg must be a fixnum"))
# == vectorize-letrec  ==>
# (lambda (f94) (error (list-ref (primitives) f94) "arg must be a fixnum"))
# == eliminate-set!  ==>
# (lambda (f94) (let ((f94 f94)) (error (list-ref (primitives) f94) "arg must be a fixnum")))
# == close-free-variables  ==>
# (closure (f94) (error list-ref primitives) (let ((f94 f94)) (error (list-ref (primitives) f94) "arg must be a fixnum")))
# == eliminate-quote  ==>
# (closure (f94) (error list-ref primitives) (let ((f94 f94)) (error (list-ref (primitives) f94) "arg must be a fixnum")))
# == eliminate-when/unless  ==>
# (closure (f94) (error list-ref primitives) (let ((f94 f94)) (error (list-ref (primitives) f94) "arg must be a fixnum")))
# == eliminate-cond  ==>
# (closure (f94) (error list-ref primitives) (let ((f94 f94)) (error (list-ref (primitives) f94) "arg must be a fixnum")))
# == external-symbols  ==>
# (closure (f94) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f94 f94)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f94) "arg must be a fixnum")))
# emit-expr (closure (f94) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f94 f94)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f94) "arg must be a fixnum")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f94) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f94 f94)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f94) "arg must be a fixnum")))
    movl $_L_774, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_775            # jump around closure body
_L_774:
# check argument count
    cmp $4,%eax
    je _L_776
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_776:
# emit-tail-expr
# si=-12
# env=((f94 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f94 f94)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f94) "arg must be a fixnum"))
# emit-tail-let
#  si   = -12
#  env  = ((f94 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f94 f94))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f94) "arg must be a fixnum")
# emit-expr f94
# emit-variable-ref
# env=((f94 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f94
    movl -8(%esp), %eax  # stack load f94
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f94 . -12) (f94 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f94) "arg must be a fixnum")
# emit-tail-funcall
#    si   =-16
#    env  = ((f94 . -12) (f94 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f94) "arg must be a fixnum")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f94)
# funcall
#    si   =-20
#    env  = ((f94 . -12) (f94 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f94)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_777"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_777":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f94 . -12) (f94 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_778"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_778":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f94
# emit-variable-ref
# env=((f94 . -12) (f94 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f94
    movl -12(%esp), %eax  # stack load f94
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f94
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f94)
# emit-expr "arg must be a fixnum"
# string literal
    jmp _L_780
    .align 8,0x90
_L_779 :
    .int 80
    .ascii "arg must be a fixnum"
_L_780:
    movl $_L_779, %eax
    orl $6, %eax
    mov %eax, -24(%esp)    # arg arg must be a fixnum
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
    .align 4,0x90
_L_775:
     movl %eax, eh$ufixnum
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == uniquify-variables  ==>
# (lambda (f95) (error (list-ref (primitives) f95) "arg must be a string"))
# == vectorize-letrec  ==>
# (lambda (f95) (error (list-ref (primitives) f95) "arg must be a string"))
# == eliminate-set!  ==>
# (lambda (f95) (let ((f95 f95)) (error (list-ref (primitives) f95) "arg must be a string")))
# == close-free-variables  ==>
# (closure (f95) (error list-ref primitives) (let ((f95 f95)) (error (list-ref (primitives) f95) "arg must be a string")))
# == eliminate-quote  ==>
# (closure (f95) (error list-ref primitives) (let ((f95 f95)) (error (list-ref (primitives) f95) "arg must be a string")))
# == eliminate-when/unless  ==>
# (closure (f95) (error list-ref primitives) (let ((f95 f95)) (error (list-ref (primitives) f95) "arg must be a string")))
# == eliminate-cond  ==>
# (closure (f95) (error list-ref primitives) (let ((f95 f95)) (error (list-ref (primitives) f95) "arg must be a string")))
# == external-symbols  ==>
# (closure (f95) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f95 f95)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f95) "arg must be a string")))
# emit-expr (closure (f95) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f95 f95)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f95) "arg must be a string")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f95) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f95 f95)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f95) "arg must be a string")))
    movl $_L_781, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_782            # jump around closure body
_L_781:
# check argument count
    cmp $4,%eax
    je _L_783
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_783:
# emit-tail-expr
# si=-12
# env=((f95 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f95 f95)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f95) "arg must be a string"))
# emit-tail-let
#  si   = -12
#  env  = ((f95 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f95 f95))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f95) "arg must be a string")
# emit-expr f95
# emit-variable-ref
# env=((f95 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f95
    movl -8(%esp), %eax  # stack load f95
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f95 . -12) (f95 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f95) "arg must be a string")
# emit-tail-funcall
#    si   =-16
#    env  = ((f95 . -12) (f95 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f95) "arg must be a string")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f95)
# funcall
#    si   =-20
#    env  = ((f95 . -12) (f95 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f95)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_784"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_784":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f95 . -12) (f95 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_785"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_785":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f95
# emit-variable-ref
# env=((f95 . -12) (f95 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f95
    movl -12(%esp), %eax  # stack load f95
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f95
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f95)
# emit-expr "arg must be a string"
# string literal
    jmp _L_787
    .align 8,0x90
_L_786 :
    .int 80
    .ascii "arg must be a string"
_L_787:
    movl $_L_786, %eax
    orl $6, %eax
    mov %eax, -24(%esp)    # arg arg must be a string
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
    .align 4,0x90
_L_782:
     movl %eax, eh$ustring
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == uniquify-variables  ==>
# (lambda (f96) (error (list-ref (primitives) f96) "arg must be a character"))
# == vectorize-letrec  ==>
# (lambda (f96) (error (list-ref (primitives) f96) "arg must be a character"))
# == eliminate-set!  ==>
# (lambda (f96) (let ((f96 f96)) (error (list-ref (primitives) f96) "arg must be a character")))
# == close-free-variables  ==>
# (closure (f96) (error list-ref primitives) (let ((f96 f96)) (error (list-ref (primitives) f96) "arg must be a character")))
# == eliminate-quote  ==>
# (closure (f96) (error list-ref primitives) (let ((f96 f96)) (error (list-ref (primitives) f96) "arg must be a character")))
# == eliminate-when/unless  ==>
# (closure (f96) (error list-ref primitives) (let ((f96 f96)) (error (list-ref (primitives) f96) "arg must be a character")))
# == eliminate-cond  ==>
# (closure (f96) (error list-ref primitives) (let ((f96 f96)) (error (list-ref (primitives) f96) "arg must be a character")))
# == external-symbols  ==>
# (closure (f96) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f96 f96)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f96) "arg must be a character")))
# emit-expr (closure (f96) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f96 f96)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f96) "arg must be a character")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f96) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f96 f96)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f96) "arg must be a character")))
    movl $_L_788, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_789            # jump around closure body
_L_788:
# check argument count
    cmp $4,%eax
    je _L_790
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_790:
# emit-tail-expr
# si=-12
# env=((f96 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f96 f96)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f96) "arg must be a character"))
# emit-tail-let
#  si   = -12
#  env  = ((f96 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f96 f96))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f96) "arg must be a character")
# emit-expr f96
# emit-variable-ref
# env=((f96 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f96
    movl -8(%esp), %eax  # stack load f96
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f96 . -12) (f96 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f96) "arg must be a character")
# emit-tail-funcall
#    si   =-16
#    env  = ((f96 . -12) (f96 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f96) "arg must be a character")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f96)
# funcall
#    si   =-20
#    env  = ((f96 . -12) (f96 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f96)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_791"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_791":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f96 . -12) (f96 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_792"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_792":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f96
# emit-variable-ref
# env=((f96 . -12) (f96 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f96
    movl -12(%esp), %eax  # stack load f96
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f96
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f96)
# emit-expr "arg must be a character"
# string literal
    jmp _L_794
    .align 8,0x90
_L_793 :
    .int 92
    .ascii "arg must be a character"
_L_794:
    movl $_L_793, %eax
    orl $6, %eax
    mov %eax, -24(%esp)    # arg arg must be a character
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
    .align 4,0x90
_L_789:
     movl %eax, eh$ucharacter
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == uniquify-variables  ==>
# (lambda (f97) (error (list-ref (primitives) f97) "arg must be a pair"))
# == vectorize-letrec  ==>
# (lambda (f97) (error (list-ref (primitives) f97) "arg must be a pair"))
# == eliminate-set!  ==>
# (lambda (f97) (let ((f97 f97)) (error (list-ref (primitives) f97) "arg must be a pair")))
# == close-free-variables  ==>
# (closure (f97) (error list-ref primitives) (let ((f97 f97)) (error (list-ref (primitives) f97) "arg must be a pair")))
# == eliminate-quote  ==>
# (closure (f97) (error list-ref primitives) (let ((f97 f97)) (error (list-ref (primitives) f97) "arg must be a pair")))
# == eliminate-when/unless  ==>
# (closure (f97) (error list-ref primitives) (let ((f97 f97)) (error (list-ref (primitives) f97) "arg must be a pair")))
# == eliminate-cond  ==>
# (closure (f97) (error list-ref primitives) (let ((f97 f97)) (error (list-ref (primitives) f97) "arg must be a pair")))
# == external-symbols  ==>
# (closure (f97) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f97 f97)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f97) "arg must be a pair")))
# emit-expr (closure (f97) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f97 f97)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f97) "arg must be a pair")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f97) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f97 f97)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f97) "arg must be a pair")))
    movl $_L_795, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_796            # jump around closure body
_L_795:
# check argument count
    cmp $4,%eax
    je _L_797
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_797:
# emit-tail-expr
# si=-12
# env=((f97 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f97 f97)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f97) "arg must be a pair"))
# emit-tail-let
#  si   = -12
#  env  = ((f97 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f97 f97))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f97) "arg must be a pair")
# emit-expr f97
# emit-variable-ref
# env=((f97 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f97
    movl -8(%esp), %eax  # stack load f97
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f97 . -12) (f97 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f97) "arg must be a pair")
# emit-tail-funcall
#    si   =-16
#    env  = ((f97 . -12) (f97 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f97) "arg must be a pair")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f97)
# funcall
#    si   =-20
#    env  = ((f97 . -12) (f97 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f97)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_798"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_798":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f97 . -12) (f97 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_799"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_799":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f97
# emit-variable-ref
# env=((f97 . -12) (f97 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f97
    movl -12(%esp), %eax  # stack load f97
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f97
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f97)
# emit-expr "arg must be a pair"
# string literal
    jmp _L_801
    .align 8,0x90
_L_800 :
    .int 72
    .ascii "arg must be a pair"
_L_801:
    movl $_L_800, %eax
    orl $6, %eax
    mov %eax, -24(%esp)    # arg arg must be a pair
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
    .align 4,0x90
_L_796:
     movl %eax, eh$upair
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == uniquify-variables  ==>
# (lambda (f98) (error (list-ref (primitives) f98) "arg must be a vector"))
# == vectorize-letrec  ==>
# (lambda (f98) (error (list-ref (primitives) f98) "arg must be a vector"))
# == eliminate-set!  ==>
# (lambda (f98) (let ((f98 f98)) (error (list-ref (primitives) f98) "arg must be a vector")))
# == close-free-variables  ==>
# (closure (f98) (error list-ref primitives) (let ((f98 f98)) (error (list-ref (primitives) f98) "arg must be a vector")))
# == eliminate-quote  ==>
# (closure (f98) (error list-ref primitives) (let ((f98 f98)) (error (list-ref (primitives) f98) "arg must be a vector")))
# == eliminate-when/unless  ==>
# (closure (f98) (error list-ref primitives) (let ((f98 f98)) (error (list-ref (primitives) f98) "arg must be a vector")))
# == eliminate-cond  ==>
# (closure (f98) (error list-ref primitives) (let ((f98 f98)) (error (list-ref (primitives) f98) "arg must be a vector")))
# == external-symbols  ==>
# (closure (f98) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f98 f98)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f98) "arg must be a vector")))
# emit-expr (closure (f98) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f98 f98)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f98) "arg must be a vector")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f98) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f98 f98)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f98) "arg must be a vector")))
    movl $_L_802, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_803            # jump around closure body
_L_802:
# check argument count
    cmp $4,%eax
    je _L_804
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_804:
# emit-tail-expr
# si=-12
# env=((f98 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f98 f98)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f98) "arg must be a vector"))
# emit-tail-let
#  si   = -12
#  env  = ((f98 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f98 f98))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f98) "arg must be a vector")
# emit-expr f98
# emit-variable-ref
# env=((f98 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f98
    movl -8(%esp), %eax  # stack load f98
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f98 . -12) (f98 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f98) "arg must be a vector")
# emit-tail-funcall
#    si   =-16
#    env  = ((f98 . -12) (f98 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f98) "arg must be a vector")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f98)
# funcall
#    si   =-20
#    env  = ((f98 . -12) (f98 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f98)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_805"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_805":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f98 . -12) (f98 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_806"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_806":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f98
# emit-variable-ref
# env=((f98 . -12) (f98 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f98
    movl -12(%esp), %eax  # stack load f98
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f98
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f98)
# emit-expr "arg must be a vector"
# string literal
    jmp _L_808
    .align 8,0x90
_L_807 :
    .int 80
    .ascii "arg must be a vector"
_L_808:
    movl $_L_807, %eax
    orl $6, %eax
    mov %eax, -24(%esp)    # arg arg must be a vector
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
    .align 4,0x90
_L_803:
     movl %eax, eh$uvector
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == uniquify-variables  ==>
# (lambda (f99) (error (list-ref (primitives) f99) "length must be a fixnum >= 0"))
# == vectorize-letrec  ==>
# (lambda (f99) (error (list-ref (primitives) f99) "length must be a fixnum >= 0"))
# == eliminate-set!  ==>
# (lambda (f99) (let ((f99 f99)) (error (list-ref (primitives) f99) "length must be a fixnum >= 0")))
# == close-free-variables  ==>
# (closure (f99) (error list-ref primitives) (let ((f99 f99)) (error (list-ref (primitives) f99) "length must be a fixnum >= 0")))
# == eliminate-quote  ==>
# (closure (f99) (error list-ref primitives) (let ((f99 f99)) (error (list-ref (primitives) f99) "length must be a fixnum >= 0")))
# == eliminate-when/unless  ==>
# (closure (f99) (error list-ref primitives) (let ((f99 f99)) (error (list-ref (primitives) f99) "length must be a fixnum >= 0")))
# == eliminate-cond  ==>
# (closure (f99) (error list-ref primitives) (let ((f99 f99)) (error (list-ref (primitives) f99) "length must be a fixnum >= 0")))
# == external-symbols  ==>
# (closure (f99) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f99 f99)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f99) "length must be a fixnum >= 0")))
# emit-expr (closure (f99) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f99 f99)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f99) "length must be a fixnum >= 0")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f99) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f99 f99)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f99) "length must be a fixnum >= 0")))
    movl $_L_809, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_810            # jump around closure body
_L_809:
# check argument count
    cmp $4,%eax
    je _L_811
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_811:
# emit-tail-expr
# si=-12
# env=((f99 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f99 f99)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f99) "length must be a fixnum >= 0"))
# emit-tail-let
#  si   = -12
#  env  = ((f99 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f99 f99))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f99) "length must be a fixnum >= 0")
# emit-expr f99
# emit-variable-ref
# env=((f99 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f99
    movl -8(%esp), %eax  # stack load f99
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f99 . -12) (f99 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f99) "length must be a fixnum >= 0")
# emit-tail-funcall
#    si   =-16
#    env  = ((f99 . -12) (f99 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f99) "length must be a fixnum >= 0")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f99)
# funcall
#    si   =-20
#    env  = ((f99 . -12) (f99 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f99)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_812"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_812":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f99 . -12) (f99 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_813"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_813":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f99
# emit-variable-ref
# env=((f99 . -12) (f99 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f99
    movl -12(%esp), %eax  # stack load f99
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f99
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f99)
# emit-expr "length must be a fixnum >= 0"
# string literal
    jmp _L_815
    .align 8,0x90
_L_814 :
    .int 112
    .ascii "length must be a fixnum >= 0"
_L_815:
    movl $_L_814, %eax
    orl $6, %eax
    mov %eax, -24(%esp)    # arg length must be a fixnum >= 0
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
    .align 4,0x90
_L_810:
     movl %eax, eh$ulength
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == uniquify-variables  ==>
# (lambda (f100) (error (list-ref (primitives) f100) "index out of bounds"))
# == vectorize-letrec  ==>
# (lambda (f100) (error (list-ref (primitives) f100) "index out of bounds"))
# == eliminate-set!  ==>
# (lambda (f100) (let ((f100 f100)) (error (list-ref (primitives) f100) "index out of bounds")))
# == close-free-variables  ==>
# (closure (f100) (error list-ref primitives) (let ((f100 f100)) (error (list-ref (primitives) f100) "index out of bounds")))
# == eliminate-quote  ==>
# (closure (f100) (error list-ref primitives) (let ((f100 f100)) (error (list-ref (primitives) f100) "index out of bounds")))
# == eliminate-when/unless  ==>
# (closure (f100) (error list-ref primitives) (let ((f100 f100)) (error (list-ref (primitives) f100) "index out of bounds")))
# == eliminate-cond  ==>
# (closure (f100) (error list-ref primitives) (let ((f100 f100)) (error (list-ref (primitives) f100) "index out of bounds")))
# == external-symbols  ==>
# (closure (f100) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f100 f100)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f100) "index out of bounds")))
# emit-expr (closure (f100) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f100 f100)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f100) "index out of bounds")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f100) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f100 f100)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f100) "index out of bounds")))
    movl $_L_816, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_817            # jump around closure body
_L_816:
# check argument count
    cmp $4,%eax
    je _L_818
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_818:
# emit-tail-expr
# si=-12
# env=((f100 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f100 f100)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f100) "index out of bounds"))
# emit-tail-let
#  si   = -12
#  env  = ((f100 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f100 f100))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f100) "index out of bounds")
# emit-expr f100
# emit-variable-ref
# env=((f100 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f100
    movl -8(%esp), %eax  # stack load f100
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f100 . -12) (f100 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f100) "index out of bounds")
# emit-tail-funcall
#    si   =-16
#    env  = ((f100 . -12) (f100 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f100) "index out of bounds")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f100)
# funcall
#    si   =-20
#    env  = ((f100 . -12) (f100 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f100)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_819"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_819":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f100 . -12) (f100 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_820"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_820":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f100
# emit-variable-ref
# env=((f100 . -12) (f100 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f100
    movl -12(%esp), %eax  # stack load f100
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f100
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f100)
# emit-expr "index out of bounds"
# string literal
    jmp _L_822
    .align 8,0x90
_L_821 :
    .int 76
    .ascii "index out of bounds"
_L_822:
    movl $_L_821, %eax
    orl $6, %eax
    mov %eax, -24(%esp)    # arg index out of bounds
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
    .align 4,0x90
_L_817:
     movl %eax, eh$uvector$uindex
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == uniquify-variables  ==>
# (lambda (f101) (error (list-ref (primitives) f101) "index out of bounds"))
# == vectorize-letrec  ==>
# (lambda (f101) (error (list-ref (primitives) f101) "index out of bounds"))
# == eliminate-set!  ==>
# (lambda (f101) (let ((f101 f101)) (error (list-ref (primitives) f101) "index out of bounds")))
# == close-free-variables  ==>
# (closure (f101) (error list-ref primitives) (let ((f101 f101)) (error (list-ref (primitives) f101) "index out of bounds")))
# == eliminate-quote  ==>
# (closure (f101) (error list-ref primitives) (let ((f101 f101)) (error (list-ref (primitives) f101) "index out of bounds")))
# == eliminate-when/unless  ==>
# (closure (f101) (error list-ref primitives) (let ((f101 f101)) (error (list-ref (primitives) f101) "index out of bounds")))
# == eliminate-cond  ==>
# (closure (f101) (error list-ref primitives) (let ((f101 f101)) (error (list-ref (primitives) f101) "index out of bounds")))
# == external-symbols  ==>
# (closure (f101) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f101 f101)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f101) "index out of bounds")))
# emit-expr (closure (f101) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f101 f101)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f101) "index out of bounds")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f101) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f101 f101)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f101) "index out of bounds")))
    movl $_L_823, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_824            # jump around closure body
_L_823:
# check argument count
    cmp $4,%eax
    je _L_825
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_825:
# emit-tail-expr
# si=-12
# env=((f101 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f101 f101)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f101) "index out of bounds"))
# emit-tail-let
#  si   = -12
#  env  = ((f101 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f101 f101))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f101) "index out of bounds")
# emit-expr f101
# emit-variable-ref
# env=((f101 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f101
    movl -8(%esp), %eax  # stack load f101
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f101 . -12) (f101 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f101) "index out of bounds")
# emit-tail-funcall
#    si   =-16
#    env  = ((f101 . -12) (f101 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f101) "index out of bounds")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f101)
# funcall
#    si   =-20
#    env  = ((f101 . -12) (f101 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f101)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_826"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_826":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f101 . -12) (f101 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_827"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_827":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f101
# emit-variable-ref
# env=((f101 . -12) (f101 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f101
    movl -12(%esp), %eax  # stack load f101
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f101
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f101)
# emit-expr "index out of bounds"
# string literal
    jmp _L_829
    .align 8,0x90
_L_828 :
    .int 76
    .ascii "index out of bounds"
_L_829:
    movl $_L_828, %eax
    orl $6, %eax
    mov %eax, -24(%esp)    # arg index out of bounds
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
    .align 4,0x90
_L_824:
     movl %eax, eh$ustring$uindex
# emit-expr (begin #t)
# emit-begin
#   expr=(begin #t)
#   env=()
# emit-expr #t
    movl $111, %eax     # immed #t
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=()
    .extern base_init_callback
    jmp base_init_callback
