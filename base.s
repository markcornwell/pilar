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
# == eliminate-shadowing  ==>
# (let ((interned-symbols (cons (make-symbol "nil" ()) ()))) (lambda () interned-symbols))
# == vectorize-letrec  ==>
# (let ((interned-symbols (cons (make-symbol "nil" ()) ()))) (lambda () interned-symbols))
# == eliminate-set!  ==>
# (let ((interned-symbols (cons (make-symbol "nil" ()) ()))) (lambda () (let () interned-symbols)))
# == close-free-variables  ==>
# (let ((interned-symbols (cons (make-symbol "nil" ()) ()))) (closure () (interned-symbols) (let () interned-symbols)))
# == eliminate-quote  ==>
# (let ((interned-symbols (cons (make-symbol "nil" ()) ()))) (closure () (interned-symbols) (let () interned-symbols)))
# == eliminate-when/unless  ==>
# (let ((interned-symbols (cons (make-symbol "nil" ()) ()))) (closure () (interned-symbols) (let () interned-symbols)))
# == eliminate-cond  ==>
# (let ((interned-symbols (cons (make-symbol "nil" ()) ()))) (closure () (interned-symbols) (let () interned-symbols)))
# == external-symbols  ==>
# (let ((interned-symbols (cons (make-symbol "nil" ()) ()))) (closure () (interned-symbols) (let () interned-symbols)))
# emit-expr (let ((interned-symbols (cons (make-symbol "nil" ()) ()))) (closure () (interned-symbols) (let () interned-symbols)))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((interned-symbols (cons (make-symbol "nil" ()) ())))
#  body = (closure () (interned-symbols) (let () interned-symbols))
# emit-expr (cons (make-symbol "nil" ()) ())
# cons arg1=(make-symbol "nil" ()) arg2=()
# emit-expr (make-symbol "nil" ())
# make-symbol arg1="nil" arg2=()
# emit-expr "nil"
# string literal
    jmp _L_5398
    .align 8,0x90
_L_5397 :
    .int 12
    .ascii "nil"
_L_5398:
    movl $_L_5397, %eax
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
# emit-expr (closure () (interned-symbols) (let () interned-symbols))
# emit-closure
# si = -4
# env = ((interned-symbols . 0))
# expr = (closure () (interned-symbols) (let () interned-symbols))
    movl $_L_5399, 0(%ebp)  # closure label
# emit-variable-ref
# env=((interned-symbols . 0))
# var=interned-symbols
    movl 0(%esp), %eax  # stack load interned-symbols
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # interned-symbols
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_5400            # jump around closure body
_L_5399:
# check argument count
    cmp $0,%eax
    je _L_5401
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_5401:
# emit-tail-expr
# si=-8
# env=((interned-symbols . 4) (interned-symbols . 0))
# expr=(let () interned-symbols)
# emit-tail-let
#  si   = -8
#  env  = ((interned-symbols . 4) (interned-symbols . 0))
#  bindings = ()
#  body = interned-symbols
# emit-tail-expr
# si=-8
# env=((interned-symbols . 4) (interned-symbols . 0))
# expr=interned-symbols
# emit-tail-variable-ref
# emit-variable-ref
# env=((interned-symbols . 4) (interned-symbols . 0))
# var=interned-symbols
    movl 2(%edi), %eax  # frame load interned-symbols
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    .align 4,0x90
_L_5400:
     movl %eax, symbols
# == explicit-begins  ==>
# (letrec ((slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if (si= s1 s2 i) (si<n= s1 s2 (fx+ i 1) n) #f)))) (ss= (lambda (s1 s2) (if (slen= s1 s2) (si<n= s1 s2 0 (string-length s1)) #f)))) ss=)
# == eliminate-let*  ==>
# (letrec ((slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if (si= s1 s2 i) (si<n= s1 s2 (fx+ i 1) n) #f)))) (ss= (lambda (s1 s2) (if (slen= s1 s2) (si<n= s1 s2 0 (string-length s1)) #f)))) ss=)
# == eliminate-shadowing  ==>
# (letrec ((slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if (si= s1 s2 i) (si<n= s1 s2 (fx+ i 1) n) #f)))) (ss= (lambda (s1 s2) (if (slen= s1 s2) (si<n= s1 s2 0 (string-length s1)) #f)))) ss=)
# == vectorize-letrec  ==>
# (let ((slen= (make-vector 1)) (si= (make-vector 1)) (si<n= (make-vector 1)) (ss= (make-vector 1))) (begin (begin (vector-set! slen= 0 (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (vector-set! si= 0 (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (vector-set! si<n= 0 (lambda (s1 s2 i n) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f)))) (vector-set! ss= 0 (lambda (s1 s2) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)))) (vector-ref ss= 0)))
# == eliminate-set!  ==>
# (let ((slen= (make-vector 1)) (si= (make-vector 1)) (si<n= (make-vector 1)) (ss= (make-vector 1))) (begin (begin (vector-set! slen= 0 (lambda (s1 s2) (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! si= 0 (lambda (s1 s2 i) (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! si<n= 0 (lambda (s1 s2 i n) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (lambda (s1 s2) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f))))) (vector-ref ss= 0)))
# == close-free-variables  ==>
# (let ((slen= (make-vector 1)) (si= (make-vector 1)) (si<n= (make-vector 1)) (ss= (make-vector 1))) (begin (begin (vector-set! slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f))))) (vector-ref ss= 0)))
# == eliminate-quote  ==>
# (let ((slen= (make-vector 1)) (si= (make-vector 1)) (si<n= (make-vector 1)) (ss= (make-vector 1))) (begin (begin (vector-set! slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f))))) (vector-ref ss= 0)))
# == eliminate-when/unless  ==>
# (let ((slen= (make-vector 1)) (si= (make-vector 1)) (si<n= (make-vector 1)) (ss= (make-vector 1))) (begin (begin (vector-set! slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f))))) (vector-ref ss= 0)))
# == eliminate-cond  ==>
# (let ((slen= (make-vector 1)) (si= (make-vector 1)) (si<n= (make-vector 1)) (ss= (make-vector 1))) (begin (begin (vector-set! slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f))))) (vector-ref ss= 0)))
# == external-symbols  ==>
# (let ((slen= (make-vector 1)) (si= (make-vector 1)) (si<n= (make-vector 1)) (ss= (make-vector 1))) (begin (begin (vector-set! slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f))))) (vector-ref ss= 0)))
# emit-expr (let ((slen= (make-vector 1)) (si= (make-vector 1)) (si<n= (make-vector 1)) (ss= (make-vector 1))) (begin (begin (vector-set! slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f))))) (vector-ref ss= 0)))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((slen= (make-vector 1)) (si= (make-vector 1)) (si<n= (make-vector 1)) (ss= (make-vector 1)))
#  body = (begin (begin (vector-set! slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f))))) (vector-ref ss= 0))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5402"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5402:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_5403
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5403:
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
    je "_L_5404"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5404:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_5405
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5405:
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
    je "_L_5406"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5406:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_5407
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5407:
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
    je "_L_5408"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5408:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_5409
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5409:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, -12(%esp)  # stack save
# emit-expr (begin (begin (vector-set! slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f))))) (vector-ref ss= 0))
# emit-begin
#   expr=(begin (begin (vector-set! slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f))))) (vector-ref ss= 0))
#   env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# emit-expr (begin (vector-set! slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)))))
# emit-begin
#   expr=(begin (vector-set! slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)))))
#   env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# emit-expr (vector-set! slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2)))))
# emit-expr slen=
# emit-variable-ref
# env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=slen=
    movl 0(%esp), %eax  # stack load slen=
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5410
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5410:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5411"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5411:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5413
    cmp  $0,%eax
    jge _L_5412
_L_5413:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5412:
    movl %eax, -20(%esp)
# emit-expr (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))
# emit-closure
# si = -24
# env = ((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr = (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))
    movl $_L_5414, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_5415            # jump around closure body
_L_5414:
# check argument count
    cmp $8,%eax
    je _L_5416
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_5416:
# emit-tail-expr
# si=-16
# env=((s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=(let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2)))
# emit-tail-let
#  si   = -16
#  env  = ((s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
#  bindings = ((s1 s1) (s2 s2))
#  body = (fx= (string-length s1) (string-length s2))
# emit-expr s1
# emit-variable-ref
# env=((s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s1
    movl -8(%esp), %eax  # stack load s1
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr s2
# emit-variable-ref
# env=((s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s2
    movl -12(%esp), %eax  # stack load s2
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=(fx= (string-length s1) (string-length s2))
# tail primcall
# emit-expr (string-length s2)
# emit-expr s2
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s2
    movl -20(%esp), %eax  # stack load s2
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_5417
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5417:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5418"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5418:
    movl %eax, -24(%esp)
# emit-expr (string-length s1)
# emit-expr s1
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s1
    movl -16(%esp), %eax  # stack load s1
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_5419
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5419:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5420"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5420:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (fx= (string-length s1) (string-length s2))
    ret
    .align 4,0x90
_L_5415:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)))))
# emit-begin
#   expr=(begin (vector-set! si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)))))
#   env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# emit-expr (vector-set! si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i)))))
# emit-expr si=
# emit-variable-ref
# env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=si=
    movl -4(%esp), %eax  # stack load si=
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5421
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5421:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5422"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5422:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5424
    cmp  $0,%eax
    jge _L_5423
_L_5424:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5423:
    movl %eax, -20(%esp)
# emit-expr (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))
# emit-closure
# si = -24
# env = ((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr = (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))
    movl $_L_5425, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_5426            # jump around closure body
_L_5425:
# check argument count
    cmp $12,%eax
    je _L_5427
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_5427:
# emit-tail-expr
# si=-20
# env=((i . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=(let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i)))
# emit-tail-let
#  si   = -20
#  env  = ((i . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
#  bindings = ((s1 s1) (s2 s2) (i i))
#  body = (char=? (string-ref s1 i) (string-ref s2 i))
# emit-expr s1
# emit-variable-ref
# env=((i . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s1
    movl -8(%esp), %eax  # stack load s1
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr s2
# emit-variable-ref
# env=((i . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s2
    movl -12(%esp), %eax  # stack load s2
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr i
# emit-variable-ref
# env=((i . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=i
    movl -16(%esp), %eax  # stack load i
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=(char=? (string-ref s1 i) (string-ref s2 i))
# tail primcall
# char= c1=(string-ref s1 i) c2=(string-ref s2 i)
# emit-expr (string-ref s1 i)
# emit-expr s1
# emit-variable-ref
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s1
    movl -20(%esp), %eax  # stack load s1
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_5428
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5428:
    movl %eax, -32(%esp)
# emit-expr i
# emit-variable-ref
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=i
    movl -28(%esp), %eax  # stack load i
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5429"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5429:
# check bounds on string index
    movl -32(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_5431
    cmp  $0,%eax
    jge _L_5430
_L_5431:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5430:
    sar $2, %eax
    movl -32(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_5432"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5432:
    movb %ah, -32(%esp)
# emit-expr (string-ref s2 i)
# emit-expr s2
# emit-variable-ref
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s2
    movl -24(%esp), %eax  # stack load s2
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_5433
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5433:
    movl %eax, -36(%esp)
# emit-expr i
# emit-variable-ref
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=i
    movl -28(%esp), %eax  # stack load i
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5434"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5434:
# check bounds on string index
    movl -36(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_5436
    cmp  $0,%eax
    jge _L_5435
_L_5436:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5435:
    sar $2, %eax
    movl -36(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_5437"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5437:
    cmp %ah, -32(%esp)
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (char=? (string-ref s1 i) (string-ref s2 i))
    ret
    .align 4,0x90
_L_5426:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)))))
# emit-begin
#   expr=(begin (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)))))
#   env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# emit-expr (vector-set! si<n= 0 (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f)))))
# emit-expr si<n=
# emit-variable-ref
# env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=si<n=
    movl -8(%esp), %eax  # stack load si<n=
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5438
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5438:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5439"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5439:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5441
    cmp  $0,%eax
    jge _L_5440
_L_5441:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5440:
    movl %eax, -20(%esp)
# emit-expr (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))
# emit-closure
# si = -24
# env = ((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr = (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))
    movl $_L_5442, 0(%ebp)  # closure label
# emit-variable-ref
# env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=si=
    movl -4(%esp), %eax  # stack load si=
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # si=
# emit-variable-ref
# env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=si<n=
    movl -8(%esp), %eax  # stack load si<n=
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # si<n=
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_5443            # jump around closure body
_L_5442:
# check argument count
    cmp $16,%eax
    je _L_5444
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_5444:
# emit-tail-expr
# si=-24
# env=((n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=(let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f)))
# emit-tail-let
#  si   = -24
#  env  = ((n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
#  bindings = ((s1 s1) (s2 s2) (i i) (n n))
#  body = (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))
# emit-expr s1
# emit-variable-ref
# env=((n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s1
    movl -8(%esp), %eax  # stack load s1
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr s2
# emit-variable-ref
# env=((n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s2
    movl -12(%esp), %eax  # stack load s2
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-expr i
# emit-variable-ref
# env=((n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=i
    movl -16(%esp), %eax  # stack load i
# end emit-variable-ref
    movl %eax, -32(%esp)  # stack save
# emit-expr n
# emit-variable-ref
# env=((n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=n
    movl -20(%esp), %eax  # stack load n
# end emit-variable-ref
    movl %eax, -36(%esp)  # stack save
# emit-tail-expr
# si=-40
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=(if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))
# emit-expr (fx= i n)
# emit-expr n
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=n
    movl -36(%esp), %eax  # stack load n
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5447"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5447:
    movl %eax, -40(%esp)
# emit-expr i
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=i
    movl -32(%esp), %eax  # stack load i
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5448"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5448:
    cmp -40(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_5445
# emit-tail-expr
# si=-40
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=#t
    movl $111, %eax     # immed #t
    ret                  # immediate tail return
    jmp _L_5446
_L_5445:
# emit-tail-expr
# si=-40
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=(if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f)
# emit-expr ((vector-ref si= 0) s1 s2 i)
# funcall
#    si   =-40
#    env  = ((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
#    expr = (funcall (vector-ref si= 0) s1 s2 i)
# emit-expr (vector-ref si= 0)
# emit-expr si=
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=si=
    movl 2(%edi), %eax  # frame load si=
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5451
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5451:
    movl %eax, -48(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5452"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5452:
# check bounds on vector index
    movl -48(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5454
    cmp  $0,%eax
    jge _L_5453
_L_5454:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5453:
    movl -48(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5455"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5455":
   movl %eax,  -48(%esp)  # stash funcall-oper in closure slot
# emit-expr s1
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s1
    movl -24(%esp), %eax  # stack load s1
# end emit-variable-ref
    mov %eax, -52(%esp)  # arg s1
# emit-expr s2
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s2
    movl -28(%esp), %eax  # stack load s2
# end emit-variable-ref
    mov %eax, -56(%esp)  # arg s2
# emit-expr i
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=i
    movl -32(%esp), %eax  # stack load i
# end emit-variable-ref
    mov %eax, -60(%esp)  # arg i
    movl -48(%esp), %edi   # load new closure to %edi
    add $-40, %esp   # adjust base
    movl $12,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $40, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_5449
# emit-tail-expr
# si=-40
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=((vector-ref si<n= 0) s1 s2 (fx+ i 1) n)
# emit-tail-funcall
#    si   =-40
#    env  = ((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
#    expr = (funcall (vector-ref si<n= 0) s1 s2 (fx+ i 1) n)
# emit-expr (vector-ref si<n= 0)
# emit-expr si<n=
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=si<n=
    movl 6(%edi), %eax  # frame load si<n=
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5456
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5456:
    movl %eax, -40(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5457"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5457:
# check bounds on vector index
    movl -40(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5459
    cmp  $0,%eax
    jge _L_5458
_L_5459:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5458:
    movl -40(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -40(%esp)  # stash funcall-oper in next closure slot
# emit-expr s1
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s1
    movl -24(%esp), %eax  # stack load s1
# end emit-variable-ref
    mov %eax, -44(%esp)    # arg s1
# emit-expr s2
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s2
    movl -28(%esp), %eax  # stack load s2
# end emit-variable-ref
    mov %eax, -48(%esp)    # arg s2
# emit-expr (fx+ i 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5460"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5460:
    movl %eax, -52(%esp)  # fx+ push arg1
# emit-expr i
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=i
    movl -32(%esp), %eax  # stack load i
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5461"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5461:
    addl -52(%esp), %eax  # fx+ arg1 arg2
    mov %eax, -52(%esp)    # arg (fx+ i 1)
# emit-expr n
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=n
    movl -36(%esp), %eax  # stack load n
# end emit-variable-ref
    mov %eax, -56(%esp)    # arg n
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
    jmp _L_5450
_L_5449:
# emit-tail-expr
# si=-40
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_5450:
_L_5446:
    .align 4,0x90
_L_5443:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)))))
# emit-begin
#   expr=(begin (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)))))
#   env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# emit-expr (vector-set! ss= 0 (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f))))
# emit-expr ss=
# emit-variable-ref
# env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=ss=
    movl -12(%esp), %eax  # stack load ss=
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5462
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5462:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5463"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5463:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5465
    cmp  $0,%eax
    jge _L_5464
_L_5465:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5464:
    movl %eax, -20(%esp)
# emit-expr (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)))
# emit-closure
# si = -24
# env = ((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr = (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)))
    movl $_L_5466, 0(%ebp)  # closure label
# emit-variable-ref
# env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=slen=
    movl 0(%esp), %eax  # stack load slen=
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # slen=
# emit-variable-ref
# env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=si<n=
    movl -8(%esp), %eax  # stack load si<n=
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # si<n=
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_5467            # jump around closure body
_L_5466:
# check argument count
    cmp $8,%eax
    je _L_5468
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_5468:
# emit-tail-expr
# si=-16
# env=((s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=(let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f))
# emit-tail-let
#  si   = -16
#  env  = ((s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
#  bindings = ((s1 s1) (s2 s2))
#  body = (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)
# emit-expr s1
# emit-variable-ref
# env=((s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s1
    movl -8(%esp), %eax  # stack load s1
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr s2
# emit-variable-ref
# env=((s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s2
    movl -12(%esp), %eax  # stack load s2
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=(if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)
# emit-expr ((vector-ref slen= 0) s1 s2)
# funcall
#    si   =-24
#    env  = ((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
#    expr = (funcall (vector-ref slen= 0) s1 s2)
# emit-expr (vector-ref slen= 0)
# emit-expr slen=
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=slen=
    movl 2(%edi), %eax  # frame load slen=
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5471
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5471:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5472"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5472:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5474
    cmp  $0,%eax
    jge _L_5473
_L_5474:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5473:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5475"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5475":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr s1
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s1
    movl -16(%esp), %eax  # stack load s1
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg s1
# emit-expr s2
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s2
    movl -20(%esp), %eax  # stack load s2
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg s2
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_5469
# emit-tail-expr
# si=-24
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=((vector-ref si<n= 0) s1 s2 0 (string-length s1))
# emit-tail-funcall
#    si   =-24
#    env  = ((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
#    expr = (funcall (vector-ref si<n= 0) s1 s2 0 (string-length s1))
# emit-expr (vector-ref si<n= 0)
# emit-expr si<n=
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=si<n=
    movl 6(%edi), %eax  # frame load si<n=
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5476
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5476:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5477"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5477:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5479
    cmp  $0,%eax
    jge _L_5478
_L_5479:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5478:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr s1
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s1
    movl -16(%esp), %eax  # stack load s1
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg s1
# emit-expr s2
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s2
    movl -20(%esp), %eax  # stack load s2
# end emit-variable-ref
    mov %eax, -32(%esp)    # arg s2
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -36(%esp)    # arg 0
# emit-expr (string-length s1)
# emit-expr s1
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s1
    movl -16(%esp), %eax  # stack load s1
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_5480
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5480:
    movl -6(%eax), %eax
    mov %eax, -40(%esp)    # arg (string-length s1)
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
    jmp _L_5470
_L_5469:
# emit-tail-expr
# si=-24
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_5470:
    .align 4,0x90
_L_5467:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# emit-expr (begin (vector-ref ss= 0))
# emit-begin
#   expr=(begin (vector-ref ss= 0))
#   env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# emit-expr (vector-ref ss= 0)
# emit-expr ss=
# emit-variable-ref
# env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=ss=
    movl -12(%esp), %eax  # stack load ss=
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5481
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5481:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5482"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5482:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5484
    cmp  $0,%eax
    jge _L_5483
_L_5484:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5483:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
     movl %eax, string$e$q
# == explicit-begins  ==>
# (letrec ((str->sym (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let* ((new-sym (make-symbol str #f)) (new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym)) (str->sym str (cdr symlist))))))) (lambda (str) (str->sym str (symbols))))
# == eliminate-let*  ==>
# (letrec ((str->sym (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) (str->sym str (cdr symlist))))))) (lambda (str) (str->sym str (symbols))))
# == eliminate-shadowing  ==>
# (letrec ((str->sym (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) (str->sym str (cdr symlist))))))) (lambda (str) (str->sym str (symbols))))
# == vectorize-letrec  ==>
# (let ((str->sym (make-vector 1))) (begin (begin (vector-set! str->sym 0 (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist))))))) (lambda (str) ((vector-ref str->sym 0) str (symbols)))))
# == eliminate-set!  ==>
# (let ((str->sym (make-vector 1))) (begin (begin (vector-set! str->sym 0 (lambda (str symlist) (let ((str str) (symlist symlist)) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist)))))))) (lambda (str) (let ((str str)) ((vector-ref str->sym 0) str (symbols))))))
# == close-free-variables  ==>
# (let ((str->sym (make-vector 1))) (begin (begin (vector-set! str->sym 0 (closure (str symlist) (string=? str->sym) (let ((str str) (symlist symlist)) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist)))))))) (closure (str) (str->sym symbols) (let ((str str)) ((vector-ref str->sym 0) str (symbols))))))
# == eliminate-quote  ==>
# (let ((str->sym (make-vector 1))) (begin (begin (vector-set! str->sym 0 (closure (str symlist) (string=? str->sym) (let ((str str) (symlist symlist)) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist)))))))) (closure (str) (str->sym symbols) (let ((str str)) ((vector-ref str->sym 0) str (symbols))))))
# == eliminate-when/unless  ==>
# (let ((str->sym (make-vector 1))) (begin (begin (vector-set! str->sym 0 (closure (str symlist) (string=? str->sym) (let ((str str) (symlist symlist)) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist)))))))) (closure (str) (str->sym symbols) (let ((str str)) ((vector-ref str->sym 0) str (symbols))))))
# == eliminate-cond  ==>
# (let ((str->sym (make-vector 1))) (begin (begin (vector-set! str->sym 0 (closure (str symlist) (string=? str->sym) (let ((str str) (symlist symlist)) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist)))))))) (closure (str) (str->sym symbols) (let ((str str)) ((vector-ref str->sym 0) str (symbols))))))
# == external-symbols  ==>
# (let ((str->sym (make-vector 1))) (begin (begin (vector-set! str->sym 0 (closure (str symlist) ((primitive-ref string=?) str->sym) (let ((str str) (symlist symlist)) (if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist)))))))) (closure (str) (str->sym (primitive-ref symbols)) (let ((str str)) ((vector-ref str->sym 0) str ((primitive-ref symbols)))))))
# emit-expr (let ((str->sym (make-vector 1))) (begin (begin (vector-set! str->sym 0 (closure (str symlist) ((primitive-ref string=?) str->sym) (let ((str str) (symlist symlist)) (if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist)))))))) (closure (str) (str->sym (primitive-ref symbols)) (let ((str str)) ((vector-ref str->sym 0) str ((primitive-ref symbols)))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((str->sym (make-vector 1)))
#  body = (begin (begin (vector-set! str->sym 0 (closure (str symlist) ((primitive-ref string=?) str->sym) (let ((str str) (symlist symlist)) (if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist)))))))) (closure (str) (str->sym (primitive-ref symbols)) (let ((str str)) ((vector-ref str->sym 0) str ((primitive-ref symbols))))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5485"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5485:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_5486
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5486:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! str->sym 0 (closure (str symlist) ((primitive-ref string=?) str->sym) (let ((str str) (symlist symlist)) (if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist)))))))) (closure (str) (str->sym (primitive-ref symbols)) (let ((str str)) ((vector-ref str->sym 0) str ((primitive-ref symbols))))))
# emit-begin
#   expr=(begin (begin (vector-set! str->sym 0 (closure (str symlist) ((primitive-ref string=?) str->sym) (let ((str str) (symlist symlist)) (if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist)))))))) (closure (str) (str->sym (primitive-ref symbols)) (let ((str str)) ((vector-ref str->sym 0) str ((primitive-ref symbols))))))
#   env=((str->sym . 0))
# emit-expr (begin (vector-set! str->sym 0 (closure (str symlist) ((primitive-ref string=?) str->sym) (let ((str str) (symlist symlist)) (if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist))))))))
# emit-begin
#   expr=(begin (vector-set! str->sym 0 (closure (str symlist) ((primitive-ref string=?) str->sym) (let ((str str) (symlist symlist)) (if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist))))))))
#   env=((str->sym . 0))
# emit-expr (vector-set! str->sym 0 (closure (str symlist) ((primitive-ref string=?) str->sym) (let ((str str) (symlist symlist)) (if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist)))))))
# emit-expr str->sym
# emit-variable-ref
# env=((str->sym . 0))
# var=str->sym
    movl 0(%esp), %eax  # stack load str->sym
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5487
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5487:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5488"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5488:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5490
    cmp  $0,%eax
    jge _L_5489
_L_5490:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5489:
    movl %eax, -8(%esp)
# emit-expr (closure (str symlist) ((primitive-ref string=?) str->sym) (let ((str str) (symlist symlist)) (if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist))))))
# emit-closure
# si = -12
# env = ((str->sym . 0))
# expr = (closure (str symlist) ((primitive-ref string=?) str->sym) (let ((str str) (symlist symlist)) (if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist))))))
    movl $_L_5491, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref string=?) not defined in the environmnet
# emit-variable-ref
# env=((str->sym . 0))
# var=str->sym
    movl 0(%esp), %eax  # stack load str->sym
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # str->sym
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_5492            # jump around closure body
_L_5491:
# check argument count
    cmp $8,%eax
    je _L_5493
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_5493:
# emit-tail-expr
# si=-16
# env=((symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# expr=(let ((str str) (symlist symlist)) (if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist)))))
# emit-tail-let
#  si   = -16
#  env  = ((symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
#  bindings = ((str str) (symlist symlist))
#  body = (if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist))))
# emit-expr str
# emit-variable-ref
# env=((symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# var=str
    movl -8(%esp), %eax  # stack load str
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr symlist
# emit-variable-ref
# env=((symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# var=symlist
    movl -12(%esp), %eax  # stack load symlist
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# expr=(if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist))))
# emit-expr ((primitive-ref string=?) str (symbol->string (car symlist)))
# funcall
#    si   =-24
#    env  = ((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
#    expr = (funcall (primitive-ref string=?) str (symbol->string (car symlist)))
# emit-expr (primitive-ref string=?)
    .extern string$e$q
    movl string$e$q,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5496"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5496":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr str
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# var=str
    movl -16(%esp), %eax  # stack load str
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg str
# emit-expr (symbol->string (car symlist))
# symbol->string (car symlist)
# emit-expr (car symlist)
# emit-expr symlist
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# var=symlist
    movl -20(%esp), %eax  # stack load symlist
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_5497
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5497:
    movl -1(%eax), %eax
    movl -3(%eax), %eax
    mov %eax, -40(%esp)  # arg (symbol->string (car symlist))
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_5494
# emit-tail-expr
# si=-24
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# expr=(car symlist)
# tail primcall
# emit-expr symlist
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# var=symlist
    movl -20(%esp), %eax  # stack load symlist
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_5498
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5498:
    movl -1(%eax), %eax
#return from tail (car symlist)
    ret
    jmp _L_5495
_L_5494:
# emit-tail-expr
# si=-24
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# expr=(if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist)))
# emit-expr (null? (cdr symlist))
# emit-expr (cdr symlist)
# emit-expr symlist
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# var=symlist
    movl -20(%esp), %eax  # stack load symlist
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_5501
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5501:
    movl 3(%eax), %eax
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_5499
# emit-tail-expr
# si=-24
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# expr=(let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym)))
# emit-tail-let
#  si   = -24
#  env  = ((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
#  bindings = ((new-sym (make-symbol str #f)))
#  body = (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))
# emit-expr (make-symbol str #f)
# make-symbol arg1=str arg2=#f
# emit-expr str
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# var=str
    movl -16(%esp), %eax  # stack load str
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
# env=((new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# expr=(let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))
# emit-tail-let
#  si   = -28
#  env  = ((new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
#  bindings = ((new-cdr (cons new-sym ())))
#  body = (begin (set-cdr! symlist new-cdr) new-sym)
# emit-expr (cons new-sym ())
# cons arg1=new-sym arg2=()
# emit-expr new-sym
# emit-variable-ref
# env=((new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# var=new-sym
    movl -24(%esp), %eax  # stack load new-sym
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
# env=((new-cdr . -28) (new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# expr=(begin (set-cdr! symlist new-cdr) new-sym)
# tail-begin (begin (set-cdr! symlist new-cdr) new-sym)
#   env=((new-cdr . -28) (new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# emit-expr (set-cdr! symlist new-cdr)
# emit-expr symlist
# emit-variable-ref
# env=((new-cdr . -28) (new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# var=symlist
    movl -20(%esp), %eax  # stack load symlist
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_5502
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5502:
    movl %eax, -32(%esp)
# emit-expr new-cdr
# emit-variable-ref
# env=((new-cdr . -28) (new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# var=new-cdr
    movl -28(%esp), %eax  # stack load new-cdr
# end emit-variable-ref
    movl -32(%esp), %ebx
    movl %eax, 3(%ebx)
# emit-tail-expr
# si=-32
# env=((new-cdr . -28) (new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# expr=(begin new-sym)
# tail-begin (begin new-sym)
#   env=((new-cdr . -28) (new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# emit-tail-expr
# si=-32
# env=((new-cdr . -28) (new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# expr=new-sym
# emit-tail-variable-ref
# emit-variable-ref
# env=((new-cdr . -28) (new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# var=new-sym
    movl -24(%esp), %eax  # stack load new-sym
# end emit-variable-ref
    ret
# end emit-tail-variable ref
     ret   # return thru stack
    jmp _L_5500
_L_5499:
# emit-tail-expr
# si=-24
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# expr=((vector-ref str->sym 0) str (cdr symlist))
# emit-tail-funcall
#    si   =-24
#    env  = ((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
#    expr = (funcall (vector-ref str->sym 0) str (cdr symlist))
# emit-expr (vector-ref str->sym 0)
# emit-expr str->sym
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# var=str->sym
    movl 6(%edi), %eax  # frame load str->sym
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5503
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5503:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5504"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5504:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5506
    cmp  $0,%eax
    jge _L_5505
_L_5506:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5505:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr str
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# var=str
    movl -16(%esp), %eax  # stack load str
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg str
# emit-expr (cdr symlist)
# emit-expr symlist
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym . 8) ((primitive-ref string=?) . 4) (str->sym . 0))
# var=symlist
    movl -20(%esp), %eax  # stack load symlist
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_5507
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5507:
    movl 3(%eax), %eax
    mov %eax, -32(%esp)    # arg (cdr symlist)
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
_L_5500:
_L_5495:
    .align 4,0x90
_L_5492:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((str->sym . 0))
# emit-expr (begin (closure (str) (str->sym (primitive-ref symbols)) (let ((str str)) ((vector-ref str->sym 0) str ((primitive-ref symbols))))))
# emit-begin
#   expr=(begin (closure (str) (str->sym (primitive-ref symbols)) (let ((str str)) ((vector-ref str->sym 0) str ((primitive-ref symbols))))))
#   env=((str->sym . 0))
# emit-expr (closure (str) (str->sym (primitive-ref symbols)) (let ((str str)) ((vector-ref str->sym 0) str ((primitive-ref symbols)))))
# emit-closure
# si = -4
# env = ((str->sym . 0))
# expr = (closure (str) (str->sym (primitive-ref symbols)) (let ((str str)) ((vector-ref str->sym 0) str ((primitive-ref symbols)))))
    movl $_L_5508, 0(%ebp)  # closure label
# emit-variable-ref
# env=((str->sym . 0))
# var=str->sym
    movl 0(%esp), %eax  # stack load str->sym
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # str->sym
# WARNING: free var (primitive-ref symbols) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_5509            # jump around closure body
_L_5508:
# check argument count
    cmp $4,%eax
    je _L_5510
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_5510:
# emit-tail-expr
# si=-12
# env=((str . -8) ((primitive-ref symbols) . 8) (str->sym . 4) (str->sym . 0))
# expr=(let ((str str)) ((vector-ref str->sym 0) str ((primitive-ref symbols))))
# emit-tail-let
#  si   = -12
#  env  = ((str . -8) ((primitive-ref symbols) . 8) (str->sym . 4) (str->sym . 0))
#  bindings = ((str str))
#  body = ((vector-ref str->sym 0) str ((primitive-ref symbols)))
# emit-expr str
# emit-variable-ref
# env=((str . -8) ((primitive-ref symbols) . 8) (str->sym . 4) (str->sym . 0))
# var=str
    movl -8(%esp), %eax  # stack load str
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((str . -12) (str . -8) ((primitive-ref symbols) . 8) (str->sym . 4) (str->sym . 0))
# expr=((vector-ref str->sym 0) str ((primitive-ref symbols)))
# emit-tail-funcall
#    si   =-16
#    env  = ((str . -12) (str . -8) ((primitive-ref symbols) . 8) (str->sym . 4) (str->sym . 0))
#    expr = (funcall (vector-ref str->sym 0) str ((primitive-ref symbols)))
# emit-expr (vector-ref str->sym 0)
# emit-expr str->sym
# emit-variable-ref
# env=((str . -12) (str . -8) ((primitive-ref symbols) . 8) (str->sym . 4) (str->sym . 0))
# var=str->sym
    movl 2(%edi), %eax  # frame load str->sym
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5511
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5511:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5512"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5512:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5514
    cmp  $0,%eax
    jge _L_5513
_L_5514:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5513:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr str
# emit-variable-ref
# env=((str . -12) (str . -8) ((primitive-ref symbols) . 8) (str->sym . 4) (str->sym . 0))
# var=str
    movl -12(%esp), %eax  # stack load str
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg str
# emit-expr ((primitive-ref symbols))
# funcall
#    si   =-24
#    env  = ((str . -12) (str . -8) ((primitive-ref symbols) . 8) (str->sym . 4) (str->sym . 0))
#    expr = (funcall (primitive-ref symbols))
# emit-expr (primitive-ref symbols)
    .extern symbols
    movl symbols,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5515"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5515":
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
_L_5509:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((str->sym . 0))
     movl %eax, string$m$gsymbol
# == explicit-begins  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == eliminate-let*  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == eliminate-shadowing  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == vectorize-letrec  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == eliminate-set!  ==>
# (lambda (lst elt) (let ((lst lst) (elt elt)) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt)))))
# == close-free-variables  ==>
# (closure (lst elt) (e nil append1) (let ((lst lst) (elt elt)) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt)))))
# == eliminate-quote  ==>
# (closure (lst elt) (e nil append1) (let ((lst lst) (elt elt)) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt)))))
# == eliminate-when/unless  ==>
# (closure (lst elt) (e nil append1) (let ((lst lst) (elt elt)) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt)))))
# == eliminate-cond  ==>
# (closure (lst elt) (e nil append1) (let ((lst lst) (elt elt)) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt)))))
# == external-symbols  ==>
# (closure (lst elt) (e nil (primitive-ref append1)) (let ((lst lst) (elt elt)) (if (null? lst) (cons e nil) (cons (car lst) ((primitive-ref append1) (cdr lst) elt)))))
# emit-expr (closure (lst elt) (e nil (primitive-ref append1)) (let ((lst lst) (elt elt)) (if (null? lst) (cons e nil) (cons (car lst) ((primitive-ref append1) (cdr lst) elt)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (lst elt) (e nil (primitive-ref append1)) (let ((lst lst) (elt elt)) (if (null? lst) (cons e nil) (cons (car lst) ((primitive-ref append1) (cdr lst) elt)))))
    movl $_L_5516, 0(%ebp)  # closure label
# WARNING: free var e not defined in the environmnet
# WARNING: free var nil not defined in the environmnet
# WARNING: free var (primitive-ref append1) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_5517            # jump around closure body
_L_5516:
# check argument count
    cmp $8,%eax
    je _L_5518
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_5518:
# emit-tail-expr
# si=-16
# env=((elt . -12) (lst . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(let ((lst lst) (elt elt)) (if (null? lst) (cons e nil) (cons (car lst) ((primitive-ref append1) (cdr lst) elt))))
# emit-tail-let
#  si   = -16
#  env  = ((elt . -12) (lst . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
#  bindings = ((lst lst) (elt elt))
#  body = (if (null? lst) (cons e nil) (cons (car lst) ((primitive-ref append1) (cdr lst) elt)))
# emit-expr lst
# emit-variable-ref
# env=((elt . -12) (lst . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=lst
    movl -8(%esp), %eax  # stack load lst
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr elt
# emit-variable-ref
# env=((elt . -12) (lst . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=elt
    movl -12(%esp), %eax  # stack load elt
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((elt . -20) (lst . -16) (elt . -12) (lst . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(if (null? lst) (cons e nil) (cons (car lst) ((primitive-ref append1) (cdr lst) elt)))
# emit-expr (null? lst)
# emit-expr lst
# emit-variable-ref
# env=((elt . -20) (lst . -16) (elt . -12) (lst . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=lst
    movl -16(%esp), %eax  # stack load lst
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_5519
# emit-tail-expr
# si=-24
# env=((elt . -20) (lst . -16) (elt . -12) (lst . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(cons e nil)
# tail primcall
# cons arg1=e arg2=nil
# emit-expr e
# emit-variable-ref
# env=((elt . -20) (lst . -16) (elt . -12) (lst . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=e
    movl 2(%edi), %eax  # frame load e
# end emit-variable-ref
    movl %eax, -24(%esp)
# emit-expr nil
# emit-variable-ref
# env=((elt . -20) (lst . -16) (elt . -12) (lst . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
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
    jmp _L_5520
_L_5519:
# emit-tail-expr
# si=-24
# env=((elt . -20) (lst . -16) (elt . -12) (lst . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(cons (car lst) ((primitive-ref append1) (cdr lst) elt))
# tail primcall
# cons arg1=(car lst) arg2=((primitive-ref append1) (cdr lst) elt)
# emit-expr (car lst)
# emit-expr lst
# emit-variable-ref
# env=((elt . -20) (lst . -16) (elt . -12) (lst . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=lst
    movl -16(%esp), %eax  # stack load lst
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_5521
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5521:
    movl -1(%eax), %eax
    movl %eax, -24(%esp)
# emit-expr ((primitive-ref append1) (cdr lst) elt)
# funcall
#    si   =-28
#    env  = ((elt . -20) (lst . -16) (elt . -12) (lst . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
#    expr = (funcall (primitive-ref append1) (cdr lst) elt)
# emit-expr (primitive-ref append1)
    .extern append1
    movl append1,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5522"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5522":
   movl %eax,  -36(%esp)  # stash funcall-oper in closure slot
# emit-expr (cdr lst)
# emit-expr lst
# emit-variable-ref
# env=((elt . -20) (lst . -16) (elt . -12) (lst . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=lst
    movl -16(%esp), %eax  # stack load lst
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_5523
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5523:
    movl 3(%eax), %eax
    mov %eax, -40(%esp)  # arg (cdr lst)
# emit-expr elt
# emit-variable-ref
# env=((elt . -20) (lst . -16) (elt . -12) (lst . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=elt
    movl -20(%esp), %eax  # stack load elt
# end emit-variable-ref
    mov %eax, -44(%esp)  # arg elt
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
#return from tail (cons (car lst) ((primitive-ref append1) (cdr lst) elt))
    ret
_L_5520:
    .align 4,0x90
_L_5517:
     movl %eax, append1
# == explicit-begins  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == eliminate-let*  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == eliminate-shadowing  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == vectorize-letrec  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == eliminate-set!  ==>
# (lambda (l k) (let ((l l) (k k)) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1)))))
# == close-free-variables  ==>
# (closure (l k) (list-ref) (let ((l l) (k k)) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1)))))
# == eliminate-quote  ==>
# (closure (l k) (list-ref) (let ((l l) (k k)) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1)))))
# == eliminate-when/unless  ==>
# (closure (l k) (list-ref) (let ((l l) (k k)) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1)))))
# == eliminate-cond  ==>
# (closure (l k) (list-ref) (let ((l l) (k k)) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1)))))
# == external-symbols  ==>
# (closure (l k) ((primitive-ref list-ref)) (let ((l l) (k k)) (if (fx= k 0) (car l) ((primitive-ref list-ref) (cdr l) (fx- k 1)))))
# emit-expr (closure (l k) ((primitive-ref list-ref)) (let ((l l) (k k)) (if (fx= k 0) (car l) ((primitive-ref list-ref) (cdr l) (fx- k 1)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (l k) ((primitive-ref list-ref)) (let ((l l) (k k)) (if (fx= k 0) (car l) ((primitive-ref list-ref) (cdr l) (fx- k 1)))))
    movl $_L_5524, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_5525            # jump around closure body
_L_5524:
# check argument count
    cmp $8,%eax
    je _L_5526
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_5526:
# emit-tail-expr
# si=-16
# env=((k . -12) (l . -8) ((primitive-ref list-ref) . 4))
# expr=(let ((l l) (k k)) (if (fx= k 0) (car l) ((primitive-ref list-ref) (cdr l) (fx- k 1))))
# emit-tail-let
#  si   = -16
#  env  = ((k . -12) (l . -8) ((primitive-ref list-ref) . 4))
#  bindings = ((l l) (k k))
#  body = (if (fx= k 0) (car l) ((primitive-ref list-ref) (cdr l) (fx- k 1)))
# emit-expr l
# emit-variable-ref
# env=((k . -12) (l . -8) ((primitive-ref list-ref) . 4))
# var=l
    movl -8(%esp), %eax  # stack load l
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr k
# emit-variable-ref
# env=((k . -12) (l . -8) ((primitive-ref list-ref) . 4))
# var=k
    movl -12(%esp), %eax  # stack load k
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((k . -20) (l . -16) (k . -12) (l . -8) ((primitive-ref list-ref) . 4))
# expr=(if (fx= k 0) (car l) ((primitive-ref list-ref) (cdr l) (fx- k 1)))
# emit-expr (fx= k 0)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5529"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5529:
    movl %eax, -24(%esp)
# emit-expr k
# emit-variable-ref
# env=((k . -20) (l . -16) (k . -12) (l . -8) ((primitive-ref list-ref) . 4))
# var=k
    movl -20(%esp), %eax  # stack load k
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5530"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5530:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_5527
# emit-tail-expr
# si=-24
# env=((k . -20) (l . -16) (k . -12) (l . -8) ((primitive-ref list-ref) . 4))
# expr=(car l)
# tail primcall
# emit-expr l
# emit-variable-ref
# env=((k . -20) (l . -16) (k . -12) (l . -8) ((primitive-ref list-ref) . 4))
# var=l
    movl -16(%esp), %eax  # stack load l
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_5531
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5531:
    movl -1(%eax), %eax
#return from tail (car l)
    ret
    jmp _L_5528
_L_5527:
# emit-tail-expr
# si=-24
# env=((k . -20) (l . -16) (k . -12) (l . -8) ((primitive-ref list-ref) . 4))
# expr=((primitive-ref list-ref) (cdr l) (fx- k 1))
# emit-tail-funcall
#    si   =-24
#    env  = ((k . -20) (l . -16) (k . -12) (l . -8) ((primitive-ref list-ref) . 4))
#    expr = (funcall (primitive-ref list-ref) (cdr l) (fx- k 1))
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr (cdr l)
# emit-expr l
# emit-variable-ref
# env=((k . -20) (l . -16) (k . -12) (l . -8) ((primitive-ref list-ref) . 4))
# var=l
    movl -16(%esp), %eax  # stack load l
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_5532
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5532:
    movl 3(%eax), %eax
    mov %eax, -28(%esp)    # arg (cdr l)
# emit-expr (fx- k 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5533"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5533:
    movl %eax, -32(%esp)
# emit-expr k
# emit-variable-ref
# env=((k . -20) (l . -16) (k . -12) (l . -8) ((primitive-ref list-ref) . 4))
# var=k
    movl -20(%esp), %eax  # stack load k
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5534"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5534:
    subl -32(%esp), %eax
    mov %eax, -32(%esp)    # arg (fx- k 1)
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
_L_5528:
    .align 4,0x90
_L_5525:
     movl %eax, list$mref
# == explicit-begins  ==>
# (let* ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s)))) (write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))
# == eliminate-let*  ==>
# (let ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s))))) (let ((write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1)))))
# == eliminate-shadowing  ==>
# (let ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s))))) (let ((write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1)))))
# == vectorize-letrec  ==>
# (let ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s))))) (let ((write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1)))))
# == eliminate-set!  ==>
# (let ((write-stderr (lambda (s) (let ((s s)) (foreign-call "s_write" 2 s (string-length s)))))) (let ((write-errmsg (lambda (sym emsg) (let ((sym sym) (emsg emsg)) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n")))))) (lambda (sym emsg) (let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))))
# == close-free-variables  ==>
# (let ((write-stderr (closure (s) () (let ((s s)) (foreign-call "s_write" 2 s (string-length s)))))) (let ((write-errmsg (closure (sym emsg) (write-stderr write-stderr write-stderr write-stderr write-stderr) (let ((sym sym) (emsg emsg)) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n")))))) (closure (sym emsg) (write-errmsg) (let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))))
# == eliminate-quote  ==>
# (let ((write-stderr (closure (s) () (let ((s s)) (foreign-call "s_write" 2 s (string-length s)))))) (let ((write-errmsg (closure (sym emsg) (write-stderr write-stderr write-stderr write-stderr write-stderr) (let ((sym sym) (emsg emsg)) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n")))))) (closure (sym emsg) (write-errmsg) (let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))))
# == eliminate-when/unless  ==>
# (let ((write-stderr (closure (s) () (let ((s s)) (foreign-call "s_write" 2 s (string-length s)))))) (let ((write-errmsg (closure (sym emsg) (write-stderr write-stderr write-stderr write-stderr write-stderr) (let ((sym sym) (emsg emsg)) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n")))))) (closure (sym emsg) (write-errmsg) (let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))))
# == eliminate-cond  ==>
# (let ((write-stderr (closure (s) () (let ((s s)) (foreign-call "s_write" 2 s (string-length s)))))) (let ((write-errmsg (closure (sym emsg) (write-stderr write-stderr write-stderr write-stderr write-stderr) (let ((sym sym) (emsg emsg)) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n")))))) (closure (sym emsg) (write-errmsg) (let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))))
# == external-symbols  ==>
# (let ((write-stderr (closure (s) () (let ((s s)) (foreign-call "s_write" 2 s (string-length s)))))) (let ((write-errmsg (closure (sym emsg) (write-stderr write-stderr write-stderr write-stderr write-stderr) (let ((sym sym) (emsg emsg)) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n")))))) (closure (sym emsg) (write-errmsg) (let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))))
# emit-expr (let ((write-stderr (closure (s) () (let ((s s)) (foreign-call "s_write" 2 s (string-length s)))))) (let ((write-errmsg (closure (sym emsg) (write-stderr write-stderr write-stderr write-stderr write-stderr) (let ((sym sym) (emsg emsg)) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n")))))) (closure (sym emsg) (write-errmsg) (let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((write-stderr (closure (s) () (let ((s s)) (foreign-call "s_write" 2 s (string-length s))))))
#  body = (let ((write-errmsg (closure (sym emsg) (write-stderr write-stderr write-stderr write-stderr write-stderr) (let ((sym sym) (emsg emsg)) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n")))))) (closure (sym emsg) (write-errmsg) (let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1)))))
# emit-expr (closure (s) () (let ((s s)) (foreign-call "s_write" 2 s (string-length s))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (s) () (let ((s s)) (foreign-call "s_write" 2 s (string-length s))))
    movl $_L_5535, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_5536            # jump around closure body
_L_5535:
# check argument count
    cmp $4,%eax
    je _L_5537
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_5537:
# emit-tail-expr
# si=-12
# env=((s . -8))
# expr=(let ((s s)) (foreign-call "s_write" 2 s (string-length s)))
# emit-tail-let
#  si   = -12
#  env  = ((s . -8))
#  bindings = ((s s))
#  body = (foreign-call "s_write" 2 s (string-length s))
# emit-expr s
# emit-variable-ref
# env=((s . -8))
# var=s
    movl -8(%esp), %eax  # stack load s
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((s . -12) (s . -8))
# expr=(foreign-call "s_write" 2 s (string-length s))
    movl %ecx,-16(%esp)
    movl %esp,-20(%esp)
# emit-expr (string-length s)
# emit-expr s
# emit-variable-ref
# env=((s . -12) (s . -8))
# var=s
    movl -12(%esp), %eax  # stack load s
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_5538
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5538:
    movl -6(%eax), %eax
    movl %eax, -24(%esp)
# emit-expr s
# emit-variable-ref
# env=((s . -12) (s . -8))
# var=s
    movl -12(%esp), %eax  # stack load s
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
_L_5536:
    movl %eax, 0(%esp)  # stack save
# emit-expr (let ((write-errmsg (closure (sym emsg) (write-stderr write-stderr write-stderr write-stderr write-stderr) (let ((sym sym) (emsg emsg)) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n")))))) (closure (sym emsg) (write-errmsg) (let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1)))))
# emit-let
#  si   = -4
#  env  = ((write-stderr . 0))
#  bindings = ((write-errmsg (closure (sym emsg) (write-stderr write-stderr write-stderr write-stderr write-stderr) (let ((sym sym) (emsg emsg)) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))))
#  body = (closure (sym emsg) (write-errmsg) (let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))
# emit-expr (closure (sym emsg) (write-stderr write-stderr write-stderr write-stderr write-stderr) (let ((sym sym) (emsg emsg)) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))
# emit-closure
# si = -4
# env = ((write-stderr . 0))
# expr = (closure (sym emsg) (write-stderr write-stderr write-stderr write-stderr write-stderr) (let ((sym sym) (emsg emsg)) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))
    movl $_L_5539, 0(%ebp)  # closure label
# emit-variable-ref
# env=((write-stderr . 0))
# var=write-stderr
    movl 0(%esp), %eax  # stack load write-stderr
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # write-stderr
# emit-variable-ref
# env=((write-stderr . 0))
# var=write-stderr
    movl 0(%esp), %eax  # stack load write-stderr
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # write-stderr
# emit-variable-ref
# env=((write-stderr . 0))
# var=write-stderr
    movl 0(%esp), %eax  # stack load write-stderr
# end emit-variable-ref
   movl  %eax, 12(%ebp)  # write-stderr
# emit-variable-ref
# env=((write-stderr . 0))
# var=write-stderr
    movl 0(%esp), %eax  # stack load write-stderr
# end emit-variable-ref
   movl  %eax, 16(%ebp)  # write-stderr
# emit-variable-ref
# env=((write-stderr . 0))
# var=write-stderr
    movl 0(%esp), %eax  # stack load write-stderr
# end emit-variable-ref
   movl  %eax, 20(%ebp)  # write-stderr
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $24, %ebp     # bump ebp
    jmp _L_5540            # jump around closure body
_L_5539:
# check argument count
    cmp $8,%eax
    je _L_5541
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_5541:
# emit-tail-expr
# si=-16
# env=((emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# expr=(let ((sym sym) (emsg emsg)) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n")))
# emit-tail-let
#  si   = -16
#  env  = ((emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
#  bindings = ((sym sym) (emsg emsg))
#  body = (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))
# emit-expr sym
# emit-variable-ref
# env=((emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# var=sym
    movl -8(%esp), %eax  # stack load sym
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr emsg
# emit-variable-ref
# env=((emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# var=emsg
    movl -12(%esp), %eax  # stack load emsg
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# expr=(begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))
# tail-begin (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))
#   env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# emit-expr (write-stderr "error:")
# funcall
#    si   =-24
#    env  = ((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
#    expr = (funcall write-stderr "error:")
# emit-expr write-stderr
# emit-variable-ref
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# var=write-stderr
    movl 18(%edi), %eax  # frame load write-stderr
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5542"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5542":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr "error:"
# string literal
    jmp _L_5544
    .align 8,0x90
_L_5543 :
    .int 24
    .ascii "error:"
_L_5544:
    movl $_L_5543, %eax
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
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# expr=(begin (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))
# tail-begin (begin (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))
#   env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# emit-expr (write-stderr (symbol->string sym))
# funcall
#    si   =-24
#    env  = ((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
#    expr = (funcall write-stderr (symbol->string sym))
# emit-expr write-stderr
# emit-variable-ref
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# var=write-stderr
    movl 18(%edi), %eax  # frame load write-stderr
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5545"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5545":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr (symbol->string sym)
# symbol->string sym
# emit-expr sym
# emit-variable-ref
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# var=sym
    movl -16(%esp), %eax  # stack load sym
# end emit-variable-ref
    movl -3(%eax), %eax
    mov %eax, -36(%esp)  # arg (symbol->string sym)
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# expr=(begin (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))
# tail-begin (begin (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))
#   env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# emit-expr (write-stderr ": ")
# funcall
#    si   =-24
#    env  = ((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
#    expr = (funcall write-stderr ": ")
# emit-expr write-stderr
# emit-variable-ref
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# var=write-stderr
    movl 18(%edi), %eax  # frame load write-stderr
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5546"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5546":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr ": "
# string literal
    jmp _L_5548
    .align 8,0x90
_L_5547 :
    .int 8
    .ascii ": "
_L_5548:
    movl $_L_5547, %eax
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
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# expr=(begin (write-stderr emsg) (write-stderr "\n"))
# tail-begin (begin (write-stderr emsg) (write-stderr "\n"))
#   env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# emit-expr (write-stderr emsg)
# funcall
#    si   =-24
#    env  = ((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
#    expr = (funcall write-stderr emsg)
# emit-expr write-stderr
# emit-variable-ref
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# var=write-stderr
    movl 18(%edi), %eax  # frame load write-stderr
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5549"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5549":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr emsg
# emit-variable-ref
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# var=emsg
    movl -20(%esp), %eax  # stack load emsg
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg emsg
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# expr=(begin (write-stderr "\n"))
# tail-begin (begin (write-stderr "\n"))
#   env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# emit-tail-expr
# si=-24
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# expr=(write-stderr "\n")
# emit-tail-funcall
#    si   =-24
#    env  = ((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
#    expr = (funcall write-stderr "\n")
# emit-expr write-stderr
# emit-variable-ref
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-stderr . 20) (write-stderr . 16) (write-stderr . 12) (write-stderr . 8) (write-stderr . 4) (write-stderr . 0))
# var=write-stderr
    movl 18(%edi), %eax  # frame load write-stderr
# end emit-variable-ref
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr "\n"
# string literal
    jmp _L_5551
    .align 8,0x90
_L_5550 :
    .int 4
    .ascii "\n"
_L_5551:
    movl $_L_5550, %eax
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
_L_5540:
    movl %eax, -4(%esp)  # stack save
# emit-expr (closure (sym emsg) (write-errmsg) (let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))
# emit-closure
# si = -8
# env = ((write-errmsg . -4) (write-stderr . 0))
# expr = (closure (sym emsg) (write-errmsg) (let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))
    movl $_L_5552, 0(%ebp)  # closure label
# emit-variable-ref
# env=((write-errmsg . -4) (write-stderr . 0))
# var=write-errmsg
    movl -4(%esp), %eax  # stack load write-errmsg
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # write-errmsg
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_5553            # jump around closure body
_L_5552:
# check argument count
    cmp $8,%eax
    je _L_5554
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_5554:
# emit-tail-expr
# si=-16
# env=((emsg . -12) (sym . -8) (write-errmsg . 4) (write-errmsg . -4) (write-stderr . 0))
# expr=(let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1)))
# emit-tail-let
#  si   = -16
#  env  = ((emsg . -12) (sym . -8) (write-errmsg . 4) (write-errmsg . -4) (write-stderr . 0))
#  bindings = ((sym sym) (emsg emsg))
#  body = (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))
# emit-expr sym
# emit-variable-ref
# env=((emsg . -12) (sym . -8) (write-errmsg . 4) (write-errmsg . -4) (write-stderr . 0))
# var=sym
    movl -8(%esp), %eax  # stack load sym
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr emsg
# emit-variable-ref
# env=((emsg . -12) (sym . -8) (write-errmsg . 4) (write-errmsg . -4) (write-stderr . 0))
# var=emsg
    movl -12(%esp), %eax  # stack load emsg
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-errmsg . 4) (write-errmsg . -4) (write-stderr . 0))
# expr=(begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))
# tail-begin (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))
#   env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-errmsg . 4) (write-errmsg . -4) (write-stderr . 0))
# emit-expr (write-errmsg sym emsg)
# funcall
#    si   =-24
#    env  = ((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-errmsg . 4) (write-errmsg . -4) (write-stderr . 0))
#    expr = (funcall write-errmsg sym emsg)
# emit-expr write-errmsg
# emit-variable-ref
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-errmsg . 4) (write-errmsg . -4) (write-stderr . 0))
# var=write-errmsg
    movl 2(%edi), %eax  # frame load write-errmsg
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5555"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5555":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr sym
# emit-variable-ref
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-errmsg . 4) (write-errmsg . -4) (write-stderr . 0))
# var=sym
    movl -16(%esp), %eax  # stack load sym
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg sym
# emit-expr emsg
# emit-variable-ref
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-errmsg . 4) (write-errmsg . -4) (write-stderr . 0))
# var=emsg
    movl -20(%esp), %eax  # stack load emsg
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg emsg
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-errmsg . 4) (write-errmsg . -4) (write-stderr . 0))
# expr=(begin (foreign-call "s_exit" 1))
# tail-begin (begin (foreign-call "s_exit" 1))
#   env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-errmsg . 4) (write-errmsg . -4) (write-stderr . 0))
# emit-tail-expr
# si=-24
# env=((emsg . -20) (sym . -16) (emsg . -12) (sym . -8) (write-errmsg . 4) (write-errmsg . -4) (write-stderr . 0))
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
_L_5553:
     movl %eax, error
# == explicit-begins  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == eliminate-let*  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == eliminate-shadowing  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == vectorize-letrec  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == eliminate-set!  ==>
# (let ((p (vector (quote ())))) (begin (vector-set! p 0 (cons (quote procedure?) (vector-ref p 0))) (vector-set! p 0 (cons (quote cdr) (vector-ref p 0))) (vector-set! p 0 (cons (quote car) (vector-ref p 0))) (vector-set! p 0 (cons (quote symbol-value) (vector-ref p 0))) (vector-set! p 0 (cons (quote symbol->string) (vector-ref p 0))) (vector-set! p 0 (cons (quote make-symbol) (vector-ref p 0))) (vector-set! p 0 (cons (quote symbol?) (vector-ref p 0))) (vector-set! p 0 (cons (quote string-set!) (vector-ref p 0))) (vector-set! p 0 (cons (quote string-ref) (vector-ref p 0))) (vector-set! p 0 (cons (quote string-length) (vector-ref p 0))) (vector-set! p 0 (cons (quote string?) (vector-ref p 0))) (vector-set! p 0 (cons (quote make-string) (vector-ref p 0))) (vector-set! p 0 (cons (quote vector) (vector-ref p 0))) (vector-set! p 0 (cons (quote vector-ref) (vector-ref p 0))) (vector-set! p 0 (cons (quote vector-set!) (vector-ref p 0))) (vector-set! p 0 (cons (quote vector-length) (vector-ref p 0))) (vector-set! p 0 (cons (quote make-vector) (vector-ref p 0))) (vector-set! p 0 (cons (quote vector?) (vector-ref p 0))) (vector-set! p 0 (cons (quote set-cdr!) (vector-ref p 0))) (vector-set! p 0 (cons (quote set-car!) (vector-ref p 0))) (vector-set! p 0 (cons (quote cdr) (vector-ref p 0))) (vector-set! p 0 (cons (quote car) (vector-ref p 0))) (vector-set! p 0 (cons (quote cons) (vector-ref p 0))) (vector-set! p 0 (cons (quote pair?) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx*) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx-) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx+) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx>=) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx>) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx<=) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx<) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx=) (vector-ref p 0))) (vector-set! p 0 (cons (quote fxzero?) (vector-ref p 0))) (vector-set! p 0 (cons (quote fxsub1) (vector-ref p 0))) (vector-set! p 0 (cons (quote fxadd1) (vector-ref p 0))) (vector-set! p 0 (cons (quote fxlogor) (vector-ref p 0))) (vector-set! p 0 (cons (quote fxlogand) (vector-ref p 0))) (vector-set! p 0 (cons (quote fxlognot) (vector-ref p 0))) (vector-set! p 0 (cons (quote char=?) (vector-ref p 0))) (vector-set! p 0 (cons (quote eq?) (vector-ref p 0))) (vector-set! p 0 (cons (quote not) (vector-ref p 0))) (vector-set! p 0 (cons (quote boolean?) (vector-ref p 0))) (vector-set! p 0 (cons (quote fixnum?) (vector-ref p 0))) (vector-set! p 0 (cons (quote char?) (vector-ref p 0))) (vector-set! p 0 (cons (quote null?) (vector-ref p 0))) (vector-set! p 0 (cons (quote char->fixnum) (vector-ref p 0))) (vector-set! p 0 (cons (quote fixnum->char) (vector-ref p 0))) (lambda () (let () (vector-ref p 0)))))
# == close-free-variables  ==>
# (let ((p (vector (quote ())))) (begin (vector-set! p 0 (cons (quote procedure?) (vector-ref p 0))) (vector-set! p 0 (cons (quote cdr) (vector-ref p 0))) (vector-set! p 0 (cons (quote car) (vector-ref p 0))) (vector-set! p 0 (cons (quote symbol-value) (vector-ref p 0))) (vector-set! p 0 (cons (quote symbol->string) (vector-ref p 0))) (vector-set! p 0 (cons (quote make-symbol) (vector-ref p 0))) (vector-set! p 0 (cons (quote symbol?) (vector-ref p 0))) (vector-set! p 0 (cons (quote string-set!) (vector-ref p 0))) (vector-set! p 0 (cons (quote string-ref) (vector-ref p 0))) (vector-set! p 0 (cons (quote string-length) (vector-ref p 0))) (vector-set! p 0 (cons (quote string?) (vector-ref p 0))) (vector-set! p 0 (cons (quote make-string) (vector-ref p 0))) (vector-set! p 0 (cons (quote vector) (vector-ref p 0))) (vector-set! p 0 (cons (quote vector-ref) (vector-ref p 0))) (vector-set! p 0 (cons (quote vector-set!) (vector-ref p 0))) (vector-set! p 0 (cons (quote vector-length) (vector-ref p 0))) (vector-set! p 0 (cons (quote make-vector) (vector-ref p 0))) (vector-set! p 0 (cons (quote vector?) (vector-ref p 0))) (vector-set! p 0 (cons (quote set-cdr!) (vector-ref p 0))) (vector-set! p 0 (cons (quote set-car!) (vector-ref p 0))) (vector-set! p 0 (cons (quote cdr) (vector-ref p 0))) (vector-set! p 0 (cons (quote car) (vector-ref p 0))) (vector-set! p 0 (cons (quote cons) (vector-ref p 0))) (vector-set! p 0 (cons (quote pair?) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx*) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx-) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx+) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx>=) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx>) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx<=) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx<) (vector-ref p 0))) (vector-set! p 0 (cons (quote fx=) (vector-ref p 0))) (vector-set! p 0 (cons (quote fxzero?) (vector-ref p 0))) (vector-set! p 0 (cons (quote fxsub1) (vector-ref p 0))) (vector-set! p 0 (cons (quote fxadd1) (vector-ref p 0))) (vector-set! p 0 (cons (quote fxlogor) (vector-ref p 0))) (vector-set! p 0 (cons (quote fxlogand) (vector-ref p 0))) (vector-set! p 0 (cons (quote fxlognot) (vector-ref p 0))) (vector-set! p 0 (cons (quote char=?) (vector-ref p 0))) (vector-set! p 0 (cons (quote eq?) (vector-ref p 0))) (vector-set! p 0 (cons (quote not) (vector-ref p 0))) (vector-set! p 0 (cons (quote boolean?) (vector-ref p 0))) (vector-set! p 0 (cons (quote fixnum?) (vector-ref p 0))) (vector-set! p 0 (cons (quote char?) (vector-ref p 0))) (vector-set! p 0 (cons (quote null?) (vector-ref p 0))) (vector-set! p 0 (cons (quote char->fixnum) (vector-ref p 0))) (vector-set! p 0 (cons (quote fixnum->char) (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0)))))
# == eliminate-quote  ==>
# (let ((p (vector ()))) (begin (vector-set! p 0 (cons (string->symbol "procedure?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "cdr") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "car") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "symbol-value") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "string-length") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "string?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "make-string") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "cdr") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "car") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "cons") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "pair?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx*") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx-") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx+") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx>") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx<") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx=") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "char=?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "eq?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "not") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "char?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "null?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0)))))
# == eliminate-when/unless  ==>
# (let ((p (vector ()))) (begin (vector-set! p 0 (cons (string->symbol "procedure?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "cdr") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "car") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "symbol-value") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "string-length") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "string?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "make-string") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "cdr") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "car") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "cons") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "pair?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx*") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx-") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx+") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx>") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx<") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx=") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "char=?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "eq?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "not") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "char?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "null?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0)))))
# == eliminate-cond  ==>
# (let ((p (vector ()))) (begin (vector-set! p 0 (cons (string->symbol "procedure?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "cdr") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "car") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "symbol-value") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "string-length") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "string?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "make-string") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "vector?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "cdr") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "car") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "cons") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "pair?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx*") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx-") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx+") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx>") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx<") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fx=") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "char=?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "eq?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "not") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "char?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "null?") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons (string->symbol "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0)))))
# == external-symbols  ==>
# (let ((p (vector ()))) (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0)))))
# emit-expr (let ((p (vector ()))) (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0)))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((p (vector ())))
#  body = (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-expr (vector ())
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5556"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5556:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_5557
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5557:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)
# emit-expr ()
    movl $63, %eax     # immed ()
    movl  %eax, %ebx
    movl 0(%esp), %eax
    movl %ebx, -1(%eax)
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5558
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5558:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5559"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5559:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5561
    cmp  $0,%eax
    jge _L_5560
_L_5561:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5560:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "procedure?") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "procedure?") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "procedure?")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "procedure?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5562"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5562":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "procedure?"
# string literal
    jmp _L_5564
    .align 8,0x90
_L_5563 :
    .int 40
    .ascii "procedure?"
_L_5564:
    movl $_L_5563, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg procedure?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5565
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5565:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5566"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5566:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5568
    cmp  $0,%eax
    jge _L_5567
_L_5568:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5567:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5569
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5569:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5570"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5570:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5572
    cmp  $0,%eax
    jge _L_5571
_L_5572:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5571:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "cdr") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "cdr")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "cdr")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5573"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5573":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_5575
    .align 8,0x90
_L_5574 :
    .int 12
    .ascii "cdr"
_L_5575:
    movl $_L_5574, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cdr
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5576
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5576:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5577"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5577:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5579
    cmp  $0,%eax
    jge _L_5578
_L_5579:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5578:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5580
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5580:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5581"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5581:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5583
    cmp  $0,%eax
    jge _L_5582
_L_5583:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5582:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "car") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "car")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "car")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5584"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5584":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_5586
    .align 8,0x90
_L_5585 :
    .int 12
    .ascii "car"
_L_5586:
    movl $_L_5585, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg car
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5587
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5587:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5588"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5588:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5590
    cmp  $0,%eax
    jge _L_5589
_L_5590:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5589:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5591
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5591:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5592"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5592:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5594
    cmp  $0,%eax
    jge _L_5593
_L_5594:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5593:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "symbol-value") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "symbol-value")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol-value")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5595"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5595":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol-value"
# string literal
    jmp _L_5597
    .align 8,0x90
_L_5596 :
    .int 48
    .ascii "symbol-value"
_L_5597:
    movl $_L_5596, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol-value
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5598
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5598:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5599"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5599:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5601
    cmp  $0,%eax
    jge _L_5600
_L_5601:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5600:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5602
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5602:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5603"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5603:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5605
    cmp  $0,%eax
    jge _L_5604
_L_5605:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5604:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "symbol->string") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "symbol->string")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol->string")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5606"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5606":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol->string"
# string literal
    jmp _L_5608
    .align 8,0x90
_L_5607 :
    .int 56
    .ascii "symbol->string"
_L_5608:
    movl $_L_5607, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol->string
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5609
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5609:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5610"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5610:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5612
    cmp  $0,%eax
    jge _L_5611
_L_5612:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5611:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5613
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5613:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5614"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5614:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5616
    cmp  $0,%eax
    jge _L_5615
_L_5616:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5615:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "make-symbol") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "make-symbol")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-symbol")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5617"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5617":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-symbol"
# string literal
    jmp _L_5619
    .align 8,0x90
_L_5618 :
    .int 44
    .ascii "make-symbol"
_L_5619:
    movl $_L_5618, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-symbol
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5620
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5620:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5621"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5621:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5623
    cmp  $0,%eax
    jge _L_5622
_L_5623:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5622:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5624
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5624:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5625"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5625:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5627
    cmp  $0,%eax
    jge _L_5626
_L_5627:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5626:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol?") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "symbol?") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "symbol?")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5628"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5628":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol?"
# string literal
    jmp _L_5630
    .align 8,0x90
_L_5629 :
    .int 28
    .ascii "symbol?"
_L_5630:
    movl $_L_5629, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5631
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5631:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5632"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5632:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5634
    cmp  $0,%eax
    jge _L_5633
_L_5634:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5633:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5635
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5635:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5636"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5636:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5638
    cmp  $0,%eax
    jge _L_5637
_L_5638:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5637:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-set!") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "string-set!") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "string-set!")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-set!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5639"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5639":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-set!"
# string literal
    jmp _L_5641
    .align 8,0x90
_L_5640 :
    .int 44
    .ascii "string-set!"
_L_5641:
    movl $_L_5640, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-set!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5642
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5642:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5643"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5643:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5645
    cmp  $0,%eax
    jge _L_5644
_L_5645:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5644:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5646
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5646:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5647"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5647:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5649
    cmp  $0,%eax
    jge _L_5648
_L_5649:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5648:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-ref") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "string-ref") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "string-ref")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-ref")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5650"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5650":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-ref"
# string literal
    jmp _L_5652
    .align 8,0x90
_L_5651 :
    .int 40
    .ascii "string-ref"
_L_5652:
    movl $_L_5651, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-ref
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5653
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5653:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5654"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5654:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5656
    cmp  $0,%eax
    jge _L_5655
_L_5656:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5655:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5657
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5657:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5658"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5658:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5660
    cmp  $0,%eax
    jge _L_5659
_L_5660:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5659:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-length") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "string-length") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "string-length")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-length")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5661"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5661":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-length"
# string literal
    jmp _L_5663
    .align 8,0x90
_L_5662 :
    .int 52
    .ascii "string-length"
_L_5663:
    movl $_L_5662, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-length
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5664
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5664:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5665"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5665:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5667
    cmp  $0,%eax
    jge _L_5666
_L_5667:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5666:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5668
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5668:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5669"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5669:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5671
    cmp  $0,%eax
    jge _L_5670
_L_5671:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5670:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string?") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "string?") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "string?")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "string?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5672"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5672":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string?"
# string literal
    jmp _L_5674
    .align 8,0x90
_L_5673 :
    .int 28
    .ascii "string?"
_L_5674:
    movl $_L_5673, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5675
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5675:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5676"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5676:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5678
    cmp  $0,%eax
    jge _L_5677
_L_5678:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5677:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5679
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5679:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5680"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5680:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5682
    cmp  $0,%eax
    jge _L_5681
_L_5682:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5681:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-string") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "make-string") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "make-string")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-string")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5683"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5683":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-string"
# string literal
    jmp _L_5685
    .align 8,0x90
_L_5684 :
    .int 44
    .ascii "make-string"
_L_5685:
    movl $_L_5684, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-string
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5686
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5686:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5687"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5687:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5689
    cmp  $0,%eax
    jge _L_5688
_L_5689:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5688:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5690
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5690:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5691"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5691:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5693
    cmp  $0,%eax
    jge _L_5692
_L_5693:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5692:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "vector") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "vector")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5694"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5694":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector"
# string literal
    jmp _L_5696
    .align 8,0x90
_L_5695 :
    .int 24
    .ascii "vector"
_L_5696:
    movl $_L_5695, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5697
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5697:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5698"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5698:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5700
    cmp  $0,%eax
    jge _L_5699
_L_5700:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5699:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5701
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5701:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5702"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5702:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5704
    cmp  $0,%eax
    jge _L_5703
_L_5704:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5703:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "vector-ref") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "vector-ref")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-ref")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5705"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5705":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-ref"
# string literal
    jmp _L_5707
    .align 8,0x90
_L_5706 :
    .int 40
    .ascii "vector-ref"
_L_5707:
    movl $_L_5706, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-ref
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5708
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5708:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5709"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5709:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5711
    cmp  $0,%eax
    jge _L_5710
_L_5711:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5710:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5712
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5712:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5713"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5713:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5715
    cmp  $0,%eax
    jge _L_5714
_L_5715:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5714:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "vector-set!") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "vector-set!")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-set!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5716"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5716":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-set!"
# string literal
    jmp _L_5718
    .align 8,0x90
_L_5717 :
    .int 44
    .ascii "vector-set!"
_L_5718:
    movl $_L_5717, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-set!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5719
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5719:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5720"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5720:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5722
    cmp  $0,%eax
    jge _L_5721
_L_5722:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5721:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5723
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5723:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5724"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5724:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5726
    cmp  $0,%eax
    jge _L_5725
_L_5726:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5725:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-length") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "vector-length") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "vector-length")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-length")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5727"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5727":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-length"
# string literal
    jmp _L_5729
    .align 8,0x90
_L_5728 :
    .int 52
    .ascii "vector-length"
_L_5729:
    movl $_L_5728, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-length
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5730
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5730:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5731"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5731:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5733
    cmp  $0,%eax
    jge _L_5732
_L_5733:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5732:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5734
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5734:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5735"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5735:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5737
    cmp  $0,%eax
    jge _L_5736
_L_5737:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5736:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-vector") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "make-vector") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "make-vector")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-vector")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5738"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5738":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-vector"
# string literal
    jmp _L_5740
    .align 8,0x90
_L_5739 :
    .int 44
    .ascii "make-vector"
_L_5740:
    movl $_L_5739, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-vector
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5741
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5741:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5742"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5742:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5744
    cmp  $0,%eax
    jge _L_5743
_L_5744:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5743:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5745
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5745:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5746"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5746:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5748
    cmp  $0,%eax
    jge _L_5747
_L_5748:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5747:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector?") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "vector?") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "vector?")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5749"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5749":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector?"
# string literal
    jmp _L_5751
    .align 8,0x90
_L_5750 :
    .int 28
    .ascii "vector?"
_L_5751:
    movl $_L_5750, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5752
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5752:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5753"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5753:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5755
    cmp  $0,%eax
    jge _L_5754
_L_5755:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5754:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5756
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5756:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5757"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5757:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5759
    cmp  $0,%eax
    jge _L_5758
_L_5759:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5758:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "set-cdr!") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "set-cdr!")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "set-cdr!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5760"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5760":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-cdr!"
# string literal
    jmp _L_5762
    .align 8,0x90
_L_5761 :
    .int 32
    .ascii "set-cdr!"
_L_5762:
    movl $_L_5761, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg set-cdr!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5763
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5763:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5764"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5764:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5766
    cmp  $0,%eax
    jge _L_5765
_L_5766:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5765:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5767
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5767:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5768"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5768:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5770
    cmp  $0,%eax
    jge _L_5769
_L_5770:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5769:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "set-car!") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "set-car!") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "set-car!")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "set-car!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5771"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5771":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-car!"
# string literal
    jmp _L_5773
    .align 8,0x90
_L_5772 :
    .int 32
    .ascii "set-car!"
_L_5773:
    movl $_L_5772, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg set-car!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5774
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5774:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5775"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5775:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5777
    cmp  $0,%eax
    jge _L_5776
_L_5777:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5776:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5778
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5778:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5779"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5779:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5781
    cmp  $0,%eax
    jge _L_5780
_L_5781:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5780:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cdr") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "cdr") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "cdr")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "cdr")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5782"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5782":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_5784
    .align 8,0x90
_L_5783 :
    .int 12
    .ascii "cdr"
_L_5784:
    movl $_L_5783, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cdr
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5785
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5785:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5786"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5786:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5788
    cmp  $0,%eax
    jge _L_5787
_L_5788:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5787:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "car") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5789
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5789:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5790"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5790:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5792
    cmp  $0,%eax
    jge _L_5791
_L_5792:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5791:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "car") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "car") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "car")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "car")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5793"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5793":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_5795
    .align 8,0x90
_L_5794 :
    .int 12
    .ascii "car"
_L_5795:
    movl $_L_5794, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg car
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5796
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5796:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5797"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5797:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5799
    cmp  $0,%eax
    jge _L_5798
_L_5799:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5798:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5800
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5800:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5801"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5801:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5803
    cmp  $0,%eax
    jge _L_5802
_L_5803:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5802:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cons") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "cons") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "cons")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "cons")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5804"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5804":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cons"
# string literal
    jmp _L_5806
    .align 8,0x90
_L_5805 :
    .int 16
    .ascii "cons"
_L_5806:
    movl $_L_5805, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cons
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5807
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5807:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5808"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5808:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5810
    cmp  $0,%eax
    jge _L_5809
_L_5810:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5809:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5811
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5811:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5812"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5812:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5814
    cmp  $0,%eax
    jge _L_5813
_L_5814:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5813:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "pair?") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "pair?") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "pair?")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "pair?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5815"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5815":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "pair?"
# string literal
    jmp _L_5817
    .align 8,0x90
_L_5816 :
    .int 20
    .ascii "pair?"
_L_5817:
    movl $_L_5816, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg pair?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5818
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5818:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5819"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5819:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5821
    cmp  $0,%eax
    jge _L_5820
_L_5821:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5820:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5822
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5822:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5823"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5823:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5825
    cmp  $0,%eax
    jge _L_5824
_L_5825:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5824:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx*") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fx*") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fx*")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx*")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5826"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5826":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx*"
# string literal
    jmp _L_5828
    .align 8,0x90
_L_5827 :
    .int 12
    .ascii "fx*"
_L_5828:
    movl $_L_5827, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx*
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5829
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5829:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5830"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5830:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5832
    cmp  $0,%eax
    jge _L_5831
_L_5832:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5831:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5833
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5833:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5834"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5834:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5836
    cmp  $0,%eax
    jge _L_5835
_L_5836:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5835:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx-") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fx-") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fx-")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx-")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5837"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5837":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx-"
# string literal
    jmp _L_5839
    .align 8,0x90
_L_5838 :
    .int 12
    .ascii "fx-"
_L_5839:
    movl $_L_5838, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx-
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5840
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5840:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5841"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5841:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5843
    cmp  $0,%eax
    jge _L_5842
_L_5843:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5842:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5844
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5844:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5845"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5845:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5847
    cmp  $0,%eax
    jge _L_5846
_L_5847:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5846:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx+") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fx+") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fx+")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx+")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5848"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5848":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx+"
# string literal
    jmp _L_5850
    .align 8,0x90
_L_5849 :
    .int 12
    .ascii "fx+"
_L_5850:
    movl $_L_5849, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx+
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5851
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5851:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5852"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5852:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5854
    cmp  $0,%eax
    jge _L_5853
_L_5854:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5853:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5855
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5855:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5856"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5856:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5858
    cmp  $0,%eax
    jge _L_5857
_L_5858:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5857:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx>=") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fx>=") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fx>=")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx>=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5859"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5859":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>="
# string literal
    jmp _L_5861
    .align 8,0x90
_L_5860 :
    .int 16
    .ascii "fx>="
_L_5861:
    movl $_L_5860, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx>=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5862
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5862:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5863"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5863:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5865
    cmp  $0,%eax
    jge _L_5864
_L_5865:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5864:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5866
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5866:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5867"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5867:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5869
    cmp  $0,%eax
    jge _L_5868
_L_5869:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5868:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx>") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fx>") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fx>")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx>")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5870"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5870":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>"
# string literal
    jmp _L_5872
    .align 8,0x90
_L_5871 :
    .int 12
    .ascii "fx>"
_L_5872:
    movl $_L_5871, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx>
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5873
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5873:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5874"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5874:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5876
    cmp  $0,%eax
    jge _L_5875
_L_5876:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5875:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5877
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5877:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5878"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5878:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5880
    cmp  $0,%eax
    jge _L_5879
_L_5880:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5879:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx<=") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fx<=") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fx<=")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx<=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5881"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5881":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<="
# string literal
    jmp _L_5883
    .align 8,0x90
_L_5882 :
    .int 16
    .ascii "fx<="
_L_5883:
    movl $_L_5882, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx<=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5884
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5884:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5885"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5885:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5887
    cmp  $0,%eax
    jge _L_5886
_L_5887:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5886:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5888
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5888:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5889"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5889:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5891
    cmp  $0,%eax
    jge _L_5890
_L_5891:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5890:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx<") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fx<") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fx<")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx<")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5892"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5892":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<"
# string literal
    jmp _L_5894
    .align 8,0x90
_L_5893 :
    .int 12
    .ascii "fx<"
_L_5894:
    movl $_L_5893, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx<
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5895
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5895:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5896"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5896:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5898
    cmp  $0,%eax
    jge _L_5897
_L_5898:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5897:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5899
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5899:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5900"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5900:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5902
    cmp  $0,%eax
    jge _L_5901
_L_5902:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5901:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx=") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fx=") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fx=")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5903"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5903":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx="
# string literal
    jmp _L_5905
    .align 8,0x90
_L_5904 :
    .int 12
    .ascii "fx="
_L_5905:
    movl $_L_5904, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5906
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5906:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5907"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5907:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5909
    cmp  $0,%eax
    jge _L_5908
_L_5909:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5908:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5910
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5910:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5911"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5911:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5913
    cmp  $0,%eax
    jge _L_5912
_L_5913:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5912:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fxzero?") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fxzero?")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxzero?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5914"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5914":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxzero?"
# string literal
    jmp _L_5916
    .align 8,0x90
_L_5915 :
    .int 28
    .ascii "fxzero?"
_L_5916:
    movl $_L_5915, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxzero?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5917
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5917:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5918"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5918:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5920
    cmp  $0,%eax
    jge _L_5919
_L_5920:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5919:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5921
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5921:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5922"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5922:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5924
    cmp  $0,%eax
    jge _L_5923
_L_5924:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5923:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fxsub1") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fxsub1")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxsub1")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5925"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5925":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxsub1"
# string literal
    jmp _L_5927
    .align 8,0x90
_L_5926 :
    .int 24
    .ascii "fxsub1"
_L_5927:
    movl $_L_5926, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxsub1
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5928
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5928:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5929"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5929:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5931
    cmp  $0,%eax
    jge _L_5930
_L_5931:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5930:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5932
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5932:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5933"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5933:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5935
    cmp  $0,%eax
    jge _L_5934
_L_5935:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5934:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fxadd1") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fxadd1")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxadd1")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5936"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5936":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxadd1"
# string literal
    jmp _L_5938
    .align 8,0x90
_L_5937 :
    .int 24
    .ascii "fxadd1"
_L_5938:
    movl $_L_5937, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxadd1
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5939
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5939:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5940"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5940:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5942
    cmp  $0,%eax
    jge _L_5941
_L_5942:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5941:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5943
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5943:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5944"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5944:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5946
    cmp  $0,%eax
    jge _L_5945
_L_5946:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5945:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fxlogor") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fxlogor")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlogor")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5947"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5947":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogor"
# string literal
    jmp _L_5949
    .align 8,0x90
_L_5948 :
    .int 28
    .ascii "fxlogor"
_L_5949:
    movl $_L_5948, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlogor
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5950
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5950:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5951"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5951:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5953
    cmp  $0,%eax
    jge _L_5952
_L_5953:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5952:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5954
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5954:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5955"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5955:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5957
    cmp  $0,%eax
    jge _L_5956
_L_5957:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5956:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fxlogand") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fxlogand")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlogand")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5958"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5958":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogand"
# string literal
    jmp _L_5960
    .align 8,0x90
_L_5959 :
    .int 32
    .ascii "fxlogand"
_L_5960:
    movl $_L_5959, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlogand
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5961
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5961:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5962"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5962:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5964
    cmp  $0,%eax
    jge _L_5963
_L_5964:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5963:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5965
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5965:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5966"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5966:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5968
    cmp  $0,%eax
    jge _L_5967
_L_5968:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5967:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fxlognot") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fxlognot")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlognot")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5969"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5969":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlognot"
# string literal
    jmp _L_5971
    .align 8,0x90
_L_5970 :
    .int 32
    .ascii "fxlognot"
_L_5971:
    movl $_L_5970, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlognot
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5972
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5972:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5973"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5973:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5975
    cmp  $0,%eax
    jge _L_5974
_L_5975:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5974:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5976
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5976:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5977"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5977:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5979
    cmp  $0,%eax
    jge _L_5978
_L_5979:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5978:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char=?") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "char=?") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "char=?")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "char=?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5980"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5980":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char=?"
# string literal
    jmp _L_5982
    .align 8,0x90
_L_5981 :
    .int 24
    .ascii "char=?"
_L_5982:
    movl $_L_5981, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char=?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5983
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5983:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5984"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5984:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5986
    cmp  $0,%eax
    jge _L_5985
_L_5986:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5985:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5987
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5987:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5988"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5988:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5990
    cmp  $0,%eax
    jge _L_5989
_L_5990:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5989:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "eq?") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "eq?") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "eq?")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "eq?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_5991"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_5991":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "eq?"
# string literal
    jmp _L_5993
    .align 8,0x90
_L_5992 :
    .int 12
    .ascii "eq?"
_L_5993:
    movl $_L_5992, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg eq?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5994
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5994:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5995"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5995:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_5997
    cmp  $0,%eax
    jge _L_5996
_L_5997:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_5996:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "not") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_5998
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5998:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_5999"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_5999:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_6001
    cmp  $0,%eax
    jge _L_6000
_L_6001:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_6000:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "not") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "not") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "not")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "not")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_6002"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_6002":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "not"
# string literal
    jmp _L_6004
    .align 8,0x90
_L_6003 :
    .int 12
    .ascii "not"
_L_6004:
    movl $_L_6003, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg not
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_6005
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_6005:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_6006"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_6006:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_6008
    cmp  $0,%eax
    jge _L_6007
_L_6008:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_6007:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_6009
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_6009:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_6010"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_6010:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_6012
    cmp  $0,%eax
    jge _L_6011
_L_6012:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_6011:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "boolean?") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "boolean?") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "boolean?")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "boolean?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_6013"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_6013":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "boolean?"
# string literal
    jmp _L_6015
    .align 8,0x90
_L_6014 :
    .int 32
    .ascii "boolean?"
_L_6015:
    movl $_L_6014, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg boolean?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_6016
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_6016:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_6017"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_6017:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_6019
    cmp  $0,%eax
    jge _L_6018
_L_6019:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_6018:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_6020
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_6020:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_6021"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_6021:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_6023
    cmp  $0,%eax
    jge _L_6022
_L_6023:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_6022:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fixnum?") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fixnum?")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fixnum?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_6024"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_6024":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum?"
# string literal
    jmp _L_6026
    .align 8,0x90
_L_6025 :
    .int 28
    .ascii "fixnum?"
_L_6026:
    movl $_L_6025, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fixnum?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_6027
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_6027:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_6028"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_6028:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_6030
    cmp  $0,%eax
    jge _L_6029
_L_6030:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_6029:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_6031
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_6031:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_6032"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_6032:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_6034
    cmp  $0,%eax
    jge _L_6033
_L_6034:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_6033:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char?") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "char?") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "char?")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "char?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_6035"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_6035":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char?"
# string literal
    jmp _L_6037
    .align 8,0x90
_L_6036 :
    .int 20
    .ascii "char?"
_L_6037:
    movl $_L_6036, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_6038
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_6038:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_6039"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_6039:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_6041
    cmp  $0,%eax
    jge _L_6040
_L_6041:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_6040:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_6042
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_6042:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_6043"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_6043:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_6045
    cmp  $0,%eax
    jge _L_6044
_L_6045:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_6044:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "null?") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "null?") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "null?")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "null?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_6046"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_6046":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "null?"
# string literal
    jmp _L_6048
    .align 8,0x90
_L_6047 :
    .int 20
    .ascii "null?"
_L_6048:
    movl $_L_6047, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg null?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_6049
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_6049:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_6050"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_6050:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_6052
    cmp  $0,%eax
    jge _L_6051
_L_6052:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_6051:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))) (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_6053
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_6053:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_6054"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_6054:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_6056
    cmp  $0,%eax
    jge _L_6055
_L_6056:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_6055:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "char->fixnum") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "char->fixnum")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "char->fixnum")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_6057"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_6057":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char->fixnum"
# string literal
    jmp _L_6059
    .align 8,0x90
_L_6058 :
    .int 48
    .ascii "char->fixnum"
_L_6059:
    movl $_L_6058, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char->fixnum
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_6060
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_6060:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_6061"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_6061:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_6063
    cmp  $0,%eax
    jge _L_6062
_L_6063:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_6062:
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
# emit-expr (begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))) (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (vector-set! p 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0)))
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_6064
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_6064:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_6065"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_6065:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_6067
    cmp  $0,%eax
    jge _L_6066
_L_6067:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_6066:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref p 0))
# cons arg1=((primitive-ref string->symbol) "fixnum->char") arg2=(vector-ref p 0)
# emit-expr ((primitive-ref string->symbol) "fixnum->char")
# funcall
#    si   =-12
#    env  = ((p . 0))
#    expr = (funcall (primitive-ref string->symbol) "fixnum->char")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_6068"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_6068":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum->char"
# string literal
    jmp _L_6070
    .align 8,0x90
_L_6069 :
    .int 48
    .ascii "fixnum->char"
_L_6070:
    movl $_L_6069, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fixnum->char
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref p 0)
# emit-expr p
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_6071
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_6071:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_6072"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_6072:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_6074
    cmp  $0,%eax
    jge _L_6073
_L_6074:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_6073:
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
# emit-expr (begin (closure () (p) (let () (vector-ref p 0))))
# emit-begin
#   expr=(begin (closure () (p) (let () (vector-ref p 0))))
#   env=((p . 0))
# emit-expr (closure () (p) (let () (vector-ref p 0)))
# emit-closure
# si = -4
# env = ((p . 0))
# expr = (closure () (p) (let () (vector-ref p 0)))
    movl $_L_6075, 0(%ebp)  # closure label
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # p
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_6076            # jump around closure body
_L_6075:
# check argument count
    cmp $0,%eax
    je _L_6077
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_6077:
# emit-tail-expr
# si=-8
# env=((p . 4) (p . 0))
# expr=(let () (vector-ref p 0))
# emit-tail-let
#  si   = -8
#  env  = ((p . 4) (p . 0))
#  bindings = ()
#  body = (vector-ref p 0)
# emit-tail-expr
# si=-8
# env=((p . 4) (p . 0))
# expr=(vector-ref p 0)
# tail primcall
# emit-expr p
# emit-variable-ref
# env=((p . 4) (p . 0))
# var=p
    movl 2(%edi), %eax  # frame load p
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_6078
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_6078:
    movl %eax, -8(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_6079"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_6079:
# check bounds on vector index
    movl -8(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_6081
    cmp  $0,%eax
    jge _L_6080
_L_6081:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_6080:
    movl -8(%esp), %esi
    movl -1(%eax,%esi), %eax
#return from tail (vector-ref p 0)
    ret
    .align 4,0x90
_L_6076:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((p . 0))
     movl %eax, primitives
# == explicit-begins  ==>
# (lambda () (error (quote funcall) "arg 1 must be a procedure"))
# == eliminate-let*  ==>
# (lambda () (error (quote funcall) "arg 1 must be a procedure"))
# == eliminate-shadowing  ==>
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
    movl $_L_6082, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_6083            # jump around closure body
_L_6082:
# check argument count
    cmp $0,%eax
    je _L_6084
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_6084:
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
    je "_L_6085"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_6085":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_6087
    .align 8,0x90
_L_6086 :
    .int 28
    .ascii "funcall"
_L_6087:
    movl $_L_6086, %eax
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
    jmp _L_6089
    .align 8,0x90
_L_6088 :
    .int 100
    .ascii "arg 1 must be a procedure"
_L_6089:
    movl $_L_6088, %eax
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
_L_6083:
     movl %eax, eh$uprocedure
# == explicit-begins  ==>
# (lambda () (error (quote funcall) "wrong number of args"))
# == eliminate-let*  ==>
# (lambda () (error (quote funcall) "wrong number of args"))
# == eliminate-shadowing  ==>
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
    movl $_L_6090, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_6091            # jump around closure body
_L_6090:
# check argument count
    cmp $0,%eax
    je _L_6092
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_6092:
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
    je "_L_6093"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_6093":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_6095
    .align 8,0x90
_L_6094 :
    .int 28
    .ascii "funcall"
_L_6095:
    movl $_L_6094, %eax
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
    jmp _L_6097
    .align 8,0x90
_L_6096 :
    .int 80
    .ascii "wrong number of args"
_L_6097:
    movl $_L_6096, %eax
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
_L_6091:
     movl %eax, eh$uargcount
# == explicit-begins  ==>
# (lambda () (error (quote funcall) "too few args"))
# == eliminate-let*  ==>
# (lambda () (error (quote funcall) "too few args"))
# == eliminate-shadowing  ==>
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
    movl $_L_6098, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_6099            # jump around closure body
_L_6098:
# check argument count
    cmp $0,%eax
    je _L_6100
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_6100:
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
    je "_L_6101"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_6101":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_6103
    .align 8,0x90
_L_6102 :
    .int 28
    .ascii "funcall"
_L_6103:
    movl $_L_6102, %eax
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
    jmp _L_6105
    .align 8,0x90
_L_6104 :
    .int 48
    .ascii "too few args"
_L_6105:
    movl $_L_6104, %eax
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
_L_6099:
     movl %eax, eh$uargcount$umin
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == eliminate-shadowing  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == vectorize-letrec  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == eliminate-set!  ==>
# (lambda (i) (let ((i i)) (error (list-ref (primitives) i) "arg must be a fixnum")))
# == close-free-variables  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a fixnum")))
# == eliminate-quote  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a fixnum")))
# == eliminate-when/unless  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a fixnum")))
# == eliminate-cond  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a fixnum")))
# == external-symbols  ==>
# (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a fixnum")))
# emit-expr (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a fixnum")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a fixnum")))
    movl $_L_6106, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_6107            # jump around closure body
_L_6106:
# check argument count
    cmp $4,%eax
    je _L_6108
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_6108:
# emit-tail-expr
# si=-12
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a fixnum"))
# emit-tail-let
#  si   = -12
#  env  = ((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((i i))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a fixnum")
# emit-expr i
# emit-variable-ref
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -8(%esp), %eax  # stack load i
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a fixnum")
# emit-tail-funcall
#    si   =-16
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a fixnum")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# funcall
#    si   =-20
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_6109"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_6109":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_6110"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_6110":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr i
# emit-variable-ref
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -12(%esp), %eax  # stack load i
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg i
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr "arg must be a fixnum"
# string literal
    jmp _L_6112
    .align 8,0x90
_L_6111 :
    .int 80
    .ascii "arg must be a fixnum"
_L_6112:
    movl $_L_6111, %eax
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
_L_6107:
     movl %eax, eh$ufixnum
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == eliminate-shadowing  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == vectorize-letrec  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == eliminate-set!  ==>
# (lambda (i) (let ((i i)) (error (list-ref (primitives) i) "arg must be a string")))
# == close-free-variables  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a string")))
# == eliminate-quote  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a string")))
# == eliminate-when/unless  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a string")))
# == eliminate-cond  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a string")))
# == external-symbols  ==>
# (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a string")))
# emit-expr (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a string")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a string")))
    movl $_L_6113, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_6114            # jump around closure body
_L_6113:
# check argument count
    cmp $4,%eax
    je _L_6115
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_6115:
# emit-tail-expr
# si=-12
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a string"))
# emit-tail-let
#  si   = -12
#  env  = ((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((i i))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a string")
# emit-expr i
# emit-variable-ref
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -8(%esp), %eax  # stack load i
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a string")
# emit-tail-funcall
#    si   =-16
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a string")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# funcall
#    si   =-20
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_6116"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_6116":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_6117"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_6117":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr i
# emit-variable-ref
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -12(%esp), %eax  # stack load i
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg i
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr "arg must be a string"
# string literal
    jmp _L_6119
    .align 8,0x90
_L_6118 :
    .int 80
    .ascii "arg must be a string"
_L_6119:
    movl $_L_6118, %eax
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
_L_6114:
     movl %eax, eh$ustring
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == eliminate-shadowing  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == vectorize-letrec  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == eliminate-set!  ==>
# (lambda (i) (let ((i i)) (error (list-ref (primitives) i) "arg must be a character")))
# == close-free-variables  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a character")))
# == eliminate-quote  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a character")))
# == eliminate-when/unless  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a character")))
# == eliminate-cond  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a character")))
# == external-symbols  ==>
# (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a character")))
# emit-expr (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a character")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a character")))
    movl $_L_6120, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_6121            # jump around closure body
_L_6120:
# check argument count
    cmp $4,%eax
    je _L_6122
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_6122:
# emit-tail-expr
# si=-12
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a character"))
# emit-tail-let
#  si   = -12
#  env  = ((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((i i))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a character")
# emit-expr i
# emit-variable-ref
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -8(%esp), %eax  # stack load i
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a character")
# emit-tail-funcall
#    si   =-16
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a character")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# funcall
#    si   =-20
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_6123"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_6123":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_6124"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_6124":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr i
# emit-variable-ref
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -12(%esp), %eax  # stack load i
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg i
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr "arg must be a character"
# string literal
    jmp _L_6126
    .align 8,0x90
_L_6125 :
    .int 92
    .ascii "arg must be a character"
_L_6126:
    movl $_L_6125, %eax
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
_L_6121:
     movl %eax, eh$ucharacter
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == eliminate-shadowing  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == vectorize-letrec  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == eliminate-set!  ==>
# (lambda (i) (let ((i i)) (error (list-ref (primitives) i) "arg must be a pair")))
# == close-free-variables  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a pair")))
# == eliminate-quote  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a pair")))
# == eliminate-when/unless  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a pair")))
# == eliminate-cond  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a pair")))
# == external-symbols  ==>
# (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a pair")))
# emit-expr (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a pair")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a pair")))
    movl $_L_6127, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_6128            # jump around closure body
_L_6127:
# check argument count
    cmp $4,%eax
    je _L_6129
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_6129:
# emit-tail-expr
# si=-12
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a pair"))
# emit-tail-let
#  si   = -12
#  env  = ((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((i i))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a pair")
# emit-expr i
# emit-variable-ref
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -8(%esp), %eax  # stack load i
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a pair")
# emit-tail-funcall
#    si   =-16
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a pair")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# funcall
#    si   =-20
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_6130"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_6130":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_6131"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_6131":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr i
# emit-variable-ref
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -12(%esp), %eax  # stack load i
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg i
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr "arg must be a pair"
# string literal
    jmp _L_6133
    .align 8,0x90
_L_6132 :
    .int 72
    .ascii "arg must be a pair"
_L_6133:
    movl $_L_6132, %eax
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
_L_6128:
     movl %eax, eh$upair
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == eliminate-shadowing  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == vectorize-letrec  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == eliminate-set!  ==>
# (lambda (i) (let ((i i)) (error (list-ref (primitives) i) "arg must be a vector")))
# == close-free-variables  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a vector")))
# == eliminate-quote  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a vector")))
# == eliminate-when/unless  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a vector")))
# == eliminate-cond  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "arg must be a vector")))
# == external-symbols  ==>
# (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a vector")))
# emit-expr (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a vector")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a vector")))
    movl $_L_6134, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_6135            # jump around closure body
_L_6134:
# check argument count
    cmp $4,%eax
    je _L_6136
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_6136:
# emit-tail-expr
# si=-12
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a vector"))
# emit-tail-let
#  si   = -12
#  env  = ((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((i i))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a vector")
# emit-expr i
# emit-variable-ref
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -8(%esp), %eax  # stack load i
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a vector")
# emit-tail-funcall
#    si   =-16
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "arg must be a vector")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# funcall
#    si   =-20
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_6137"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_6137":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_6138"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_6138":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr i
# emit-variable-ref
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -12(%esp), %eax  # stack load i
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg i
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr "arg must be a vector"
# string literal
    jmp _L_6140
    .align 8,0x90
_L_6139 :
    .int 80
    .ascii "arg must be a vector"
_L_6140:
    movl $_L_6139, %eax
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
_L_6135:
     movl %eax, eh$uvector
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == eliminate-shadowing  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == vectorize-letrec  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == eliminate-set!  ==>
# (lambda (i) (let ((i i)) (error (list-ref (primitives) i) "length must be a fixnum >= 0")))
# == close-free-variables  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "length must be a fixnum >= 0")))
# == eliminate-quote  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "length must be a fixnum >= 0")))
# == eliminate-when/unless  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "length must be a fixnum >= 0")))
# == eliminate-cond  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "length must be a fixnum >= 0")))
# == external-symbols  ==>
# (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "length must be a fixnum >= 0")))
# emit-expr (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "length must be a fixnum >= 0")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "length must be a fixnum >= 0")))
    movl $_L_6141, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_6142            # jump around closure body
_L_6141:
# check argument count
    cmp $4,%eax
    je _L_6143
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_6143:
# emit-tail-expr
# si=-12
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "length must be a fixnum >= 0"))
# emit-tail-let
#  si   = -12
#  env  = ((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((i i))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "length must be a fixnum >= 0")
# emit-expr i
# emit-variable-ref
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -8(%esp), %eax  # stack load i
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "length must be a fixnum >= 0")
# emit-tail-funcall
#    si   =-16
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "length must be a fixnum >= 0")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# funcall
#    si   =-20
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_6144"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_6144":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_6145"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_6145":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr i
# emit-variable-ref
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -12(%esp), %eax  # stack load i
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg i
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr "length must be a fixnum >= 0"
# string literal
    jmp _L_6147
    .align 8,0x90
_L_6146 :
    .int 112
    .ascii "length must be a fixnum >= 0"
_L_6147:
    movl $_L_6146, %eax
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
_L_6142:
     movl %eax, eh$ulength
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-shadowing  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == vectorize-letrec  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-set!  ==>
# (lambda (i) (let ((i i)) (error (list-ref (primitives) i) "index out of bounds")))
# == close-free-variables  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "index out of bounds")))
# == eliminate-quote  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "index out of bounds")))
# == eliminate-when/unless  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "index out of bounds")))
# == eliminate-cond  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "index out of bounds")))
# == external-symbols  ==>
# (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "index out of bounds")))
# emit-expr (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "index out of bounds")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "index out of bounds")))
    movl $_L_6148, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_6149            # jump around closure body
_L_6148:
# check argument count
    cmp $4,%eax
    je _L_6150
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_6150:
# emit-tail-expr
# si=-12
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "index out of bounds"))
# emit-tail-let
#  si   = -12
#  env  = ((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((i i))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "index out of bounds")
# emit-expr i
# emit-variable-ref
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -8(%esp), %eax  # stack load i
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "index out of bounds")
# emit-tail-funcall
#    si   =-16
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "index out of bounds")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# funcall
#    si   =-20
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_6151"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_6151":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_6152"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_6152":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr i
# emit-variable-ref
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -12(%esp), %eax  # stack load i
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg i
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr "index out of bounds"
# string literal
    jmp _L_6154
    .align 8,0x90
_L_6153 :
    .int 76
    .ascii "index out of bounds"
_L_6154:
    movl $_L_6153, %eax
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
_L_6149:
     movl %eax, eh$uvector$uindex
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-shadowing  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == vectorize-letrec  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-set!  ==>
# (lambda (i) (let ((i i)) (error (list-ref (primitives) i) "index out of bounds")))
# == close-free-variables  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "index out of bounds")))
# == eliminate-quote  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "index out of bounds")))
# == eliminate-when/unless  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "index out of bounds")))
# == eliminate-cond  ==>
# (closure (i) (error list-ref primitives) (let ((i i)) (error (list-ref (primitives) i) "index out of bounds")))
# == external-symbols  ==>
# (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "index out of bounds")))
# emit-expr (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "index out of bounds")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (i) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "index out of bounds")))
    movl $_L_6155, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_6156            # jump around closure body
_L_6155:
# check argument count
    cmp $4,%eax
    je _L_6157
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_6157:
# emit-tail-expr
# si=-12
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((i i)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "index out of bounds"))
# emit-tail-let
#  si   = -12
#  env  = ((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((i i))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "index out of bounds")
# emit-expr i
# emit-variable-ref
# env=((i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -8(%esp), %eax  # stack load i
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "index out of bounds")
# emit-tail-funcall
#    si   =-16
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) i) "index out of bounds")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# funcall
#    si   =-20
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_6158"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_6158":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_6159"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_6159":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr i
# emit-variable-ref
# env=((i . -12) (i . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=i
    movl -12(%esp), %eax  # stack load i
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg i
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr "index out of bounds"
# string literal
    jmp _L_6161
    .align 8,0x90
_L_6160 :
    .int 76
    .ascii "index out of bounds"
_L_6161:
    movl $_L_6160, %eax
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
_L_6156:
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
