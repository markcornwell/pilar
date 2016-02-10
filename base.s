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
     .global "standard$mout"
     .align 8
standard$mout:
     .int 0xFF
     .global "current$moutput$mport"
     .align 8
current$moutput$mport:
     .int 0xFF
     .global "port$mfd"
     .align 8
port$mfd:
     .int 0xFF
     .global "port$mbuf"
     .align 8
port$mbuf:
     .int 0xFF
     .global "port$mndx"
     .align 8
port$mndx:
     .int 0xFF
     .global "port$mndx$madd1"
     .align 8
port$mndx$madd1:
     .int 0xFF
     .global "port$mndx$mreset"
     .align 8
port$mndx$mreset:
     .int 0xFF
     .global "port$msize"
     .align 8
port$msize:
     .int 0xFF
     .global "write$mchar"
     .align 8
write$mchar:
     .int 0xFF
     .global "flush$moutput$mport"
     .align 8
flush$moutput$mport:
     .int 0xFF
     .global "exit"
     .align 8
exit:
     .int 0xFF
     .global "output$mport$q"
     .align 8
output$mport$q:
     .int 0xFF
     .global "open$moutput$mfile"
     .align 8
open$moutput$mfile:
     .int 0xFF
     .global "close$moutput$mport"
     .align 8
close$moutput$mport:
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
# (let ((f8486 (cons (make-symbol "nil" ()) ()))) (lambda () f8486))
# == vectorize-letrec  ==>
# (let ((f8486 (cons (make-symbol "nil" ()) ()))) (lambda () f8486))
# == eliminate-set!  ==>
# (let ((f8486 (cons (make-symbol "nil" ()) ()))) (lambda () (let () f8486)))
# == close-free-variables  ==>
# (let ((f8486 (cons (make-symbol "nil" ()) ()))) (closure () (f8486) (let () f8486)))
# == eliminate-quote  ==>
# (let ((f8486 (cons (make-symbol "nil" ()) ()))) (closure () (f8486) (let () f8486)))
# == eliminate-when/unless  ==>
# (let ((f8486 (cons (make-symbol "nil" ()) ()))) (closure () (f8486) (let () f8486)))
# == eliminate-cond  ==>
# (let ((f8486 (cons (make-symbol "nil" ()) ()))) (closure () (f8486) (let () f8486)))
# == external-symbols  ==>
# (let ((f8486 (cons (make-symbol "nil" ()) ()))) (closure () (f8486) (let () f8486)))
# emit-expr (let ((f8486 (cons (make-symbol "nil" ()) ()))) (closure () (f8486) (let () f8486)))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f8486 (cons (make-symbol "nil" ()) ())))
#  body = (closure () (f8486) (let () f8486))
# emit-expr (cons (make-symbol "nil" ()) ())
# cons arg1=(make-symbol "nil" ()) arg2=()
# emit-expr (make-symbol "nil" ())
# make-symbol arg1="nil" arg2=()
# emit-expr "nil"
# string literal
    jmp _L_70134
    .align 8,0x90
_L_70133 :
    .int 12
    .ascii "nil"
_L_70134:
    movl $_L_70133, %eax
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
# emit-expr (closure () (f8486) (let () f8486))
# emit-closure
# si = -4
# env = ((f8486 . 0))
# expr = (closure () (f8486) (let () f8486))
    movl $_L_70135, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f8486 . 0))
# var=f8486
    movl 0(%esp), %eax  # stack load f8486
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f8486
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_70136            # jump around closure body
_L_70135:
# check argument count
    cmp $0,%eax
    je _L_70137
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_70137:
# emit-tail-expr
# si=-8
# env=((f8486 . 4) (f8486 . 0))
# expr=(let () f8486)
# emit-tail-let
#  si   = -8
#  env  = ((f8486 . 4) (f8486 . 0))
#  bindings = ()
#  body = f8486
# emit-tail-expr
# si=-8
# env=((f8486 . 4) (f8486 . 0))
# expr=f8486
# emit-tail-variable-ref
# emit-variable-ref
# env=((f8486 . 4) (f8486 . 0))
# var=f8486
    movl 2(%edi), %eax  # frame load f8486
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    .align 4,0x90
_L_70136:
     movl %eax, symbols
# == explicit-begins  ==>
# (letrec ((slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if (si= s1 s2 i) (si<n= s1 s2 (fx+ i 1) n) #f)))) (ss= (lambda (s1 s2) (if (slen= s1 s2) (si<n= s1 s2 0 (string-length s1)) #f)))) ss=)
# == eliminate-let*  ==>
# (letrec ((slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if (si= s1 s2 i) (si<n= s1 s2 (fx+ i 1) n) #f)))) (ss= (lambda (s1 s2) (if (slen= s1 s2) (si<n= s1 s2 0 (string-length s1)) #f)))) ss=)
# == uniquify-variables  ==>
# (letrec ((f8490 (lambda (f8511 f8512) (fx= (string-length f8511) (string-length f8512)))) (f8489 (lambda (f8508 f8509 f8510) (char=? (string-ref f8508 f8510) (string-ref f8509 f8510)))) (f8488 (lambda (f8504 f8505 f8506 f8507) (if (fx= f8506 f8507) #t (if (f8489 f8504 f8505 f8506) (f8488 f8504 f8505 (fx+ f8506 1) f8507) #f)))) (f8487 (lambda (f8502 f8503) (if (f8490 f8502 f8503) (f8488 f8502 f8503 0 (string-length f8502)) #f)))) f8487)
# == vectorize-letrec  ==>
# (let ((f8490 (make-vector 1)) (f8489 (make-vector 1)) (f8488 (make-vector 1)) (f8487 (make-vector 1))) (begin (begin (vector-set! f8490 0 (lambda (f8511 f8512) (fx= (string-length f8511) (string-length f8512)))) (vector-set! f8489 0 (lambda (f8508 f8509 f8510) (char=? (string-ref f8508 f8510) (string-ref f8509 f8510)))) (vector-set! f8488 0 (lambda (f8504 f8505 f8506 f8507) (if (fx= f8506 f8507) #t (if ((vector-ref f8489 0) f8504 f8505 f8506) ((vector-ref f8488 0) f8504 f8505 (fx+ f8506 1) f8507) #f)))) (vector-set! f8487 0 (lambda (f8502 f8503) (if ((vector-ref f8490 0) f8502 f8503) ((vector-ref f8488 0) f8502 f8503 0 (string-length f8502)) #f)))) (vector-ref f8487 0)))
# == eliminate-set!  ==>
# (let ((f8490 (make-vector 1)) (f8489 (make-vector 1)) (f8488 (make-vector 1)) (f8487 (make-vector 1))) (begin (begin (vector-set! f8490 0 (lambda (f8511 f8512) (let ((f8511 f8511) (f8512 f8512)) (fx= (string-length f8511) (string-length f8512))))) (vector-set! f8489 0 (lambda (f8508 f8509 f8510) (let ((f8508 f8508) (f8509 f8509) (f8510 f8510)) (char=? (string-ref f8508 f8510) (string-ref f8509 f8510))))) (vector-set! f8488 0 (lambda (f8504 f8505 f8506 f8507) (let ((f8504 f8504) (f8505 f8505) (f8506 f8506) (f8507 f8507)) (if (fx= f8506 f8507) #t (if ((vector-ref f8489 0) f8504 f8505 f8506) ((vector-ref f8488 0) f8504 f8505 (fx+ f8506 1) f8507) #f))))) (vector-set! f8487 0 (lambda (f8502 f8503) (let ((f8502 f8502) (f8503 f8503)) (if ((vector-ref f8490 0) f8502 f8503) ((vector-ref f8488 0) f8502 f8503 0 (string-length f8502)) #f))))) (vector-ref f8487 0)))
# == close-free-variables  ==>
# (let ((f8490 (make-vector 1)) (f8489 (make-vector 1)) (f8488 (make-vector 1)) (f8487 (make-vector 1))) (begin (begin (vector-set! f8490 0 (closure (f8511 f8512) () (let ((f8511 f8511) (f8512 f8512)) (fx= (string-length f8511) (string-length f8512))))) (vector-set! f8489 0 (closure (f8508 f8509 f8510) () (let ((f8508 f8508) (f8509 f8509) (f8510 f8510)) (char=? (string-ref f8508 f8510) (string-ref f8509 f8510))))) (vector-set! f8488 0 (closure (f8504 f8505 f8506 f8507) (f8489 f8488) (let ((f8504 f8504) (f8505 f8505) (f8506 f8506) (f8507 f8507)) (if (fx= f8506 f8507) #t (if ((vector-ref f8489 0) f8504 f8505 f8506) ((vector-ref f8488 0) f8504 f8505 (fx+ f8506 1) f8507) #f))))) (vector-set! f8487 0 (closure (f8502 f8503) (f8490 f8488) (let ((f8502 f8502) (f8503 f8503)) (if ((vector-ref f8490 0) f8502 f8503) ((vector-ref f8488 0) f8502 f8503 0 (string-length f8502)) #f))))) (vector-ref f8487 0)))
# == eliminate-quote  ==>
# (let ((f8490 (make-vector 1)) (f8489 (make-vector 1)) (f8488 (make-vector 1)) (f8487 (make-vector 1))) (begin (begin (vector-set! f8490 0 (closure (f8511 f8512) () (let ((f8511 f8511) (f8512 f8512)) (fx= (string-length f8511) (string-length f8512))))) (vector-set! f8489 0 (closure (f8508 f8509 f8510) () (let ((f8508 f8508) (f8509 f8509) (f8510 f8510)) (char=? (string-ref f8508 f8510) (string-ref f8509 f8510))))) (vector-set! f8488 0 (closure (f8504 f8505 f8506 f8507) (f8489 f8488) (let ((f8504 f8504) (f8505 f8505) (f8506 f8506) (f8507 f8507)) (if (fx= f8506 f8507) #t (if ((vector-ref f8489 0) f8504 f8505 f8506) ((vector-ref f8488 0) f8504 f8505 (fx+ f8506 1) f8507) #f))))) (vector-set! f8487 0 (closure (f8502 f8503) (f8490 f8488) (let ((f8502 f8502) (f8503 f8503)) (if ((vector-ref f8490 0) f8502 f8503) ((vector-ref f8488 0) f8502 f8503 0 (string-length f8502)) #f))))) (vector-ref f8487 0)))
# == eliminate-when/unless  ==>
# (let ((f8490 (make-vector 1)) (f8489 (make-vector 1)) (f8488 (make-vector 1)) (f8487 (make-vector 1))) (begin (begin (vector-set! f8490 0 (closure (f8511 f8512) () (let ((f8511 f8511) (f8512 f8512)) (fx= (string-length f8511) (string-length f8512))))) (vector-set! f8489 0 (closure (f8508 f8509 f8510) () (let ((f8508 f8508) (f8509 f8509) (f8510 f8510)) (char=? (string-ref f8508 f8510) (string-ref f8509 f8510))))) (vector-set! f8488 0 (closure (f8504 f8505 f8506 f8507) (f8489 f8488) (let ((f8504 f8504) (f8505 f8505) (f8506 f8506) (f8507 f8507)) (if (fx= f8506 f8507) #t (if ((vector-ref f8489 0) f8504 f8505 f8506) ((vector-ref f8488 0) f8504 f8505 (fx+ f8506 1) f8507) #f))))) (vector-set! f8487 0 (closure (f8502 f8503) (f8490 f8488) (let ((f8502 f8502) (f8503 f8503)) (if ((vector-ref f8490 0) f8502 f8503) ((vector-ref f8488 0) f8502 f8503 0 (string-length f8502)) #f))))) (vector-ref f8487 0)))
# == eliminate-cond  ==>
# (let ((f8490 (make-vector 1)) (f8489 (make-vector 1)) (f8488 (make-vector 1)) (f8487 (make-vector 1))) (begin (begin (vector-set! f8490 0 (closure (f8511 f8512) () (let ((f8511 f8511) (f8512 f8512)) (fx= (string-length f8511) (string-length f8512))))) (vector-set! f8489 0 (closure (f8508 f8509 f8510) () (let ((f8508 f8508) (f8509 f8509) (f8510 f8510)) (char=? (string-ref f8508 f8510) (string-ref f8509 f8510))))) (vector-set! f8488 0 (closure (f8504 f8505 f8506 f8507) (f8489 f8488) (let ((f8504 f8504) (f8505 f8505) (f8506 f8506) (f8507 f8507)) (if (fx= f8506 f8507) #t (if ((vector-ref f8489 0) f8504 f8505 f8506) ((vector-ref f8488 0) f8504 f8505 (fx+ f8506 1) f8507) #f))))) (vector-set! f8487 0 (closure (f8502 f8503) (f8490 f8488) (let ((f8502 f8502) (f8503 f8503)) (if ((vector-ref f8490 0) f8502 f8503) ((vector-ref f8488 0) f8502 f8503 0 (string-length f8502)) #f))))) (vector-ref f8487 0)))
# == external-symbols  ==>
# (let ((f8490 (make-vector 1)) (f8489 (make-vector 1)) (f8488 (make-vector 1)) (f8487 (make-vector 1))) (begin (begin (vector-set! f8490 0 (closure (f8511 f8512) () (let ((f8511 f8511) (f8512 f8512)) (fx= (string-length f8511) (string-length f8512))))) (vector-set! f8489 0 (closure (f8508 f8509 f8510) () (let ((f8508 f8508) (f8509 f8509) (f8510 f8510)) (char=? (string-ref f8508 f8510) (string-ref f8509 f8510))))) (vector-set! f8488 0 (closure (f8504 f8505 f8506 f8507) (f8489 f8488) (let ((f8504 f8504) (f8505 f8505) (f8506 f8506) (f8507 f8507)) (if (fx= f8506 f8507) #t (if ((vector-ref f8489 0) f8504 f8505 f8506) ((vector-ref f8488 0) f8504 f8505 (fx+ f8506 1) f8507) #f))))) (vector-set! f8487 0 (closure (f8502 f8503) (f8490 f8488) (let ((f8502 f8502) (f8503 f8503)) (if ((vector-ref f8490 0) f8502 f8503) ((vector-ref f8488 0) f8502 f8503 0 (string-length f8502)) #f))))) (vector-ref f8487 0)))
# emit-expr (let ((f8490 (make-vector 1)) (f8489 (make-vector 1)) (f8488 (make-vector 1)) (f8487 (make-vector 1))) (begin (begin (vector-set! f8490 0 (closure (f8511 f8512) () (let ((f8511 f8511) (f8512 f8512)) (fx= (string-length f8511) (string-length f8512))))) (vector-set! f8489 0 (closure (f8508 f8509 f8510) () (let ((f8508 f8508) (f8509 f8509) (f8510 f8510)) (char=? (string-ref f8508 f8510) (string-ref f8509 f8510))))) (vector-set! f8488 0 (closure (f8504 f8505 f8506 f8507) (f8489 f8488) (let ((f8504 f8504) (f8505 f8505) (f8506 f8506) (f8507 f8507)) (if (fx= f8506 f8507) #t (if ((vector-ref f8489 0) f8504 f8505 f8506) ((vector-ref f8488 0) f8504 f8505 (fx+ f8506 1) f8507) #f))))) (vector-set! f8487 0 (closure (f8502 f8503) (f8490 f8488) (let ((f8502 f8502) (f8503 f8503)) (if ((vector-ref f8490 0) f8502 f8503) ((vector-ref f8488 0) f8502 f8503 0 (string-length f8502)) #f))))) (vector-ref f8487 0)))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f8490 (make-vector 1)) (f8489 (make-vector 1)) (f8488 (make-vector 1)) (f8487 (make-vector 1)))
#  body = (begin (begin (vector-set! f8490 0 (closure (f8511 f8512) () (let ((f8511 f8511) (f8512 f8512)) (fx= (string-length f8511) (string-length f8512))))) (vector-set! f8489 0 (closure (f8508 f8509 f8510) () (let ((f8508 f8508) (f8509 f8509) (f8510 f8510)) (char=? (string-ref f8508 f8510) (string-ref f8509 f8510))))) (vector-set! f8488 0 (closure (f8504 f8505 f8506 f8507) (f8489 f8488) (let ((f8504 f8504) (f8505 f8505) (f8506 f8506) (f8507 f8507)) (if (fx= f8506 f8507) #t (if ((vector-ref f8489 0) f8504 f8505 f8506) ((vector-ref f8488 0) f8504 f8505 (fx+ f8506 1) f8507) #f))))) (vector-set! f8487 0 (closure (f8502 f8503) (f8490 f8488) (let ((f8502 f8502) (f8503 f8503)) (if ((vector-ref f8490 0) f8502 f8503) ((vector-ref f8488 0) f8502 f8503 0 (string-length f8502)) #f))))) (vector-ref f8487 0))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70138"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70138:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_70139
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70139:
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
    je "_L_70140"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70140:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_70141
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70141:
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
    je "_L_70142"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70142:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_70143
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70143:
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
    je "_L_70144"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70144:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_70145
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70145:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, -12(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f8490 0 (closure (f8511 f8512) () (let ((f8511 f8511) (f8512 f8512)) (fx= (string-length f8511) (string-length f8512))))) (vector-set! f8489 0 (closure (f8508 f8509 f8510) () (let ((f8508 f8508) (f8509 f8509) (f8510 f8510)) (char=? (string-ref f8508 f8510) (string-ref f8509 f8510))))) (vector-set! f8488 0 (closure (f8504 f8505 f8506 f8507) (f8489 f8488) (let ((f8504 f8504) (f8505 f8505) (f8506 f8506) (f8507 f8507)) (if (fx= f8506 f8507) #t (if ((vector-ref f8489 0) f8504 f8505 f8506) ((vector-ref f8488 0) f8504 f8505 (fx+ f8506 1) f8507) #f))))) (vector-set! f8487 0 (closure (f8502 f8503) (f8490 f8488) (let ((f8502 f8502) (f8503 f8503)) (if ((vector-ref f8490 0) f8502 f8503) ((vector-ref f8488 0) f8502 f8503 0 (string-length f8502)) #f))))) (vector-ref f8487 0))
# emit-begin
#   expr=(begin (begin (vector-set! f8490 0 (closure (f8511 f8512) () (let ((f8511 f8511) (f8512 f8512)) (fx= (string-length f8511) (string-length f8512))))) (vector-set! f8489 0 (closure (f8508 f8509 f8510) () (let ((f8508 f8508) (f8509 f8509) (f8510 f8510)) (char=? (string-ref f8508 f8510) (string-ref f8509 f8510))))) (vector-set! f8488 0 (closure (f8504 f8505 f8506 f8507) (f8489 f8488) (let ((f8504 f8504) (f8505 f8505) (f8506 f8506) (f8507 f8507)) (if (fx= f8506 f8507) #t (if ((vector-ref f8489 0) f8504 f8505 f8506) ((vector-ref f8488 0) f8504 f8505 (fx+ f8506 1) f8507) #f))))) (vector-set! f8487 0 (closure (f8502 f8503) (f8490 f8488) (let ((f8502 f8502) (f8503 f8503)) (if ((vector-ref f8490 0) f8502 f8503) ((vector-ref f8488 0) f8502 f8503 0 (string-length f8502)) #f))))) (vector-ref f8487 0))
#   env=((f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# emit-expr (begin (vector-set! f8490 0 (closure (f8511 f8512) () (let ((f8511 f8511) (f8512 f8512)) (fx= (string-length f8511) (string-length f8512))))) (vector-set! f8489 0 (closure (f8508 f8509 f8510) () (let ((f8508 f8508) (f8509 f8509) (f8510 f8510)) (char=? (string-ref f8508 f8510) (string-ref f8509 f8510))))) (vector-set! f8488 0 (closure (f8504 f8505 f8506 f8507) (f8489 f8488) (let ((f8504 f8504) (f8505 f8505) (f8506 f8506) (f8507 f8507)) (if (fx= f8506 f8507) #t (if ((vector-ref f8489 0) f8504 f8505 f8506) ((vector-ref f8488 0) f8504 f8505 (fx+ f8506 1) f8507) #f))))) (vector-set! f8487 0 (closure (f8502 f8503) (f8490 f8488) (let ((f8502 f8502) (f8503 f8503)) (if ((vector-ref f8490 0) f8502 f8503) ((vector-ref f8488 0) f8502 f8503 0 (string-length f8502)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f8490 0 (closure (f8511 f8512) () (let ((f8511 f8511) (f8512 f8512)) (fx= (string-length f8511) (string-length f8512))))) (vector-set! f8489 0 (closure (f8508 f8509 f8510) () (let ((f8508 f8508) (f8509 f8509) (f8510 f8510)) (char=? (string-ref f8508 f8510) (string-ref f8509 f8510))))) (vector-set! f8488 0 (closure (f8504 f8505 f8506 f8507) (f8489 f8488) (let ((f8504 f8504) (f8505 f8505) (f8506 f8506) (f8507 f8507)) (if (fx= f8506 f8507) #t (if ((vector-ref f8489 0) f8504 f8505 f8506) ((vector-ref f8488 0) f8504 f8505 (fx+ f8506 1) f8507) #f))))) (vector-set! f8487 0 (closure (f8502 f8503) (f8490 f8488) (let ((f8502 f8502) (f8503 f8503)) (if ((vector-ref f8490 0) f8502 f8503) ((vector-ref f8488 0) f8502 f8503 0 (string-length f8502)) #f)))))
#   env=((f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# emit-expr (vector-set! f8490 0 (closure (f8511 f8512) () (let ((f8511 f8511) (f8512 f8512)) (fx= (string-length f8511) (string-length f8512)))))
# emit-expr f8490
# emit-variable-ref
# env=((f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8490
    movl 0(%esp), %eax  # stack load f8490
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70146
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70146:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70147"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70147:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70149
    cmp  $0,%eax
    jge _L_70148
_L_70149:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70148:
    movl %eax, -20(%esp)
# emit-expr (closure (f8511 f8512) () (let ((f8511 f8511) (f8512 f8512)) (fx= (string-length f8511) (string-length f8512))))
# emit-closure
# si = -24
# env = ((f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# expr = (closure (f8511 f8512) () (let ((f8511 f8511) (f8512 f8512)) (fx= (string-length f8511) (string-length f8512))))
    movl $_L_70150, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_70151            # jump around closure body
_L_70150:
# check argument count
    cmp $8,%eax
    je _L_70152
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_70152:
# emit-tail-expr
# si=-16
# env=((f8512 . -12) (f8511 . -8) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# expr=(let ((f8511 f8511) (f8512 f8512)) (fx= (string-length f8511) (string-length f8512)))
# emit-tail-let
#  si   = -16
#  env  = ((f8512 . -12) (f8511 . -8) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
#  bindings = ((f8511 f8511) (f8512 f8512))
#  body = (fx= (string-length f8511) (string-length f8512))
# emit-expr f8511
# emit-variable-ref
# env=((f8512 . -12) (f8511 . -8) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8511
    movl -8(%esp), %eax  # stack load f8511
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f8512
# emit-variable-ref
# env=((f8512 . -12) (f8511 . -8) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8512
    movl -12(%esp), %eax  # stack load f8512
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f8512 . -20) (f8511 . -16) (f8512 . -12) (f8511 . -8) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# expr=(fx= (string-length f8511) (string-length f8512))
# tail primcall
# emit-expr (string-length f8512)
# emit-expr f8512
# emit-variable-ref
# env=((f8512 . -20) (f8511 . -16) (f8512 . -12) (f8511 . -8) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8512
    movl -20(%esp), %eax  # stack load f8512
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_70153
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70153:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70154"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70154:
    movl %eax, -24(%esp)
# emit-expr (string-length f8511)
# emit-expr f8511
# emit-variable-ref
# env=((f8512 . -20) (f8511 . -16) (f8512 . -12) (f8511 . -8) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8511
    movl -16(%esp), %eax  # stack load f8511
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_70155
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70155:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70156"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70156:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (fx= (string-length f8511) (string-length f8512))
    ret
    .align 4,0x90
_L_70151:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f8489 0 (closure (f8508 f8509 f8510) () (let ((f8508 f8508) (f8509 f8509) (f8510 f8510)) (char=? (string-ref f8508 f8510) (string-ref f8509 f8510))))) (vector-set! f8488 0 (closure (f8504 f8505 f8506 f8507) (f8489 f8488) (let ((f8504 f8504) (f8505 f8505) (f8506 f8506) (f8507 f8507)) (if (fx= f8506 f8507) #t (if ((vector-ref f8489 0) f8504 f8505 f8506) ((vector-ref f8488 0) f8504 f8505 (fx+ f8506 1) f8507) #f))))) (vector-set! f8487 0 (closure (f8502 f8503) (f8490 f8488) (let ((f8502 f8502) (f8503 f8503)) (if ((vector-ref f8490 0) f8502 f8503) ((vector-ref f8488 0) f8502 f8503 0 (string-length f8502)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f8489 0 (closure (f8508 f8509 f8510) () (let ((f8508 f8508) (f8509 f8509) (f8510 f8510)) (char=? (string-ref f8508 f8510) (string-ref f8509 f8510))))) (vector-set! f8488 0 (closure (f8504 f8505 f8506 f8507) (f8489 f8488) (let ((f8504 f8504) (f8505 f8505) (f8506 f8506) (f8507 f8507)) (if (fx= f8506 f8507) #t (if ((vector-ref f8489 0) f8504 f8505 f8506) ((vector-ref f8488 0) f8504 f8505 (fx+ f8506 1) f8507) #f))))) (vector-set! f8487 0 (closure (f8502 f8503) (f8490 f8488) (let ((f8502 f8502) (f8503 f8503)) (if ((vector-ref f8490 0) f8502 f8503) ((vector-ref f8488 0) f8502 f8503 0 (string-length f8502)) #f)))))
#   env=((f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# emit-expr (vector-set! f8489 0 (closure (f8508 f8509 f8510) () (let ((f8508 f8508) (f8509 f8509) (f8510 f8510)) (char=? (string-ref f8508 f8510) (string-ref f8509 f8510)))))
# emit-expr f8489
# emit-variable-ref
# env=((f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8489
    movl -4(%esp), %eax  # stack load f8489
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70157
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70157:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70158"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70158:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70160
    cmp  $0,%eax
    jge _L_70159
_L_70160:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70159:
    movl %eax, -20(%esp)
# emit-expr (closure (f8508 f8509 f8510) () (let ((f8508 f8508) (f8509 f8509) (f8510 f8510)) (char=? (string-ref f8508 f8510) (string-ref f8509 f8510))))
# emit-closure
# si = -24
# env = ((f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# expr = (closure (f8508 f8509 f8510) () (let ((f8508 f8508) (f8509 f8509) (f8510 f8510)) (char=? (string-ref f8508 f8510) (string-ref f8509 f8510))))
    movl $_L_70161, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_70162            # jump around closure body
_L_70161:
# check argument count
    cmp $12,%eax
    je _L_70163
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_70163:
# emit-tail-expr
# si=-20
# env=((f8510 . -16) (f8509 . -12) (f8508 . -8) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# expr=(let ((f8508 f8508) (f8509 f8509) (f8510 f8510)) (char=? (string-ref f8508 f8510) (string-ref f8509 f8510)))
# emit-tail-let
#  si   = -20
#  env  = ((f8510 . -16) (f8509 . -12) (f8508 . -8) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
#  bindings = ((f8508 f8508) (f8509 f8509) (f8510 f8510))
#  body = (char=? (string-ref f8508 f8510) (string-ref f8509 f8510))
# emit-expr f8508
# emit-variable-ref
# env=((f8510 . -16) (f8509 . -12) (f8508 . -8) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8508
    movl -8(%esp), %eax  # stack load f8508
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr f8509
# emit-variable-ref
# env=((f8510 . -16) (f8509 . -12) (f8508 . -8) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8509
    movl -12(%esp), %eax  # stack load f8509
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f8510
# emit-variable-ref
# env=((f8510 . -16) (f8509 . -12) (f8508 . -8) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8510
    movl -16(%esp), %eax  # stack load f8510
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((f8510 . -28) (f8509 . -24) (f8508 . -20) (f8510 . -16) (f8509 . -12) (f8508 . -8) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# expr=(char=? (string-ref f8508 f8510) (string-ref f8509 f8510))
# tail primcall
# char= c1=(string-ref f8508 f8510) c2=(string-ref f8509 f8510)
# emit-expr (string-ref f8508 f8510)
# emit-expr f8508
# emit-variable-ref
# env=((f8510 . -28) (f8509 . -24) (f8508 . -20) (f8510 . -16) (f8509 . -12) (f8508 . -8) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8508
    movl -20(%esp), %eax  # stack load f8508
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_70164
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $156,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70164:
    movl %eax, -32(%esp)
# emit-expr f8510
# emit-variable-ref
# env=((f8510 . -28) (f8509 . -24) (f8508 . -20) (f8510 . -16) (f8509 . -12) (f8508 . -8) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8510
    movl -28(%esp), %eax  # stack load f8510
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70165"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $156,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70165:
# check bounds on string index
    movl -32(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_70167
    cmp  $0,%eax
    jge _L_70166
_L_70167:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $156,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70166:
    sar $2, %eax
    movl -32(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_70168"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70168:
    movb %ah, -32(%esp)
# emit-expr (string-ref f8509 f8510)
# emit-expr f8509
# emit-variable-ref
# env=((f8510 . -28) (f8509 . -24) (f8508 . -20) (f8510 . -16) (f8509 . -12) (f8508 . -8) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8509
    movl -24(%esp), %eax  # stack load f8509
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_70169
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $156,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70169:
    movl %eax, -36(%esp)
# emit-expr f8510
# emit-variable-ref
# env=((f8510 . -28) (f8509 . -24) (f8508 . -20) (f8510 . -16) (f8509 . -12) (f8508 . -8) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8510
    movl -28(%esp), %eax  # stack load f8510
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70170"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $156,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70170:
# check bounds on string index
    movl -36(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_70172
    cmp  $0,%eax
    jge _L_70171
_L_70172:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $156,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70171:
    sar $2, %eax
    movl -36(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_70173"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70173:
    cmp %ah, -32(%esp)
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (char=? (string-ref f8508 f8510) (string-ref f8509 f8510))
    ret
    .align 4,0x90
_L_70162:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f8488 0 (closure (f8504 f8505 f8506 f8507) (f8489 f8488) (let ((f8504 f8504) (f8505 f8505) (f8506 f8506) (f8507 f8507)) (if (fx= f8506 f8507) #t (if ((vector-ref f8489 0) f8504 f8505 f8506) ((vector-ref f8488 0) f8504 f8505 (fx+ f8506 1) f8507) #f))))) (vector-set! f8487 0 (closure (f8502 f8503) (f8490 f8488) (let ((f8502 f8502) (f8503 f8503)) (if ((vector-ref f8490 0) f8502 f8503) ((vector-ref f8488 0) f8502 f8503 0 (string-length f8502)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f8488 0 (closure (f8504 f8505 f8506 f8507) (f8489 f8488) (let ((f8504 f8504) (f8505 f8505) (f8506 f8506) (f8507 f8507)) (if (fx= f8506 f8507) #t (if ((vector-ref f8489 0) f8504 f8505 f8506) ((vector-ref f8488 0) f8504 f8505 (fx+ f8506 1) f8507) #f))))) (vector-set! f8487 0 (closure (f8502 f8503) (f8490 f8488) (let ((f8502 f8502) (f8503 f8503)) (if ((vector-ref f8490 0) f8502 f8503) ((vector-ref f8488 0) f8502 f8503 0 (string-length f8502)) #f)))))
#   env=((f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# emit-expr (vector-set! f8488 0 (closure (f8504 f8505 f8506 f8507) (f8489 f8488) (let ((f8504 f8504) (f8505 f8505) (f8506 f8506) (f8507 f8507)) (if (fx= f8506 f8507) #t (if ((vector-ref f8489 0) f8504 f8505 f8506) ((vector-ref f8488 0) f8504 f8505 (fx+ f8506 1) f8507) #f)))))
# emit-expr f8488
# emit-variable-ref
# env=((f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8488
    movl -8(%esp), %eax  # stack load f8488
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70174
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70174:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70175"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70175:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70177
    cmp  $0,%eax
    jge _L_70176
_L_70177:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70176:
    movl %eax, -20(%esp)
# emit-expr (closure (f8504 f8505 f8506 f8507) (f8489 f8488) (let ((f8504 f8504) (f8505 f8505) (f8506 f8506) (f8507 f8507)) (if (fx= f8506 f8507) #t (if ((vector-ref f8489 0) f8504 f8505 f8506) ((vector-ref f8488 0) f8504 f8505 (fx+ f8506 1) f8507) #f))))
# emit-closure
# si = -24
# env = ((f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# expr = (closure (f8504 f8505 f8506 f8507) (f8489 f8488) (let ((f8504 f8504) (f8505 f8505) (f8506 f8506) (f8507 f8507)) (if (fx= f8506 f8507) #t (if ((vector-ref f8489 0) f8504 f8505 f8506) ((vector-ref f8488 0) f8504 f8505 (fx+ f8506 1) f8507) #f))))
    movl $_L_70178, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8489
    movl -4(%esp), %eax  # stack load f8489
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f8489
# emit-variable-ref
# env=((f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8488
    movl -8(%esp), %eax  # stack load f8488
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f8488
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_70179            # jump around closure body
_L_70178:
# check argument count
    cmp $16,%eax
    je _L_70180
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_70180:
# emit-tail-expr
# si=-24
# env=((f8507 . -20) (f8506 . -16) (f8505 . -12) (f8504 . -8) (f8488 . 8) (f8489 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# expr=(let ((f8504 f8504) (f8505 f8505) (f8506 f8506) (f8507 f8507)) (if (fx= f8506 f8507) #t (if ((vector-ref f8489 0) f8504 f8505 f8506) ((vector-ref f8488 0) f8504 f8505 (fx+ f8506 1) f8507) #f)))
# emit-tail-let
#  si   = -24
#  env  = ((f8507 . -20) (f8506 . -16) (f8505 . -12) (f8504 . -8) (f8488 . 8) (f8489 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
#  bindings = ((f8504 f8504) (f8505 f8505) (f8506 f8506) (f8507 f8507))
#  body = (if (fx= f8506 f8507) #t (if ((vector-ref f8489 0) f8504 f8505 f8506) ((vector-ref f8488 0) f8504 f8505 (fx+ f8506 1) f8507) #f))
# emit-expr f8504
# emit-variable-ref
# env=((f8507 . -20) (f8506 . -16) (f8505 . -12) (f8504 . -8) (f8488 . 8) (f8489 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8504
    movl -8(%esp), %eax  # stack load f8504
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f8505
# emit-variable-ref
# env=((f8507 . -20) (f8506 . -16) (f8505 . -12) (f8504 . -8) (f8488 . 8) (f8489 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8505
    movl -12(%esp), %eax  # stack load f8505
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-expr f8506
# emit-variable-ref
# env=((f8507 . -20) (f8506 . -16) (f8505 . -12) (f8504 . -8) (f8488 . 8) (f8489 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8506
    movl -16(%esp), %eax  # stack load f8506
# end emit-variable-ref
    movl %eax, -32(%esp)  # stack save
# emit-expr f8507
# emit-variable-ref
# env=((f8507 . -20) (f8506 . -16) (f8505 . -12) (f8504 . -8) (f8488 . 8) (f8489 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8507
    movl -20(%esp), %eax  # stack load f8507
# end emit-variable-ref
    movl %eax, -36(%esp)  # stack save
# emit-tail-expr
# si=-40
# env=((f8507 . -36) (f8506 . -32) (f8505 . -28) (f8504 . -24) (f8507 . -20) (f8506 . -16) (f8505 . -12) (f8504 . -8) (f8488 . 8) (f8489 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# expr=(if (fx= f8506 f8507) #t (if ((vector-ref f8489 0) f8504 f8505 f8506) ((vector-ref f8488 0) f8504 f8505 (fx+ f8506 1) f8507) #f))
# emit-expr (fx= f8506 f8507)
# emit-expr f8507
# emit-variable-ref
# env=((f8507 . -36) (f8506 . -32) (f8505 . -28) (f8504 . -24) (f8507 . -20) (f8506 . -16) (f8505 . -12) (f8504 . -8) (f8488 . 8) (f8489 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8507
    movl -36(%esp), %eax  # stack load f8507
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70183"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70183:
    movl %eax, -40(%esp)
# emit-expr f8506
# emit-variable-ref
# env=((f8507 . -36) (f8506 . -32) (f8505 . -28) (f8504 . -24) (f8507 . -20) (f8506 . -16) (f8505 . -12) (f8504 . -8) (f8488 . 8) (f8489 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8506
    movl -32(%esp), %eax  # stack load f8506
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70184"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70184:
    cmp -40(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_70181
# emit-tail-expr
# si=-40
# env=((f8507 . -36) (f8506 . -32) (f8505 . -28) (f8504 . -24) (f8507 . -20) (f8506 . -16) (f8505 . -12) (f8504 . -8) (f8488 . 8) (f8489 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# expr=#t
    movl $111, %eax     # immed #t
    ret                  # immediate tail return
    jmp _L_70182
_L_70181:
# emit-tail-expr
# si=-40
# env=((f8507 . -36) (f8506 . -32) (f8505 . -28) (f8504 . -24) (f8507 . -20) (f8506 . -16) (f8505 . -12) (f8504 . -8) (f8488 . 8) (f8489 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# expr=(if ((vector-ref f8489 0) f8504 f8505 f8506) ((vector-ref f8488 0) f8504 f8505 (fx+ f8506 1) f8507) #f)
# emit-expr ((vector-ref f8489 0) f8504 f8505 f8506)
# funcall
#    si   =-40
#    env  = ((f8507 . -36) (f8506 . -32) (f8505 . -28) (f8504 . -24) (f8507 . -20) (f8506 . -16) (f8505 . -12) (f8504 . -8) (f8488 . 8) (f8489 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
#    expr = (funcall (vector-ref f8489 0) f8504 f8505 f8506)
# emit-expr (vector-ref f8489 0)
# emit-expr f8489
# emit-variable-ref
# env=((f8507 . -36) (f8506 . -32) (f8505 . -28) (f8504 . -24) (f8507 . -20) (f8506 . -16) (f8505 . -12) (f8504 . -8) (f8488 . 8) (f8489 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8489
    movl 2(%edi), %eax  # frame load f8489
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70187
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70187:
    movl %eax, -48(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70188"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70188:
# check bounds on vector index
    movl -48(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70190
    cmp  $0,%eax
    jge _L_70189
_L_70190:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70189:
    movl -48(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70191"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70191":
   movl %eax,  -48(%esp)  # stash funcall-oper in closure slot
# emit-expr f8504
# emit-variable-ref
# env=((f8507 . -36) (f8506 . -32) (f8505 . -28) (f8504 . -24) (f8507 . -20) (f8506 . -16) (f8505 . -12) (f8504 . -8) (f8488 . 8) (f8489 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8504
    movl -24(%esp), %eax  # stack load f8504
# end emit-variable-ref
    mov %eax, -52(%esp)  # arg f8504
# emit-expr f8505
# emit-variable-ref
# env=((f8507 . -36) (f8506 . -32) (f8505 . -28) (f8504 . -24) (f8507 . -20) (f8506 . -16) (f8505 . -12) (f8504 . -8) (f8488 . 8) (f8489 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8505
    movl -28(%esp), %eax  # stack load f8505
# end emit-variable-ref
    mov %eax, -56(%esp)  # arg f8505
# emit-expr f8506
# emit-variable-ref
# env=((f8507 . -36) (f8506 . -32) (f8505 . -28) (f8504 . -24) (f8507 . -20) (f8506 . -16) (f8505 . -12) (f8504 . -8) (f8488 . 8) (f8489 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8506
    movl -32(%esp), %eax  # stack load f8506
# end emit-variable-ref
    mov %eax, -60(%esp)  # arg f8506
    movl -48(%esp), %edi   # load new closure to %edi
    add $-40, %esp   # adjust base
    movl $12,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $40, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_70185
# emit-tail-expr
# si=-40
# env=((f8507 . -36) (f8506 . -32) (f8505 . -28) (f8504 . -24) (f8507 . -20) (f8506 . -16) (f8505 . -12) (f8504 . -8) (f8488 . 8) (f8489 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# expr=((vector-ref f8488 0) f8504 f8505 (fx+ f8506 1) f8507)
# emit-tail-funcall
#    si   =-40
#    env  = ((f8507 . -36) (f8506 . -32) (f8505 . -28) (f8504 . -24) (f8507 . -20) (f8506 . -16) (f8505 . -12) (f8504 . -8) (f8488 . 8) (f8489 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
#    expr = (funcall (vector-ref f8488 0) f8504 f8505 (fx+ f8506 1) f8507)
# emit-expr (vector-ref f8488 0)
# emit-expr f8488
# emit-variable-ref
# env=((f8507 . -36) (f8506 . -32) (f8505 . -28) (f8504 . -24) (f8507 . -20) (f8506 . -16) (f8505 . -12) (f8504 . -8) (f8488 . 8) (f8489 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8488
    movl 6(%edi), %eax  # frame load f8488
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70192
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70192:
    movl %eax, -40(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70193"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70193:
# check bounds on vector index
    movl -40(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70195
    cmp  $0,%eax
    jge _L_70194
_L_70195:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70194:
    movl -40(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -40(%esp)  # stash funcall-oper in next closure slot
# emit-expr f8504
# emit-variable-ref
# env=((f8507 . -36) (f8506 . -32) (f8505 . -28) (f8504 . -24) (f8507 . -20) (f8506 . -16) (f8505 . -12) (f8504 . -8) (f8488 . 8) (f8489 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8504
    movl -24(%esp), %eax  # stack load f8504
# end emit-variable-ref
    mov %eax, -44(%esp)    # arg f8504
# emit-expr f8505
# emit-variable-ref
# env=((f8507 . -36) (f8506 . -32) (f8505 . -28) (f8504 . -24) (f8507 . -20) (f8506 . -16) (f8505 . -12) (f8504 . -8) (f8488 . 8) (f8489 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8505
    movl -28(%esp), %eax  # stack load f8505
# end emit-variable-ref
    mov %eax, -48(%esp)    # arg f8505
# emit-expr (fx+ f8506 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70196"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70196:
    movl %eax, -52(%esp)  # fx+ push arg1
# emit-expr f8506
# emit-variable-ref
# env=((f8507 . -36) (f8506 . -32) (f8505 . -28) (f8504 . -24) (f8507 . -20) (f8506 . -16) (f8505 . -12) (f8504 . -8) (f8488 . 8) (f8489 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8506
    movl -32(%esp), %eax  # stack load f8506
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70197"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70197:
    addl -52(%esp), %eax  # fx+ arg1 arg2
    mov %eax, -52(%esp)    # arg (fx+ f8506 1)
# emit-expr f8507
# emit-variable-ref
# env=((f8507 . -36) (f8506 . -32) (f8505 . -28) (f8504 . -24) (f8507 . -20) (f8506 . -16) (f8505 . -12) (f8504 . -8) (f8488 . 8) (f8489 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8507
    movl -36(%esp), %eax  # stack load f8507
# end emit-variable-ref
    mov %eax, -56(%esp)    # arg f8507
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
    jmp _L_70186
_L_70185:
# emit-tail-expr
# si=-40
# env=((f8507 . -36) (f8506 . -32) (f8505 . -28) (f8504 . -24) (f8507 . -20) (f8506 . -16) (f8505 . -12) (f8504 . -8) (f8488 . 8) (f8489 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_70186:
_L_70182:
    .align 4,0x90
_L_70179:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f8487 0 (closure (f8502 f8503) (f8490 f8488) (let ((f8502 f8502) (f8503 f8503)) (if ((vector-ref f8490 0) f8502 f8503) ((vector-ref f8488 0) f8502 f8503 0 (string-length f8502)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f8487 0 (closure (f8502 f8503) (f8490 f8488) (let ((f8502 f8502) (f8503 f8503)) (if ((vector-ref f8490 0) f8502 f8503) ((vector-ref f8488 0) f8502 f8503 0 (string-length f8502)) #f)))))
#   env=((f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# emit-expr (vector-set! f8487 0 (closure (f8502 f8503) (f8490 f8488) (let ((f8502 f8502) (f8503 f8503)) (if ((vector-ref f8490 0) f8502 f8503) ((vector-ref f8488 0) f8502 f8503 0 (string-length f8502)) #f))))
# emit-expr f8487
# emit-variable-ref
# env=((f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8487
    movl -12(%esp), %eax  # stack load f8487
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70198
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70198:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70199"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70199:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70201
    cmp  $0,%eax
    jge _L_70200
_L_70201:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70200:
    movl %eax, -20(%esp)
# emit-expr (closure (f8502 f8503) (f8490 f8488) (let ((f8502 f8502) (f8503 f8503)) (if ((vector-ref f8490 0) f8502 f8503) ((vector-ref f8488 0) f8502 f8503 0 (string-length f8502)) #f)))
# emit-closure
# si = -24
# env = ((f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# expr = (closure (f8502 f8503) (f8490 f8488) (let ((f8502 f8502) (f8503 f8503)) (if ((vector-ref f8490 0) f8502 f8503) ((vector-ref f8488 0) f8502 f8503 0 (string-length f8502)) #f)))
    movl $_L_70202, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8490
    movl 0(%esp), %eax  # stack load f8490
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f8490
# emit-variable-ref
# env=((f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8488
    movl -8(%esp), %eax  # stack load f8488
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f8488
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_70203            # jump around closure body
_L_70202:
# check argument count
    cmp $8,%eax
    je _L_70204
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_70204:
# emit-tail-expr
# si=-16
# env=((f8503 . -12) (f8502 . -8) (f8488 . 8) (f8490 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# expr=(let ((f8502 f8502) (f8503 f8503)) (if ((vector-ref f8490 0) f8502 f8503) ((vector-ref f8488 0) f8502 f8503 0 (string-length f8502)) #f))
# emit-tail-let
#  si   = -16
#  env  = ((f8503 . -12) (f8502 . -8) (f8488 . 8) (f8490 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
#  bindings = ((f8502 f8502) (f8503 f8503))
#  body = (if ((vector-ref f8490 0) f8502 f8503) ((vector-ref f8488 0) f8502 f8503 0 (string-length f8502)) #f)
# emit-expr f8502
# emit-variable-ref
# env=((f8503 . -12) (f8502 . -8) (f8488 . 8) (f8490 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8502
    movl -8(%esp), %eax  # stack load f8502
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f8503
# emit-variable-ref
# env=((f8503 . -12) (f8502 . -8) (f8488 . 8) (f8490 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8503
    movl -12(%esp), %eax  # stack load f8503
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f8503 . -20) (f8502 . -16) (f8503 . -12) (f8502 . -8) (f8488 . 8) (f8490 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# expr=(if ((vector-ref f8490 0) f8502 f8503) ((vector-ref f8488 0) f8502 f8503 0 (string-length f8502)) #f)
# emit-expr ((vector-ref f8490 0) f8502 f8503)
# funcall
#    si   =-24
#    env  = ((f8503 . -20) (f8502 . -16) (f8503 . -12) (f8502 . -8) (f8488 . 8) (f8490 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
#    expr = (funcall (vector-ref f8490 0) f8502 f8503)
# emit-expr (vector-ref f8490 0)
# emit-expr f8490
# emit-variable-ref
# env=((f8503 . -20) (f8502 . -16) (f8503 . -12) (f8502 . -8) (f8488 . 8) (f8490 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8490
    movl 2(%edi), %eax  # frame load f8490
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70207
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70207:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70208"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70208:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70210
    cmp  $0,%eax
    jge _L_70209
_L_70210:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70209:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70211"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70211":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f8502
# emit-variable-ref
# env=((f8503 . -20) (f8502 . -16) (f8503 . -12) (f8502 . -8) (f8488 . 8) (f8490 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8502
    movl -16(%esp), %eax  # stack load f8502
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f8502
# emit-expr f8503
# emit-variable-ref
# env=((f8503 . -20) (f8502 . -16) (f8503 . -12) (f8502 . -8) (f8488 . 8) (f8490 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8503
    movl -20(%esp), %eax  # stack load f8503
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg f8503
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_70205
# emit-tail-expr
# si=-24
# env=((f8503 . -20) (f8502 . -16) (f8503 . -12) (f8502 . -8) (f8488 . 8) (f8490 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# expr=((vector-ref f8488 0) f8502 f8503 0 (string-length f8502))
# emit-tail-funcall
#    si   =-24
#    env  = ((f8503 . -20) (f8502 . -16) (f8503 . -12) (f8502 . -8) (f8488 . 8) (f8490 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
#    expr = (funcall (vector-ref f8488 0) f8502 f8503 0 (string-length f8502))
# emit-expr (vector-ref f8488 0)
# emit-expr f8488
# emit-variable-ref
# env=((f8503 . -20) (f8502 . -16) (f8503 . -12) (f8502 . -8) (f8488 . 8) (f8490 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8488
    movl 6(%edi), %eax  # frame load f8488
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70212
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70212:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70213"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70213:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70215
    cmp  $0,%eax
    jge _L_70214
_L_70215:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70214:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr f8502
# emit-variable-ref
# env=((f8503 . -20) (f8502 . -16) (f8503 . -12) (f8502 . -8) (f8488 . 8) (f8490 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8502
    movl -16(%esp), %eax  # stack load f8502
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f8502
# emit-expr f8503
# emit-variable-ref
# env=((f8503 . -20) (f8502 . -16) (f8503 . -12) (f8502 . -8) (f8488 . 8) (f8490 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8503
    movl -20(%esp), %eax  # stack load f8503
# end emit-variable-ref
    mov %eax, -32(%esp)    # arg f8503
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -36(%esp)    # arg 0
# emit-expr (string-length f8502)
# emit-expr f8502
# emit-variable-ref
# env=((f8503 . -20) (f8502 . -16) (f8503 . -12) (f8502 . -8) (f8488 . 8) (f8490 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8502
    movl -16(%esp), %eax  # stack load f8502
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_70216
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70216:
    movl -6(%eax), %eax
    mov %eax, -40(%esp)    # arg (string-length f8502)
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
    jmp _L_70206
_L_70205:
# emit-tail-expr
# si=-24
# env=((f8503 . -20) (f8502 . -16) (f8503 . -12) (f8502 . -8) (f8488 . 8) (f8490 . 4) (f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_70206:
    .align 4,0x90
_L_70203:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# emit-expr (begin (vector-ref f8487 0))
# emit-begin
#   expr=(begin (vector-ref f8487 0))
#   env=((f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# emit-expr (vector-ref f8487 0)
# emit-expr f8487
# emit-variable-ref
# env=((f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
# var=f8487
    movl -12(%esp), %eax  # stack load f8487
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70217
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70217:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70218"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70218:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70220
    cmp  $0,%eax
    jge _L_70219
_L_70220:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70219:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f8487 . -12) (f8488 . -8) (f8489 . -4) (f8490 . 0))
     movl %eax, string$e$q
# == explicit-begins  ==>
# (letrec ((str->sym (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let* ((new-sym (make-symbol str #f)) (new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym)) (str->sym str (cdr symlist))))))) (lambda (str) (str->sym str (symbols))))
# == eliminate-let*  ==>
# (letrec ((str->sym (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) (str->sym str (cdr symlist))))))) (lambda (str) (str->sym str (symbols))))
# == uniquify-variables  ==>
# (letrec ((f8513 (lambda (f8522 f8523) (if (string=? f8522 (symbol->string (car f8523))) (car f8523) (if (null? (cdr f8523)) (let ((f8527 (make-symbol f8522 #f))) (let ((f8529 (cons f8527 ()))) (begin (set-cdr! f8523 f8529) f8527))) (f8513 f8522 (cdr f8523))))))) (lambda (f8531) (f8513 f8531 (symbols))))
# == vectorize-letrec  ==>
# (let ((f8513 (make-vector 1))) (begin (begin (vector-set! f8513 0 (lambda (f8522 f8523) (if (string=? f8522 (symbol->string (car f8523))) (car f8523) (if (null? (cdr f8523)) (let ((f8527 (make-symbol f8522 #f))) (let ((f8529 (cons f8527 ()))) (begin (set-cdr! f8523 f8529) f8527))) ((vector-ref f8513 0) f8522 (cdr f8523))))))) (lambda (f8531) ((vector-ref f8513 0) f8531 (symbols)))))
# == eliminate-set!  ==>
# (let ((f8513 (make-vector 1))) (begin (begin (vector-set! f8513 0 (lambda (f8522 f8523) (let ((f8522 f8522) (f8523 f8523)) (if (string=? f8522 (symbol->string (car f8523))) (car f8523) (if (null? (cdr f8523)) (let ((f8527 (make-symbol f8522 #f))) (let ((f8529 (cons f8527 ()))) (begin (set-cdr! f8523 f8529) f8527))) ((vector-ref f8513 0) f8522 (cdr f8523)))))))) (lambda (f8531) (let ((f8531 f8531)) ((vector-ref f8513 0) f8531 (symbols))))))
# == close-free-variables  ==>
# (let ((f8513 (make-vector 1))) (begin (begin (vector-set! f8513 0 (closure (f8522 f8523) (string=? f8513) (let ((f8522 f8522) (f8523 f8523)) (if (string=? f8522 (symbol->string (car f8523))) (car f8523) (if (null? (cdr f8523)) (let ((f8527 (make-symbol f8522 #f))) (let ((f8529 (cons f8527 ()))) (begin (set-cdr! f8523 f8529) f8527))) ((vector-ref f8513 0) f8522 (cdr f8523)))))))) (closure (f8531) (f8513 symbols) (let ((f8531 f8531)) ((vector-ref f8513 0) f8531 (symbols))))))
# == eliminate-quote  ==>
# (let ((f8513 (make-vector 1))) (begin (begin (vector-set! f8513 0 (closure (f8522 f8523) (string=? f8513) (let ((f8522 f8522) (f8523 f8523)) (if (string=? f8522 (symbol->string (car f8523))) (car f8523) (if (null? (cdr f8523)) (let ((f8527 (make-symbol f8522 #f))) (let ((f8529 (cons f8527 ()))) (begin (set-cdr! f8523 f8529) f8527))) ((vector-ref f8513 0) f8522 (cdr f8523)))))))) (closure (f8531) (f8513 symbols) (let ((f8531 f8531)) ((vector-ref f8513 0) f8531 (symbols))))))
# == eliminate-when/unless  ==>
# (let ((f8513 (make-vector 1))) (begin (begin (vector-set! f8513 0 (closure (f8522 f8523) (string=? f8513) (let ((f8522 f8522) (f8523 f8523)) (if (string=? f8522 (symbol->string (car f8523))) (car f8523) (if (null? (cdr f8523)) (let ((f8527 (make-symbol f8522 #f))) (let ((f8529 (cons f8527 ()))) (begin (set-cdr! f8523 f8529) f8527))) ((vector-ref f8513 0) f8522 (cdr f8523)))))))) (closure (f8531) (f8513 symbols) (let ((f8531 f8531)) ((vector-ref f8513 0) f8531 (symbols))))))
# == eliminate-cond  ==>
# (let ((f8513 (make-vector 1))) (begin (begin (vector-set! f8513 0 (closure (f8522 f8523) (string=? f8513) (let ((f8522 f8522) (f8523 f8523)) (if (string=? f8522 (symbol->string (car f8523))) (car f8523) (if (null? (cdr f8523)) (let ((f8527 (make-symbol f8522 #f))) (let ((f8529 (cons f8527 ()))) (begin (set-cdr! f8523 f8529) f8527))) ((vector-ref f8513 0) f8522 (cdr f8523)))))))) (closure (f8531) (f8513 symbols) (let ((f8531 f8531)) ((vector-ref f8513 0) f8531 (symbols))))))
# == external-symbols  ==>
# (let ((f8513 (make-vector 1))) (begin (begin (vector-set! f8513 0 (closure (f8522 f8523) ((primitive-ref string=?) f8513) (let ((f8522 f8522) (f8523 f8523)) (if ((primitive-ref string=?) f8522 (symbol->string (car f8523))) (car f8523) (if (null? (cdr f8523)) (let ((f8527 (make-symbol f8522 #f))) (let ((f8529 (cons f8527 ()))) (begin (set-cdr! f8523 f8529) f8527))) ((vector-ref f8513 0) f8522 (cdr f8523)))))))) (closure (f8531) (f8513 (primitive-ref symbols)) (let ((f8531 f8531)) ((vector-ref f8513 0) f8531 ((primitive-ref symbols)))))))
# emit-expr (let ((f8513 (make-vector 1))) (begin (begin (vector-set! f8513 0 (closure (f8522 f8523) ((primitive-ref string=?) f8513) (let ((f8522 f8522) (f8523 f8523)) (if ((primitive-ref string=?) f8522 (symbol->string (car f8523))) (car f8523) (if (null? (cdr f8523)) (let ((f8527 (make-symbol f8522 #f))) (let ((f8529 (cons f8527 ()))) (begin (set-cdr! f8523 f8529) f8527))) ((vector-ref f8513 0) f8522 (cdr f8523)))))))) (closure (f8531) (f8513 (primitive-ref symbols)) (let ((f8531 f8531)) ((vector-ref f8513 0) f8531 ((primitive-ref symbols)))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f8513 (make-vector 1)))
#  body = (begin (begin (vector-set! f8513 0 (closure (f8522 f8523) ((primitive-ref string=?) f8513) (let ((f8522 f8522) (f8523 f8523)) (if ((primitive-ref string=?) f8522 (symbol->string (car f8523))) (car f8523) (if (null? (cdr f8523)) (let ((f8527 (make-symbol f8522 #f))) (let ((f8529 (cons f8527 ()))) (begin (set-cdr! f8523 f8529) f8527))) ((vector-ref f8513 0) f8522 (cdr f8523)))))))) (closure (f8531) (f8513 (primitive-ref symbols)) (let ((f8531 f8531)) ((vector-ref f8513 0) f8531 ((primitive-ref symbols))))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70221"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70221:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_70222
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70222:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f8513 0 (closure (f8522 f8523) ((primitive-ref string=?) f8513) (let ((f8522 f8522) (f8523 f8523)) (if ((primitive-ref string=?) f8522 (symbol->string (car f8523))) (car f8523) (if (null? (cdr f8523)) (let ((f8527 (make-symbol f8522 #f))) (let ((f8529 (cons f8527 ()))) (begin (set-cdr! f8523 f8529) f8527))) ((vector-ref f8513 0) f8522 (cdr f8523)))))))) (closure (f8531) (f8513 (primitive-ref symbols)) (let ((f8531 f8531)) ((vector-ref f8513 0) f8531 ((primitive-ref symbols))))))
# emit-begin
#   expr=(begin (begin (vector-set! f8513 0 (closure (f8522 f8523) ((primitive-ref string=?) f8513) (let ((f8522 f8522) (f8523 f8523)) (if ((primitive-ref string=?) f8522 (symbol->string (car f8523))) (car f8523) (if (null? (cdr f8523)) (let ((f8527 (make-symbol f8522 #f))) (let ((f8529 (cons f8527 ()))) (begin (set-cdr! f8523 f8529) f8527))) ((vector-ref f8513 0) f8522 (cdr f8523)))))))) (closure (f8531) (f8513 (primitive-ref symbols)) (let ((f8531 f8531)) ((vector-ref f8513 0) f8531 ((primitive-ref symbols))))))
#   env=((f8513 . 0))
# emit-expr (begin (vector-set! f8513 0 (closure (f8522 f8523) ((primitive-ref string=?) f8513) (let ((f8522 f8522) (f8523 f8523)) (if ((primitive-ref string=?) f8522 (symbol->string (car f8523))) (car f8523) (if (null? (cdr f8523)) (let ((f8527 (make-symbol f8522 #f))) (let ((f8529 (cons f8527 ()))) (begin (set-cdr! f8523 f8529) f8527))) ((vector-ref f8513 0) f8522 (cdr f8523))))))))
# emit-begin
#   expr=(begin (vector-set! f8513 0 (closure (f8522 f8523) ((primitive-ref string=?) f8513) (let ((f8522 f8522) (f8523 f8523)) (if ((primitive-ref string=?) f8522 (symbol->string (car f8523))) (car f8523) (if (null? (cdr f8523)) (let ((f8527 (make-symbol f8522 #f))) (let ((f8529 (cons f8527 ()))) (begin (set-cdr! f8523 f8529) f8527))) ((vector-ref f8513 0) f8522 (cdr f8523))))))))
#   env=((f8513 . 0))
# emit-expr (vector-set! f8513 0 (closure (f8522 f8523) ((primitive-ref string=?) f8513) (let ((f8522 f8522) (f8523 f8523)) (if ((primitive-ref string=?) f8522 (symbol->string (car f8523))) (car f8523) (if (null? (cdr f8523)) (let ((f8527 (make-symbol f8522 #f))) (let ((f8529 (cons f8527 ()))) (begin (set-cdr! f8523 f8529) f8527))) ((vector-ref f8513 0) f8522 (cdr f8523)))))))
# emit-expr f8513
# emit-variable-ref
# env=((f8513 . 0))
# var=f8513
    movl 0(%esp), %eax  # stack load f8513
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70223
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70223:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70224"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70224:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70226
    cmp  $0,%eax
    jge _L_70225
_L_70226:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70225:
    movl %eax, -8(%esp)
# emit-expr (closure (f8522 f8523) ((primitive-ref string=?) f8513) (let ((f8522 f8522) (f8523 f8523)) (if ((primitive-ref string=?) f8522 (symbol->string (car f8523))) (car f8523) (if (null? (cdr f8523)) (let ((f8527 (make-symbol f8522 #f))) (let ((f8529 (cons f8527 ()))) (begin (set-cdr! f8523 f8529) f8527))) ((vector-ref f8513 0) f8522 (cdr f8523))))))
# emit-closure
# si = -12
# env = ((f8513 . 0))
# expr = (closure (f8522 f8523) ((primitive-ref string=?) f8513) (let ((f8522 f8522) (f8523 f8523)) (if ((primitive-ref string=?) f8522 (symbol->string (car f8523))) (car f8523) (if (null? (cdr f8523)) (let ((f8527 (make-symbol f8522 #f))) (let ((f8529 (cons f8527 ()))) (begin (set-cdr! f8523 f8529) f8527))) ((vector-ref f8513 0) f8522 (cdr f8523))))))
    movl $_L_70227, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref string=?) not defined in the environmnet
# emit-variable-ref
# env=((f8513 . 0))
# var=f8513
    movl 0(%esp), %eax  # stack load f8513
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f8513
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_70228            # jump around closure body
_L_70227:
# check argument count
    cmp $8,%eax
    je _L_70229
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_70229:
# emit-tail-expr
# si=-16
# env=((f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
# expr=(let ((f8522 f8522) (f8523 f8523)) (if ((primitive-ref string=?) f8522 (symbol->string (car f8523))) (car f8523) (if (null? (cdr f8523)) (let ((f8527 (make-symbol f8522 #f))) (let ((f8529 (cons f8527 ()))) (begin (set-cdr! f8523 f8529) f8527))) ((vector-ref f8513 0) f8522 (cdr f8523)))))
# emit-tail-let
#  si   = -16
#  env  = ((f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
#  bindings = ((f8522 f8522) (f8523 f8523))
#  body = (if ((primitive-ref string=?) f8522 (symbol->string (car f8523))) (car f8523) (if (null? (cdr f8523)) (let ((f8527 (make-symbol f8522 #f))) (let ((f8529 (cons f8527 ()))) (begin (set-cdr! f8523 f8529) f8527))) ((vector-ref f8513 0) f8522 (cdr f8523))))
# emit-expr f8522
# emit-variable-ref
# env=((f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
# var=f8522
    movl -8(%esp), %eax  # stack load f8522
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f8523
# emit-variable-ref
# env=((f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
# var=f8523
    movl -12(%esp), %eax  # stack load f8523
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f8523 . -20) (f8522 . -16) (f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
# expr=(if ((primitive-ref string=?) f8522 (symbol->string (car f8523))) (car f8523) (if (null? (cdr f8523)) (let ((f8527 (make-symbol f8522 #f))) (let ((f8529 (cons f8527 ()))) (begin (set-cdr! f8523 f8529) f8527))) ((vector-ref f8513 0) f8522 (cdr f8523))))
# emit-expr ((primitive-ref string=?) f8522 (symbol->string (car f8523)))
# funcall
#    si   =-24
#    env  = ((f8523 . -20) (f8522 . -16) (f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
#    expr = (funcall (primitive-ref string=?) f8522 (symbol->string (car f8523)))
# emit-expr (primitive-ref string=?)
    .extern string$e$q
    movl string$e$q,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70232"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70232":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f8522
# emit-variable-ref
# env=((f8523 . -20) (f8522 . -16) (f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
# var=f8522
    movl -16(%esp), %eax  # stack load f8522
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f8522
# emit-expr (symbol->string (car f8523))
# symbol->string (car f8523)
# emit-expr (car f8523)
# emit-expr f8523
# emit-variable-ref
# env=((f8523 . -20) (f8522 . -16) (f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
# var=f8523
    movl -20(%esp), %eax  # stack load f8523
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_70233
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $108,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70233:
    movl -1(%eax), %eax
    movl -3(%eax), %eax
    mov %eax, -40(%esp)  # arg (symbol->string (car f8523))
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_70230
# emit-tail-expr
# si=-24
# env=((f8523 . -20) (f8522 . -16) (f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
# expr=(car f8523)
# tail primcall
# emit-expr f8523
# emit-variable-ref
# env=((f8523 . -20) (f8522 . -16) (f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
# var=f8523
    movl -20(%esp), %eax  # stack load f8523
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_70234
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $108,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70234:
    movl -1(%eax), %eax
#return from tail (car f8523)
    ret
    jmp _L_70231
_L_70230:
# emit-tail-expr
# si=-24
# env=((f8523 . -20) (f8522 . -16) (f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
# expr=(if (null? (cdr f8523)) (let ((f8527 (make-symbol f8522 #f))) (let ((f8529 (cons f8527 ()))) (begin (set-cdr! f8523 f8529) f8527))) ((vector-ref f8513 0) f8522 (cdr f8523)))
# emit-expr (null? (cdr f8523))
# emit-expr (cdr f8523)
# emit-expr f8523
# emit-variable-ref
# env=((f8523 . -20) (f8522 . -16) (f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
# var=f8523
    movl -20(%esp), %eax  # stack load f8523
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_70237
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70237:
    movl 3(%eax), %eax
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_70235
# emit-tail-expr
# si=-24
# env=((f8523 . -20) (f8522 . -16) (f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
# expr=(let ((f8527 (make-symbol f8522 #f))) (let ((f8529 (cons f8527 ()))) (begin (set-cdr! f8523 f8529) f8527)))
# emit-tail-let
#  si   = -24
#  env  = ((f8523 . -20) (f8522 . -16) (f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
#  bindings = ((f8527 (make-symbol f8522 #f)))
#  body = (let ((f8529 (cons f8527 ()))) (begin (set-cdr! f8523 f8529) f8527))
# emit-expr (make-symbol f8522 #f)
# make-symbol arg1=f8522 arg2=#f
# emit-expr f8522
# emit-variable-ref
# env=((f8523 . -20) (f8522 . -16) (f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
# var=f8522
    movl -16(%esp), %eax  # stack load f8522
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
# env=((f8527 . -24) (f8523 . -20) (f8522 . -16) (f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
# expr=(let ((f8529 (cons f8527 ()))) (begin (set-cdr! f8523 f8529) f8527))
# emit-tail-let
#  si   = -28
#  env  = ((f8527 . -24) (f8523 . -20) (f8522 . -16) (f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
#  bindings = ((f8529 (cons f8527 ())))
#  body = (begin (set-cdr! f8523 f8529) f8527)
# emit-expr (cons f8527 ())
# cons arg1=f8527 arg2=()
# emit-expr f8527
# emit-variable-ref
# env=((f8527 . -24) (f8523 . -20) (f8522 . -16) (f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
# var=f8527
    movl -24(%esp), %eax  # stack load f8527
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
# env=((f8529 . -28) (f8527 . -24) (f8523 . -20) (f8522 . -16) (f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
# expr=(begin (set-cdr! f8523 f8529) f8527)
# tail-begin (begin (set-cdr! f8523 f8529) f8527)
#   env=((f8529 . -28) (f8527 . -24) (f8523 . -20) (f8522 . -16) (f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
# emit-expr (set-cdr! f8523 f8529)
# emit-expr f8523
# emit-variable-ref
# env=((f8529 . -28) (f8527 . -24) (f8523 . -20) (f8522 . -16) (f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
# var=f8523
    movl -20(%esp), %eax  # stack load f8523
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_70238
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70238:
    movl %eax, -32(%esp)
# emit-expr f8529
# emit-variable-ref
# env=((f8529 . -28) (f8527 . -24) (f8523 . -20) (f8522 . -16) (f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
# var=f8529
    movl -28(%esp), %eax  # stack load f8529
# end emit-variable-ref
    movl -32(%esp), %ebx
    movl %eax, 3(%ebx)
# emit-tail-expr
# si=-32
# env=((f8529 . -28) (f8527 . -24) (f8523 . -20) (f8522 . -16) (f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
# expr=(begin f8527)
# tail-begin (begin f8527)
#   env=((f8529 . -28) (f8527 . -24) (f8523 . -20) (f8522 . -16) (f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
# emit-tail-expr
# si=-32
# env=((f8529 . -28) (f8527 . -24) (f8523 . -20) (f8522 . -16) (f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
# expr=f8527
# emit-tail-variable-ref
# emit-variable-ref
# env=((f8529 . -28) (f8527 . -24) (f8523 . -20) (f8522 . -16) (f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
# var=f8527
    movl -24(%esp), %eax  # stack load f8527
# end emit-variable-ref
    ret
# end emit-tail-variable ref
     ret   # return thru stack
    jmp _L_70236
_L_70235:
# emit-tail-expr
# si=-24
# env=((f8523 . -20) (f8522 . -16) (f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
# expr=((vector-ref f8513 0) f8522 (cdr f8523))
# emit-tail-funcall
#    si   =-24
#    env  = ((f8523 . -20) (f8522 . -16) (f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
#    expr = (funcall (vector-ref f8513 0) f8522 (cdr f8523))
# emit-expr (vector-ref f8513 0)
# emit-expr f8513
# emit-variable-ref
# env=((f8523 . -20) (f8522 . -16) (f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
# var=f8513
    movl 6(%edi), %eax  # frame load f8513
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70239
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70239:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70240"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70240:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70242
    cmp  $0,%eax
    jge _L_70241
_L_70242:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70241:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr f8522
# emit-variable-ref
# env=((f8523 . -20) (f8522 . -16) (f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
# var=f8522
    movl -16(%esp), %eax  # stack load f8522
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f8522
# emit-expr (cdr f8523)
# emit-expr f8523
# emit-variable-ref
# env=((f8523 . -20) (f8522 . -16) (f8523 . -12) (f8522 . -8) (f8513 . 8) ((primitive-ref string=?) . 4) (f8513 . 0))
# var=f8523
    movl -20(%esp), %eax  # stack load f8523
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_70243
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70243:
    movl 3(%eax), %eax
    mov %eax, -32(%esp)    # arg (cdr f8523)
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
_L_70236:
_L_70231:
    .align 4,0x90
_L_70228:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f8513 . 0))
# emit-expr (begin (closure (f8531) (f8513 (primitive-ref symbols)) (let ((f8531 f8531)) ((vector-ref f8513 0) f8531 ((primitive-ref symbols))))))
# emit-begin
#   expr=(begin (closure (f8531) (f8513 (primitive-ref symbols)) (let ((f8531 f8531)) ((vector-ref f8513 0) f8531 ((primitive-ref symbols))))))
#   env=((f8513 . 0))
# emit-expr (closure (f8531) (f8513 (primitive-ref symbols)) (let ((f8531 f8531)) ((vector-ref f8513 0) f8531 ((primitive-ref symbols)))))
# emit-closure
# si = -4
# env = ((f8513 . 0))
# expr = (closure (f8531) (f8513 (primitive-ref symbols)) (let ((f8531 f8531)) ((vector-ref f8513 0) f8531 ((primitive-ref symbols)))))
    movl $_L_70244, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f8513 . 0))
# var=f8513
    movl 0(%esp), %eax  # stack load f8513
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f8513
# WARNING: free var (primitive-ref symbols) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_70245            # jump around closure body
_L_70244:
# check argument count
    cmp $4,%eax
    je _L_70246
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_70246:
# emit-tail-expr
# si=-12
# env=((f8531 . -8) ((primitive-ref symbols) . 8) (f8513 . 4) (f8513 . 0))
# expr=(let ((f8531 f8531)) ((vector-ref f8513 0) f8531 ((primitive-ref symbols))))
# emit-tail-let
#  si   = -12
#  env  = ((f8531 . -8) ((primitive-ref symbols) . 8) (f8513 . 4) (f8513 . 0))
#  bindings = ((f8531 f8531))
#  body = ((vector-ref f8513 0) f8531 ((primitive-ref symbols)))
# emit-expr f8531
# emit-variable-ref
# env=((f8531 . -8) ((primitive-ref symbols) . 8) (f8513 . 4) (f8513 . 0))
# var=f8531
    movl -8(%esp), %eax  # stack load f8531
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f8531 . -12) (f8531 . -8) ((primitive-ref symbols) . 8) (f8513 . 4) (f8513 . 0))
# expr=((vector-ref f8513 0) f8531 ((primitive-ref symbols)))
# emit-tail-funcall
#    si   =-16
#    env  = ((f8531 . -12) (f8531 . -8) ((primitive-ref symbols) . 8) (f8513 . 4) (f8513 . 0))
#    expr = (funcall (vector-ref f8513 0) f8531 ((primitive-ref symbols)))
# emit-expr (vector-ref f8513 0)
# emit-expr f8513
# emit-variable-ref
# env=((f8531 . -12) (f8531 . -8) ((primitive-ref symbols) . 8) (f8513 . 4) (f8513 . 0))
# var=f8513
    movl 2(%edi), %eax  # frame load f8513
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70247
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70247:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70248"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70248:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70250
    cmp  $0,%eax
    jge _L_70249
_L_70250:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70249:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f8531
# emit-variable-ref
# env=((f8531 . -12) (f8531 . -8) ((primitive-ref symbols) . 8) (f8513 . 4) (f8513 . 0))
# var=f8531
    movl -12(%esp), %eax  # stack load f8531
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f8531
# emit-expr ((primitive-ref symbols))
# funcall
#    si   =-24
#    env  = ((f8531 . -12) (f8531 . -8) ((primitive-ref symbols) . 8) (f8513 . 4) (f8513 . 0))
#    expr = (funcall (primitive-ref symbols))
# emit-expr (primitive-ref symbols)
    .extern symbols
    movl symbols,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70251"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70251":
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
_L_70245:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f8513 . 0))
     movl %eax, string$m$gsymbol
# == explicit-begins  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == eliminate-let*  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == uniquify-variables  ==>
# (lambda (f8532 f8533) (if (null? f8532) (cons e nil) (cons (car f8532) (append1 (cdr f8532) f8533))))
# == vectorize-letrec  ==>
# (lambda (f8532 f8533) (if (null? f8532) (cons e nil) (cons (car f8532) (append1 (cdr f8532) f8533))))
# == eliminate-set!  ==>
# (lambda (f8532 f8533) (let ((f8532 f8532) (f8533 f8533)) (if (null? f8532) (cons e nil) (cons (car f8532) (append1 (cdr f8532) f8533)))))
# == close-free-variables  ==>
# (closure (f8532 f8533) (e nil append1) (let ((f8532 f8532) (f8533 f8533)) (if (null? f8532) (cons e nil) (cons (car f8532) (append1 (cdr f8532) f8533)))))
# == eliminate-quote  ==>
# (closure (f8532 f8533) (e nil append1) (let ((f8532 f8532) (f8533 f8533)) (if (null? f8532) (cons e nil) (cons (car f8532) (append1 (cdr f8532) f8533)))))
# == eliminate-when/unless  ==>
# (closure (f8532 f8533) (e nil append1) (let ((f8532 f8532) (f8533 f8533)) (if (null? f8532) (cons e nil) (cons (car f8532) (append1 (cdr f8532) f8533)))))
# == eliminate-cond  ==>
# (closure (f8532 f8533) (e nil append1) (let ((f8532 f8532) (f8533 f8533)) (if (null? f8532) (cons e nil) (cons (car f8532) (append1 (cdr f8532) f8533)))))
# == external-symbols  ==>
# (closure (f8532 f8533) (e nil (primitive-ref append1)) (let ((f8532 f8532) (f8533 f8533)) (if (null? f8532) (cons e nil) (cons (car f8532) ((primitive-ref append1) (cdr f8532) f8533)))))
# emit-expr (closure (f8532 f8533) (e nil (primitive-ref append1)) (let ((f8532 f8532) (f8533 f8533)) (if (null? f8532) (cons e nil) (cons (car f8532) ((primitive-ref append1) (cdr f8532) f8533)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f8532 f8533) (e nil (primitive-ref append1)) (let ((f8532 f8532) (f8533 f8533)) (if (null? f8532) (cons e nil) (cons (car f8532) ((primitive-ref append1) (cdr f8532) f8533)))))
    movl $_L_70252, 0(%ebp)  # closure label
# WARNING: free var e not defined in the environmnet
# WARNING: free var nil not defined in the environmnet
# WARNING: free var (primitive-ref append1) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_70253            # jump around closure body
_L_70252:
# check argument count
    cmp $8,%eax
    je _L_70254
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_70254:
# emit-tail-expr
# si=-16
# env=((f8533 . -12) (f8532 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(let ((f8532 f8532) (f8533 f8533)) (if (null? f8532) (cons e nil) (cons (car f8532) ((primitive-ref append1) (cdr f8532) f8533))))
# emit-tail-let
#  si   = -16
#  env  = ((f8533 . -12) (f8532 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
#  bindings = ((f8532 f8532) (f8533 f8533))
#  body = (if (null? f8532) (cons e nil) (cons (car f8532) ((primitive-ref append1) (cdr f8532) f8533)))
# emit-expr f8532
# emit-variable-ref
# env=((f8533 . -12) (f8532 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f8532
    movl -8(%esp), %eax  # stack load f8532
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f8533
# emit-variable-ref
# env=((f8533 . -12) (f8532 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f8533
    movl -12(%esp), %eax  # stack load f8533
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f8533 . -20) (f8532 . -16) (f8533 . -12) (f8532 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(if (null? f8532) (cons e nil) (cons (car f8532) ((primitive-ref append1) (cdr f8532) f8533)))
# emit-expr (null? f8532)
# emit-expr f8532
# emit-variable-ref
# env=((f8533 . -20) (f8532 . -16) (f8533 . -12) (f8532 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f8532
    movl -16(%esp), %eax  # stack load f8532
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_70255
# emit-tail-expr
# si=-24
# env=((f8533 . -20) (f8532 . -16) (f8533 . -12) (f8532 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(cons e nil)
# tail primcall
# cons arg1=e arg2=nil
# emit-expr e
# emit-variable-ref
# env=((f8533 . -20) (f8532 . -16) (f8533 . -12) (f8532 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=e
    movl 2(%edi), %eax  # frame load e
# end emit-variable-ref
    movl %eax, -24(%esp)
# emit-expr nil
# emit-variable-ref
# env=((f8533 . -20) (f8532 . -16) (f8533 . -12) (f8532 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
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
    jmp _L_70256
_L_70255:
# emit-tail-expr
# si=-24
# env=((f8533 . -20) (f8532 . -16) (f8533 . -12) (f8532 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(cons (car f8532) ((primitive-ref append1) (cdr f8532) f8533))
# tail primcall
# cons arg1=(car f8532) arg2=((primitive-ref append1) (cdr f8532) f8533)
# emit-expr (car f8532)
# emit-expr f8532
# emit-variable-ref
# env=((f8533 . -20) (f8532 . -16) (f8533 . -12) (f8532 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f8532
    movl -16(%esp), %eax  # stack load f8532
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_70257
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $108,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70257:
    movl -1(%eax), %eax
    movl %eax, -24(%esp)
# emit-expr ((primitive-ref append1) (cdr f8532) f8533)
# funcall
#    si   =-28
#    env  = ((f8533 . -20) (f8532 . -16) (f8533 . -12) (f8532 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
#    expr = (funcall (primitive-ref append1) (cdr f8532) f8533)
# emit-expr (primitive-ref append1)
    .extern append1
    movl append1,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70258"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70258":
   movl %eax,  -36(%esp)  # stash funcall-oper in closure slot
# emit-expr (cdr f8532)
# emit-expr f8532
# emit-variable-ref
# env=((f8533 . -20) (f8532 . -16) (f8533 . -12) (f8532 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f8532
    movl -16(%esp), %eax  # stack load f8532
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_70259
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70259:
    movl 3(%eax), %eax
    mov %eax, -40(%esp)  # arg (cdr f8532)
# emit-expr f8533
# emit-variable-ref
# env=((f8533 . -20) (f8532 . -16) (f8533 . -12) (f8532 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f8533
    movl -20(%esp), %eax  # stack load f8533
# end emit-variable-ref
    mov %eax, -44(%esp)  # arg f8533
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
#return from tail (cons (car f8532) ((primitive-ref append1) (cdr f8532) f8533))
    ret
_L_70256:
    .align 4,0x90
_L_70253:
     movl %eax, append1
# == explicit-begins  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == eliminate-let*  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == uniquify-variables  ==>
# (lambda (f8534 f8535) (if (fx= f8535 0) (car f8534) (list-ref (cdr f8534) (fx- f8535 1))))
# == vectorize-letrec  ==>
# (lambda (f8534 f8535) (if (fx= f8535 0) (car f8534) (list-ref (cdr f8534) (fx- f8535 1))))
# == eliminate-set!  ==>
# (lambda (f8534 f8535) (let ((f8534 f8534) (f8535 f8535)) (if (fx= f8535 0) (car f8534) (list-ref (cdr f8534) (fx- f8535 1)))))
# == close-free-variables  ==>
# (closure (f8534 f8535) (list-ref) (let ((f8534 f8534) (f8535 f8535)) (if (fx= f8535 0) (car f8534) (list-ref (cdr f8534) (fx- f8535 1)))))
# == eliminate-quote  ==>
# (closure (f8534 f8535) (list-ref) (let ((f8534 f8534) (f8535 f8535)) (if (fx= f8535 0) (car f8534) (list-ref (cdr f8534) (fx- f8535 1)))))
# == eliminate-when/unless  ==>
# (closure (f8534 f8535) (list-ref) (let ((f8534 f8534) (f8535 f8535)) (if (fx= f8535 0) (car f8534) (list-ref (cdr f8534) (fx- f8535 1)))))
# == eliminate-cond  ==>
# (closure (f8534 f8535) (list-ref) (let ((f8534 f8534) (f8535 f8535)) (if (fx= f8535 0) (car f8534) (list-ref (cdr f8534) (fx- f8535 1)))))
# == external-symbols  ==>
# (closure (f8534 f8535) ((primitive-ref list-ref)) (let ((f8534 f8534) (f8535 f8535)) (if (fx= f8535 0) (car f8534) ((primitive-ref list-ref) (cdr f8534) (fx- f8535 1)))))
# emit-expr (closure (f8534 f8535) ((primitive-ref list-ref)) (let ((f8534 f8534) (f8535 f8535)) (if (fx= f8535 0) (car f8534) ((primitive-ref list-ref) (cdr f8534) (fx- f8535 1)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f8534 f8535) ((primitive-ref list-ref)) (let ((f8534 f8534) (f8535 f8535)) (if (fx= f8535 0) (car f8534) ((primitive-ref list-ref) (cdr f8534) (fx- f8535 1)))))
    movl $_L_70260, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_70261            # jump around closure body
_L_70260:
# check argument count
    cmp $8,%eax
    je _L_70262
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_70262:
# emit-tail-expr
# si=-16
# env=((f8535 . -12) (f8534 . -8) ((primitive-ref list-ref) . 4))
# expr=(let ((f8534 f8534) (f8535 f8535)) (if (fx= f8535 0) (car f8534) ((primitive-ref list-ref) (cdr f8534) (fx- f8535 1))))
# emit-tail-let
#  si   = -16
#  env  = ((f8535 . -12) (f8534 . -8) ((primitive-ref list-ref) . 4))
#  bindings = ((f8534 f8534) (f8535 f8535))
#  body = (if (fx= f8535 0) (car f8534) ((primitive-ref list-ref) (cdr f8534) (fx- f8535 1)))
# emit-expr f8534
# emit-variable-ref
# env=((f8535 . -12) (f8534 . -8) ((primitive-ref list-ref) . 4))
# var=f8534
    movl -8(%esp), %eax  # stack load f8534
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f8535
# emit-variable-ref
# env=((f8535 . -12) (f8534 . -8) ((primitive-ref list-ref) . 4))
# var=f8535
    movl -12(%esp), %eax  # stack load f8535
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f8535 . -20) (f8534 . -16) (f8535 . -12) (f8534 . -8) ((primitive-ref list-ref) . 4))
# expr=(if (fx= f8535 0) (car f8534) ((primitive-ref list-ref) (cdr f8534) (fx- f8535 1)))
# emit-expr (fx= f8535 0)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70265"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70265:
    movl %eax, -24(%esp)
# emit-expr f8535
# emit-variable-ref
# env=((f8535 . -20) (f8534 . -16) (f8535 . -12) (f8534 . -8) ((primitive-ref list-ref) . 4))
# var=f8535
    movl -20(%esp), %eax  # stack load f8535
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70266"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70266:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_70263
# emit-tail-expr
# si=-24
# env=((f8535 . -20) (f8534 . -16) (f8535 . -12) (f8534 . -8) ((primitive-ref list-ref) . 4))
# expr=(car f8534)
# tail primcall
# emit-expr f8534
# emit-variable-ref
# env=((f8535 . -20) (f8534 . -16) (f8535 . -12) (f8534 . -8) ((primitive-ref list-ref) . 4))
# var=f8534
    movl -16(%esp), %eax  # stack load f8534
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_70267
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $108,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70267:
    movl -1(%eax), %eax
#return from tail (car f8534)
    ret
    jmp _L_70264
_L_70263:
# emit-tail-expr
# si=-24
# env=((f8535 . -20) (f8534 . -16) (f8535 . -12) (f8534 . -8) ((primitive-ref list-ref) . 4))
# expr=((primitive-ref list-ref) (cdr f8534) (fx- f8535 1))
# emit-tail-funcall
#    si   =-24
#    env  = ((f8535 . -20) (f8534 . -16) (f8535 . -12) (f8534 . -8) ((primitive-ref list-ref) . 4))
#    expr = (funcall (primitive-ref list-ref) (cdr f8534) (fx- f8535 1))
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr (cdr f8534)
# emit-expr f8534
# emit-variable-ref
# env=((f8535 . -20) (f8534 . -16) (f8535 . -12) (f8534 . -8) ((primitive-ref list-ref) . 4))
# var=f8534
    movl -16(%esp), %eax  # stack load f8534
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_70268
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70268:
    movl 3(%eax), %eax
    mov %eax, -28(%esp)    # arg (cdr f8534)
# emit-expr (fx- f8535 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70269"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70269:
    movl %eax, -32(%esp)
# emit-expr f8535
# emit-variable-ref
# env=((f8535 . -20) (f8534 . -16) (f8535 . -12) (f8534 . -8) ((primitive-ref list-ref) . 4))
# var=f8535
    movl -20(%esp), %eax  # stack load f8535
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70270"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70270:
    subl -32(%esp), %eax
    mov %eax, -32(%esp)    # arg (fx- f8535 1)
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
_L_70264:
    .align 4,0x90
_L_70261:
     movl %eax, list$mref
# == explicit-begins  ==>
# (lambda (l) (if (null? l) 0 (fxadd1 (list-length (cdr l)))))
# == eliminate-let*  ==>
# (lambda (l) (if (null? l) 0 (fxadd1 (list-length (cdr l)))))
# == uniquify-variables  ==>
# (lambda (f8536) (if (null? f8536) 0 (fxadd1 (list-length (cdr f8536)))))
# == vectorize-letrec  ==>
# (lambda (f8536) (if (null? f8536) 0 (fxadd1 (list-length (cdr f8536)))))
# == eliminate-set!  ==>
# (lambda (f8536) (let ((f8536 f8536)) (if (null? f8536) 0 (fxadd1 (list-length (cdr f8536))))))
# == close-free-variables  ==>
# (closure (f8536) (list-length) (let ((f8536 f8536)) (if (null? f8536) 0 (fxadd1 (list-length (cdr f8536))))))
# == eliminate-quote  ==>
# (closure (f8536) (list-length) (let ((f8536 f8536)) (if (null? f8536) 0 (fxadd1 (list-length (cdr f8536))))))
# == eliminate-when/unless  ==>
# (closure (f8536) (list-length) (let ((f8536 f8536)) (if (null? f8536) 0 (fxadd1 (list-length (cdr f8536))))))
# == eliminate-cond  ==>
# (closure (f8536) (list-length) (let ((f8536 f8536)) (if (null? f8536) 0 (fxadd1 (list-length (cdr f8536))))))
# == external-symbols  ==>
# (closure (f8536) ((primitive-ref list-length)) (let ((f8536 f8536)) (if (null? f8536) 0 (fxadd1 ((primitive-ref list-length) (cdr f8536))))))
# emit-expr (closure (f8536) ((primitive-ref list-length)) (let ((f8536 f8536)) (if (null? f8536) 0 (fxadd1 ((primitive-ref list-length) (cdr f8536))))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f8536) ((primitive-ref list-length)) (let ((f8536 f8536)) (if (null? f8536) 0 (fxadd1 ((primitive-ref list-length) (cdr f8536))))))
    movl $_L_70271, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref list-length) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_70272            # jump around closure body
_L_70271:
# check argument count
    cmp $4,%eax
    je _L_70273
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_70273:
# emit-tail-expr
# si=-12
# env=((f8536 . -8) ((primitive-ref list-length) . 4))
# expr=(let ((f8536 f8536)) (if (null? f8536) 0 (fxadd1 ((primitive-ref list-length) (cdr f8536)))))
# emit-tail-let
#  si   = -12
#  env  = ((f8536 . -8) ((primitive-ref list-length) . 4))
#  bindings = ((f8536 f8536))
#  body = (if (null? f8536) 0 (fxadd1 ((primitive-ref list-length) (cdr f8536))))
# emit-expr f8536
# emit-variable-ref
# env=((f8536 . -8) ((primitive-ref list-length) . 4))
# var=f8536
    movl -8(%esp), %eax  # stack load f8536
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f8536 . -12) (f8536 . -8) ((primitive-ref list-length) . 4))
# expr=(if (null? f8536) 0 (fxadd1 ((primitive-ref list-length) (cdr f8536))))
# emit-expr (null? f8536)
# emit-expr f8536
# emit-variable-ref
# env=((f8536 . -12) (f8536 . -8) ((primitive-ref list-length) . 4))
# var=f8536
    movl -12(%esp), %eax  # stack load f8536
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_70274
# emit-tail-expr
# si=-16
# env=((f8536 . -12) (f8536 . -8) ((primitive-ref list-length) . 4))
# expr=0
    movl $0, %eax     # immed 0
    ret                  # immediate tail return
    jmp _L_70275
_L_70274:
# emit-tail-expr
# si=-16
# env=((f8536 . -12) (f8536 . -8) ((primitive-ref list-length) . 4))
# expr=(fxadd1 ((primitive-ref list-length) (cdr f8536)))
# tail primcall
# emit-expr ((primitive-ref list-length) (cdr f8536))
# funcall
#    si   =-16
#    env  = ((f8536 . -12) (f8536 . -8) ((primitive-ref list-length) . 4))
#    expr = (funcall (primitive-ref list-length) (cdr f8536))
# emit-expr (primitive-ref list-length)
    .extern list$mlength
    movl list$mlength,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70276"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70276":
   movl %eax,  -24(%esp)  # stash funcall-oper in closure slot
# emit-expr (cdr f8536)
# emit-expr f8536
# emit-variable-ref
# env=((f8536 . -12) (f8536 . -8) ((primitive-ref list-length) . 4))
# var=f8536
    movl -12(%esp), %eax  # stack load f8536
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_70277
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70277:
    movl 3(%eax), %eax
    mov %eax, -28(%esp)  # arg (cdr f8536)
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
    je "_L_70278"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70278:
     addl $4, %eax
#return from tail (fxadd1 ((primitive-ref list-length) (cdr f8536)))
    ret
_L_70275:
    .align 4,0x90
_L_70272:
     movl %eax, list$mlength
# == explicit-begins  ==>
# (letrec ((fill-vector (lambda (v k args) (if (null? args) v (begin (vector-set! v k (car args)) (fill-vector v (fxadd1 k) (cdr args))))))) (lambda args (let ((v (make-vector (list-length args)))) (fill-vector v 0 args))))
# == eliminate-let*  ==>
# (letrec ((fill-vector (lambda (v k args) (if (null? args) v (begin (vector-set! v k (car args)) (fill-vector v (fxadd1 k) (cdr args))))))) (lambda args (let ((v (make-vector (list-length args)))) (fill-vector v 0 args))))
# == uniquify-variables  ==>
# (letrec ((f8537 (lambda (f8541 f8542 f8543) (if (null? f8543) f8541 (begin (vector-set! f8541 f8542 (car f8543)) (f8537 f8541 (fxadd1 f8542) (cdr f8543))))))) (lambda f8547 (let ((f8549 (make-vector (list-length f8547)))) (f8537 f8549 0 f8547))))
# == vectorize-letrec  ==>
# (let ((f8537 (make-vector 1))) (begin (begin (vector-set! f8537 0 (lambda (f8541 f8542 f8543) (if (null? f8543) f8541 (begin (vector-set! f8541 f8542 (car f8543)) ((vector-ref f8537 0) f8541 (fxadd1 f8542) (cdr f8543))))))) (lambda f8547 (let ((f8549 (make-vector (list-length f8547)))) ((vector-ref f8537 0) f8549 0 f8547)))))
# == eliminate-set!  ==>
# (let ((f8537 (make-vector 1))) (begin (begin (vector-set! f8537 0 (lambda (f8541 f8542 f8543) (let ((f8541 f8541) (f8542 f8542) (f8543 f8543)) (if (null? f8543) f8541 (begin (vector-set! f8541 f8542 (car f8543)) ((vector-ref f8537 0) f8541 (fxadd1 f8542) (cdr f8543)))))))) (lambda f8547 (let () (let ((f8549 (make-vector (list-length f8547)))) ((vector-ref f8537 0) f8549 0 f8547))))))
# == close-free-variables  ==>
# (let ((f8537 (make-vector 1))) (begin (begin (vector-set! f8537 0 (closure (f8541 f8542 f8543) (f8537) (let ((f8541 f8541) (f8542 f8542) (f8543 f8543)) (if (null? f8543) f8541 (begin (vector-set! f8541 f8542 (car f8543)) ((vector-ref f8537 0) f8541 (fxadd1 f8542) (cdr f8543)))))))) (closure f8547 (f8537) (let () (let ((f8549 (make-vector (list-length f8547)))) ((vector-ref f8537 0) f8549 0 f8547))))))
# == eliminate-quote  ==>
# (let ((f8537 (make-vector 1))) (begin (begin (vector-set! f8537 0 (closure (f8541 f8542 f8543) (f8537) (let ((f8541 f8541) (f8542 f8542) (f8543 f8543)) (if (null? f8543) f8541 (begin (vector-set! f8541 f8542 (car f8543)) ((vector-ref f8537 0) f8541 (fxadd1 f8542) (cdr f8543)))))))) (closure f8547 (f8537) (let () (let ((f8549 (make-vector (list-length f8547)))) ((vector-ref f8537 0) f8549 0 f8547))))))
# == eliminate-when/unless  ==>
# (let ((f8537 (make-vector 1))) (begin (begin (vector-set! f8537 0 (closure (f8541 f8542 f8543) (f8537) (let ((f8541 f8541) (f8542 f8542) (f8543 f8543)) (if (null? f8543) f8541 (begin (vector-set! f8541 f8542 (car f8543)) ((vector-ref f8537 0) f8541 (fxadd1 f8542) (cdr f8543)))))))) (closure f8547 (f8537) (let () (let ((f8549 (make-vector (list-length f8547)))) ((vector-ref f8537 0) f8549 0 f8547))))))
# == eliminate-cond  ==>
# (let ((f8537 (make-vector 1))) (begin (begin (vector-set! f8537 0 (closure (f8541 f8542 f8543) (f8537) (let ((f8541 f8541) (f8542 f8542) (f8543 f8543)) (if (null? f8543) f8541 (begin (vector-set! f8541 f8542 (car f8543)) ((vector-ref f8537 0) f8541 (fxadd1 f8542) (cdr f8543)))))))) (closure f8547 (f8537) (let () (let ((f8549 (make-vector (list-length f8547)))) ((vector-ref f8537 0) f8549 0 f8547))))))
# == external-symbols  ==>
# (let ((f8537 (make-vector 1))) (begin (begin (vector-set! f8537 0 (closure (f8541 f8542 f8543) (f8537) (let ((f8541 f8541) (f8542 f8542) (f8543 f8543)) (if (null? f8543) f8541 (begin (vector-set! f8541 f8542 (car f8543)) ((vector-ref f8537 0) f8541 (fxadd1 f8542) (cdr f8543)))))))) (closure f8547 (f8537) (let () (let ((f8549 (make-vector ((primitive-ref list-length) f8547)))) ((vector-ref f8537 0) f8549 0 f8547))))))
# emit-expr (let ((f8537 (make-vector 1))) (begin (begin (vector-set! f8537 0 (closure (f8541 f8542 f8543) (f8537) (let ((f8541 f8541) (f8542 f8542) (f8543 f8543)) (if (null? f8543) f8541 (begin (vector-set! f8541 f8542 (car f8543)) ((vector-ref f8537 0) f8541 (fxadd1 f8542) (cdr f8543)))))))) (closure f8547 (f8537) (let () (let ((f8549 (make-vector ((primitive-ref list-length) f8547)))) ((vector-ref f8537 0) f8549 0 f8547))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f8537 (make-vector 1)))
#  body = (begin (begin (vector-set! f8537 0 (closure (f8541 f8542 f8543) (f8537) (let ((f8541 f8541) (f8542 f8542) (f8543 f8543)) (if (null? f8543) f8541 (begin (vector-set! f8541 f8542 (car f8543)) ((vector-ref f8537 0) f8541 (fxadd1 f8542) (cdr f8543)))))))) (closure f8547 (f8537) (let () (let ((f8549 (make-vector ((primitive-ref list-length) f8547)))) ((vector-ref f8537 0) f8549 0 f8547)))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70279"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70279:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_70280
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70280:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f8537 0 (closure (f8541 f8542 f8543) (f8537) (let ((f8541 f8541) (f8542 f8542) (f8543 f8543)) (if (null? f8543) f8541 (begin (vector-set! f8541 f8542 (car f8543)) ((vector-ref f8537 0) f8541 (fxadd1 f8542) (cdr f8543)))))))) (closure f8547 (f8537) (let () (let ((f8549 (make-vector ((primitive-ref list-length) f8547)))) ((vector-ref f8537 0) f8549 0 f8547)))))
# emit-begin
#   expr=(begin (begin (vector-set! f8537 0 (closure (f8541 f8542 f8543) (f8537) (let ((f8541 f8541) (f8542 f8542) (f8543 f8543)) (if (null? f8543) f8541 (begin (vector-set! f8541 f8542 (car f8543)) ((vector-ref f8537 0) f8541 (fxadd1 f8542) (cdr f8543)))))))) (closure f8547 (f8537) (let () (let ((f8549 (make-vector ((primitive-ref list-length) f8547)))) ((vector-ref f8537 0) f8549 0 f8547)))))
#   env=((f8537 . 0))
# emit-expr (begin (vector-set! f8537 0 (closure (f8541 f8542 f8543) (f8537) (let ((f8541 f8541) (f8542 f8542) (f8543 f8543)) (if (null? f8543) f8541 (begin (vector-set! f8541 f8542 (car f8543)) ((vector-ref f8537 0) f8541 (fxadd1 f8542) (cdr f8543))))))))
# emit-begin
#   expr=(begin (vector-set! f8537 0 (closure (f8541 f8542 f8543) (f8537) (let ((f8541 f8541) (f8542 f8542) (f8543 f8543)) (if (null? f8543) f8541 (begin (vector-set! f8541 f8542 (car f8543)) ((vector-ref f8537 0) f8541 (fxadd1 f8542) (cdr f8543))))))))
#   env=((f8537 . 0))
# emit-expr (vector-set! f8537 0 (closure (f8541 f8542 f8543) (f8537) (let ((f8541 f8541) (f8542 f8542) (f8543 f8543)) (if (null? f8543) f8541 (begin (vector-set! f8541 f8542 (car f8543)) ((vector-ref f8537 0) f8541 (fxadd1 f8542) (cdr f8543)))))))
# emit-expr f8537
# emit-variable-ref
# env=((f8537 . 0))
# var=f8537
    movl 0(%esp), %eax  # stack load f8537
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70281
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70281:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70282"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70282:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70284
    cmp  $0,%eax
    jge _L_70283
_L_70284:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70283:
    movl %eax, -8(%esp)
# emit-expr (closure (f8541 f8542 f8543) (f8537) (let ((f8541 f8541) (f8542 f8542) (f8543 f8543)) (if (null? f8543) f8541 (begin (vector-set! f8541 f8542 (car f8543)) ((vector-ref f8537 0) f8541 (fxadd1 f8542) (cdr f8543))))))
# emit-closure
# si = -12
# env = ((f8537 . 0))
# expr = (closure (f8541 f8542 f8543) (f8537) (let ((f8541 f8541) (f8542 f8542) (f8543 f8543)) (if (null? f8543) f8541 (begin (vector-set! f8541 f8542 (car f8543)) ((vector-ref f8537 0) f8541 (fxadd1 f8542) (cdr f8543))))))
    movl $_L_70285, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f8537 . 0))
# var=f8537
    movl 0(%esp), %eax  # stack load f8537
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f8537
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_70286            # jump around closure body
_L_70285:
# check argument count
    cmp $12,%eax
    je _L_70287
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_70287:
# emit-tail-expr
# si=-20
# env=((f8543 . -16) (f8542 . -12) (f8541 . -8) (f8537 . 4) (f8537 . 0))
# expr=(let ((f8541 f8541) (f8542 f8542) (f8543 f8543)) (if (null? f8543) f8541 (begin (vector-set! f8541 f8542 (car f8543)) ((vector-ref f8537 0) f8541 (fxadd1 f8542) (cdr f8543)))))
# emit-tail-let
#  si   = -20
#  env  = ((f8543 . -16) (f8542 . -12) (f8541 . -8) (f8537 . 4) (f8537 . 0))
#  bindings = ((f8541 f8541) (f8542 f8542) (f8543 f8543))
#  body = (if (null? f8543) f8541 (begin (vector-set! f8541 f8542 (car f8543)) ((vector-ref f8537 0) f8541 (fxadd1 f8542) (cdr f8543))))
# emit-expr f8541
# emit-variable-ref
# env=((f8543 . -16) (f8542 . -12) (f8541 . -8) (f8537 . 4) (f8537 . 0))
# var=f8541
    movl -8(%esp), %eax  # stack load f8541
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr f8542
# emit-variable-ref
# env=((f8543 . -16) (f8542 . -12) (f8541 . -8) (f8537 . 4) (f8537 . 0))
# var=f8542
    movl -12(%esp), %eax  # stack load f8542
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f8543
# emit-variable-ref
# env=((f8543 . -16) (f8542 . -12) (f8541 . -8) (f8537 . 4) (f8537 . 0))
# var=f8543
    movl -16(%esp), %eax  # stack load f8543
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((f8543 . -28) (f8542 . -24) (f8541 . -20) (f8543 . -16) (f8542 . -12) (f8541 . -8) (f8537 . 4) (f8537 . 0))
# expr=(if (null? f8543) f8541 (begin (vector-set! f8541 f8542 (car f8543)) ((vector-ref f8537 0) f8541 (fxadd1 f8542) (cdr f8543))))
# emit-expr (null? f8543)
# emit-expr f8543
# emit-variable-ref
# env=((f8543 . -28) (f8542 . -24) (f8541 . -20) (f8543 . -16) (f8542 . -12) (f8541 . -8) (f8537 . 4) (f8537 . 0))
# var=f8543
    movl -28(%esp), %eax  # stack load f8543
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_70288
# emit-tail-expr
# si=-32
# env=((f8543 . -28) (f8542 . -24) (f8541 . -20) (f8543 . -16) (f8542 . -12) (f8541 . -8) (f8537 . 4) (f8537 . 0))
# expr=f8541
# emit-tail-variable-ref
# emit-variable-ref
# env=((f8543 . -28) (f8542 . -24) (f8541 . -20) (f8543 . -16) (f8542 . -12) (f8541 . -8) (f8537 . 4) (f8537 . 0))
# var=f8541
    movl -20(%esp), %eax  # stack load f8541
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    jmp _L_70289
_L_70288:
# emit-tail-expr
# si=-32
# env=((f8543 . -28) (f8542 . -24) (f8541 . -20) (f8543 . -16) (f8542 . -12) (f8541 . -8) (f8537 . 4) (f8537 . 0))
# expr=(begin (vector-set! f8541 f8542 (car f8543)) ((vector-ref f8537 0) f8541 (fxadd1 f8542) (cdr f8543)))
# tail-begin (begin (vector-set! f8541 f8542 (car f8543)) ((vector-ref f8537 0) f8541 (fxadd1 f8542) (cdr f8543)))
#   env=((f8543 . -28) (f8542 . -24) (f8541 . -20) (f8543 . -16) (f8542 . -12) (f8541 . -8) (f8537 . 4) (f8537 . 0))
# emit-expr (vector-set! f8541 f8542 (car f8543))
# emit-expr f8541
# emit-variable-ref
# env=((f8543 . -28) (f8542 . -24) (f8541 . -20) (f8543 . -16) (f8542 . -12) (f8541 . -8) (f8537 . 4) (f8537 . 0))
# var=f8541
    movl -20(%esp), %eax  # stack load f8541
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70290
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70290:
    movl %eax, -32(%esp)
# emit-expr f8542
# emit-variable-ref
# env=((f8543 . -28) (f8542 . -24) (f8541 . -20) (f8543 . -16) (f8542 . -12) (f8541 . -8) (f8537 . 4) (f8537 . 0))
# var=f8542
    movl -24(%esp), %eax  # stack load f8542
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70291"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70291:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70293
    cmp  $0,%eax
    jge _L_70292
_L_70293:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70292:
    movl %eax, -36(%esp)
# emit-expr (car f8543)
# emit-expr f8543
# emit-variable-ref
# env=((f8543 . -28) (f8542 . -24) (f8541 . -20) (f8543 . -16) (f8542 . -12) (f8541 . -8) (f8537 . 4) (f8537 . 0))
# var=f8543
    movl -28(%esp), %eax  # stack load f8543
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_70294
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $108,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70294:
    movl -1(%eax), %eax
    movl -32(%esp), %ebx
    movl -36(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-tail-expr
# si=-32
# env=((f8543 . -28) (f8542 . -24) (f8541 . -20) (f8543 . -16) (f8542 . -12) (f8541 . -8) (f8537 . 4) (f8537 . 0))
# expr=(begin ((vector-ref f8537 0) f8541 (fxadd1 f8542) (cdr f8543)))
# tail-begin (begin ((vector-ref f8537 0) f8541 (fxadd1 f8542) (cdr f8543)))
#   env=((f8543 . -28) (f8542 . -24) (f8541 . -20) (f8543 . -16) (f8542 . -12) (f8541 . -8) (f8537 . 4) (f8537 . 0))
# emit-tail-expr
# si=-32
# env=((f8543 . -28) (f8542 . -24) (f8541 . -20) (f8543 . -16) (f8542 . -12) (f8541 . -8) (f8537 . 4) (f8537 . 0))
# expr=((vector-ref f8537 0) f8541 (fxadd1 f8542) (cdr f8543))
# emit-tail-funcall
#    si   =-32
#    env  = ((f8543 . -28) (f8542 . -24) (f8541 . -20) (f8543 . -16) (f8542 . -12) (f8541 . -8) (f8537 . 4) (f8537 . 0))
#    expr = (funcall (vector-ref f8537 0) f8541 (fxadd1 f8542) (cdr f8543))
# emit-expr (vector-ref f8537 0)
# emit-expr f8537
# emit-variable-ref
# env=((f8543 . -28) (f8542 . -24) (f8541 . -20) (f8543 . -16) (f8542 . -12) (f8541 . -8) (f8537 . 4) (f8537 . 0))
# var=f8537
    movl 2(%edi), %eax  # frame load f8537
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70295
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70295:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70296"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70296:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70298
    cmp  $0,%eax
    jge _L_70297
_L_70298:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70297:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -32(%esp)  # stash funcall-oper in next closure slot
# emit-expr f8541
# emit-variable-ref
# env=((f8543 . -28) (f8542 . -24) (f8541 . -20) (f8543 . -16) (f8542 . -12) (f8541 . -8) (f8537 . 4) (f8537 . 0))
# var=f8541
    movl -20(%esp), %eax  # stack load f8541
# end emit-variable-ref
    mov %eax, -36(%esp)    # arg f8541
# emit-expr (fxadd1 f8542)
# emit-expr f8542
# emit-variable-ref
# env=((f8543 . -28) (f8542 . -24) (f8541 . -20) (f8543 . -16) (f8542 . -12) (f8541 . -8) (f8537 . 4) (f8537 . 0))
# var=f8542
    movl -24(%esp), %eax  # stack load f8542
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70299"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70299:
     addl $4, %eax
    mov %eax, -40(%esp)    # arg (fxadd1 f8542)
# emit-expr (cdr f8543)
# emit-expr f8543
# emit-variable-ref
# env=((f8543 . -28) (f8542 . -24) (f8541 . -20) (f8543 . -16) (f8542 . -12) (f8541 . -8) (f8537 . 4) (f8537 . 0))
# var=f8543
    movl -28(%esp), %eax  # stack load f8543
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_70300
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70300:
    movl 3(%eax), %eax
    mov %eax, -44(%esp)    # arg (cdr f8543)
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
_L_70289:
    .align 4,0x90
_L_70286:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f8537 . 0))
# emit-expr (begin (closure f8547 (f8537) (let () (let ((f8549 (make-vector ((primitive-ref list-length) f8547)))) ((vector-ref f8537 0) f8549 0 f8547)))))
# emit-begin
#   expr=(begin (closure f8547 (f8537) (let () (let ((f8549 (make-vector ((primitive-ref list-length) f8547)))) ((vector-ref f8537 0) f8549 0 f8547)))))
#   env=((f8537 . 0))
# emit-expr (closure f8547 (f8537) (let () (let ((f8549 (make-vector ((primitive-ref list-length) f8547)))) ((vector-ref f8537 0) f8549 0 f8547))))
# emit-closure
# si = -4
# env = ((f8537 . 0))
# expr = (closure f8547 (f8537) (let () (let ((f8549 (make-vector ((primitive-ref list-length) f8547)))) ((vector-ref f8537 0) f8549 0 f8547))))
    movl $_L_70301, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f8537 . 0))
# var=f8537
    movl 0(%esp), %eax  # stack load f8537
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f8537
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_70302            # jump around closure body
_L_70301:
# check argument count
    cmp $0,%eax
    jge _L_70303
# invoke error handler eh_argcount_min
    .extern eh$uargcount$umin
    movl eh$uargcount$umin, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_70303:
# emit-build-varargs-list
    movl $63, %esi       # args <- () 
    lea -4(%esp),%edi    # edi <- esp-4
    subl %eax, %edi      # edi <- esp-4-eax    addr of arg[K+N] on stack
_L_70305:
    lea -4(%esp),%ebx    # addr of arg[K] on stack
    cmp %edi, %ebx       # while edi <> esp+(si+4)
    je _L_70304
    movl (%edi),%ebx     # arg i -> car
    movl %ebx, 0(%ebp)
    movl %esi, 4(%ebp)  # esi -> cdr
    movl %ebp, %esi
    addl $1, %esi       # tag as pair
    addl $8,%ebp         # bump heap ptr
    addl $4,%edi         # move to next previous arg from the end
    jmp _L_70305
_L_70304:
    movl %esi, -8(%esp)  # set args
# emit-tail-expr
# si=-12
# env=((f8547 . -8) (f8537 . 4) (f8537 . 0))
# expr=(let () (let ((f8549 (make-vector ((primitive-ref list-length) f8547)))) ((vector-ref f8537 0) f8549 0 f8547)))
# emit-tail-let
#  si   = -12
#  env  = ((f8547 . -8) (f8537 . 4) (f8537 . 0))
#  bindings = ()
#  body = (let ((f8549 (make-vector ((primitive-ref list-length) f8547)))) ((vector-ref f8537 0) f8549 0 f8547))
# emit-tail-expr
# si=-12
# env=((f8547 . -8) (f8537 . 4) (f8537 . 0))
# expr=(let ((f8549 (make-vector ((primitive-ref list-length) f8547)))) ((vector-ref f8537 0) f8549 0 f8547))
# emit-tail-let
#  si   = -12
#  env  = ((f8547 . -8) (f8537 . 4) (f8537 . 0))
#  bindings = ((f8549 (make-vector ((primitive-ref list-length) f8547))))
#  body = ((vector-ref f8537 0) f8549 0 f8547)
# emit-expr (make-vector ((primitive-ref list-length) f8547))
# make-vector ((primitive-ref list-length) f8547)
# emit-expr ((primitive-ref list-length) f8547)
# funcall
#    si   =-12
#    env  = ((f8547 . -8) (f8537 . 4) (f8537 . 0))
#    expr = (funcall (primitive-ref list-length) f8547)
# emit-expr (primitive-ref list-length)
    .extern list$mlength
    movl list$mlength,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70306"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70306":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr f8547
# emit-variable-ref
# env=((f8547 . -8) (f8537 . 4) (f8537 . 0))
# var=f8547
    movl -8(%esp), %eax  # stack load f8547
# end emit-variable-ref
    mov %eax, -24(%esp)  # arg f8547
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
    je "_L_70307"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70307:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_70308
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70308:
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
# env=((f8549 . -12) (f8547 . -8) (f8537 . 4) (f8537 . 0))
# expr=((vector-ref f8537 0) f8549 0 f8547)
# emit-tail-funcall
#    si   =-16
#    env  = ((f8549 . -12) (f8547 . -8) (f8537 . 4) (f8537 . 0))
#    expr = (funcall (vector-ref f8537 0) f8549 0 f8547)
# emit-expr (vector-ref f8537 0)
# emit-expr f8537
# emit-variable-ref
# env=((f8549 . -12) (f8547 . -8) (f8537 . 4) (f8537 . 0))
# var=f8537
    movl 2(%edi), %eax  # frame load f8537
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70309
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70309:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70310"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70310:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70312
    cmp  $0,%eax
    jge _L_70311
_L_70312:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70311:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f8549
# emit-variable-ref
# env=((f8549 . -12) (f8547 . -8) (f8537 . 4) (f8537 . 0))
# var=f8549
    movl -12(%esp), %eax  # stack load f8549
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f8549
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -24(%esp)    # arg 0
# emit-expr f8547
# emit-variable-ref
# env=((f8549 . -12) (f8547 . -8) (f8537 . 4) (f8537 . 0))
# var=f8547
    movl -8(%esp), %eax  # stack load f8547
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f8547
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
_L_70302:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f8537 . 0))
     movl %eax, vector
# == explicit-begins  ==>
# (letrec ((fill-string (lambda (s k args) (if (null? args) s (begin (string-set! s k (car args)) (fill-string s (fxadd1 k) (cdr args))))))) (lambda args (let ((s (make-string (list-length args)))) (fill-string s 0 args))))
# == eliminate-let*  ==>
# (letrec ((fill-string (lambda (s k args) (if (null? args) s (begin (string-set! s k (car args)) (fill-string s (fxadd1 k) (cdr args))))))) (lambda args (let ((s (make-string (list-length args)))) (fill-string s 0 args))))
# == uniquify-variables  ==>
# (letrec ((f8550 (lambda (f8554 f8555 f8556) (if (null? f8556) f8554 (begin (string-set! f8554 f8555 (car f8556)) (f8550 f8554 (fxadd1 f8555) (cdr f8556))))))) (lambda f8560 (let ((f8562 (make-string (list-length f8560)))) (f8550 f8562 0 f8560))))
# == vectorize-letrec  ==>
# (let ((f8550 (make-vector 1))) (begin (begin (vector-set! f8550 0 (lambda (f8554 f8555 f8556) (if (null? f8556) f8554 (begin (string-set! f8554 f8555 (car f8556)) ((vector-ref f8550 0) f8554 (fxadd1 f8555) (cdr f8556))))))) (lambda f8560 (let ((f8562 (make-string (list-length f8560)))) ((vector-ref f8550 0) f8562 0 f8560)))))
# == eliminate-set!  ==>
# (let ((f8550 (make-vector 1))) (begin (begin (vector-set! f8550 0 (lambda (f8554 f8555 f8556) (let ((f8554 f8554) (f8555 f8555) (f8556 f8556)) (if (null? f8556) f8554 (begin (string-set! f8554 f8555 (car f8556)) ((vector-ref f8550 0) f8554 (fxadd1 f8555) (cdr f8556)))))))) (lambda f8560 (let () (let ((f8562 (make-string (list-length f8560)))) ((vector-ref f8550 0) f8562 0 f8560))))))
# == close-free-variables  ==>
# (let ((f8550 (make-vector 1))) (begin (begin (vector-set! f8550 0 (closure (f8554 f8555 f8556) (f8550) (let ((f8554 f8554) (f8555 f8555) (f8556 f8556)) (if (null? f8556) f8554 (begin (string-set! f8554 f8555 (car f8556)) ((vector-ref f8550 0) f8554 (fxadd1 f8555) (cdr f8556)))))))) (closure f8560 (f8550) (let () (let ((f8562 (make-string (list-length f8560)))) ((vector-ref f8550 0) f8562 0 f8560))))))
# == eliminate-quote  ==>
# (let ((f8550 (make-vector 1))) (begin (begin (vector-set! f8550 0 (closure (f8554 f8555 f8556) (f8550) (let ((f8554 f8554) (f8555 f8555) (f8556 f8556)) (if (null? f8556) f8554 (begin (string-set! f8554 f8555 (car f8556)) ((vector-ref f8550 0) f8554 (fxadd1 f8555) (cdr f8556)))))))) (closure f8560 (f8550) (let () (let ((f8562 (make-string (list-length f8560)))) ((vector-ref f8550 0) f8562 0 f8560))))))
# == eliminate-when/unless  ==>
# (let ((f8550 (make-vector 1))) (begin (begin (vector-set! f8550 0 (closure (f8554 f8555 f8556) (f8550) (let ((f8554 f8554) (f8555 f8555) (f8556 f8556)) (if (null? f8556) f8554 (begin (string-set! f8554 f8555 (car f8556)) ((vector-ref f8550 0) f8554 (fxadd1 f8555) (cdr f8556)))))))) (closure f8560 (f8550) (let () (let ((f8562 (make-string (list-length f8560)))) ((vector-ref f8550 0) f8562 0 f8560))))))
# == eliminate-cond  ==>
# (let ((f8550 (make-vector 1))) (begin (begin (vector-set! f8550 0 (closure (f8554 f8555 f8556) (f8550) (let ((f8554 f8554) (f8555 f8555) (f8556 f8556)) (if (null? f8556) f8554 (begin (string-set! f8554 f8555 (car f8556)) ((vector-ref f8550 0) f8554 (fxadd1 f8555) (cdr f8556)))))))) (closure f8560 (f8550) (let () (let ((f8562 (make-string (list-length f8560)))) ((vector-ref f8550 0) f8562 0 f8560))))))
# == external-symbols  ==>
# (let ((f8550 (make-vector 1))) (begin (begin (vector-set! f8550 0 (closure (f8554 f8555 f8556) (f8550) (let ((f8554 f8554) (f8555 f8555) (f8556 f8556)) (if (null? f8556) f8554 (begin (string-set! f8554 f8555 (car f8556)) ((vector-ref f8550 0) f8554 (fxadd1 f8555) (cdr f8556)))))))) (closure f8560 (f8550) (let () (let ((f8562 (make-string ((primitive-ref list-length) f8560)))) ((vector-ref f8550 0) f8562 0 f8560))))))
# emit-expr (let ((f8550 (make-vector 1))) (begin (begin (vector-set! f8550 0 (closure (f8554 f8555 f8556) (f8550) (let ((f8554 f8554) (f8555 f8555) (f8556 f8556)) (if (null? f8556) f8554 (begin (string-set! f8554 f8555 (car f8556)) ((vector-ref f8550 0) f8554 (fxadd1 f8555) (cdr f8556)))))))) (closure f8560 (f8550) (let () (let ((f8562 (make-string ((primitive-ref list-length) f8560)))) ((vector-ref f8550 0) f8562 0 f8560))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f8550 (make-vector 1)))
#  body = (begin (begin (vector-set! f8550 0 (closure (f8554 f8555 f8556) (f8550) (let ((f8554 f8554) (f8555 f8555) (f8556 f8556)) (if (null? f8556) f8554 (begin (string-set! f8554 f8555 (car f8556)) ((vector-ref f8550 0) f8554 (fxadd1 f8555) (cdr f8556)))))))) (closure f8560 (f8550) (let () (let ((f8562 (make-string ((primitive-ref list-length) f8560)))) ((vector-ref f8550 0) f8562 0 f8560)))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70313"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70313:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_70314
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70314:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f8550 0 (closure (f8554 f8555 f8556) (f8550) (let ((f8554 f8554) (f8555 f8555) (f8556 f8556)) (if (null? f8556) f8554 (begin (string-set! f8554 f8555 (car f8556)) ((vector-ref f8550 0) f8554 (fxadd1 f8555) (cdr f8556)))))))) (closure f8560 (f8550) (let () (let ((f8562 (make-string ((primitive-ref list-length) f8560)))) ((vector-ref f8550 0) f8562 0 f8560)))))
# emit-begin
#   expr=(begin (begin (vector-set! f8550 0 (closure (f8554 f8555 f8556) (f8550) (let ((f8554 f8554) (f8555 f8555) (f8556 f8556)) (if (null? f8556) f8554 (begin (string-set! f8554 f8555 (car f8556)) ((vector-ref f8550 0) f8554 (fxadd1 f8555) (cdr f8556)))))))) (closure f8560 (f8550) (let () (let ((f8562 (make-string ((primitive-ref list-length) f8560)))) ((vector-ref f8550 0) f8562 0 f8560)))))
#   env=((f8550 . 0))
# emit-expr (begin (vector-set! f8550 0 (closure (f8554 f8555 f8556) (f8550) (let ((f8554 f8554) (f8555 f8555) (f8556 f8556)) (if (null? f8556) f8554 (begin (string-set! f8554 f8555 (car f8556)) ((vector-ref f8550 0) f8554 (fxadd1 f8555) (cdr f8556))))))))
# emit-begin
#   expr=(begin (vector-set! f8550 0 (closure (f8554 f8555 f8556) (f8550) (let ((f8554 f8554) (f8555 f8555) (f8556 f8556)) (if (null? f8556) f8554 (begin (string-set! f8554 f8555 (car f8556)) ((vector-ref f8550 0) f8554 (fxadd1 f8555) (cdr f8556))))))))
#   env=((f8550 . 0))
# emit-expr (vector-set! f8550 0 (closure (f8554 f8555 f8556) (f8550) (let ((f8554 f8554) (f8555 f8555) (f8556 f8556)) (if (null? f8556) f8554 (begin (string-set! f8554 f8555 (car f8556)) ((vector-ref f8550 0) f8554 (fxadd1 f8555) (cdr f8556)))))))
# emit-expr f8550
# emit-variable-ref
# env=((f8550 . 0))
# var=f8550
    movl 0(%esp), %eax  # stack load f8550
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70315
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70315:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70316"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70316:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70318
    cmp  $0,%eax
    jge _L_70317
_L_70318:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70317:
    movl %eax, -8(%esp)
# emit-expr (closure (f8554 f8555 f8556) (f8550) (let ((f8554 f8554) (f8555 f8555) (f8556 f8556)) (if (null? f8556) f8554 (begin (string-set! f8554 f8555 (car f8556)) ((vector-ref f8550 0) f8554 (fxadd1 f8555) (cdr f8556))))))
# emit-closure
# si = -12
# env = ((f8550 . 0))
# expr = (closure (f8554 f8555 f8556) (f8550) (let ((f8554 f8554) (f8555 f8555) (f8556 f8556)) (if (null? f8556) f8554 (begin (string-set! f8554 f8555 (car f8556)) ((vector-ref f8550 0) f8554 (fxadd1 f8555) (cdr f8556))))))
    movl $_L_70319, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f8550 . 0))
# var=f8550
    movl 0(%esp), %eax  # stack load f8550
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f8550
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_70320            # jump around closure body
_L_70319:
# check argument count
    cmp $12,%eax
    je _L_70321
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_70321:
# emit-tail-expr
# si=-20
# env=((f8556 . -16) (f8555 . -12) (f8554 . -8) (f8550 . 4) (f8550 . 0))
# expr=(let ((f8554 f8554) (f8555 f8555) (f8556 f8556)) (if (null? f8556) f8554 (begin (string-set! f8554 f8555 (car f8556)) ((vector-ref f8550 0) f8554 (fxadd1 f8555) (cdr f8556)))))
# emit-tail-let
#  si   = -20
#  env  = ((f8556 . -16) (f8555 . -12) (f8554 . -8) (f8550 . 4) (f8550 . 0))
#  bindings = ((f8554 f8554) (f8555 f8555) (f8556 f8556))
#  body = (if (null? f8556) f8554 (begin (string-set! f8554 f8555 (car f8556)) ((vector-ref f8550 0) f8554 (fxadd1 f8555) (cdr f8556))))
# emit-expr f8554
# emit-variable-ref
# env=((f8556 . -16) (f8555 . -12) (f8554 . -8) (f8550 . 4) (f8550 . 0))
# var=f8554
    movl -8(%esp), %eax  # stack load f8554
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr f8555
# emit-variable-ref
# env=((f8556 . -16) (f8555 . -12) (f8554 . -8) (f8550 . 4) (f8550 . 0))
# var=f8555
    movl -12(%esp), %eax  # stack load f8555
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f8556
# emit-variable-ref
# env=((f8556 . -16) (f8555 . -12) (f8554 . -8) (f8550 . 4) (f8550 . 0))
# var=f8556
    movl -16(%esp), %eax  # stack load f8556
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((f8556 . -28) (f8555 . -24) (f8554 . -20) (f8556 . -16) (f8555 . -12) (f8554 . -8) (f8550 . 4) (f8550 . 0))
# expr=(if (null? f8556) f8554 (begin (string-set! f8554 f8555 (car f8556)) ((vector-ref f8550 0) f8554 (fxadd1 f8555) (cdr f8556))))
# emit-expr (null? f8556)
# emit-expr f8556
# emit-variable-ref
# env=((f8556 . -28) (f8555 . -24) (f8554 . -20) (f8556 . -16) (f8555 . -12) (f8554 . -8) (f8550 . 4) (f8550 . 0))
# var=f8556
    movl -28(%esp), %eax  # stack load f8556
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_70322
# emit-tail-expr
# si=-32
# env=((f8556 . -28) (f8555 . -24) (f8554 . -20) (f8556 . -16) (f8555 . -12) (f8554 . -8) (f8550 . 4) (f8550 . 0))
# expr=f8554
# emit-tail-variable-ref
# emit-variable-ref
# env=((f8556 . -28) (f8555 . -24) (f8554 . -20) (f8556 . -16) (f8555 . -12) (f8554 . -8) (f8550 . 4) (f8550 . 0))
# var=f8554
    movl -20(%esp), %eax  # stack load f8554
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    jmp _L_70323
_L_70322:
# emit-tail-expr
# si=-32
# env=((f8556 . -28) (f8555 . -24) (f8554 . -20) (f8556 . -16) (f8555 . -12) (f8554 . -8) (f8550 . 4) (f8550 . 0))
# expr=(begin (string-set! f8554 f8555 (car f8556)) ((vector-ref f8550 0) f8554 (fxadd1 f8555) (cdr f8556)))
# tail-begin (begin (string-set! f8554 f8555 (car f8556)) ((vector-ref f8550 0) f8554 (fxadd1 f8555) (cdr f8556)))
#   env=((f8556 . -28) (f8555 . -24) (f8554 . -20) (f8556 . -16) (f8555 . -12) (f8554 . -8) (f8550 . 4) (f8550 . 0))
# emit-expr (string-set! f8554 f8555 (car f8556))
# emit-expr f8554
# emit-variable-ref
# env=((f8556 . -28) (f8555 . -24) (f8554 . -20) (f8556 . -16) (f8555 . -12) (f8554 . -8) (f8550 . 4) (f8550 . 0))
# var=f8554
    movl -20(%esp), %eax  # stack load f8554
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_70324
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $160,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70324:
    movl %eax, -32(%esp)
# emit-expr f8555
# emit-variable-ref
# env=((f8556 . -28) (f8555 . -24) (f8554 . -20) (f8556 . -16) (f8555 . -12) (f8554 . -8) (f8550 . 4) (f8550 . 0))
# var=f8555
    movl -24(%esp), %eax  # stack load f8555
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70325"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $160,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70325:
# check bounds on string index
    movl -32(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_70327
    cmp  $0,%eax
    jge _L_70326
_L_70327:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $160,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70326:
    movl %eax, -36(%esp)
# emit-expr (car f8556)
# emit-expr f8556
# emit-variable-ref
# env=((f8556 . -28) (f8555 . -24) (f8554 . -20) (f8556 . -16) (f8555 . -12) (f8554 . -8) (f8550 . 4) (f8550 . 0))
# var=f8556
    movl -28(%esp), %eax  # stack load f8556
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_70328
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $108,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70328:
    movl -1(%eax), %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_70329"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $160,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70329:
    movl -32(%esp), %ebx
    movl -36(%esp), %esi
    sar $2, %esi
    movb  %ah, -2(%ebx,%esi)
# emit-tail-expr
# si=-32
# env=((f8556 . -28) (f8555 . -24) (f8554 . -20) (f8556 . -16) (f8555 . -12) (f8554 . -8) (f8550 . 4) (f8550 . 0))
# expr=(begin ((vector-ref f8550 0) f8554 (fxadd1 f8555) (cdr f8556)))
# tail-begin (begin ((vector-ref f8550 0) f8554 (fxadd1 f8555) (cdr f8556)))
#   env=((f8556 . -28) (f8555 . -24) (f8554 . -20) (f8556 . -16) (f8555 . -12) (f8554 . -8) (f8550 . 4) (f8550 . 0))
# emit-tail-expr
# si=-32
# env=((f8556 . -28) (f8555 . -24) (f8554 . -20) (f8556 . -16) (f8555 . -12) (f8554 . -8) (f8550 . 4) (f8550 . 0))
# expr=((vector-ref f8550 0) f8554 (fxadd1 f8555) (cdr f8556))
# emit-tail-funcall
#    si   =-32
#    env  = ((f8556 . -28) (f8555 . -24) (f8554 . -20) (f8556 . -16) (f8555 . -12) (f8554 . -8) (f8550 . 4) (f8550 . 0))
#    expr = (funcall (vector-ref f8550 0) f8554 (fxadd1 f8555) (cdr f8556))
# emit-expr (vector-ref f8550 0)
# emit-expr f8550
# emit-variable-ref
# env=((f8556 . -28) (f8555 . -24) (f8554 . -20) (f8556 . -16) (f8555 . -12) (f8554 . -8) (f8550 . 4) (f8550 . 0))
# var=f8550
    movl 2(%edi), %eax  # frame load f8550
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70330
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70330:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70331"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70331:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70333
    cmp  $0,%eax
    jge _L_70332
_L_70333:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70332:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -32(%esp)  # stash funcall-oper in next closure slot
# emit-expr f8554
# emit-variable-ref
# env=((f8556 . -28) (f8555 . -24) (f8554 . -20) (f8556 . -16) (f8555 . -12) (f8554 . -8) (f8550 . 4) (f8550 . 0))
# var=f8554
    movl -20(%esp), %eax  # stack load f8554
# end emit-variable-ref
    mov %eax, -36(%esp)    # arg f8554
# emit-expr (fxadd1 f8555)
# emit-expr f8555
# emit-variable-ref
# env=((f8556 . -28) (f8555 . -24) (f8554 . -20) (f8556 . -16) (f8555 . -12) (f8554 . -8) (f8550 . 4) (f8550 . 0))
# var=f8555
    movl -24(%esp), %eax  # stack load f8555
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70334"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70334:
     addl $4, %eax
    mov %eax, -40(%esp)    # arg (fxadd1 f8555)
# emit-expr (cdr f8556)
# emit-expr f8556
# emit-variable-ref
# env=((f8556 . -28) (f8555 . -24) (f8554 . -20) (f8556 . -16) (f8555 . -12) (f8554 . -8) (f8550 . 4) (f8550 . 0))
# var=f8556
    movl -28(%esp), %eax  # stack load f8556
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_70335
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70335:
    movl 3(%eax), %eax
    mov %eax, -44(%esp)    # arg (cdr f8556)
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
_L_70323:
    .align 4,0x90
_L_70320:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f8550 . 0))
# emit-expr (begin (closure f8560 (f8550) (let () (let ((f8562 (make-string ((primitive-ref list-length) f8560)))) ((vector-ref f8550 0) f8562 0 f8560)))))
# emit-begin
#   expr=(begin (closure f8560 (f8550) (let () (let ((f8562 (make-string ((primitive-ref list-length) f8560)))) ((vector-ref f8550 0) f8562 0 f8560)))))
#   env=((f8550 . 0))
# emit-expr (closure f8560 (f8550) (let () (let ((f8562 (make-string ((primitive-ref list-length) f8560)))) ((vector-ref f8550 0) f8562 0 f8560))))
# emit-closure
# si = -4
# env = ((f8550 . 0))
# expr = (closure f8560 (f8550) (let () (let ((f8562 (make-string ((primitive-ref list-length) f8560)))) ((vector-ref f8550 0) f8562 0 f8560))))
    movl $_L_70336, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f8550 . 0))
# var=f8550
    movl 0(%esp), %eax  # stack load f8550
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f8550
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_70337            # jump around closure body
_L_70336:
# check argument count
    cmp $0,%eax
    jge _L_70338
# invoke error handler eh_argcount_min
    .extern eh$uargcount$umin
    movl eh$uargcount$umin, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_70338:
# emit-build-varargs-list
    movl $63, %esi       # args <- () 
    lea -4(%esp),%edi    # edi <- esp-4
    subl %eax, %edi      # edi <- esp-4-eax    addr of arg[K+N] on stack
_L_70340:
    lea -4(%esp),%ebx    # addr of arg[K] on stack
    cmp %edi, %ebx       # while edi <> esp+(si+4)
    je _L_70339
    movl (%edi),%ebx     # arg i -> car
    movl %ebx, 0(%ebp)
    movl %esi, 4(%ebp)  # esi -> cdr
    movl %ebp, %esi
    addl $1, %esi       # tag as pair
    addl $8,%ebp         # bump heap ptr
    addl $4,%edi         # move to next previous arg from the end
    jmp _L_70340
_L_70339:
    movl %esi, -8(%esp)  # set args
# emit-tail-expr
# si=-12
# env=((f8560 . -8) (f8550 . 4) (f8550 . 0))
# expr=(let () (let ((f8562 (make-string ((primitive-ref list-length) f8560)))) ((vector-ref f8550 0) f8562 0 f8560)))
# emit-tail-let
#  si   = -12
#  env  = ((f8560 . -8) (f8550 . 4) (f8550 . 0))
#  bindings = ()
#  body = (let ((f8562 (make-string ((primitive-ref list-length) f8560)))) ((vector-ref f8550 0) f8562 0 f8560))
# emit-tail-expr
# si=-12
# env=((f8560 . -8) (f8550 . 4) (f8550 . 0))
# expr=(let ((f8562 (make-string ((primitive-ref list-length) f8560)))) ((vector-ref f8550 0) f8562 0 f8560))
# emit-tail-let
#  si   = -12
#  env  = ((f8560 . -8) (f8550 . 4) (f8550 . 0))
#  bindings = ((f8562 (make-string ((primitive-ref list-length) f8560))))
#  body = ((vector-ref f8550 0) f8562 0 f8560)
# emit-expr (make-string ((primitive-ref list-length) f8560))
# make-string len=((primitive-ref list-length) f8560)
# emit-expr ((primitive-ref list-length) f8560)
# funcall
#    si   =-12
#    env  = ((f8560 . -8) (f8550 . 4) (f8550 . 0))
#    expr = (funcall (primitive-ref list-length) f8560)
# emit-expr (primitive-ref list-length)
    .extern list$mlength
    movl list$mlength,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70341"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70341":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr f8560
# emit-variable-ref
# env=((f8560 . -8) (f8550 . 4) (f8550 . 0))
# var=f8560
    movl -8(%esp), %eax  # stack load f8560
# end emit-variable-ref
    mov %eax, -24(%esp)  # arg f8560
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
    je "_L_70342"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70342:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_70343
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70343:
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
# env=((f8562 . -12) (f8560 . -8) (f8550 . 4) (f8550 . 0))
# expr=((vector-ref f8550 0) f8562 0 f8560)
# emit-tail-funcall
#    si   =-16
#    env  = ((f8562 . -12) (f8560 . -8) (f8550 . 4) (f8550 . 0))
#    expr = (funcall (vector-ref f8550 0) f8562 0 f8560)
# emit-expr (vector-ref f8550 0)
# emit-expr f8550
# emit-variable-ref
# env=((f8562 . -12) (f8560 . -8) (f8550 . 4) (f8550 . 0))
# var=f8550
    movl 2(%edi), %eax  # frame load f8550
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70344
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70344:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70345"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70345:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70347
    cmp  $0,%eax
    jge _L_70346
_L_70347:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70346:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f8562
# emit-variable-ref
# env=((f8562 . -12) (f8560 . -8) (f8550 . 4) (f8550 . 0))
# var=f8562
    movl -12(%esp), %eax  # stack load f8562
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f8562
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -24(%esp)    # arg 0
# emit-expr f8560
# emit-variable-ref
# env=((f8562 . -12) (f8560 . -8) (f8550 . 4) (f8550 . 0))
# var=f8560
    movl -8(%esp), %eax  # stack load f8560
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f8560
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
_L_70337:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f8550 . 0))
     movl %eax, string
# == explicit-begins  ==>
# (let* ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s)))) (write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))
# == eliminate-let*  ==>
# (let ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s))))) (let ((write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1)))))
# == uniquify-variables  ==>
# (let ((f8563 (lambda (f8564) (foreign-call "s_write" 2 f8564 (string-length f8564))))) (let ((f8572 (lambda (f8573 f8574) (begin (f8563 "error:") (f8563 (symbol->string f8573)) (f8563 ": ") (f8563 f8574) (f8563 "\n"))))) (lambda (f8577 f8578) (begin (f8572 f8577 f8578) (foreign-call "s_exit" 1)))))
# == vectorize-letrec  ==>
# (let ((f8563 (lambda (f8564) (foreign-call "s_write" 2 f8564 (string-length f8564))))) (let ((f8572 (lambda (f8573 f8574) (begin (f8563 "error:") (f8563 (symbol->string f8573)) (f8563 ": ") (f8563 f8574) (f8563 "\n"))))) (lambda (f8577 f8578) (begin (f8572 f8577 f8578) (foreign-call "s_exit" 1)))))
# == eliminate-set!  ==>
# (let ((f8563 (lambda (f8564) (let ((f8564 f8564)) (foreign-call "s_write" 2 f8564 (string-length f8564)))))) (let ((f8572 (lambda (f8573 f8574) (let ((f8573 f8573) (f8574 f8574)) (begin (f8563 "error:") (f8563 (symbol->string f8573)) (f8563 ": ") (f8563 f8574) (f8563 "\n")))))) (lambda (f8577 f8578) (let ((f8577 f8577) (f8578 f8578)) (begin (f8572 f8577 f8578) (foreign-call "s_exit" 1))))))
# == close-free-variables  ==>
# (let ((f8563 (closure (f8564) () (let ((f8564 f8564)) (foreign-call "s_write" 2 f8564 (string-length f8564)))))) (let ((f8572 (closure (f8573 f8574) (f8563 f8563 f8563 f8563 f8563) (let ((f8573 f8573) (f8574 f8574)) (begin (f8563 "error:") (f8563 (symbol->string f8573)) (f8563 ": ") (f8563 f8574) (f8563 "\n")))))) (closure (f8577 f8578) (f8572) (let ((f8577 f8577) (f8578 f8578)) (begin (f8572 f8577 f8578) (foreign-call "s_exit" 1))))))
# == eliminate-quote  ==>
# (let ((f8563 (closure (f8564) () (let ((f8564 f8564)) (foreign-call "s_write" 2 f8564 (string-length f8564)))))) (let ((f8572 (closure (f8573 f8574) (f8563 f8563 f8563 f8563 f8563) (let ((f8573 f8573) (f8574 f8574)) (begin (f8563 "error:") (f8563 (symbol->string f8573)) (f8563 ": ") (f8563 f8574) (f8563 "\n")))))) (closure (f8577 f8578) (f8572) (let ((f8577 f8577) (f8578 f8578)) (begin (f8572 f8577 f8578) (foreign-call "s_exit" 1))))))
# == eliminate-when/unless  ==>
# (let ((f8563 (closure (f8564) () (let ((f8564 f8564)) (foreign-call "s_write" 2 f8564 (string-length f8564)))))) (let ((f8572 (closure (f8573 f8574) (f8563 f8563 f8563 f8563 f8563) (let ((f8573 f8573) (f8574 f8574)) (begin (f8563 "error:") (f8563 (symbol->string f8573)) (f8563 ": ") (f8563 f8574) (f8563 "\n")))))) (closure (f8577 f8578) (f8572) (let ((f8577 f8577) (f8578 f8578)) (begin (f8572 f8577 f8578) (foreign-call "s_exit" 1))))))
# == eliminate-cond  ==>
# (let ((f8563 (closure (f8564) () (let ((f8564 f8564)) (foreign-call "s_write" 2 f8564 (string-length f8564)))))) (let ((f8572 (closure (f8573 f8574) (f8563 f8563 f8563 f8563 f8563) (let ((f8573 f8573) (f8574 f8574)) (begin (f8563 "error:") (f8563 (symbol->string f8573)) (f8563 ": ") (f8563 f8574) (f8563 "\n")))))) (closure (f8577 f8578) (f8572) (let ((f8577 f8577) (f8578 f8578)) (begin (f8572 f8577 f8578) (foreign-call "s_exit" 1))))))
# == external-symbols  ==>
# (let ((f8563 (closure (f8564) () (let ((f8564 f8564)) (foreign-call "s_write" 2 f8564 (string-length f8564)))))) (let ((f8572 (closure (f8573 f8574) (f8563 f8563 f8563 f8563 f8563) (let ((f8573 f8573) (f8574 f8574)) (begin (f8563 "error:") (f8563 (symbol->string f8573)) (f8563 ": ") (f8563 f8574) (f8563 "\n")))))) (closure (f8577 f8578) (f8572) (let ((f8577 f8577) (f8578 f8578)) (begin (f8572 f8577 f8578) (foreign-call "s_exit" 1))))))
# emit-expr (let ((f8563 (closure (f8564) () (let ((f8564 f8564)) (foreign-call "s_write" 2 f8564 (string-length f8564)))))) (let ((f8572 (closure (f8573 f8574) (f8563 f8563 f8563 f8563 f8563) (let ((f8573 f8573) (f8574 f8574)) (begin (f8563 "error:") (f8563 (symbol->string f8573)) (f8563 ": ") (f8563 f8574) (f8563 "\n")))))) (closure (f8577 f8578) (f8572) (let ((f8577 f8577) (f8578 f8578)) (begin (f8572 f8577 f8578) (foreign-call "s_exit" 1))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f8563 (closure (f8564) () (let ((f8564 f8564)) (foreign-call "s_write" 2 f8564 (string-length f8564))))))
#  body = (let ((f8572 (closure (f8573 f8574) (f8563 f8563 f8563 f8563 f8563) (let ((f8573 f8573) (f8574 f8574)) (begin (f8563 "error:") (f8563 (symbol->string f8573)) (f8563 ": ") (f8563 f8574) (f8563 "\n")))))) (closure (f8577 f8578) (f8572) (let ((f8577 f8577) (f8578 f8578)) (begin (f8572 f8577 f8578) (foreign-call "s_exit" 1)))))
# emit-expr (closure (f8564) () (let ((f8564 f8564)) (foreign-call "s_write" 2 f8564 (string-length f8564))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f8564) () (let ((f8564 f8564)) (foreign-call "s_write" 2 f8564 (string-length f8564))))
    movl $_L_70348, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_70349            # jump around closure body
_L_70348:
# check argument count
    cmp $4,%eax
    je _L_70350
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_70350:
# emit-tail-expr
# si=-12
# env=((f8564 . -8))
# expr=(let ((f8564 f8564)) (foreign-call "s_write" 2 f8564 (string-length f8564)))
# emit-tail-let
#  si   = -12
#  env  = ((f8564 . -8))
#  bindings = ((f8564 f8564))
#  body = (foreign-call "s_write" 2 f8564 (string-length f8564))
# emit-expr f8564
# emit-variable-ref
# env=((f8564 . -8))
# var=f8564
    movl -8(%esp), %eax  # stack load f8564
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f8564 . -12) (f8564 . -8))
# expr=(foreign-call "s_write" 2 f8564 (string-length f8564))
    movl %ecx,-16(%esp)
    movl %esp,-20(%esp)
# emit-expr (string-length f8564)
# emit-expr f8564
# emit-variable-ref
# env=((f8564 . -12) (f8564 . -8))
# var=f8564
    movl -12(%esp), %eax  # stack load f8564
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_70351
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70351:
    movl -6(%eax), %eax
    movl %eax, -24(%esp)
# emit-expr f8564
# emit-variable-ref
# env=((f8564 . -12) (f8564 . -8))
# var=f8564
    movl -12(%esp), %eax  # stack load f8564
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
_L_70349:
    movl %eax, 0(%esp)  # stack save
# emit-expr (let ((f8572 (closure (f8573 f8574) (f8563 f8563 f8563 f8563 f8563) (let ((f8573 f8573) (f8574 f8574)) (begin (f8563 "error:") (f8563 (symbol->string f8573)) (f8563 ": ") (f8563 f8574) (f8563 "\n")))))) (closure (f8577 f8578) (f8572) (let ((f8577 f8577) (f8578 f8578)) (begin (f8572 f8577 f8578) (foreign-call "s_exit" 1)))))
# emit-let
#  si   = -4
#  env  = ((f8563 . 0))
#  bindings = ((f8572 (closure (f8573 f8574) (f8563 f8563 f8563 f8563 f8563) (let ((f8573 f8573) (f8574 f8574)) (begin (f8563 "error:") (f8563 (symbol->string f8573)) (f8563 ": ") (f8563 f8574) (f8563 "\n"))))))
#  body = (closure (f8577 f8578) (f8572) (let ((f8577 f8577) (f8578 f8578)) (begin (f8572 f8577 f8578) (foreign-call "s_exit" 1))))
# emit-expr (closure (f8573 f8574) (f8563 f8563 f8563 f8563 f8563) (let ((f8573 f8573) (f8574 f8574)) (begin (f8563 "error:") (f8563 (symbol->string f8573)) (f8563 ": ") (f8563 f8574) (f8563 "\n"))))
# emit-closure
# si = -4
# env = ((f8563 . 0))
# expr = (closure (f8573 f8574) (f8563 f8563 f8563 f8563 f8563) (let ((f8573 f8573) (f8574 f8574)) (begin (f8563 "error:") (f8563 (symbol->string f8573)) (f8563 ": ") (f8563 f8574) (f8563 "\n"))))
    movl $_L_70352, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f8563 . 0))
# var=f8563
    movl 0(%esp), %eax  # stack load f8563
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f8563
# emit-variable-ref
# env=((f8563 . 0))
# var=f8563
    movl 0(%esp), %eax  # stack load f8563
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f8563
# emit-variable-ref
# env=((f8563 . 0))
# var=f8563
    movl 0(%esp), %eax  # stack load f8563
# end emit-variable-ref
   movl  %eax, 12(%ebp)  # f8563
# emit-variable-ref
# env=((f8563 . 0))
# var=f8563
    movl 0(%esp), %eax  # stack load f8563
# end emit-variable-ref
   movl  %eax, 16(%ebp)  # f8563
# emit-variable-ref
# env=((f8563 . 0))
# var=f8563
    movl 0(%esp), %eax  # stack load f8563
# end emit-variable-ref
   movl  %eax, 20(%ebp)  # f8563
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $24, %ebp     # bump ebp
    jmp _L_70353            # jump around closure body
_L_70352:
# check argument count
    cmp $8,%eax
    je _L_70354
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_70354:
# emit-tail-expr
# si=-16
# env=((f8574 . -12) (f8573 . -8) (f8563 . 20) (f8563 . 16) (f8563 . 12) (f8563 . 8) (f8563 . 4) (f8563 . 0))
# expr=(let ((f8573 f8573) (f8574 f8574)) (begin (f8563 "error:") (f8563 (symbol->string f8573)) (f8563 ": ") (f8563 f8574) (f8563 "\n")))
# emit-tail-let
#  si   = -16
#  env  = ((f8574 . -12) (f8573 . -8) (f8563 . 20) (f8563 . 16) (f8563 . 12) (f8563 . 8) (f8563 . 4) (f8563 . 0))
#  bindings = ((f8573 f8573) (f8574 f8574))
#  body = (begin (f8563 "error:") (f8563 (symbol->string f8573)) (f8563 ": ") (f8563 f8574) (f8563 "\n"))
# emit-expr f8573
# emit-variable-ref
# env=((f8574 . -12) (f8573 . -8) (f8563 . 20) (f8563 . 16) (f8563 . 12) (f8563 . 8) (f8563 . 4) (f8563 . 0))
# var=f8573
    movl -8(%esp), %eax  # stack load f8573
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f8574
# emit-variable-ref
# env=((f8574 . -12) (f8573 . -8) (f8563 . 20) (f8563 . 16) (f8563 . 12) (f8563 . 8) (f8563 . 4) (f8563 . 0))
# var=f8574
    movl -12(%esp), %eax  # stack load f8574
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f8574 . -20) (f8573 . -16) (f8574 . -12) (f8573 . -8) (f8563 . 20) (f8563 . 16) (f8563 . 12) (f8563 . 8) (f8563 . 4) (f8563 . 0))
# expr=(begin (f8563 "error:") (f8563 (symbol->string f8573)) (f8563 ": ") (f8563 f8574) (f8563 "\n"))
# tail-begin (begin (f8563 "error:") (f8563 (symbol->string f8573)) (f8563 ": ") (f8563 f8574) (f8563 "\n"))
#   env=((f8574 . -20) (f8573 . -16) (f8574 . -12) (f8573 . -8) (f8563 . 20) (f8563 . 16) (f8563 . 12) (f8563 . 8) (f8563 . 4) (f8563 . 0))
# emit-expr (f8563 "error:")
# funcall
#    si   =-24
#    env  = ((f8574 . -20) (f8573 . -16) (f8574 . -12) (f8573 . -8) (f8563 . 20) (f8563 . 16) (f8563 . 12) (f8563 . 8) (f8563 . 4) (f8563 . 0))
#    expr = (funcall f8563 "error:")
# emit-expr f8563
# emit-variable-ref
# env=((f8574 . -20) (f8573 . -16) (f8574 . -12) (f8573 . -8) (f8563 . 20) (f8563 . 16) (f8563 . 12) (f8563 . 8) (f8563 . 4) (f8563 . 0))
# var=f8563
    movl 18(%edi), %eax  # frame load f8563
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70355"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70355":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr "error:"
# string literal
    jmp _L_70357
    .align 8,0x90
_L_70356 :
    .int 24
    .ascii "error:"
_L_70357:
    movl $_L_70356, %eax
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
# env=((f8574 . -20) (f8573 . -16) (f8574 . -12) (f8573 . -8) (f8563 . 20) (f8563 . 16) (f8563 . 12) (f8563 . 8) (f8563 . 4) (f8563 . 0))
# expr=(begin (f8563 (symbol->string f8573)) (f8563 ": ") (f8563 f8574) (f8563 "\n"))
# tail-begin (begin (f8563 (symbol->string f8573)) (f8563 ": ") (f8563 f8574) (f8563 "\n"))
#   env=((f8574 . -20) (f8573 . -16) (f8574 . -12) (f8573 . -8) (f8563 . 20) (f8563 . 16) (f8563 . 12) (f8563 . 8) (f8563 . 4) (f8563 . 0))
# emit-expr (f8563 (symbol->string f8573))
# funcall
#    si   =-24
#    env  = ((f8574 . -20) (f8573 . -16) (f8574 . -12) (f8573 . -8) (f8563 . 20) (f8563 . 16) (f8563 . 12) (f8563 . 8) (f8563 . 4) (f8563 . 0))
#    expr = (funcall f8563 (symbol->string f8573))
# emit-expr f8563
# emit-variable-ref
# env=((f8574 . -20) (f8573 . -16) (f8574 . -12) (f8573 . -8) (f8563 . 20) (f8563 . 16) (f8563 . 12) (f8563 . 8) (f8563 . 4) (f8563 . 0))
# var=f8563
    movl 18(%edi), %eax  # frame load f8563
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70358"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70358":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr (symbol->string f8573)
# symbol->string f8573
# emit-expr f8573
# emit-variable-ref
# env=((f8574 . -20) (f8573 . -16) (f8574 . -12) (f8573 . -8) (f8563 . 20) (f8563 . 16) (f8563 . 12) (f8563 . 8) (f8563 . 4) (f8563 . 0))
# var=f8573
    movl -16(%esp), %eax  # stack load f8573
# end emit-variable-ref
    movl -3(%eax), %eax
    mov %eax, -36(%esp)  # arg (symbol->string f8573)
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f8574 . -20) (f8573 . -16) (f8574 . -12) (f8573 . -8) (f8563 . 20) (f8563 . 16) (f8563 . 12) (f8563 . 8) (f8563 . 4) (f8563 . 0))
# expr=(begin (f8563 ": ") (f8563 f8574) (f8563 "\n"))
# tail-begin (begin (f8563 ": ") (f8563 f8574) (f8563 "\n"))
#   env=((f8574 . -20) (f8573 . -16) (f8574 . -12) (f8573 . -8) (f8563 . 20) (f8563 . 16) (f8563 . 12) (f8563 . 8) (f8563 . 4) (f8563 . 0))
# emit-expr (f8563 ": ")
# funcall
#    si   =-24
#    env  = ((f8574 . -20) (f8573 . -16) (f8574 . -12) (f8573 . -8) (f8563 . 20) (f8563 . 16) (f8563 . 12) (f8563 . 8) (f8563 . 4) (f8563 . 0))
#    expr = (funcall f8563 ": ")
# emit-expr f8563
# emit-variable-ref
# env=((f8574 . -20) (f8573 . -16) (f8574 . -12) (f8573 . -8) (f8563 . 20) (f8563 . 16) (f8563 . 12) (f8563 . 8) (f8563 . 4) (f8563 . 0))
# var=f8563
    movl 18(%edi), %eax  # frame load f8563
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70359"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70359":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr ": "
# string literal
    jmp _L_70361
    .align 8,0x90
_L_70360 :
    .int 8
    .ascii ": "
_L_70361:
    movl $_L_70360, %eax
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
# env=((f8574 . -20) (f8573 . -16) (f8574 . -12) (f8573 . -8) (f8563 . 20) (f8563 . 16) (f8563 . 12) (f8563 . 8) (f8563 . 4) (f8563 . 0))
# expr=(begin (f8563 f8574) (f8563 "\n"))
# tail-begin (begin (f8563 f8574) (f8563 "\n"))
#   env=((f8574 . -20) (f8573 . -16) (f8574 . -12) (f8573 . -8) (f8563 . 20) (f8563 . 16) (f8563 . 12) (f8563 . 8) (f8563 . 4) (f8563 . 0))
# emit-expr (f8563 f8574)
# funcall
#    si   =-24
#    env  = ((f8574 . -20) (f8573 . -16) (f8574 . -12) (f8573 . -8) (f8563 . 20) (f8563 . 16) (f8563 . 12) (f8563 . 8) (f8563 . 4) (f8563 . 0))
#    expr = (funcall f8563 f8574)
# emit-expr f8563
# emit-variable-ref
# env=((f8574 . -20) (f8573 . -16) (f8574 . -12) (f8573 . -8) (f8563 . 20) (f8563 . 16) (f8563 . 12) (f8563 . 8) (f8563 . 4) (f8563 . 0))
# var=f8563
    movl 18(%edi), %eax  # frame load f8563
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70362"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70362":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f8574
# emit-variable-ref
# env=((f8574 . -20) (f8573 . -16) (f8574 . -12) (f8573 . -8) (f8563 . 20) (f8563 . 16) (f8563 . 12) (f8563 . 8) (f8563 . 4) (f8563 . 0))
# var=f8574
    movl -20(%esp), %eax  # stack load f8574
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f8574
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f8574 . -20) (f8573 . -16) (f8574 . -12) (f8573 . -8) (f8563 . 20) (f8563 . 16) (f8563 . 12) (f8563 . 8) (f8563 . 4) (f8563 . 0))
# expr=(begin (f8563 "\n"))
# tail-begin (begin (f8563 "\n"))
#   env=((f8574 . -20) (f8573 . -16) (f8574 . -12) (f8573 . -8) (f8563 . 20) (f8563 . 16) (f8563 . 12) (f8563 . 8) (f8563 . 4) (f8563 . 0))
# emit-tail-expr
# si=-24
# env=((f8574 . -20) (f8573 . -16) (f8574 . -12) (f8573 . -8) (f8563 . 20) (f8563 . 16) (f8563 . 12) (f8563 . 8) (f8563 . 4) (f8563 . 0))
# expr=(f8563 "\n")
# emit-tail-funcall
#    si   =-24
#    env  = ((f8574 . -20) (f8573 . -16) (f8574 . -12) (f8573 . -8) (f8563 . 20) (f8563 . 16) (f8563 . 12) (f8563 . 8) (f8563 . 4) (f8563 . 0))
#    expr = (funcall f8563 "\n")
# emit-expr f8563
# emit-variable-ref
# env=((f8574 . -20) (f8573 . -16) (f8574 . -12) (f8573 . -8) (f8563 . 20) (f8563 . 16) (f8563 . 12) (f8563 . 8) (f8563 . 4) (f8563 . 0))
# var=f8563
    movl 18(%edi), %eax  # frame load f8563
# end emit-variable-ref
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr "\n"
# string literal
    jmp _L_70364
    .align 8,0x90
_L_70363 :
    .int 4
    .ascii "\n"
_L_70364:
    movl $_L_70363, %eax
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
_L_70353:
    movl %eax, -4(%esp)  # stack save
# emit-expr (closure (f8577 f8578) (f8572) (let ((f8577 f8577) (f8578 f8578)) (begin (f8572 f8577 f8578) (foreign-call "s_exit" 1))))
# emit-closure
# si = -8
# env = ((f8572 . -4) (f8563 . 0))
# expr = (closure (f8577 f8578) (f8572) (let ((f8577 f8577) (f8578 f8578)) (begin (f8572 f8577 f8578) (foreign-call "s_exit" 1))))
    movl $_L_70365, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f8572 . -4) (f8563 . 0))
# var=f8572
    movl -4(%esp), %eax  # stack load f8572
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f8572
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_70366            # jump around closure body
_L_70365:
# check argument count
    cmp $8,%eax
    je _L_70367
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_70367:
# emit-tail-expr
# si=-16
# env=((f8578 . -12) (f8577 . -8) (f8572 . 4) (f8572 . -4) (f8563 . 0))
# expr=(let ((f8577 f8577) (f8578 f8578)) (begin (f8572 f8577 f8578) (foreign-call "s_exit" 1)))
# emit-tail-let
#  si   = -16
#  env  = ((f8578 . -12) (f8577 . -8) (f8572 . 4) (f8572 . -4) (f8563 . 0))
#  bindings = ((f8577 f8577) (f8578 f8578))
#  body = (begin (f8572 f8577 f8578) (foreign-call "s_exit" 1))
# emit-expr f8577
# emit-variable-ref
# env=((f8578 . -12) (f8577 . -8) (f8572 . 4) (f8572 . -4) (f8563 . 0))
# var=f8577
    movl -8(%esp), %eax  # stack load f8577
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f8578
# emit-variable-ref
# env=((f8578 . -12) (f8577 . -8) (f8572 . 4) (f8572 . -4) (f8563 . 0))
# var=f8578
    movl -12(%esp), %eax  # stack load f8578
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f8578 . -20) (f8577 . -16) (f8578 . -12) (f8577 . -8) (f8572 . 4) (f8572 . -4) (f8563 . 0))
# expr=(begin (f8572 f8577 f8578) (foreign-call "s_exit" 1))
# tail-begin (begin (f8572 f8577 f8578) (foreign-call "s_exit" 1))
#   env=((f8578 . -20) (f8577 . -16) (f8578 . -12) (f8577 . -8) (f8572 . 4) (f8572 . -4) (f8563 . 0))
# emit-expr (f8572 f8577 f8578)
# funcall
#    si   =-24
#    env  = ((f8578 . -20) (f8577 . -16) (f8578 . -12) (f8577 . -8) (f8572 . 4) (f8572 . -4) (f8563 . 0))
#    expr = (funcall f8572 f8577 f8578)
# emit-expr f8572
# emit-variable-ref
# env=((f8578 . -20) (f8577 . -16) (f8578 . -12) (f8577 . -8) (f8572 . 4) (f8572 . -4) (f8563 . 0))
# var=f8572
    movl 2(%edi), %eax  # frame load f8572
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70368"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70368":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f8577
# emit-variable-ref
# env=((f8578 . -20) (f8577 . -16) (f8578 . -12) (f8577 . -8) (f8572 . 4) (f8572 . -4) (f8563 . 0))
# var=f8577
    movl -16(%esp), %eax  # stack load f8577
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f8577
# emit-expr f8578
# emit-variable-ref
# env=((f8578 . -20) (f8577 . -16) (f8578 . -12) (f8577 . -8) (f8572 . 4) (f8572 . -4) (f8563 . 0))
# var=f8578
    movl -20(%esp), %eax  # stack load f8578
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg f8578
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f8578 . -20) (f8577 . -16) (f8578 . -12) (f8577 . -8) (f8572 . 4) (f8572 . -4) (f8563 . 0))
# expr=(begin (foreign-call "s_exit" 1))
# tail-begin (begin (foreign-call "s_exit" 1))
#   env=((f8578 . -20) (f8577 . -16) (f8578 . -12) (f8577 . -8) (f8572 . 4) (f8572 . -4) (f8563 . 0))
# emit-tail-expr
# si=-24
# env=((f8578 . -20) (f8577 . -16) (f8578 . -12) (f8577 . -8) (f8572 . 4) (f8572 . -4) (f8563 . 0))
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
_L_70366:
     movl %eax, error
# == explicit-begins  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fxremainder) p)) (set! p (cons (quote fxquotient) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == eliminate-let*  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fxremainder) p)) (set! p (cons (quote fxquotient) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == uniquify-variables  ==>
# (let ((f8579 (quote ()))) (begin (set! f8579 (cons (quote procedure?) f8579)) (set! f8579 (cons (quote cdr) f8579)) (set! f8579 (cons (quote car) f8579)) (set! f8579 (cons (quote symbol-value) f8579)) (set! f8579 (cons (quote symbol->string) f8579)) (set! f8579 (cons (quote make-symbol) f8579)) (set! f8579 (cons (quote symbol?) f8579)) (set! f8579 (cons (quote string-set!) f8579)) (set! f8579 (cons (quote string-ref) f8579)) (set! f8579 (cons (quote string-length) f8579)) (set! f8579 (cons (quote string?) f8579)) (set! f8579 (cons (quote make-string) f8579)) (set! f8579 (cons (quote vector-ref) f8579)) (set! f8579 (cons (quote vector-set!) f8579)) (set! f8579 (cons (quote vector-length) f8579)) (set! f8579 (cons (quote make-vector) f8579)) (set! f8579 (cons (quote vector?) f8579)) (set! f8579 (cons (quote set-cdr!) f8579)) (set! f8579 (cons (quote set-car!) f8579)) (set! f8579 (cons (quote cdr) f8579)) (set! f8579 (cons (quote car) f8579)) (set! f8579 (cons (quote cons) f8579)) (set! f8579 (cons (quote pair?) f8579)) (set! f8579 (cons (quote fxremainder) f8579)) (set! f8579 (cons (quote fxquotient) f8579)) (set! f8579 (cons (quote fx*) f8579)) (set! f8579 (cons (quote fx-) f8579)) (set! f8579 (cons (quote fx+) f8579)) (set! f8579 (cons (quote fx>=) f8579)) (set! f8579 (cons (quote fx>) f8579)) (set! f8579 (cons (quote fx<=) f8579)) (set! f8579 (cons (quote fx<) f8579)) (set! f8579 (cons (quote fx=) f8579)) (set! f8579 (cons (quote fxzero?) f8579)) (set! f8579 (cons (quote fxsub1) f8579)) (set! f8579 (cons (quote fxadd1) f8579)) (set! f8579 (cons (quote fxlogor) f8579)) (set! f8579 (cons (quote fxlogand) f8579)) (set! f8579 (cons (quote fxlognot) f8579)) (set! f8579 (cons (quote char=?) f8579)) (set! f8579 (cons (quote eq?) f8579)) (set! f8579 (cons (quote not) f8579)) (set! f8579 (cons (quote boolean?) f8579)) (set! f8579 (cons (quote fixnum?) f8579)) (set! f8579 (cons (quote char?) f8579)) (set! f8579 (cons (quote null?) f8579)) (set! f8579 (cons (quote char->fixnum) f8579)) (set! f8579 (cons (quote fixnum->char) f8579)) (lambda () f8579)))
# == vectorize-letrec  ==>
# (let ((f8579 (quote ()))) (begin (set! f8579 (cons (quote procedure?) f8579)) (set! f8579 (cons (quote cdr) f8579)) (set! f8579 (cons (quote car) f8579)) (set! f8579 (cons (quote symbol-value) f8579)) (set! f8579 (cons (quote symbol->string) f8579)) (set! f8579 (cons (quote make-symbol) f8579)) (set! f8579 (cons (quote symbol?) f8579)) (set! f8579 (cons (quote string-set!) f8579)) (set! f8579 (cons (quote string-ref) f8579)) (set! f8579 (cons (quote string-length) f8579)) (set! f8579 (cons (quote string?) f8579)) (set! f8579 (cons (quote make-string) f8579)) (set! f8579 (cons (quote vector-ref) f8579)) (set! f8579 (cons (quote vector-set!) f8579)) (set! f8579 (cons (quote vector-length) f8579)) (set! f8579 (cons (quote make-vector) f8579)) (set! f8579 (cons (quote vector?) f8579)) (set! f8579 (cons (quote set-cdr!) f8579)) (set! f8579 (cons (quote set-car!) f8579)) (set! f8579 (cons (quote cdr) f8579)) (set! f8579 (cons (quote car) f8579)) (set! f8579 (cons (quote cons) f8579)) (set! f8579 (cons (quote pair?) f8579)) (set! f8579 (cons (quote fxremainder) f8579)) (set! f8579 (cons (quote fxquotient) f8579)) (set! f8579 (cons (quote fx*) f8579)) (set! f8579 (cons (quote fx-) f8579)) (set! f8579 (cons (quote fx+) f8579)) (set! f8579 (cons (quote fx>=) f8579)) (set! f8579 (cons (quote fx>) f8579)) (set! f8579 (cons (quote fx<=) f8579)) (set! f8579 (cons (quote fx<) f8579)) (set! f8579 (cons (quote fx=) f8579)) (set! f8579 (cons (quote fxzero?) f8579)) (set! f8579 (cons (quote fxsub1) f8579)) (set! f8579 (cons (quote fxadd1) f8579)) (set! f8579 (cons (quote fxlogor) f8579)) (set! f8579 (cons (quote fxlogand) f8579)) (set! f8579 (cons (quote fxlognot) f8579)) (set! f8579 (cons (quote char=?) f8579)) (set! f8579 (cons (quote eq?) f8579)) (set! f8579 (cons (quote not) f8579)) (set! f8579 (cons (quote boolean?) f8579)) (set! f8579 (cons (quote fixnum?) f8579)) (set! f8579 (cons (quote char?) f8579)) (set! f8579 (cons (quote null?) f8579)) (set! f8579 (cons (quote char->fixnum) f8579)) (set! f8579 (cons (quote fixnum->char) f8579)) (lambda () f8579)))
# == eliminate-set!  ==>
# (let ((f8579 (vector (quote ())))) (begin (vector-set! f8579 0 (cons (quote procedure?) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote cdr) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote car) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote symbol-value) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote symbol->string) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote make-symbol) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote symbol?) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote string-set!) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote string-ref) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote string-length) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote string?) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote make-string) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote vector-ref) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote vector-set!) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote vector-length) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote make-vector) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote vector?) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote set-cdr!) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote set-car!) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote cdr) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote car) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote cons) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote pair?) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fxremainder) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fxquotient) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fx*) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fx-) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fx+) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fx>=) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fx>) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fx<=) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fx<) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fx=) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fxzero?) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fxsub1) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fxadd1) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fxlogor) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fxlogand) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fxlognot) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote char=?) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote eq?) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote not) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote boolean?) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fixnum?) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote char?) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote null?) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote char->fixnum) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fixnum->char) (vector-ref f8579 0))) (lambda () (let () (vector-ref f8579 0)))))
# == close-free-variables  ==>
# (let ((f8579 (vector (quote ())))) (begin (vector-set! f8579 0 (cons (quote procedure?) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote cdr) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote car) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote symbol-value) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote symbol->string) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote make-symbol) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote symbol?) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote string-set!) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote string-ref) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote string-length) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote string?) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote make-string) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote vector-ref) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote vector-set!) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote vector-length) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote make-vector) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote vector?) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote set-cdr!) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote set-car!) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote cdr) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote car) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote cons) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote pair?) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fxremainder) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fxquotient) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fx*) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fx-) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fx+) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fx>=) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fx>) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fx<=) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fx<) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fx=) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fxzero?) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fxsub1) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fxadd1) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fxlogor) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fxlogand) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fxlognot) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote char=?) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote eq?) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote not) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote boolean?) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fixnum?) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote char?) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote null?) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote char->fixnum) (vector-ref f8579 0))) (vector-set! f8579 0 (cons (quote fixnum->char) (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0)))))
# == eliminate-quote  ==>
# (let ((f8579 (vector ()))) (begin (vector-set! f8579 0 (cons (string->symbol "procedure?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "symbol-value") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "symbol->string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "make-symbol") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "symbol?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "string-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "string-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "string-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "string?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0)))))
# == eliminate-when/unless  ==>
# (let ((f8579 (vector ()))) (begin (vector-set! f8579 0 (cons (string->symbol "procedure?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "symbol-value") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "symbol->string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "make-symbol") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "symbol?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "string-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "string-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "string-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "string?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0)))))
# == eliminate-cond  ==>
# (let ((f8579 (vector ()))) (begin (vector-set! f8579 0 (cons (string->symbol "procedure?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "symbol-value") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "symbol->string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "make-symbol") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "symbol?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "string-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "string-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "string-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "string?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons (string->symbol "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0)))))
# == external-symbols  ==>
# (let ((f8579 ((primitive-ref vector) ()))) (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0)))))
# emit-expr (let ((f8579 ((primitive-ref vector) ()))) (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0)))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f8579 ((primitive-ref vector) ())))
#  body = (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
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
    je "_L_70369"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70369":
   movl %eax,  -8(%esp)  # stash funcall-oper in closure slot
# emit-expr ()
    movl $63, %eax     # immed ()
    mov %eax, -12(%esp)  # arg ()
    movl -8(%esp), %edi   # load new closure to %edi
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70370
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70370:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70371"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70371:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70373
    cmp  $0,%eax
    jge _L_70372
_L_70373:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70372:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "procedure?") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "procedure?")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "procedure?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70374"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70374":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "procedure?"
# string literal
    jmp _L_70376
    .align 8,0x90
_L_70375 :
    .int 40
    .ascii "procedure?"
_L_70376:
    movl $_L_70375, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg procedure?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70377
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70377:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70378"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70378:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70380
    cmp  $0,%eax
    jge _L_70379
_L_70380:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70379:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70381
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70381:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70382"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70382:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70384
    cmp  $0,%eax
    jge _L_70383
_L_70384:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70383:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "cdr") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "cdr")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cdr")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70385"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70385":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_70387
    .align 8,0x90
_L_70386 :
    .int 12
    .ascii "cdr"
_L_70387:
    movl $_L_70386, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cdr
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70388
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70388:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70389"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70389:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70391
    cmp  $0,%eax
    jge _L_70390
_L_70391:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70390:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70392
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70392:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70393"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70393:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70395
    cmp  $0,%eax
    jge _L_70394
_L_70395:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70394:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "car") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "car")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "car")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70396"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70396":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_70398
    .align 8,0x90
_L_70397 :
    .int 12
    .ascii "car"
_L_70398:
    movl $_L_70397, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg car
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70399
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70399:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70400"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70400:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70402
    cmp  $0,%eax
    jge _L_70401
_L_70402:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70401:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70403
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70403:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70404"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70404:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70406
    cmp  $0,%eax
    jge _L_70405
_L_70406:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70405:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "symbol-value") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "symbol-value")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol-value")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70407"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70407":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol-value"
# string literal
    jmp _L_70409
    .align 8,0x90
_L_70408 :
    .int 48
    .ascii "symbol-value"
_L_70409:
    movl $_L_70408, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol-value
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70410
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70410:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70411"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70411:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70413
    cmp  $0,%eax
    jge _L_70412
_L_70413:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70412:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70414
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70414:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70415"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70415:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70417
    cmp  $0,%eax
    jge _L_70416
_L_70417:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70416:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "symbol->string") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "symbol->string")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol->string")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70418"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70418":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol->string"
# string literal
    jmp _L_70420
    .align 8,0x90
_L_70419 :
    .int 56
    .ascii "symbol->string"
_L_70420:
    movl $_L_70419, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol->string
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70421
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70421:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70422"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70422:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70424
    cmp  $0,%eax
    jge _L_70423
_L_70424:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70423:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70425
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70425:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70426"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70426:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70428
    cmp  $0,%eax
    jge _L_70427
_L_70428:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70427:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "make-symbol") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "make-symbol")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-symbol")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70429"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70429":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-symbol"
# string literal
    jmp _L_70431
    .align 8,0x90
_L_70430 :
    .int 44
    .ascii "make-symbol"
_L_70431:
    movl $_L_70430, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-symbol
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70432
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70432:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70433"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70433:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70435
    cmp  $0,%eax
    jge _L_70434
_L_70435:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70434:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70436
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70436:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70437"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70437:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70439
    cmp  $0,%eax
    jge _L_70438
_L_70439:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70438:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "symbol?") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "symbol?")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70440"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70440":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol?"
# string literal
    jmp _L_70442
    .align 8,0x90
_L_70441 :
    .int 28
    .ascii "symbol?"
_L_70442:
    movl $_L_70441, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70443
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70443:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70444"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70444:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70446
    cmp  $0,%eax
    jge _L_70445
_L_70446:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70445:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70447
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70447:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70448"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70448:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70450
    cmp  $0,%eax
    jge _L_70449
_L_70450:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70449:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "string-set!") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "string-set!")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-set!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70451"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70451":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-set!"
# string literal
    jmp _L_70453
    .align 8,0x90
_L_70452 :
    .int 44
    .ascii "string-set!"
_L_70453:
    movl $_L_70452, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-set!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70454
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70454:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70455"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70455:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70457
    cmp  $0,%eax
    jge _L_70456
_L_70457:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70456:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70458
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70458:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70459"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70459:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70461
    cmp  $0,%eax
    jge _L_70460
_L_70461:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70460:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "string-ref") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "string-ref")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-ref")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70462"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70462":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-ref"
# string literal
    jmp _L_70464
    .align 8,0x90
_L_70463 :
    .int 40
    .ascii "string-ref"
_L_70464:
    movl $_L_70463, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-ref
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70465
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70465:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70466"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70466:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70468
    cmp  $0,%eax
    jge _L_70467
_L_70468:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70467:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70469
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70469:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70470"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70470:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70472
    cmp  $0,%eax
    jge _L_70471
_L_70472:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70471:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-length") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "string-length") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "string-length")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-length")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70473"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70473":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-length"
# string literal
    jmp _L_70475
    .align 8,0x90
_L_70474 :
    .int 52
    .ascii "string-length"
_L_70475:
    movl $_L_70474, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-length
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70476
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70476:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70477"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70477:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70479
    cmp  $0,%eax
    jge _L_70478
_L_70479:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70478:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70480
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70480:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70481"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70481:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70483
    cmp  $0,%eax
    jge _L_70482
_L_70483:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70482:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string?") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "string?") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "string?")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70484"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70484":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string?"
# string literal
    jmp _L_70486
    .align 8,0x90
_L_70485 :
    .int 28
    .ascii "string?"
_L_70486:
    movl $_L_70485, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70487
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70487:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70488"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70488:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70490
    cmp  $0,%eax
    jge _L_70489
_L_70490:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70489:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70491
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70491:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70492"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70492:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70494
    cmp  $0,%eax
    jge _L_70493
_L_70494:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70493:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-string") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "make-string") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "make-string")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-string")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70495"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70495":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-string"
# string literal
    jmp _L_70497
    .align 8,0x90
_L_70496 :
    .int 44
    .ascii "make-string"
_L_70497:
    movl $_L_70496, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-string
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70498
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70498:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70499"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70499:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70501
    cmp  $0,%eax
    jge _L_70500
_L_70501:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70500:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70502
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70502:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70503"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70503:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70505
    cmp  $0,%eax
    jge _L_70504
_L_70505:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70504:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "vector-ref") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "vector-ref")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-ref")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70506"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70506":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-ref"
# string literal
    jmp _L_70508
    .align 8,0x90
_L_70507 :
    .int 40
    .ascii "vector-ref"
_L_70508:
    movl $_L_70507, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-ref
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70509
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70509:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70510"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70510:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70512
    cmp  $0,%eax
    jge _L_70511
_L_70512:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70511:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70513
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70513:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70514"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70514:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70516
    cmp  $0,%eax
    jge _L_70515
_L_70516:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70515:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "vector-set!") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "vector-set!")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-set!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70517"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70517":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-set!"
# string literal
    jmp _L_70519
    .align 8,0x90
_L_70518 :
    .int 44
    .ascii "vector-set!"
_L_70519:
    movl $_L_70518, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-set!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70520
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70520:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70521"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70521:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70523
    cmp  $0,%eax
    jge _L_70522
_L_70523:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70522:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70524
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70524:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70525"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70525:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70527
    cmp  $0,%eax
    jge _L_70526
_L_70527:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70526:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "vector-length") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "vector-length")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-length")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70528"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70528":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-length"
# string literal
    jmp _L_70530
    .align 8,0x90
_L_70529 :
    .int 52
    .ascii "vector-length"
_L_70530:
    movl $_L_70529, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-length
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70531
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70531:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70532"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70532:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70534
    cmp  $0,%eax
    jge _L_70533
_L_70534:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70533:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70535
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70535:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70536"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70536:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70538
    cmp  $0,%eax
    jge _L_70537
_L_70538:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70537:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "make-vector") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "make-vector")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-vector")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70539"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70539":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-vector"
# string literal
    jmp _L_70541
    .align 8,0x90
_L_70540 :
    .int 44
    .ascii "make-vector"
_L_70541:
    movl $_L_70540, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-vector
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70542
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70542:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70543"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70543:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70545
    cmp  $0,%eax
    jge _L_70544
_L_70545:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70544:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70546
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70546:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70547"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70547:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70549
    cmp  $0,%eax
    jge _L_70548
_L_70549:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70548:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector?") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "vector?") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "vector?")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70550"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70550":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector?"
# string literal
    jmp _L_70552
    .align 8,0x90
_L_70551 :
    .int 28
    .ascii "vector?"
_L_70552:
    movl $_L_70551, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70553
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70553:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70554"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70554:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70556
    cmp  $0,%eax
    jge _L_70555
_L_70556:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70555:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70557
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70557:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70558"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70558:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70560
    cmp  $0,%eax
    jge _L_70559
_L_70560:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70559:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "set-cdr!") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "set-cdr!")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "set-cdr!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70561"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70561":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-cdr!"
# string literal
    jmp _L_70563
    .align 8,0x90
_L_70562 :
    .int 32
    .ascii "set-cdr!"
_L_70563:
    movl $_L_70562, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg set-cdr!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70564
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70564:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70565"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70565:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70567
    cmp  $0,%eax
    jge _L_70566
_L_70567:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70566:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70568
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70568:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70569"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70569:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70571
    cmp  $0,%eax
    jge _L_70570
_L_70571:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70570:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "set-car!") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "set-car!")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "set-car!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70572"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70572":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-car!"
# string literal
    jmp _L_70574
    .align 8,0x90
_L_70573 :
    .int 32
    .ascii "set-car!"
_L_70574:
    movl $_L_70573, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg set-car!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70575
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70575:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70576"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70576:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70578
    cmp  $0,%eax
    jge _L_70577
_L_70578:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70577:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70579
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70579:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70580"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70580:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70582
    cmp  $0,%eax
    jge _L_70581
_L_70582:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70581:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cdr") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "cdr") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "cdr")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cdr")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70583"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70583":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_70585
    .align 8,0x90
_L_70584 :
    .int 12
    .ascii "cdr"
_L_70585:
    movl $_L_70584, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cdr
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70586
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70586:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70587"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70587:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70589
    cmp  $0,%eax
    jge _L_70588
_L_70589:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70588:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70590
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70590:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70591"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70591:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70593
    cmp  $0,%eax
    jge _L_70592
_L_70593:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70592:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "car") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "car") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "car")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "car")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70594"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70594":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_70596
    .align 8,0x90
_L_70595 :
    .int 12
    .ascii "car"
_L_70596:
    movl $_L_70595, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg car
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70597
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70597:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70598"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70598:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70600
    cmp  $0,%eax
    jge _L_70599
_L_70600:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70599:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70601
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70601:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70602"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70602:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70604
    cmp  $0,%eax
    jge _L_70603
_L_70604:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70603:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cons") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "cons") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "cons")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cons")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70605"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70605":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cons"
# string literal
    jmp _L_70607
    .align 8,0x90
_L_70606 :
    .int 16
    .ascii "cons"
_L_70607:
    movl $_L_70606, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cons
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70608
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70608:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70609"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70609:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70611
    cmp  $0,%eax
    jge _L_70610
_L_70611:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70610:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70612
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70612:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70613"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70613:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70615
    cmp  $0,%eax
    jge _L_70614
_L_70615:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70614:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "pair?") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "pair?") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "pair?")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "pair?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70616"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70616":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "pair?"
# string literal
    jmp _L_70618
    .align 8,0x90
_L_70617 :
    .int 20
    .ascii "pair?"
_L_70618:
    movl $_L_70617, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg pair?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70619
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70619:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70620"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70620:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70622
    cmp  $0,%eax
    jge _L_70621
_L_70622:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70621:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70623
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70623:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70624"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70624:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70626
    cmp  $0,%eax
    jge _L_70625
_L_70626:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70625:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "fxremainder") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "fxremainder")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxremainder")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70627"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70627":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxremainder"
# string literal
    jmp _L_70629
    .align 8,0x90
_L_70628 :
    .int 44
    .ascii "fxremainder"
_L_70629:
    movl $_L_70628, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxremainder
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70630
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70630:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70631"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70631:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70633
    cmp  $0,%eax
    jge _L_70632
_L_70633:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70632:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70634
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70634:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70635"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70635:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70637
    cmp  $0,%eax
    jge _L_70636
_L_70637:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70636:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "fxquotient") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "fxquotient")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxquotient")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70638"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70638":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxquotient"
# string literal
    jmp _L_70640
    .align 8,0x90
_L_70639 :
    .int 40
    .ascii "fxquotient"
_L_70640:
    movl $_L_70639, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxquotient
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70641
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70641:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70642"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70642:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70644
    cmp  $0,%eax
    jge _L_70643
_L_70644:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70643:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70645
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70645:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70646"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70646:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70648
    cmp  $0,%eax
    jge _L_70647
_L_70648:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70647:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx*") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "fx*") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "fx*")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx*")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70649"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70649":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx*"
# string literal
    jmp _L_70651
    .align 8,0x90
_L_70650 :
    .int 12
    .ascii "fx*"
_L_70651:
    movl $_L_70650, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx*
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70652
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70652:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70653"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70653:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70655
    cmp  $0,%eax
    jge _L_70654
_L_70655:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70654:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70656
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70656:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70657"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70657:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70659
    cmp  $0,%eax
    jge _L_70658
_L_70659:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70658:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx-") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "fx-") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "fx-")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx-")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70660"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70660":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx-"
# string literal
    jmp _L_70662
    .align 8,0x90
_L_70661 :
    .int 12
    .ascii "fx-"
_L_70662:
    movl $_L_70661, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx-
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70663
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70663:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70664"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70664:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70666
    cmp  $0,%eax
    jge _L_70665
_L_70666:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70665:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70667
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70667:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70668"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70668:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70670
    cmp  $0,%eax
    jge _L_70669
_L_70670:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70669:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx+") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "fx+") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "fx+")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx+")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70671"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70671":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx+"
# string literal
    jmp _L_70673
    .align 8,0x90
_L_70672 :
    .int 12
    .ascii "fx+"
_L_70673:
    movl $_L_70672, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx+
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70674
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70674:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70675"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70675:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70677
    cmp  $0,%eax
    jge _L_70676
_L_70677:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70676:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70678
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70678:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70679"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70679:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70681
    cmp  $0,%eax
    jge _L_70680
_L_70681:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70680:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "fx>=") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "fx>=")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx>=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70682"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70682":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>="
# string literal
    jmp _L_70684
    .align 8,0x90
_L_70683 :
    .int 16
    .ascii "fx>="
_L_70684:
    movl $_L_70683, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx>=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70685
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70685:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70686"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70686:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70688
    cmp  $0,%eax
    jge _L_70687
_L_70688:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70687:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70689
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70689:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70690"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70690:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70692
    cmp  $0,%eax
    jge _L_70691
_L_70692:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70691:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx>") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "fx>") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "fx>")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx>")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70693"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70693":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>"
# string literal
    jmp _L_70695
    .align 8,0x90
_L_70694 :
    .int 12
    .ascii "fx>"
_L_70695:
    movl $_L_70694, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx>
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70696
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70696:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70697"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70697:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70699
    cmp  $0,%eax
    jge _L_70698
_L_70699:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70698:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70700
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70700:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70701"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70701:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70703
    cmp  $0,%eax
    jge _L_70702
_L_70703:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70702:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "fx<=") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "fx<=")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx<=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70704"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70704":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<="
# string literal
    jmp _L_70706
    .align 8,0x90
_L_70705 :
    .int 16
    .ascii "fx<="
_L_70706:
    movl $_L_70705, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx<=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70707
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70707:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70708"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70708:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70710
    cmp  $0,%eax
    jge _L_70709
_L_70710:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70709:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70711
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70711:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70712"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70712:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70714
    cmp  $0,%eax
    jge _L_70713
_L_70714:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70713:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx<") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "fx<") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "fx<")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx<")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70715"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70715":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<"
# string literal
    jmp _L_70717
    .align 8,0x90
_L_70716 :
    .int 12
    .ascii "fx<"
_L_70717:
    movl $_L_70716, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx<
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70718
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70718:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70719"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70719:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70721
    cmp  $0,%eax
    jge _L_70720
_L_70721:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70720:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70722
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70722:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70723"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70723:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70725
    cmp  $0,%eax
    jge _L_70724
_L_70725:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70724:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx=") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "fx=") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "fx=")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70726"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70726":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx="
# string literal
    jmp _L_70728
    .align 8,0x90
_L_70727 :
    .int 12
    .ascii "fx="
_L_70728:
    movl $_L_70727, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70729
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70729:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70730"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70730:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70732
    cmp  $0,%eax
    jge _L_70731
_L_70732:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70731:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70733
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70733:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70734"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70734:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70736
    cmp  $0,%eax
    jge _L_70735
_L_70736:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70735:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "fxzero?") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "fxzero?")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxzero?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70737"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70737":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxzero?"
# string literal
    jmp _L_70739
    .align 8,0x90
_L_70738 :
    .int 28
    .ascii "fxzero?"
_L_70739:
    movl $_L_70738, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxzero?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70740
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70740:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70741"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70741:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70743
    cmp  $0,%eax
    jge _L_70742
_L_70743:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70742:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70744
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70744:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70745"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70745:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70747
    cmp  $0,%eax
    jge _L_70746
_L_70747:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70746:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "fxsub1") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "fxsub1")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxsub1")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70748"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70748":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxsub1"
# string literal
    jmp _L_70750
    .align 8,0x90
_L_70749 :
    .int 24
    .ascii "fxsub1"
_L_70750:
    movl $_L_70749, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxsub1
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70751
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70751:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70752"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70752:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70754
    cmp  $0,%eax
    jge _L_70753
_L_70754:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70753:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70755
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70755:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70756"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70756:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70758
    cmp  $0,%eax
    jge _L_70757
_L_70758:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70757:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "fxadd1") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "fxadd1")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxadd1")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70759"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70759":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxadd1"
# string literal
    jmp _L_70761
    .align 8,0x90
_L_70760 :
    .int 24
    .ascii "fxadd1"
_L_70761:
    movl $_L_70760, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxadd1
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70762
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70762:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70763"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70763:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70765
    cmp  $0,%eax
    jge _L_70764
_L_70765:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70764:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70766
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70766:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70767"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70767:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70769
    cmp  $0,%eax
    jge _L_70768
_L_70769:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70768:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "fxlogor") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "fxlogor")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlogor")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70770"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70770":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogor"
# string literal
    jmp _L_70772
    .align 8,0x90
_L_70771 :
    .int 28
    .ascii "fxlogor"
_L_70772:
    movl $_L_70771, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlogor
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70773
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70773:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70774"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70774:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70776
    cmp  $0,%eax
    jge _L_70775
_L_70776:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70775:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70777
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70777:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70778"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70778:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70780
    cmp  $0,%eax
    jge _L_70779
_L_70780:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70779:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "fxlogand") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "fxlogand")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlogand")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70781"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70781":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogand"
# string literal
    jmp _L_70783
    .align 8,0x90
_L_70782 :
    .int 32
    .ascii "fxlogand"
_L_70783:
    movl $_L_70782, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlogand
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70784
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70784:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70785"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70785:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70787
    cmp  $0,%eax
    jge _L_70786
_L_70787:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70786:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70788
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70788:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70789"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70789:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70791
    cmp  $0,%eax
    jge _L_70790
_L_70791:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70790:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "fxlognot") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "fxlognot")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlognot")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70792"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70792":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlognot"
# string literal
    jmp _L_70794
    .align 8,0x90
_L_70793 :
    .int 32
    .ascii "fxlognot"
_L_70794:
    movl $_L_70793, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlognot
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70795
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70795:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70796"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70796:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70798
    cmp  $0,%eax
    jge _L_70797
_L_70798:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70797:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70799
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70799:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70800"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70800:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70802
    cmp  $0,%eax
    jge _L_70801
_L_70802:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70801:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char=?") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "char=?") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "char=?")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char=?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70803"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70803":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char=?"
# string literal
    jmp _L_70805
    .align 8,0x90
_L_70804 :
    .int 24
    .ascii "char=?"
_L_70805:
    movl $_L_70804, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char=?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70806
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70806:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70807"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70807:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70809
    cmp  $0,%eax
    jge _L_70808
_L_70809:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70808:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70810
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70810:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70811"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70811:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70813
    cmp  $0,%eax
    jge _L_70812
_L_70813:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70812:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "eq?") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "eq?") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "eq?")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "eq?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70814"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70814":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "eq?"
# string literal
    jmp _L_70816
    .align 8,0x90
_L_70815 :
    .int 12
    .ascii "eq?"
_L_70816:
    movl $_L_70815, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg eq?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70817
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70817:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70818"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70818:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70820
    cmp  $0,%eax
    jge _L_70819
_L_70820:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70819:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70821
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70821:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70822"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70822:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70824
    cmp  $0,%eax
    jge _L_70823
_L_70824:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70823:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "not") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "not") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "not")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "not")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70825"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70825":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "not"
# string literal
    jmp _L_70827
    .align 8,0x90
_L_70826 :
    .int 12
    .ascii "not"
_L_70827:
    movl $_L_70826, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg not
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70828
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70828:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70829"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70829:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70831
    cmp  $0,%eax
    jge _L_70830
_L_70831:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70830:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70832
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70832:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70833"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70833:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70835
    cmp  $0,%eax
    jge _L_70834
_L_70835:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70834:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "boolean?") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "boolean?")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "boolean?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70836"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70836":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "boolean?"
# string literal
    jmp _L_70838
    .align 8,0x90
_L_70837 :
    .int 32
    .ascii "boolean?"
_L_70838:
    movl $_L_70837, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg boolean?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70839
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70839:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70840"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70840:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70842
    cmp  $0,%eax
    jge _L_70841
_L_70842:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70841:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70843
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70843:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70844"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70844:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70846
    cmp  $0,%eax
    jge _L_70845
_L_70846:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70845:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "fixnum?") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "fixnum?")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fixnum?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70847"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70847":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum?"
# string literal
    jmp _L_70849
    .align 8,0x90
_L_70848 :
    .int 28
    .ascii "fixnum?"
_L_70849:
    movl $_L_70848, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fixnum?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70850
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70850:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70851"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70851:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70853
    cmp  $0,%eax
    jge _L_70852
_L_70853:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70852:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70854
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70854:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70855"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70855:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70857
    cmp  $0,%eax
    jge _L_70856
_L_70857:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70856:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char?") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "char?") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "char?")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70858"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70858":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char?"
# string literal
    jmp _L_70860
    .align 8,0x90
_L_70859 :
    .int 20
    .ascii "char?"
_L_70860:
    movl $_L_70859, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70861
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70861:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70862"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70862:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70864
    cmp  $0,%eax
    jge _L_70863
_L_70864:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70863:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70865
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70865:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70866"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70866:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70868
    cmp  $0,%eax
    jge _L_70867
_L_70868:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70867:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "null?") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "null?") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "null?")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "null?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70869"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70869":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "null?"
# string literal
    jmp _L_70871
    .align 8,0x90
_L_70870 :
    .int 20
    .ascii "null?"
_L_70871:
    movl $_L_70870, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg null?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70872
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70872:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70873"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70873:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70875
    cmp  $0,%eax
    jge _L_70874
_L_70875:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70874:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))) (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70876
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70876:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70877"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70877:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70879
    cmp  $0,%eax
    jge _L_70878
_L_70879:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70878:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "char->fixnum") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "char->fixnum")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char->fixnum")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70880"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70880":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char->fixnum"
# string literal
    jmp _L_70882
    .align 8,0x90
_L_70881 :
    .int 48
    .ascii "char->fixnum"
_L_70882:
    movl $_L_70881, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char->fixnum
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70883
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70883:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70884"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70884:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70886
    cmp  $0,%eax
    jge _L_70885
_L_70886:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70885:
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
# emit-expr (begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))) (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (vector-set! f8579 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0)))
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70887
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70887:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70888"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70888:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70890
    cmp  $0,%eax
    jge _L_70889
_L_70890:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70889:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f8579 0))
# cons arg1=((primitive-ref string->symbol) "fixnum->char") arg2=(vector-ref f8579 0)
# emit-expr ((primitive-ref string->symbol) "fixnum->char")
# funcall
#    si   =-12
#    env  = ((f8579 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fixnum->char")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70891"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70891":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum->char"
# string literal
    jmp _L_70893
    .align 8,0x90
_L_70892 :
    .int 48
    .ascii "fixnum->char"
_L_70893:
    movl $_L_70892, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fixnum->char
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f8579 0)
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70894
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70894:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70895"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70895:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70897
    cmp  $0,%eax
    jge _L_70896
_L_70897:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70896:
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
# emit-expr (begin (closure () (f8579) (let () (vector-ref f8579 0))))
# emit-begin
#   expr=(begin (closure () (f8579) (let () (vector-ref f8579 0))))
#   env=((f8579 . 0))
# emit-expr (closure () (f8579) (let () (vector-ref f8579 0)))
# emit-closure
# si = -4
# env = ((f8579 . 0))
# expr = (closure () (f8579) (let () (vector-ref f8579 0)))
    movl $_L_70898, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f8579 . 0))
# var=f8579
    movl 0(%esp), %eax  # stack load f8579
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f8579
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_70899            # jump around closure body
_L_70898:
# check argument count
    cmp $0,%eax
    je _L_70900
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_70900:
# emit-tail-expr
# si=-8
# env=((f8579 . 4) (f8579 . 0))
# expr=(let () (vector-ref f8579 0))
# emit-tail-let
#  si   = -8
#  env  = ((f8579 . 4) (f8579 . 0))
#  bindings = ()
#  body = (vector-ref f8579 0)
# emit-tail-expr
# si=-8
# env=((f8579 . 4) (f8579 . 0))
# expr=(vector-ref f8579 0)
# tail primcall
# emit-expr f8579
# emit-variable-ref
# env=((f8579 . 4) (f8579 . 0))
# var=f8579
    movl 2(%edi), %eax  # frame load f8579
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70901
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70901:
    movl %eax, -8(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70902"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70902:
# check bounds on vector index
    movl -8(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70904
    cmp  $0,%eax
    jge _L_70903
_L_70904:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70903:
    movl -8(%esp), %esi
    movl -1(%eax,%esi), %eax
#return from tail (vector-ref f8579 0)
    ret
    .align 4,0x90
_L_70899:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f8579 . 0))
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
    movl $_L_70905, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_70906            # jump around closure body
_L_70905:
# check argument count
    cmp $0,%eax
    je _L_70907
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_70907:
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
    je "_L_70908"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70908":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_70910
    .align 8,0x90
_L_70909 :
    .int 28
    .ascii "funcall"
_L_70910:
    movl $_L_70909, %eax
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
    jmp _L_70912
    .align 8,0x90
_L_70911 :
    .int 100
    .ascii "arg 1 must be a procedure"
_L_70912:
    movl $_L_70911, %eax
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
_L_70906:
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
    movl $_L_70913, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_70914            # jump around closure body
_L_70913:
# check argument count
    cmp $0,%eax
    je _L_70915
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_70915:
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
    je "_L_70916"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70916":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_70918
    .align 8,0x90
_L_70917 :
    .int 28
    .ascii "funcall"
_L_70918:
    movl $_L_70917, %eax
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
    jmp _L_70920
    .align 8,0x90
_L_70919 :
    .int 80
    .ascii "wrong number of args"
_L_70920:
    movl $_L_70919, %eax
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
_L_70914:
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
    movl $_L_70921, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_70922            # jump around closure body
_L_70921:
# check argument count
    cmp $0,%eax
    je _L_70923
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_70923:
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
    je "_L_70924"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70924":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_70926
    .align 8,0x90
_L_70925 :
    .int 28
    .ascii "funcall"
_L_70926:
    movl $_L_70925, %eax
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
    jmp _L_70928
    .align 8,0x90
_L_70927 :
    .int 48
    .ascii "too few args"
_L_70928:
    movl $_L_70927, %eax
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
_L_70922:
     movl %eax, eh$uargcount$umin
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == uniquify-variables  ==>
# (lambda (f8580) (error (list-ref (primitives) f8580) "arg must be a fixnum"))
# == vectorize-letrec  ==>
# (lambda (f8580) (error (list-ref (primitives) f8580) "arg must be a fixnum"))
# == eliminate-set!  ==>
# (lambda (f8580) (let ((f8580 f8580)) (error (list-ref (primitives) f8580) "arg must be a fixnum")))
# == close-free-variables  ==>
# (closure (f8580) (error list-ref primitives) (let ((f8580 f8580)) (error (list-ref (primitives) f8580) "arg must be a fixnum")))
# == eliminate-quote  ==>
# (closure (f8580) (error list-ref primitives) (let ((f8580 f8580)) (error (list-ref (primitives) f8580) "arg must be a fixnum")))
# == eliminate-when/unless  ==>
# (closure (f8580) (error list-ref primitives) (let ((f8580 f8580)) (error (list-ref (primitives) f8580) "arg must be a fixnum")))
# == eliminate-cond  ==>
# (closure (f8580) (error list-ref primitives) (let ((f8580 f8580)) (error (list-ref (primitives) f8580) "arg must be a fixnum")))
# == external-symbols  ==>
# (closure (f8580) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f8580 f8580)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8580) "arg must be a fixnum")))
# emit-expr (closure (f8580) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f8580 f8580)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8580) "arg must be a fixnum")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f8580) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f8580 f8580)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8580) "arg must be a fixnum")))
    movl $_L_70929, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_70930            # jump around closure body
_L_70929:
# check argument count
    cmp $4,%eax
    je _L_70931
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_70931:
# emit-tail-expr
# si=-12
# env=((f8580 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f8580 f8580)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8580) "arg must be a fixnum"))
# emit-tail-let
#  si   = -12
#  env  = ((f8580 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f8580 f8580))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8580) "arg must be a fixnum")
# emit-expr f8580
# emit-variable-ref
# env=((f8580 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f8580
    movl -8(%esp), %eax  # stack load f8580
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f8580 . -12) (f8580 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8580) "arg must be a fixnum")
# emit-tail-funcall
#    si   =-16
#    env  = ((f8580 . -12) (f8580 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8580) "arg must be a fixnum")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f8580)
# funcall
#    si   =-20
#    env  = ((f8580 . -12) (f8580 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f8580)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70932"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70932":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f8580 . -12) (f8580 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70933"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70933":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f8580
# emit-variable-ref
# env=((f8580 . -12) (f8580 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f8580
    movl -12(%esp), %eax  # stack load f8580
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f8580
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f8580)
# emit-expr "arg must be a fixnum"
# string literal
    jmp _L_70935
    .align 8,0x90
_L_70934 :
    .int 80
    .ascii "arg must be a fixnum"
_L_70935:
    movl $_L_70934, %eax
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
_L_70930:
     movl %eax, eh$ufixnum
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == uniquify-variables  ==>
# (lambda (f8581) (error (list-ref (primitives) f8581) "arg must be a string"))
# == vectorize-letrec  ==>
# (lambda (f8581) (error (list-ref (primitives) f8581) "arg must be a string"))
# == eliminate-set!  ==>
# (lambda (f8581) (let ((f8581 f8581)) (error (list-ref (primitives) f8581) "arg must be a string")))
# == close-free-variables  ==>
# (closure (f8581) (error list-ref primitives) (let ((f8581 f8581)) (error (list-ref (primitives) f8581) "arg must be a string")))
# == eliminate-quote  ==>
# (closure (f8581) (error list-ref primitives) (let ((f8581 f8581)) (error (list-ref (primitives) f8581) "arg must be a string")))
# == eliminate-when/unless  ==>
# (closure (f8581) (error list-ref primitives) (let ((f8581 f8581)) (error (list-ref (primitives) f8581) "arg must be a string")))
# == eliminate-cond  ==>
# (closure (f8581) (error list-ref primitives) (let ((f8581 f8581)) (error (list-ref (primitives) f8581) "arg must be a string")))
# == external-symbols  ==>
# (closure (f8581) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f8581 f8581)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8581) "arg must be a string")))
# emit-expr (closure (f8581) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f8581 f8581)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8581) "arg must be a string")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f8581) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f8581 f8581)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8581) "arg must be a string")))
    movl $_L_70936, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_70937            # jump around closure body
_L_70936:
# check argument count
    cmp $4,%eax
    je _L_70938
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_70938:
# emit-tail-expr
# si=-12
# env=((f8581 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f8581 f8581)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8581) "arg must be a string"))
# emit-tail-let
#  si   = -12
#  env  = ((f8581 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f8581 f8581))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8581) "arg must be a string")
# emit-expr f8581
# emit-variable-ref
# env=((f8581 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f8581
    movl -8(%esp), %eax  # stack load f8581
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f8581 . -12) (f8581 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8581) "arg must be a string")
# emit-tail-funcall
#    si   =-16
#    env  = ((f8581 . -12) (f8581 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8581) "arg must be a string")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f8581)
# funcall
#    si   =-20
#    env  = ((f8581 . -12) (f8581 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f8581)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70939"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70939":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f8581 . -12) (f8581 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70940"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70940":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f8581
# emit-variable-ref
# env=((f8581 . -12) (f8581 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f8581
    movl -12(%esp), %eax  # stack load f8581
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f8581
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f8581)
# emit-expr "arg must be a string"
# string literal
    jmp _L_70942
    .align 8,0x90
_L_70941 :
    .int 80
    .ascii "arg must be a string"
_L_70942:
    movl $_L_70941, %eax
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
_L_70937:
     movl %eax, eh$ustring
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == uniquify-variables  ==>
# (lambda (f8582) (error (list-ref (primitives) f8582) "arg must be a character"))
# == vectorize-letrec  ==>
# (lambda (f8582) (error (list-ref (primitives) f8582) "arg must be a character"))
# == eliminate-set!  ==>
# (lambda (f8582) (let ((f8582 f8582)) (error (list-ref (primitives) f8582) "arg must be a character")))
# == close-free-variables  ==>
# (closure (f8582) (error list-ref primitives) (let ((f8582 f8582)) (error (list-ref (primitives) f8582) "arg must be a character")))
# == eliminate-quote  ==>
# (closure (f8582) (error list-ref primitives) (let ((f8582 f8582)) (error (list-ref (primitives) f8582) "arg must be a character")))
# == eliminate-when/unless  ==>
# (closure (f8582) (error list-ref primitives) (let ((f8582 f8582)) (error (list-ref (primitives) f8582) "arg must be a character")))
# == eliminate-cond  ==>
# (closure (f8582) (error list-ref primitives) (let ((f8582 f8582)) (error (list-ref (primitives) f8582) "arg must be a character")))
# == external-symbols  ==>
# (closure (f8582) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f8582 f8582)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8582) "arg must be a character")))
# emit-expr (closure (f8582) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f8582 f8582)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8582) "arg must be a character")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f8582) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f8582 f8582)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8582) "arg must be a character")))
    movl $_L_70943, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_70944            # jump around closure body
_L_70943:
# check argument count
    cmp $4,%eax
    je _L_70945
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_70945:
# emit-tail-expr
# si=-12
# env=((f8582 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f8582 f8582)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8582) "arg must be a character"))
# emit-tail-let
#  si   = -12
#  env  = ((f8582 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f8582 f8582))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8582) "arg must be a character")
# emit-expr f8582
# emit-variable-ref
# env=((f8582 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f8582
    movl -8(%esp), %eax  # stack load f8582
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f8582 . -12) (f8582 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8582) "arg must be a character")
# emit-tail-funcall
#    si   =-16
#    env  = ((f8582 . -12) (f8582 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8582) "arg must be a character")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f8582)
# funcall
#    si   =-20
#    env  = ((f8582 . -12) (f8582 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f8582)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70946"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70946":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f8582 . -12) (f8582 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70947"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70947":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f8582
# emit-variable-ref
# env=((f8582 . -12) (f8582 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f8582
    movl -12(%esp), %eax  # stack load f8582
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f8582
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f8582)
# emit-expr "arg must be a character"
# string literal
    jmp _L_70949
    .align 8,0x90
_L_70948 :
    .int 92
    .ascii "arg must be a character"
_L_70949:
    movl $_L_70948, %eax
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
_L_70944:
     movl %eax, eh$ucharacter
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == uniquify-variables  ==>
# (lambda (f8583) (error (list-ref (primitives) f8583) "arg must be a pair"))
# == vectorize-letrec  ==>
# (lambda (f8583) (error (list-ref (primitives) f8583) "arg must be a pair"))
# == eliminate-set!  ==>
# (lambda (f8583) (let ((f8583 f8583)) (error (list-ref (primitives) f8583) "arg must be a pair")))
# == close-free-variables  ==>
# (closure (f8583) (error list-ref primitives) (let ((f8583 f8583)) (error (list-ref (primitives) f8583) "arg must be a pair")))
# == eliminate-quote  ==>
# (closure (f8583) (error list-ref primitives) (let ((f8583 f8583)) (error (list-ref (primitives) f8583) "arg must be a pair")))
# == eliminate-when/unless  ==>
# (closure (f8583) (error list-ref primitives) (let ((f8583 f8583)) (error (list-ref (primitives) f8583) "arg must be a pair")))
# == eliminate-cond  ==>
# (closure (f8583) (error list-ref primitives) (let ((f8583 f8583)) (error (list-ref (primitives) f8583) "arg must be a pair")))
# == external-symbols  ==>
# (closure (f8583) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f8583 f8583)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8583) "arg must be a pair")))
# emit-expr (closure (f8583) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f8583 f8583)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8583) "arg must be a pair")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f8583) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f8583 f8583)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8583) "arg must be a pair")))
    movl $_L_70950, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_70951            # jump around closure body
_L_70950:
# check argument count
    cmp $4,%eax
    je _L_70952
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_70952:
# emit-tail-expr
# si=-12
# env=((f8583 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f8583 f8583)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8583) "arg must be a pair"))
# emit-tail-let
#  si   = -12
#  env  = ((f8583 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f8583 f8583))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8583) "arg must be a pair")
# emit-expr f8583
# emit-variable-ref
# env=((f8583 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f8583
    movl -8(%esp), %eax  # stack load f8583
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f8583 . -12) (f8583 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8583) "arg must be a pair")
# emit-tail-funcall
#    si   =-16
#    env  = ((f8583 . -12) (f8583 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8583) "arg must be a pair")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f8583)
# funcall
#    si   =-20
#    env  = ((f8583 . -12) (f8583 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f8583)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70953"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70953":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f8583 . -12) (f8583 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70954"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70954":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f8583
# emit-variable-ref
# env=((f8583 . -12) (f8583 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f8583
    movl -12(%esp), %eax  # stack load f8583
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f8583
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f8583)
# emit-expr "arg must be a pair"
# string literal
    jmp _L_70956
    .align 8,0x90
_L_70955 :
    .int 72
    .ascii "arg must be a pair"
_L_70956:
    movl $_L_70955, %eax
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
_L_70951:
     movl %eax, eh$upair
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == uniquify-variables  ==>
# (lambda (f8584) (error (list-ref (primitives) f8584) "arg must be a vector"))
# == vectorize-letrec  ==>
# (lambda (f8584) (error (list-ref (primitives) f8584) "arg must be a vector"))
# == eliminate-set!  ==>
# (lambda (f8584) (let ((f8584 f8584)) (error (list-ref (primitives) f8584) "arg must be a vector")))
# == close-free-variables  ==>
# (closure (f8584) (error list-ref primitives) (let ((f8584 f8584)) (error (list-ref (primitives) f8584) "arg must be a vector")))
# == eliminate-quote  ==>
# (closure (f8584) (error list-ref primitives) (let ((f8584 f8584)) (error (list-ref (primitives) f8584) "arg must be a vector")))
# == eliminate-when/unless  ==>
# (closure (f8584) (error list-ref primitives) (let ((f8584 f8584)) (error (list-ref (primitives) f8584) "arg must be a vector")))
# == eliminate-cond  ==>
# (closure (f8584) (error list-ref primitives) (let ((f8584 f8584)) (error (list-ref (primitives) f8584) "arg must be a vector")))
# == external-symbols  ==>
# (closure (f8584) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f8584 f8584)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8584) "arg must be a vector")))
# emit-expr (closure (f8584) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f8584 f8584)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8584) "arg must be a vector")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f8584) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f8584 f8584)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8584) "arg must be a vector")))
    movl $_L_70957, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_70958            # jump around closure body
_L_70957:
# check argument count
    cmp $4,%eax
    je _L_70959
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_70959:
# emit-tail-expr
# si=-12
# env=((f8584 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f8584 f8584)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8584) "arg must be a vector"))
# emit-tail-let
#  si   = -12
#  env  = ((f8584 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f8584 f8584))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8584) "arg must be a vector")
# emit-expr f8584
# emit-variable-ref
# env=((f8584 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f8584
    movl -8(%esp), %eax  # stack load f8584
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f8584 . -12) (f8584 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8584) "arg must be a vector")
# emit-tail-funcall
#    si   =-16
#    env  = ((f8584 . -12) (f8584 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8584) "arg must be a vector")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f8584)
# funcall
#    si   =-20
#    env  = ((f8584 . -12) (f8584 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f8584)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70960"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70960":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f8584 . -12) (f8584 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70961"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70961":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f8584
# emit-variable-ref
# env=((f8584 . -12) (f8584 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f8584
    movl -12(%esp), %eax  # stack load f8584
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f8584
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f8584)
# emit-expr "arg must be a vector"
# string literal
    jmp _L_70963
    .align 8,0x90
_L_70962 :
    .int 80
    .ascii "arg must be a vector"
_L_70963:
    movl $_L_70962, %eax
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
_L_70958:
     movl %eax, eh$uvector
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == uniquify-variables  ==>
# (lambda (f8585) (error (list-ref (primitives) f8585) "length must be a fixnum >= 0"))
# == vectorize-letrec  ==>
# (lambda (f8585) (error (list-ref (primitives) f8585) "length must be a fixnum >= 0"))
# == eliminate-set!  ==>
# (lambda (f8585) (let ((f8585 f8585)) (error (list-ref (primitives) f8585) "length must be a fixnum >= 0")))
# == close-free-variables  ==>
# (closure (f8585) (error list-ref primitives) (let ((f8585 f8585)) (error (list-ref (primitives) f8585) "length must be a fixnum >= 0")))
# == eliminate-quote  ==>
# (closure (f8585) (error list-ref primitives) (let ((f8585 f8585)) (error (list-ref (primitives) f8585) "length must be a fixnum >= 0")))
# == eliminate-when/unless  ==>
# (closure (f8585) (error list-ref primitives) (let ((f8585 f8585)) (error (list-ref (primitives) f8585) "length must be a fixnum >= 0")))
# == eliminate-cond  ==>
# (closure (f8585) (error list-ref primitives) (let ((f8585 f8585)) (error (list-ref (primitives) f8585) "length must be a fixnum >= 0")))
# == external-symbols  ==>
# (closure (f8585) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f8585 f8585)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8585) "length must be a fixnum >= 0")))
# emit-expr (closure (f8585) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f8585 f8585)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8585) "length must be a fixnum >= 0")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f8585) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f8585 f8585)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8585) "length must be a fixnum >= 0")))
    movl $_L_70964, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_70965            # jump around closure body
_L_70964:
# check argument count
    cmp $4,%eax
    je _L_70966
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_70966:
# emit-tail-expr
# si=-12
# env=((f8585 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f8585 f8585)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8585) "length must be a fixnum >= 0"))
# emit-tail-let
#  si   = -12
#  env  = ((f8585 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f8585 f8585))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8585) "length must be a fixnum >= 0")
# emit-expr f8585
# emit-variable-ref
# env=((f8585 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f8585
    movl -8(%esp), %eax  # stack load f8585
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f8585 . -12) (f8585 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8585) "length must be a fixnum >= 0")
# emit-tail-funcall
#    si   =-16
#    env  = ((f8585 . -12) (f8585 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8585) "length must be a fixnum >= 0")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f8585)
# funcall
#    si   =-20
#    env  = ((f8585 . -12) (f8585 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f8585)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70967"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70967":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f8585 . -12) (f8585 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70968"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70968":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f8585
# emit-variable-ref
# env=((f8585 . -12) (f8585 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f8585
    movl -12(%esp), %eax  # stack load f8585
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f8585
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f8585)
# emit-expr "length must be a fixnum >= 0"
# string literal
    jmp _L_70970
    .align 8,0x90
_L_70969 :
    .int 112
    .ascii "length must be a fixnum >= 0"
_L_70970:
    movl $_L_70969, %eax
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
_L_70965:
     movl %eax, eh$ulength
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == uniquify-variables  ==>
# (lambda (f8586) (error (list-ref (primitives) f8586) "index out of bounds"))
# == vectorize-letrec  ==>
# (lambda (f8586) (error (list-ref (primitives) f8586) "index out of bounds"))
# == eliminate-set!  ==>
# (lambda (f8586) (let ((f8586 f8586)) (error (list-ref (primitives) f8586) "index out of bounds")))
# == close-free-variables  ==>
# (closure (f8586) (error list-ref primitives) (let ((f8586 f8586)) (error (list-ref (primitives) f8586) "index out of bounds")))
# == eliminate-quote  ==>
# (closure (f8586) (error list-ref primitives) (let ((f8586 f8586)) (error (list-ref (primitives) f8586) "index out of bounds")))
# == eliminate-when/unless  ==>
# (closure (f8586) (error list-ref primitives) (let ((f8586 f8586)) (error (list-ref (primitives) f8586) "index out of bounds")))
# == eliminate-cond  ==>
# (closure (f8586) (error list-ref primitives) (let ((f8586 f8586)) (error (list-ref (primitives) f8586) "index out of bounds")))
# == external-symbols  ==>
# (closure (f8586) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f8586 f8586)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8586) "index out of bounds")))
# emit-expr (closure (f8586) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f8586 f8586)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8586) "index out of bounds")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f8586) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f8586 f8586)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8586) "index out of bounds")))
    movl $_L_70971, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_70972            # jump around closure body
_L_70971:
# check argument count
    cmp $4,%eax
    je _L_70973
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_70973:
# emit-tail-expr
# si=-12
# env=((f8586 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f8586 f8586)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8586) "index out of bounds"))
# emit-tail-let
#  si   = -12
#  env  = ((f8586 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f8586 f8586))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8586) "index out of bounds")
# emit-expr f8586
# emit-variable-ref
# env=((f8586 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f8586
    movl -8(%esp), %eax  # stack load f8586
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f8586 . -12) (f8586 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8586) "index out of bounds")
# emit-tail-funcall
#    si   =-16
#    env  = ((f8586 . -12) (f8586 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8586) "index out of bounds")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f8586)
# funcall
#    si   =-20
#    env  = ((f8586 . -12) (f8586 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f8586)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70974"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70974":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f8586 . -12) (f8586 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70975"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70975":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f8586
# emit-variable-ref
# env=((f8586 . -12) (f8586 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f8586
    movl -12(%esp), %eax  # stack load f8586
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f8586
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f8586)
# emit-expr "index out of bounds"
# string literal
    jmp _L_70977
    .align 8,0x90
_L_70976 :
    .int 76
    .ascii "index out of bounds"
_L_70977:
    movl $_L_70976, %eax
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
_L_70972:
     movl %eax, eh$uvector$uindex
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == uniquify-variables  ==>
# (lambda (f8587) (error (list-ref (primitives) f8587) "index out of bounds"))
# == vectorize-letrec  ==>
# (lambda (f8587) (error (list-ref (primitives) f8587) "index out of bounds"))
# == eliminate-set!  ==>
# (lambda (f8587) (let ((f8587 f8587)) (error (list-ref (primitives) f8587) "index out of bounds")))
# == close-free-variables  ==>
# (closure (f8587) (error list-ref primitives) (let ((f8587 f8587)) (error (list-ref (primitives) f8587) "index out of bounds")))
# == eliminate-quote  ==>
# (closure (f8587) (error list-ref primitives) (let ((f8587 f8587)) (error (list-ref (primitives) f8587) "index out of bounds")))
# == eliminate-when/unless  ==>
# (closure (f8587) (error list-ref primitives) (let ((f8587 f8587)) (error (list-ref (primitives) f8587) "index out of bounds")))
# == eliminate-cond  ==>
# (closure (f8587) (error list-ref primitives) (let ((f8587 f8587)) (error (list-ref (primitives) f8587) "index out of bounds")))
# == external-symbols  ==>
# (closure (f8587) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f8587 f8587)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8587) "index out of bounds")))
# emit-expr (closure (f8587) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f8587 f8587)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8587) "index out of bounds")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f8587) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f8587 f8587)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8587) "index out of bounds")))
    movl $_L_70978, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_70979            # jump around closure body
_L_70978:
# check argument count
    cmp $4,%eax
    je _L_70980
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_70980:
# emit-tail-expr
# si=-12
# env=((f8587 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f8587 f8587)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8587) "index out of bounds"))
# emit-tail-let
#  si   = -12
#  env  = ((f8587 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f8587 f8587))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8587) "index out of bounds")
# emit-expr f8587
# emit-variable-ref
# env=((f8587 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f8587
    movl -8(%esp), %eax  # stack load f8587
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f8587 . -12) (f8587 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8587) "index out of bounds")
# emit-tail-funcall
#    si   =-16
#    env  = ((f8587 . -12) (f8587 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f8587) "index out of bounds")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f8587)
# funcall
#    si   =-20
#    env  = ((f8587 . -12) (f8587 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f8587)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70981"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70981":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f8587 . -12) (f8587 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70982"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70982":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f8587
# emit-variable-ref
# env=((f8587 . -12) (f8587 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f8587
    movl -12(%esp), %eax  # stack load f8587
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f8587
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f8587)
# emit-expr "index out of bounds"
# string literal
    jmp _L_70984
    .align 8,0x90
_L_70983 :
    .int 76
    .ascii "index out of bounds"
_L_70984:
    movl $_L_70983, %eax
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
_L_70979:
     movl %eax, eh$ustring$uindex
# == explicit-begins  ==>
# (let ((p (make-vector 6)) (sz 10)) (begin (vector-set! p 0 (quote output-port)) (vector-set! p 1 "/dev/stdout") (vector-set! p 2 1) (vector-set! p 3 (make-string sz)) (vector-set! p 4 0) (vector-set! p 5 sz) (lambda () p)))
# == eliminate-let*  ==>
# (let ((p (make-vector 6)) (sz 10)) (begin (vector-set! p 0 (quote output-port)) (vector-set! p 1 "/dev/stdout") (vector-set! p 2 1) (vector-set! p 3 (make-string sz)) (vector-set! p 4 0) (vector-set! p 5 sz) (lambda () p)))
# == uniquify-variables  ==>
# (let ((f8589 (make-vector 6)) (f8588 10)) (begin (vector-set! f8589 0 (quote output-port)) (vector-set! f8589 1 "/dev/stdout") (vector-set! f8589 2 1) (vector-set! f8589 3 (make-string f8588)) (vector-set! f8589 4 0) (vector-set! f8589 5 f8588) (lambda () f8589)))
# == vectorize-letrec  ==>
# (let ((f8589 (make-vector 6)) (f8588 10)) (begin (vector-set! f8589 0 (quote output-port)) (vector-set! f8589 1 "/dev/stdout") (vector-set! f8589 2 1) (vector-set! f8589 3 (make-string f8588)) (vector-set! f8589 4 0) (vector-set! f8589 5 f8588) (lambda () f8589)))
# == eliminate-set!  ==>
# (let ((f8589 (make-vector 6)) (f8588 10)) (begin (vector-set! f8589 0 (quote output-port)) (vector-set! f8589 1 "/dev/stdout") (vector-set! f8589 2 1) (vector-set! f8589 3 (make-string f8588)) (vector-set! f8589 4 0) (vector-set! f8589 5 f8588) (lambda () (let () f8589))))
# == close-free-variables  ==>
# (let ((f8589 (make-vector 6)) (f8588 10)) (begin (vector-set! f8589 0 (quote output-port)) (vector-set! f8589 1 "/dev/stdout") (vector-set! f8589 2 1) (vector-set! f8589 3 (make-string f8588)) (vector-set! f8589 4 0) (vector-set! f8589 5 f8588) (closure () (f8589) (let () f8589))))
# == eliminate-quote  ==>
# (let ((f8589 (make-vector 6)) (f8588 10)) (begin (vector-set! f8589 0 (string->symbol "output-port")) (vector-set! f8589 1 "/dev/stdout") (vector-set! f8589 2 1) (vector-set! f8589 3 (make-string f8588)) (vector-set! f8589 4 0) (vector-set! f8589 5 f8588) (closure () (f8589) (let () f8589))))
# == eliminate-when/unless  ==>
# (let ((f8589 (make-vector 6)) (f8588 10)) (begin (vector-set! f8589 0 (string->symbol "output-port")) (vector-set! f8589 1 "/dev/stdout") (vector-set! f8589 2 1) (vector-set! f8589 3 (make-string f8588)) (vector-set! f8589 4 0) (vector-set! f8589 5 f8588) (closure () (f8589) (let () f8589))))
# == eliminate-cond  ==>
# (let ((f8589 (make-vector 6)) (f8588 10)) (begin (vector-set! f8589 0 (string->symbol "output-port")) (vector-set! f8589 1 "/dev/stdout") (vector-set! f8589 2 1) (vector-set! f8589 3 (make-string f8588)) (vector-set! f8589 4 0) (vector-set! f8589 5 f8588) (closure () (f8589) (let () f8589))))
# == external-symbols  ==>
# (let ((f8589 (make-vector 6)) (f8588 10)) (begin (vector-set! f8589 0 ((primitive-ref string->symbol) "output-port")) (vector-set! f8589 1 "/dev/stdout") (vector-set! f8589 2 1) (vector-set! f8589 3 (make-string f8588)) (vector-set! f8589 4 0) (vector-set! f8589 5 f8588) (closure () (f8589) (let () f8589))))
# emit-expr (let ((f8589 (make-vector 6)) (f8588 10)) (begin (vector-set! f8589 0 ((primitive-ref string->symbol) "output-port")) (vector-set! f8589 1 "/dev/stdout") (vector-set! f8589 2 1) (vector-set! f8589 3 (make-string f8588)) (vector-set! f8589 4 0) (vector-set! f8589 5 f8588) (closure () (f8589) (let () f8589))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f8589 (make-vector 6)) (f8588 10))
#  body = (begin (vector-set! f8589 0 ((primitive-ref string->symbol) "output-port")) (vector-set! f8589 1 "/dev/stdout") (vector-set! f8589 2 1) (vector-set! f8589 3 (make-string f8588)) (vector-set! f8589 4 0) (vector-set! f8589 5 f8588) (closure () (f8589) (let () f8589)))
# emit-expr (make-vector 6)
# make-vector 6
# emit-expr 6
    movl $24, %eax     # immed 6
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70985"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70985:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_70986
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70986:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr 10
    movl $40, %eax     # immed 10
    movl %eax, -4(%esp)  # stack save
# emit-expr (begin (vector-set! f8589 0 ((primitive-ref string->symbol) "output-port")) (vector-set! f8589 1 "/dev/stdout") (vector-set! f8589 2 1) (vector-set! f8589 3 (make-string f8588)) (vector-set! f8589 4 0) (vector-set! f8589 5 f8588) (closure () (f8589) (let () f8589)))
# emit-begin
#   expr=(begin (vector-set! f8589 0 ((primitive-ref string->symbol) "output-port")) (vector-set! f8589 1 "/dev/stdout") (vector-set! f8589 2 1) (vector-set! f8589 3 (make-string f8588)) (vector-set! f8589 4 0) (vector-set! f8589 5 f8588) (closure () (f8589) (let () f8589)))
#   env=((f8588 . -4) (f8589 . 0))
# emit-expr (vector-set! f8589 0 ((primitive-ref string->symbol) "output-port"))
# emit-expr f8589
# emit-variable-ref
# env=((f8588 . -4) (f8589 . 0))
# var=f8589
    movl 0(%esp), %eax  # stack load f8589
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70987
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70987:
    movl %eax, -8(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70988"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70988:
# check bounds on vector index
    movl -8(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70990
    cmp  $0,%eax
    jge _L_70989
_L_70990:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70989:
    movl %eax, -12(%esp)
# emit-expr ((primitive-ref string->symbol) "output-port")
# funcall
#    si   =-16
#    env  = ((f8588 . -4) (f8589 . 0))
#    expr = (funcall (primitive-ref string->symbol) "output-port")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_70991"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_70991":
   movl %eax,  -24(%esp)  # stash funcall-oper in closure slot
# emit-expr "output-port"
# string literal
    jmp _L_70993
    .align 8,0x90
_L_70992 :
    .int 44
    .ascii "output-port"
_L_70993:
    movl $_L_70992, %eax
    orl $6, %eax
    mov %eax, -28(%esp)  # arg output-port
    movl -24(%esp), %edi   # load new closure to %edi
    add $-16, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $16, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl -8(%esp), %ebx
    movl -12(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f8589 1 "/dev/stdout") (vector-set! f8589 2 1) (vector-set! f8589 3 (make-string f8588)) (vector-set! f8589 4 0) (vector-set! f8589 5 f8588) (closure () (f8589) (let () f8589)))
# emit-begin
#   expr=(begin (vector-set! f8589 1 "/dev/stdout") (vector-set! f8589 2 1) (vector-set! f8589 3 (make-string f8588)) (vector-set! f8589 4 0) (vector-set! f8589 5 f8588) (closure () (f8589) (let () f8589)))
#   env=((f8588 . -4) (f8589 . 0))
# emit-expr (vector-set! f8589 1 "/dev/stdout")
# emit-expr f8589
# emit-variable-ref
# env=((f8588 . -4) (f8589 . 0))
# var=f8589
    movl 0(%esp), %eax  # stack load f8589
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_70994
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70994:
    movl %eax, -8(%esp)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_70995"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_70995:
# check bounds on vector index
    movl -8(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_70997
    cmp  $0,%eax
    jge _L_70996
_L_70997:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_70996:
    movl %eax, -12(%esp)
# emit-expr "/dev/stdout"
# string literal
    jmp _L_70999
    .align 8,0x90
_L_70998 :
    .int 44
    .ascii "/dev/stdout"
_L_70999:
    movl $_L_70998, %eax
    orl $6, %eax
    movl -8(%esp), %ebx
    movl -12(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f8589 2 1) (vector-set! f8589 3 (make-string f8588)) (vector-set! f8589 4 0) (vector-set! f8589 5 f8588) (closure () (f8589) (let () f8589)))
# emit-begin
#   expr=(begin (vector-set! f8589 2 1) (vector-set! f8589 3 (make-string f8588)) (vector-set! f8589 4 0) (vector-set! f8589 5 f8588) (closure () (f8589) (let () f8589)))
#   env=((f8588 . -4) (f8589 . 0))
# emit-expr (vector-set! f8589 2 1)
# emit-expr f8589
# emit-variable-ref
# env=((f8588 . -4) (f8589 . 0))
# var=f8589
    movl 0(%esp), %eax  # stack load f8589
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_71000
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_71000:
    movl %eax, -8(%esp)
# emit-expr 2
    movl $8, %eax     # immed 2
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_71001"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_71001:
# check bounds on vector index
    movl -8(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_71003
    cmp  $0,%eax
    jge _L_71002
_L_71003:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_71002:
    movl %eax, -12(%esp)
# emit-expr 1
    movl $4, %eax     # immed 1
    movl -8(%esp), %ebx
    movl -12(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f8589 3 (make-string f8588)) (vector-set! f8589 4 0) (vector-set! f8589 5 f8588) (closure () (f8589) (let () f8589)))
# emit-begin
#   expr=(begin (vector-set! f8589 3 (make-string f8588)) (vector-set! f8589 4 0) (vector-set! f8589 5 f8588) (closure () (f8589) (let () f8589)))
#   env=((f8588 . -4) (f8589 . 0))
# emit-expr (vector-set! f8589 3 (make-string f8588))
# emit-expr f8589
# emit-variable-ref
# env=((f8588 . -4) (f8589 . 0))
# var=f8589
    movl 0(%esp), %eax  # stack load f8589
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_71004
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_71004:
    movl %eax, -8(%esp)
# emit-expr 3
    movl $12, %eax     # immed 3
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_71005"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_71005:
# check bounds on vector index
    movl -8(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_71007
    cmp  $0,%eax
    jge _L_71006
_L_71007:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_71006:
    movl %eax, -12(%esp)
# emit-expr (make-string f8588)
# make-string len=f8588
# emit-expr f8588
# emit-variable-ref
# env=((f8588 . -4) (f8589 . 0))
# var=f8588
    movl -4(%esp), %eax  # stack load f8588
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_71008"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_71008:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_71009
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_71009:
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
    movl -8(%esp), %ebx
    movl -12(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f8589 4 0) (vector-set! f8589 5 f8588) (closure () (f8589) (let () f8589)))
# emit-begin
#   expr=(begin (vector-set! f8589 4 0) (vector-set! f8589 5 f8588) (closure () (f8589) (let () f8589)))
#   env=((f8588 . -4) (f8589 . 0))
# emit-expr (vector-set! f8589 4 0)
# emit-expr f8589
# emit-variable-ref
# env=((f8588 . -4) (f8589 . 0))
# var=f8589
    movl 0(%esp), %eax  # stack load f8589
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_71010
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_71010:
    movl %eax, -8(%esp)
# emit-expr 4
    movl $16, %eax     # immed 4
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_71011"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_71011:
# check bounds on vector index
    movl -8(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_71013
    cmp  $0,%eax
    jge _L_71012
_L_71013:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_71012:
    movl %eax, -12(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl -8(%esp), %ebx
    movl -12(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f8589 5 f8588) (closure () (f8589) (let () f8589)))
# emit-begin
#   expr=(begin (vector-set! f8589 5 f8588) (closure () (f8589) (let () f8589)))
#   env=((f8588 . -4) (f8589 . 0))
# emit-expr (vector-set! f8589 5 f8588)
# emit-expr f8589
# emit-variable-ref
# env=((f8588 . -4) (f8589 . 0))
# var=f8589
    movl 0(%esp), %eax  # stack load f8589
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_71014
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_71014:
    movl %eax, -8(%esp)
# emit-expr 5
    movl $20, %eax     # immed 5
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_71015"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_71015:
# check bounds on vector index
    movl -8(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_71017
    cmp  $0,%eax
    jge _L_71016
_L_71017:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_71016:
    movl %eax, -12(%esp)
# emit-expr f8588
# emit-variable-ref
# env=((f8588 . -4) (f8589 . 0))
# var=f8588
    movl -4(%esp), %eax  # stack load f8588
# end emit-variable-ref
    movl -8(%esp), %ebx
    movl -12(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (closure () (f8589) (let () f8589)))
# emit-begin
#   expr=(begin (closure () (f8589) (let () f8589)))
#   env=((f8588 . -4) (f8589 . 0))
# emit-expr (closure () (f8589) (let () f8589))
# emit-closure
# si = -8
# env = ((f8588 . -4) (f8589 . 0))
# expr = (closure () (f8589) (let () f8589))
    movl $_L_71018, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f8588 . -4) (f8589 . 0))
# var=f8589
    movl 0(%esp), %eax  # stack load f8589
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f8589
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_71019            # jump around closure body
_L_71018:
# check argument count
    cmp $0,%eax
    je _L_71020
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_71020:
# emit-tail-expr
# si=-8
# env=((f8589 . 4) (f8588 . -4) (f8589 . 0))
# expr=(let () f8589)
# emit-tail-let
#  si   = -8
#  env  = ((f8589 . 4) (f8588 . -4) (f8589 . 0))
#  bindings = ()
#  body = f8589
# emit-tail-expr
# si=-8
# env=((f8589 . 4) (f8588 . -4) (f8589 . 0))
# expr=f8589
# emit-tail-variable-ref
# emit-variable-ref
# env=((f8589 . 4) (f8588 . -4) (f8589 . 0))
# var=f8589
    movl 2(%edi), %eax  # frame load f8589
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    .align 4,0x90
_L_71019:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f8588 . -4) (f8589 . 0))
     movl %eax, standard$mout
# == explicit-begins  ==>
# (let ((current-out (standard-out))) (lambda () current-out))
# == eliminate-let*  ==>
# (let ((current-out (standard-out))) (lambda () current-out))
# == uniquify-variables  ==>
# (let ((f8590 (standard-out))) (lambda () f8590))
# == vectorize-letrec  ==>
# (let ((f8590 (standard-out))) (lambda () f8590))
# == eliminate-set!  ==>
# (let ((f8590 (standard-out))) (lambda () (let () f8590)))
# == close-free-variables  ==>
# (let ((f8590 (standard-out))) (closure () (f8590) (let () f8590)))
# == eliminate-quote  ==>
# (let ((f8590 (standard-out))) (closure () (f8590) (let () f8590)))
# == eliminate-when/unless  ==>
# (let ((f8590 (standard-out))) (closure () (f8590) (let () f8590)))
# == eliminate-cond  ==>
# (let ((f8590 (standard-out))) (closure () (f8590) (let () f8590)))
# == external-symbols  ==>
# (let ((f8590 ((primitive-ref standard-out)))) (closure () (f8590) (let () f8590)))
# emit-expr (let ((f8590 ((primitive-ref standard-out)))) (closure () (f8590) (let () f8590)))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f8590 ((primitive-ref standard-out))))
#  body = (closure () (f8590) (let () f8590))
# emit-expr ((primitive-ref standard-out))
# funcall
#    si   =0
#    env  = ()
#    expr = (funcall (primitive-ref standard-out))
# emit-expr (primitive-ref standard-out)
    .extern standard$mout
    movl standard$mout,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_71021"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_71021":
   movl %eax,  -8(%esp)  # stash funcall-oper in closure slot
    movl -8(%esp), %edi   # load new closure to %edi
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, 0(%esp)  # stack save
# emit-expr (closure () (f8590) (let () f8590))
# emit-closure
# si = -4
# env = ((f8590 . 0))
# expr = (closure () (f8590) (let () f8590))
    movl $_L_71022, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f8590 . 0))
# var=f8590
    movl 0(%esp), %eax  # stack load f8590
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f8590
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_71023            # jump around closure body
_L_71022:
# check argument count
    cmp $0,%eax
    je _L_71024
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_71024:
# emit-tail-expr
# si=-8
# env=((f8590 . 4) (f8590 . 0))
# expr=(let () f8590)
# emit-tail-let
#  si   = -8
#  env  = ((f8590 . 4) (f8590 . 0))
#  bindings = ()
#  body = f8590
# emit-tail-expr
# si=-8
# env=((f8590 . 4) (f8590 . 0))
# expr=f8590
# emit-tail-variable-ref
# emit-variable-ref
# env=((f8590 . 4) (f8590 . 0))
# var=f8590
    movl 2(%edi), %eax  # frame load f8590
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    .align 4,0x90
_L_71023:
     movl %eax, current$moutput$mport
# == explicit-begins  ==>
# (lambda (p) (vector-ref p 2))
# == eliminate-let*  ==>
# (lambda (p) (vector-ref p 2))
# == uniquify-variables  ==>
# (lambda (f8591) (vector-ref f8591 2))
# == vectorize-letrec  ==>
# (lambda (f8591) (vector-ref f8591 2))
# == eliminate-set!  ==>
# (lambda (f8591) (let ((f8591 f8591)) (vector-ref f8591 2)))
# == close-free-variables  ==>
# (closure (f8591) () (let ((f8591 f8591)) (vector-ref f8591 2)))
# == eliminate-quote  ==>
# (closure (f8591) () (let ((f8591 f8591)) (vector-ref f8591 2)))
# == eliminate-when/unless  ==>
# (closure (f8591) () (let ((f8591 f8591)) (vector-ref f8591 2)))
# == eliminate-cond  ==>
# (closure (f8591) () (let ((f8591 f8591)) (vector-ref f8591 2)))
# == external-symbols  ==>
# (closure (f8591) () (let ((f8591 f8591)) (vector-ref f8591 2)))
# emit-expr (closure (f8591) () (let ((f8591 f8591)) (vector-ref f8591 2)))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f8591) () (let ((f8591 f8591)) (vector-ref f8591 2)))
    movl $_L_71025, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_71026            # jump around closure body
_L_71025:
# check argument count
    cmp $4,%eax
    je _L_71027
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_71027:
# emit-tail-expr
# si=-12
# env=((f8591 . -8))
# expr=(let ((f8591 f8591)) (vector-ref f8591 2))
# emit-tail-let
#  si   = -12
#  env  = ((f8591 . -8))
#  bindings = ((f8591 f8591))
#  body = (vector-ref f8591 2)
# emit-expr f8591
# emit-variable-ref
# env=((f8591 . -8))
# var=f8591
    movl -8(%esp), %eax  # stack load f8591
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f8591 . -12) (f8591 . -8))
# expr=(vector-ref f8591 2)
# tail primcall
# emit-expr f8591
# emit-variable-ref
# env=((f8591 . -12) (f8591 . -8))
# var=f8591
    movl -12(%esp), %eax  # stack load f8591
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_71028
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_71028:
    movl %eax, -16(%esp)
# emit-expr 2
    movl $8, %eax     # immed 2
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_71029"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_71029:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_71031
    cmp  $0,%eax
    jge _L_71030
_L_71031:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_71030:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
#return from tail (vector-ref f8591 2)
    ret
    .align 4,0x90
_L_71026:
     movl %eax, port$mfd
# == explicit-begins  ==>
# (lambda (p) (vector-ref p 3))
# == eliminate-let*  ==>
# (lambda (p) (vector-ref p 3))
# == uniquify-variables  ==>
# (lambda (f8592) (vector-ref f8592 3))
# == vectorize-letrec  ==>
# (lambda (f8592) (vector-ref f8592 3))
# == eliminate-set!  ==>
# (lambda (f8592) (let ((f8592 f8592)) (vector-ref f8592 3)))
# == close-free-variables  ==>
# (closure (f8592) () (let ((f8592 f8592)) (vector-ref f8592 3)))
# == eliminate-quote  ==>
# (closure (f8592) () (let ((f8592 f8592)) (vector-ref f8592 3)))
# == eliminate-when/unless  ==>
# (closure (f8592) () (let ((f8592 f8592)) (vector-ref f8592 3)))
# == eliminate-cond  ==>
# (closure (f8592) () (let ((f8592 f8592)) (vector-ref f8592 3)))
# == external-symbols  ==>
# (closure (f8592) () (let ((f8592 f8592)) (vector-ref f8592 3)))
# emit-expr (closure (f8592) () (let ((f8592 f8592)) (vector-ref f8592 3)))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f8592) () (let ((f8592 f8592)) (vector-ref f8592 3)))
    movl $_L_71032, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_71033            # jump around closure body
_L_71032:
# check argument count
    cmp $4,%eax
    je _L_71034
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_71034:
# emit-tail-expr
# si=-12
# env=((f8592 . -8))
# expr=(let ((f8592 f8592)) (vector-ref f8592 3))
# emit-tail-let
#  si   = -12
#  env  = ((f8592 . -8))
#  bindings = ((f8592 f8592))
#  body = (vector-ref f8592 3)
# emit-expr f8592
# emit-variable-ref
# env=((f8592 . -8))
# var=f8592
    movl -8(%esp), %eax  # stack load f8592
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f8592 . -12) (f8592 . -8))
# expr=(vector-ref f8592 3)
# tail primcall
# emit-expr f8592
# emit-variable-ref
# env=((f8592 . -12) (f8592 . -8))
# var=f8592
    movl -12(%esp), %eax  # stack load f8592
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_71035
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_71035:
    movl %eax, -16(%esp)
# emit-expr 3
    movl $12, %eax     # immed 3
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_71036"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_71036:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_71038
    cmp  $0,%eax
    jge _L_71037
_L_71038:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_71037:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
#return from tail (vector-ref f8592 3)
    ret
    .align 4,0x90
_L_71033:
     movl %eax, port$mbuf
# == explicit-begins  ==>
# (lambda (p) (vector-ref p 4))
# == eliminate-let*  ==>
# (lambda (p) (vector-ref p 4))
# == uniquify-variables  ==>
# (lambda (f8593) (vector-ref f8593 4))
# == vectorize-letrec  ==>
# (lambda (f8593) (vector-ref f8593 4))
# == eliminate-set!  ==>
# (lambda (f8593) (let ((f8593 f8593)) (vector-ref f8593 4)))
# == close-free-variables  ==>
# (closure (f8593) () (let ((f8593 f8593)) (vector-ref f8593 4)))
# == eliminate-quote  ==>
# (closure (f8593) () (let ((f8593 f8593)) (vector-ref f8593 4)))
# == eliminate-when/unless  ==>
# (closure (f8593) () (let ((f8593 f8593)) (vector-ref f8593 4)))
# == eliminate-cond  ==>
# (closure (f8593) () (let ((f8593 f8593)) (vector-ref f8593 4)))
# == external-symbols  ==>
# (closure (f8593) () (let ((f8593 f8593)) (vector-ref f8593 4)))
# emit-expr (closure (f8593) () (let ((f8593 f8593)) (vector-ref f8593 4)))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f8593) () (let ((f8593 f8593)) (vector-ref f8593 4)))
    movl $_L_71039, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_71040            # jump around closure body
_L_71039:
# check argument count
    cmp $4,%eax
    je _L_71041
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_71041:
# emit-tail-expr
# si=-12
# env=((f8593 . -8))
# expr=(let ((f8593 f8593)) (vector-ref f8593 4))
# emit-tail-let
#  si   = -12
#  env  = ((f8593 . -8))
#  bindings = ((f8593 f8593))
#  body = (vector-ref f8593 4)
# emit-expr f8593
# emit-variable-ref
# env=((f8593 . -8))
# var=f8593
    movl -8(%esp), %eax  # stack load f8593
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f8593 . -12) (f8593 . -8))
# expr=(vector-ref f8593 4)
# tail primcall
# emit-expr f8593
# emit-variable-ref
# env=((f8593 . -12) (f8593 . -8))
# var=f8593
    movl -12(%esp), %eax  # stack load f8593
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_71042
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_71042:
    movl %eax, -16(%esp)
# emit-expr 4
    movl $16, %eax     # immed 4
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_71043"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_71043:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_71045
    cmp  $0,%eax
    jge _L_71044
_L_71045:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_71044:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
#return from tail (vector-ref f8593 4)
    ret
    .align 4,0x90
_L_71040:
     movl %eax, port$mndx
# == explicit-begins  ==>
# (lambda (p) (vector-set! p 4 (fxadd1 (vector-ref p 4))))
# == eliminate-let*  ==>
# (lambda (p) (vector-set! p 4 (fxadd1 (vector-ref p 4))))
# == uniquify-variables  ==>
# (lambda (f8594) (vector-set! f8594 4 (fxadd1 (vector-ref f8594 4))))
# == vectorize-letrec  ==>
# (lambda (f8594) (vector-set! f8594 4 (fxadd1 (vector-ref f8594 4))))
# == eliminate-set!  ==>
# (lambda (f8594) (let ((f8594 f8594)) (vector-set! f8594 4 (fxadd1 (vector-ref f8594 4)))))
# == close-free-variables  ==>
# (closure (f8594) () (let ((f8594 f8594)) (vector-set! f8594 4 (fxadd1 (vector-ref f8594 4)))))
# == eliminate-quote  ==>
# (closure (f8594) () (let ((f8594 f8594)) (vector-set! f8594 4 (fxadd1 (vector-ref f8594 4)))))
# == eliminate-when/unless  ==>
# (closure (f8594) () (let ((f8594 f8594)) (vector-set! f8594 4 (fxadd1 (vector-ref f8594 4)))))
# == eliminate-cond  ==>
# (closure (f8594) () (let ((f8594 f8594)) (vector-set! f8594 4 (fxadd1 (vector-ref f8594 4)))))
# == external-symbols  ==>
# (closure (f8594) () (let ((f8594 f8594)) (vector-set! f8594 4 (fxadd1 (vector-ref f8594 4)))))
# emit-expr (closure (f8594) () (let ((f8594 f8594)) (vector-set! f8594 4 (fxadd1 (vector-ref f8594 4)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f8594) () (let ((f8594 f8594)) (vector-set! f8594 4 (fxadd1 (vector-ref f8594 4)))))
    movl $_L_71046, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_71047            # jump around closure body
_L_71046:
# check argument count
    cmp $4,%eax
    je _L_71048
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_71048:
# emit-tail-expr
# si=-12
# env=((f8594 . -8))
# expr=(let ((f8594 f8594)) (vector-set! f8594 4 (fxadd1 (vector-ref f8594 4))))
# emit-tail-let
#  si   = -12
#  env  = ((f8594 . -8))
#  bindings = ((f8594 f8594))
#  body = (vector-set! f8594 4 (fxadd1 (vector-ref f8594 4)))
# emit-expr f8594
# emit-variable-ref
# env=((f8594 . -8))
# var=f8594
    movl -8(%esp), %eax  # stack load f8594
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f8594 . -12) (f8594 . -8))
# expr=(vector-set! f8594 4 (fxadd1 (vector-ref f8594 4)))
# tail primcall
# emit-expr f8594
# emit-variable-ref
# env=((f8594 . -12) (f8594 . -8))
# var=f8594
    movl -12(%esp), %eax  # stack load f8594
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_71049
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_71049:
    movl %eax, -16(%esp)
# emit-expr 4
    movl $16, %eax     # immed 4
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_71050"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_71050:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_71052
    cmp  $0,%eax
    jge _L_71051
_L_71052:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_71051:
    movl %eax, -20(%esp)
# emit-expr (fxadd1 (vector-ref f8594 4))
# emit-expr (vector-ref f8594 4)
# emit-expr f8594
# emit-variable-ref
# env=((f8594 . -12) (f8594 . -8))
# var=f8594
    movl -12(%esp), %eax  # stack load f8594
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_71053
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_71053:
    movl %eax, -24(%esp)
# emit-expr 4
    movl $16, %eax     # immed 4
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_71054"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_71054:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_71056
    cmp  $0,%eax
    jge _L_71055
_L_71056:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_71055:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_71057"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_71057:
     addl $4, %eax
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
#return from tail (vector-set! f8594 4 (fxadd1 (vector-ref f8594 4)))
    ret
    .align 4,0x90
_L_71047:
     movl %eax, port$mndx$madd1
# == explicit-begins  ==>
# (lambda (p) (vector-set! p 4 0))
# == eliminate-let*  ==>
# (lambda (p) (vector-set! p 4 0))
# == uniquify-variables  ==>
# (lambda (f8595) (vector-set! f8595 4 0))
# == vectorize-letrec  ==>
# (lambda (f8595) (vector-set! f8595 4 0))
# == eliminate-set!  ==>
# (lambda (f8595) (let ((f8595 f8595)) (vector-set! f8595 4 0)))
# == close-free-variables  ==>
# (closure (f8595) () (let ((f8595 f8595)) (vector-set! f8595 4 0)))
# == eliminate-quote  ==>
# (closure (f8595) () (let ((f8595 f8595)) (vector-set! f8595 4 0)))
# == eliminate-when/unless  ==>
# (closure (f8595) () (let ((f8595 f8595)) (vector-set! f8595 4 0)))
# == eliminate-cond  ==>
# (closure (f8595) () (let ((f8595 f8595)) (vector-set! f8595 4 0)))
# == external-symbols  ==>
# (closure (f8595) () (let ((f8595 f8595)) (vector-set! f8595 4 0)))
# emit-expr (closure (f8595) () (let ((f8595 f8595)) (vector-set! f8595 4 0)))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f8595) () (let ((f8595 f8595)) (vector-set! f8595 4 0)))
    movl $_L_71058, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_71059            # jump around closure body
_L_71058:
# check argument count
    cmp $4,%eax
    je _L_71060
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_71060:
# emit-tail-expr
# si=-12
# env=((f8595 . -8))
# expr=(let ((f8595 f8595)) (vector-set! f8595 4 0))
# emit-tail-let
#  si   = -12
#  env  = ((f8595 . -8))
#  bindings = ((f8595 f8595))
#  body = (vector-set! f8595 4 0)
# emit-expr f8595
# emit-variable-ref
# env=((f8595 . -8))
# var=f8595
    movl -8(%esp), %eax  # stack load f8595
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f8595 . -12) (f8595 . -8))
# expr=(vector-set! f8595 4 0)
# tail primcall
# emit-expr f8595
# emit-variable-ref
# env=((f8595 . -12) (f8595 . -8))
# var=f8595
    movl -12(%esp), %eax  # stack load f8595
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_71061
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_71061:
    movl %eax, -16(%esp)
# emit-expr 4
    movl $16, %eax     # immed 4
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_71062"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_71062:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_71064
    cmp  $0,%eax
    jge _L_71063
_L_71064:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_71063:
    movl %eax, -20(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
#return from tail (vector-set! f8595 4 0)
    ret
    .align 4,0x90
_L_71059:
     movl %eax, port$mndx$mreset
# == explicit-begins  ==>
# (lambda (p) (vector-ref p 5))
# == eliminate-let*  ==>
# (lambda (p) (vector-ref p 5))
# == uniquify-variables  ==>
# (lambda (f8596) (vector-ref f8596 5))
# == vectorize-letrec  ==>
# (lambda (f8596) (vector-ref f8596 5))
# == eliminate-set!  ==>
# (lambda (f8596) (let ((f8596 f8596)) (vector-ref f8596 5)))
# == close-free-variables  ==>
# (closure (f8596) () (let ((f8596 f8596)) (vector-ref f8596 5)))
# == eliminate-quote  ==>
# (closure (f8596) () (let ((f8596 f8596)) (vector-ref f8596 5)))
# == eliminate-when/unless  ==>
# (closure (f8596) () (let ((f8596 f8596)) (vector-ref f8596 5)))
# == eliminate-cond  ==>
# (closure (f8596) () (let ((f8596 f8596)) (vector-ref f8596 5)))
# == external-symbols  ==>
# (closure (f8596) () (let ((f8596 f8596)) (vector-ref f8596 5)))
# emit-expr (closure (f8596) () (let ((f8596 f8596)) (vector-ref f8596 5)))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f8596) () (let ((f8596 f8596)) (vector-ref f8596 5)))
    movl $_L_71065, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_71066            # jump around closure body
_L_71065:
# check argument count
    cmp $4,%eax
    je _L_71067
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_71067:
# emit-tail-expr
# si=-12
# env=((f8596 . -8))
# expr=(let ((f8596 f8596)) (vector-ref f8596 5))
# emit-tail-let
#  si   = -12
#  env  = ((f8596 . -8))
#  bindings = ((f8596 f8596))
#  body = (vector-ref f8596 5)
# emit-expr f8596
# emit-variable-ref
# env=((f8596 . -8))
# var=f8596
    movl -8(%esp), %eax  # stack load f8596
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f8596 . -12) (f8596 . -8))
# expr=(vector-ref f8596 5)
# tail primcall
# emit-expr f8596
# emit-variable-ref
# env=((f8596 . -12) (f8596 . -8))
# var=f8596
    movl -12(%esp), %eax  # stack load f8596
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_71068
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_71068:
    movl %eax, -16(%esp)
# emit-expr 5
    movl $20, %eax     # immed 5
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_71069"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_71069:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_71071
    cmp  $0,%eax
    jge _L_71070
_L_71071:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_71070:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
#return from tail (vector-ref f8596 5)
    ret
    .align 4,0x90
_L_71066:
     movl %eax, port$msize
# == explicit-begins  ==>
# (lambda (ch) (let ((p (current-output-port))) (when (fx= (port-ndx p) (port-size p)) (flush-output-port p)) (string-set! (port-buf p) (port-ndx p) ch) (port-ndx-add1 p)))
# == eliminate-let*  ==>
# (lambda (ch) (let ((p (current-output-port))) (when (fx= (port-ndx p) (port-size p)) (flush-output-port p)) (string-set! (port-buf p) (port-ndx p) ch) (port-ndx-add1 p)))
# == uniquify-variables  ==>
# (lambda (f8597) (let ((f8599 (current-output-port))) (when (fx= (port-ndx f8599) (port-size f8599)) (flush-output-port f8599))))
# == vectorize-letrec  ==>
# (lambda (f8597) (let ((f8599 (current-output-port))) (when (fx= (port-ndx f8599) (port-size f8599)) (flush-output-port f8599))))
# == eliminate-set!  ==>
# (lambda (f8597) (let ((f8597 f8597)) (let ((f8599 (current-output-port))) (when (fx= (port-ndx f8599) (port-size f8599)) (flush-output-port f8599)))))
# == close-free-variables  ==>
# (closure (f8597) (when port-ndx port-size flush-output-port) (let ((f8597 f8597)) (let ((f8599 (current-output-port))) (when (fx= (port-ndx f8599) (port-size f8599)) (flush-output-port f8599)))))
# == eliminate-quote  ==>
# (closure (f8597) (when port-ndx port-size flush-output-port) (let ((f8597 f8597)) (let ((f8599 (current-output-port))) (when (fx= (port-ndx f8599) (port-size f8599)) (flush-output-port f8599)))))
# == eliminate-when/unless  ==>
# (closure (f8597) (if port-ndx (begin port-size flush-output-port) #f) (let ((f8597 f8597)) (let ((f8599 (current-output-port))) (if (fx= (port-ndx f8599) (port-size f8599)) (begin (flush-output-port f8599)) #f))))
# == eliminate-cond  ==>
# (closure (f8597) (if port-ndx (begin port-size flush-output-port) #f) (let ((f8597 f8597)) (let ((f8599 (current-output-port))) (if (fx= (port-ndx f8599) (port-size f8599)) (begin (flush-output-port f8599)) #f))))
# == external-symbols  ==>
# (closure (f8597) (if (primitive-ref port-ndx) (begin (primitive-ref port-size) (primitive-ref flush-output-port)) #f) (let ((f8597 f8597)) (let ((f8599 ((primitive-ref current-output-port)))) (if (fx= ((primitive-ref port-ndx) f8599) ((primitive-ref port-size) f8599)) (begin ((primitive-ref flush-output-port) f8599)) #f))))
# emit-expr (closure (f8597) (if (primitive-ref port-ndx) (begin (primitive-ref port-size) (primitive-ref flush-output-port)) #f) (let ((f8597 f8597)) (let ((f8599 ((primitive-ref current-output-port)))) (if (fx= ((primitive-ref port-ndx) f8599) ((primitive-ref port-size) f8599)) (begin ((primitive-ref flush-output-port) f8599)) #f))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f8597) (if (primitive-ref port-ndx) (begin (primitive-ref port-size) (primitive-ref flush-output-port)) #f) (let ((f8597 f8597)) (let ((f8599 ((primitive-ref current-output-port)))) (if (fx= ((primitive-ref port-ndx) f8599) ((primitive-ref port-size) f8599)) (begin ((primitive-ref flush-output-port) f8599)) #f))))
    movl $_L_71072, 0(%ebp)  # closure label
# WARNING: free var if not defined in the environmnet
# WARNING: free var (primitive-ref port-ndx) not defined in the environmnet
# WARNING: free var (begin (primitive-ref port-size) (primitive-ref flush-output-port)) not defined in the environmnet
# WARNING: free var #f not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $24, %ebp     # bump ebp
    jmp _L_71073            # jump around closure body
_L_71072:
# check argument count
    cmp $4,%eax
    je _L_71074
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_71074:
# emit-tail-expr
# si=-12
# env=((f8597 . -8) (#f . 16) ((begin (primitive-ref port-size) (primitive-ref flush-output-port)) . 12) ((primitive-ref port-ndx) . 8) (if . 4))
# expr=(let ((f8597 f8597)) (let ((f8599 ((primitive-ref current-output-port)))) (if (fx= ((primitive-ref port-ndx) f8599) ((primitive-ref port-size) f8599)) (begin ((primitive-ref flush-output-port) f8599)) #f)))
# emit-tail-let
#  si   = -12
#  env  = ((f8597 . -8) (#f . 16) ((begin (primitive-ref port-size) (primitive-ref flush-output-port)) . 12) ((primitive-ref port-ndx) . 8) (if . 4))
#  bindings = ((f8597 f8597))
#  body = (let ((f8599 ((primitive-ref current-output-port)))) (if (fx= ((primitive-ref port-ndx) f8599) ((primitive-ref port-size) f8599)) (begin ((primitive-ref flush-output-port) f8599)) #f))
# emit-expr f8597
# emit-variable-ref
# env=((f8597 . -8) (#f . 16) ((begin (primitive-ref port-size) (primitive-ref flush-output-port)) . 12) ((primitive-ref port-ndx) . 8) (if . 4))
# var=f8597
    movl -8(%esp), %eax  # stack load f8597
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f8597 . -12) (f8597 . -8) (#f . 16) ((begin (primitive-ref port-size) (primitive-ref flush-output-port)) . 12) ((primitive-ref port-ndx) . 8) (if . 4))
# expr=(let ((f8599 ((primitive-ref current-output-port)))) (if (fx= ((primitive-ref port-ndx) f8599) ((primitive-ref port-size) f8599)) (begin ((primitive-ref flush-output-port) f8599)) #f))
# emit-tail-let
#  si   = -16
#  env  = ((f8597 . -12) (f8597 . -8) (#f . 16) ((begin (primitive-ref port-size) (primitive-ref flush-output-port)) . 12) ((primitive-ref port-ndx) . 8) (if . 4))
#  bindings = ((f8599 ((primitive-ref current-output-port))))
#  body = (if (fx= ((primitive-ref port-ndx) f8599) ((primitive-ref port-size) f8599)) (begin ((primitive-ref flush-output-port) f8599)) #f)
# emit-expr ((primitive-ref current-output-port))
# funcall
#    si   =-16
#    env  = ((f8597 . -12) (f8597 . -8) (#f . 16) ((begin (primitive-ref port-size) (primitive-ref flush-output-port)) . 12) ((primitive-ref port-ndx) . 8) (if . 4))
#    expr = (funcall (primitive-ref current-output-port))
# emit-expr (primitive-ref current-output-port)
    .extern current$moutput$mport
    movl current$moutput$mport,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_71075"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_71075":
   movl %eax,  -24(%esp)  # stash funcall-oper in closure slot
    movl -24(%esp), %edi   # load new closure to %edi
    add $-16, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $16, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -16(%esp)  # stack save
# emit-tail-expr
# si=-20
# env=((f8599 . -16) (f8597 . -12) (f8597 . -8) (#f . 16) ((begin (primitive-ref port-size) (primitive-ref flush-output-port)) . 12) ((primitive-ref port-ndx) . 8) (if . 4))
# expr=(if (fx= ((primitive-ref port-ndx) f8599) ((primitive-ref port-size) f8599)) (begin ((primitive-ref flush-output-port) f8599)) #f)
# emit-expr (fx= ((primitive-ref port-ndx) f8599) ((primitive-ref port-size) f8599))
# emit-expr ((primitive-ref port-size) f8599)
# funcall
#    si   =-20
#    env  = ((f8599 . -16) (f8597 . -12) (f8597 . -8) (#f . 16) ((begin (primitive-ref port-size) (primitive-ref flush-output-port)) . 12) ((primitive-ref port-ndx) . 8) (if . 4))
#    expr = (funcall (primitive-ref port-size) f8599)
# emit-expr (primitive-ref port-size)
    .extern port$msize
    movl port$msize,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_71078"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_71078":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr f8599
# emit-variable-ref
# env=((f8599 . -16) (f8597 . -12) (f8597 . -8) (#f . 16) ((begin (primitive-ref port-size) (primitive-ref flush-output-port)) . 12) ((primitive-ref port-ndx) . 8) (if . 4))
# var=f8599
    movl -16(%esp), %eax  # stack load f8599
# end emit-variable-ref
    mov %eax, -32(%esp)  # arg f8599
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_71079"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_71079:
    movl %eax, -20(%esp)
# emit-expr ((primitive-ref port-ndx) f8599)
# funcall
#    si   =-24
#    env  = ((f8599 . -16) (f8597 . -12) (f8597 . -8) (#f . 16) ((begin (primitive-ref port-size) (primitive-ref flush-output-port)) . 12) ((primitive-ref port-ndx) . 8) (if . 4))
#    expr = (funcall (primitive-ref port-ndx) f8599)
# emit-expr (primitive-ref port-ndx)
    .extern port$mndx
    movl port$mndx,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_71080"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_71080":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f8599
# emit-variable-ref
# env=((f8599 . -16) (f8597 . -12) (f8597 . -8) (#f . 16) ((begin (primitive-ref port-size) (primitive-ref flush-output-port)) . 12) ((primitive-ref port-ndx) . 8) (if . 4))
# var=f8599
    movl -16(%esp), %eax  # stack load f8599
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f8599
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_71081"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_71081:
    cmp -20(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_71076
# emit-tail-expr
# si=-20
# env=((f8599 . -16) (f8597 . -12) (f8597 . -8) (#f . 16) ((begin (primitive-ref port-size) (primitive-ref flush-output-port)) . 12) ((primitive-ref port-ndx) . 8) (if . 4))
# expr=(begin ((primitive-ref flush-output-port) f8599))
# tail-begin (begin ((primitive-ref flush-output-port) f8599))
#   env=((f8599 . -16) (f8597 . -12) (f8597 . -8) (#f . 16) ((begin (primitive-ref port-size) (primitive-ref flush-output-port)) . 12) ((primitive-ref port-ndx) . 8) (if . 4))
# emit-tail-expr
# si=-20
# env=((f8599 . -16) (f8597 . -12) (f8597 . -8) (#f . 16) ((begin (primitive-ref port-size) (primitive-ref flush-output-port)) . 12) ((primitive-ref port-ndx) . 8) (if . 4))
# expr=((primitive-ref flush-output-port) f8599)
# emit-tail-funcall
#    si   =-20
#    env  = ((f8599 . -16) (f8597 . -12) (f8597 . -8) (#f . 16) ((begin (primitive-ref port-size) (primitive-ref flush-output-port)) . 12) ((primitive-ref port-ndx) . 8) (if . 4))
#    expr = (funcall (primitive-ref flush-output-port) f8599)
# emit-expr (primitive-ref flush-output-port)
    .extern flush$moutput$mport
    movl flush$moutput$mport,%eax
   movl %eax,  -20(%esp)  # stash funcall-oper in next closure slot
# emit-expr f8599
# emit-variable-ref
# env=((f8599 . -16) (f8597 . -12) (f8597 . -8) (#f . 16) ((begin (primitive-ref port-size) (primitive-ref flush-output-port)) . 12) ((primitive-ref port-ndx) . 8) (if . 4))
# var=f8599
    movl -16(%esp), %eax  # stack load f8599
# end emit-variable-ref
    mov %eax, -24(%esp)    # arg f8599
    movl -20(%esp), %edi   # load new closure to %edi
# emit-shift-args:  size=2   si=-20  delta=16
    mov -20(%esp), %ebx  # shift frame cell
    mov %ebx, -4(%esp)  # down to base
# emit-shift-args:  size=1   si=-24  delta=16
    mov -24(%esp), %ebx  # shift frame cell
    mov %ebx, -8(%esp)  # down to base
# emit-shift-args:  size=0   si=-28  delta=16
    movl $4,%eax   # save arg count
    jmp *-2(%edi)  # tail-funcall
     ret   # return thru stack
    jmp _L_71077
_L_71076:
# emit-tail-expr
# si=-20
# env=((f8599 . -16) (f8597 . -12) (f8597 . -8) (#f . 16) ((begin (primitive-ref port-size) (primitive-ref flush-output-port)) . 12) ((primitive-ref port-ndx) . 8) (if . 4))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_71077:
    .align 4,0x90
_L_71073:
     movl %eax, write$mchar
# == explicit-begins  ==>
# (lambda (p) (begin (foreign-call "s_write" (port-fd p) (port-buf p) (port-ndx p)) (port-ndx-reset p)))
# == eliminate-let*  ==>
# (lambda (p) (begin (foreign-call "s_write" (port-fd p) (port-buf p) (port-ndx p)) (port-ndx-reset p)))
# == uniquify-variables  ==>
# (lambda (f8600) (begin (foreign-call "s_write" (port-fd f8600) (port-buf f8600) (port-ndx f8600)) (port-ndx-reset f8600)))
# == vectorize-letrec  ==>
# (lambda (f8600) (begin (foreign-call "s_write" (port-fd f8600) (port-buf f8600) (port-ndx f8600)) (port-ndx-reset f8600)))
# == eliminate-set!  ==>
# (lambda (f8600) (let ((f8600 f8600)) (begin (foreign-call "s_write" (port-fd f8600) (port-buf f8600) (port-ndx f8600)) (port-ndx-reset f8600))))
# == close-free-variables  ==>
# (closure (f8600) (port-fd port-buf port-ndx port-ndx-reset) (let ((f8600 f8600)) (begin (foreign-call "s_write" (port-fd f8600) (port-buf f8600) (port-ndx f8600)) (port-ndx-reset f8600))))
# == eliminate-quote  ==>
# (closure (f8600) (port-fd port-buf port-ndx port-ndx-reset) (let ((f8600 f8600)) (begin (foreign-call "s_write" (port-fd f8600) (port-buf f8600) (port-ndx f8600)) (port-ndx-reset f8600))))
# == eliminate-when/unless  ==>
# (closure (f8600) (port-fd port-buf port-ndx port-ndx-reset) (let ((f8600 f8600)) (begin (foreign-call "s_write" (port-fd f8600) (port-buf f8600) (port-ndx f8600)) (port-ndx-reset f8600))))
# == eliminate-cond  ==>
# (closure (f8600) (port-fd port-buf port-ndx port-ndx-reset) (let ((f8600 f8600)) (begin (foreign-call "s_write" (port-fd f8600) (port-buf f8600) (port-ndx f8600)) (port-ndx-reset f8600))))
# == external-symbols  ==>
# (closure (f8600) ((primitive-ref port-fd) (primitive-ref port-buf) (primitive-ref port-ndx) (primitive-ref port-ndx-reset)) (let ((f8600 f8600)) (begin (foreign-call "s_write" ((primitive-ref port-fd) f8600) ((primitive-ref port-buf) f8600) ((primitive-ref port-ndx) f8600)) ((primitive-ref port-ndx-reset) f8600))))
# emit-expr (closure (f8600) ((primitive-ref port-fd) (primitive-ref port-buf) (primitive-ref port-ndx) (primitive-ref port-ndx-reset)) (let ((f8600 f8600)) (begin (foreign-call "s_write" ((primitive-ref port-fd) f8600) ((primitive-ref port-buf) f8600) ((primitive-ref port-ndx) f8600)) ((primitive-ref port-ndx-reset) f8600))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f8600) ((primitive-ref port-fd) (primitive-ref port-buf) (primitive-ref port-ndx) (primitive-ref port-ndx-reset)) (let ((f8600 f8600)) (begin (foreign-call "s_write" ((primitive-ref port-fd) f8600) ((primitive-ref port-buf) f8600) ((primitive-ref port-ndx) f8600)) ((primitive-ref port-ndx-reset) f8600))))
    movl $_L_71082, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref port-fd) not defined in the environmnet
# WARNING: free var (primitive-ref port-buf) not defined in the environmnet
# WARNING: free var (primitive-ref port-ndx) not defined in the environmnet
# WARNING: free var (primitive-ref port-ndx-reset) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $24, %ebp     # bump ebp
    jmp _L_71083            # jump around closure body
_L_71082:
# check argument count
    cmp $4,%eax
    je _L_71084
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_71084:
# emit-tail-expr
# si=-12
# env=((f8600 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
# expr=(let ((f8600 f8600)) (begin (foreign-call "s_write" ((primitive-ref port-fd) f8600) ((primitive-ref port-buf) f8600) ((primitive-ref port-ndx) f8600)) ((primitive-ref port-ndx-reset) f8600)))
# emit-tail-let
#  si   = -12
#  env  = ((f8600 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
#  bindings = ((f8600 f8600))
#  body = (begin (foreign-call "s_write" ((primitive-ref port-fd) f8600) ((primitive-ref port-buf) f8600) ((primitive-ref port-ndx) f8600)) ((primitive-ref port-ndx-reset) f8600))
# emit-expr f8600
# emit-variable-ref
# env=((f8600 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
# var=f8600
    movl -8(%esp), %eax  # stack load f8600
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f8600 . -12) (f8600 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
# expr=(begin (foreign-call "s_write" ((primitive-ref port-fd) f8600) ((primitive-ref port-buf) f8600) ((primitive-ref port-ndx) f8600)) ((primitive-ref port-ndx-reset) f8600))
# tail-begin (begin (foreign-call "s_write" ((primitive-ref port-fd) f8600) ((primitive-ref port-buf) f8600) ((primitive-ref port-ndx) f8600)) ((primitive-ref port-ndx-reset) f8600))
#   env=((f8600 . -12) (f8600 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
# emit-expr (foreign-call "s_write" ((primitive-ref port-fd) f8600) ((primitive-ref port-buf) f8600) ((primitive-ref port-ndx) f8600))
    movl %ecx,-16(%esp)
    movl %esp,-20(%esp)
# emit-expr ((primitive-ref port-ndx) f8600)
# funcall
#    si   =-24
#    env  = ((f8600 . -12) (f8600 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
#    expr = (funcall (primitive-ref port-ndx) f8600)
# emit-expr (primitive-ref port-ndx)
    .extern port$mndx
    movl port$mndx,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_71085"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_71085":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f8600
# emit-variable-ref
# env=((f8600 . -12) (f8600 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
# var=f8600
    movl -12(%esp), %eax  # stack load f8600
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f8600
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -24(%esp)
# emit-expr ((primitive-ref port-buf) f8600)
# funcall
#    si   =-28
#    env  = ((f8600 . -12) (f8600 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
#    expr = (funcall (primitive-ref port-buf) f8600)
# emit-expr (primitive-ref port-buf)
    .extern port$mbuf
    movl port$mbuf,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_71086"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_71086":
   movl %eax,  -36(%esp)  # stash funcall-oper in closure slot
# emit-expr f8600
# emit-variable-ref
# env=((f8600 . -12) (f8600 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
# var=f8600
    movl -12(%esp), %eax  # stack load f8600
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg f8600
    movl -36(%esp), %edi   # load new closure to %edi
    add $-28, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $28, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -28(%esp)
# emit-expr ((primitive-ref port-fd) f8600)
# funcall
#    si   =-32
#    env  = ((f8600 . -12) (f8600 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
#    expr = (funcall (primitive-ref port-fd) f8600)
# emit-expr (primitive-ref port-fd)
    .extern port$mfd
    movl port$mfd,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_71087"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_71087":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
# emit-expr f8600
# emit-variable-ref
# env=((f8600 . -12) (f8600 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
# var=f8600
    movl -12(%esp), %eax  # stack load f8600
# end emit-variable-ref
    mov %eax, -44(%esp)  # arg f8600
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
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
# emit-tail-expr
# si=-16
# env=((f8600 . -12) (f8600 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
# expr=(begin ((primitive-ref port-ndx-reset) f8600))
# tail-begin (begin ((primitive-ref port-ndx-reset) f8600))
#   env=((f8600 . -12) (f8600 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
# emit-tail-expr
# si=-16
# env=((f8600 . -12) (f8600 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
# expr=((primitive-ref port-ndx-reset) f8600)
# emit-tail-funcall
#    si   =-16
#    env  = ((f8600 . -12) (f8600 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
#    expr = (funcall (primitive-ref port-ndx-reset) f8600)
# emit-expr (primitive-ref port-ndx-reset)
    .extern port$mndx$mreset
    movl port$mndx$mreset,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f8600
# emit-variable-ref
# env=((f8600 . -12) (f8600 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
# var=f8600
    movl -12(%esp), %eax  # stack load f8600
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f8600
    movl -16(%esp), %edi   # load new closure to %edi
# emit-shift-args:  size=2   si=-16  delta=12
    mov -16(%esp), %ebx  # shift frame cell
    mov %ebx, -4(%esp)  # down to base
# emit-shift-args:  size=1   si=-20  delta=12
    mov -20(%esp), %ebx  # shift frame cell
    mov %ebx, -8(%esp)  # down to base
# emit-shift-args:  size=0   si=-24  delta=12
    movl $4,%eax   # save arg count
    jmp *-2(%edi)  # tail-funcall
     ret   # return thru stack
    .align 4,0x90
_L_71083:
     movl %eax, flush$moutput$mport
# == explicit-begins  ==>
# (lambda () (foreign-call "s_exit"))
# == eliminate-let*  ==>
# (lambda () (foreign-call "s_exit"))
# == uniquify-variables  ==>
# (lambda () (foreign-call "s_exit"))
# == vectorize-letrec  ==>
# (lambda () (foreign-call "s_exit"))
# == eliminate-set!  ==>
# (lambda () (let () (foreign-call "s_exit")))
# == close-free-variables  ==>
# (closure () () (let () (foreign-call "s_exit")))
# == eliminate-quote  ==>
# (closure () () (let () (foreign-call "s_exit")))
# == eliminate-when/unless  ==>
# (closure () () (let () (foreign-call "s_exit")))
# == eliminate-cond  ==>
# (closure () () (let () (foreign-call "s_exit")))
# == external-symbols  ==>
# (closure () () (let () (foreign-call "s_exit")))
# emit-expr (closure () () (let () (foreign-call "s_exit")))
# emit-closure
# si = 0
# env = ()
# expr = (closure () () (let () (foreign-call "s_exit")))
    movl $_L_71088, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_71089            # jump around closure body
_L_71088:
# check argument count
    cmp $0,%eax
    je _L_71090
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_71090:
# emit-tail-expr
# si=-8
# env=()
# expr=(let () (foreign-call "s_exit"))
# emit-tail-let
#  si   = -8
#  env  = ()
#  bindings = ()
#  body = (foreign-call "s_exit")
# emit-tail-expr
# si=-8
# env=()
# expr=(foreign-call "s_exit")
    movl %ecx,-8(%esp)
    movl %esp,-12(%esp)
    leal -12(%esp),%edi
    movl %edi,%esi
    andl $-16,%esi
    movl 0(%edi),%eax
    movl %eax,0(%esi)
    movl %esi,%esp
    .extern _s_exit
    call _s_exit
    movl 0(%esi),%esp
    movl -8(%esp),%ecx
     ret
    .align 4,0x90
_L_71089:
     movl %eax, exit
# == explicit-begins  ==>
# (lambda (x) (error (quote output-port?) "not yet implemented"))
# == eliminate-let*  ==>
# (lambda (x) (error (quote output-port?) "not yet implemented"))
# == uniquify-variables  ==>
# (lambda (f8601) (error (quote output-port?) "not yet implemented"))
# == vectorize-letrec  ==>
# (lambda (f8601) (error (quote output-port?) "not yet implemented"))
# == eliminate-set!  ==>
# (lambda (f8601) (let ((f8601 f8601)) (error (quote output-port?) "not yet implemented")))
# == close-free-variables  ==>
# (closure (f8601) (error output-port?) (let ((f8601 f8601)) (error (quote output-port?) "not yet implemented")))
# == eliminate-quote  ==>
# (closure (f8601) (error output-port?) (let ((f8601 f8601)) (error (string->symbol "output-port?") "not yet implemented")))
# == eliminate-when/unless  ==>
# (closure (f8601) (error output-port?) (let ((f8601 f8601)) (error (string->symbol "output-port?") "not yet implemented")))
# == eliminate-cond  ==>
# (closure (f8601) (error output-port?) (let ((f8601 f8601)) (error (string->symbol "output-port?") "not yet implemented")))
# == external-symbols  ==>
# (closure (f8601) ((primitive-ref error) output-port?) (let ((f8601 f8601)) ((primitive-ref error) ((primitive-ref string->symbol) "output-port?") "not yet implemented")))
# emit-expr (closure (f8601) ((primitive-ref error) output-port?) (let ((f8601 f8601)) ((primitive-ref error) ((primitive-ref string->symbol) "output-port?") "not yet implemented")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f8601) ((primitive-ref error) output-port?) (let ((f8601 f8601)) ((primitive-ref error) ((primitive-ref string->symbol) "output-port?") "not yet implemented")))
    movl $_L_71091, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var output-port? not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_71092            # jump around closure body
_L_71091:
# check argument count
    cmp $4,%eax
    je _L_71093
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_71093:
# emit-tail-expr
# si=-12
# env=((f8601 . -8) (output-port? . 8) ((primitive-ref error) . 4))
# expr=(let ((f8601 f8601)) ((primitive-ref error) ((primitive-ref string->symbol) "output-port?") "not yet implemented"))
# emit-tail-let
#  si   = -12
#  env  = ((f8601 . -8) (output-port? . 8) ((primitive-ref error) . 4))
#  bindings = ((f8601 f8601))
#  body = ((primitive-ref error) ((primitive-ref string->symbol) "output-port?") "not yet implemented")
# emit-expr f8601
# emit-variable-ref
# env=((f8601 . -8) (output-port? . 8) ((primitive-ref error) . 4))
# var=f8601
    movl -8(%esp), %eax  # stack load f8601
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f8601 . -12) (f8601 . -8) (output-port? . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref string->symbol) "output-port?") "not yet implemented")
# emit-tail-funcall
#    si   =-16
#    env  = ((f8601 . -12) (f8601 . -8) (output-port? . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref string->symbol) "output-port?") "not yet implemented")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref string->symbol) "output-port?")
# funcall
#    si   =-20
#    env  = ((f8601 . -12) (f8601 . -8) (output-port? . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref string->symbol) "output-port?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_71094"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_71094":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr "output-port?"
# string literal
    jmp _L_71096
    .align 8,0x90
_L_71095 :
    .int 48
    .ascii "output-port?"
_L_71096:
    movl $_L_71095, %eax
    orl $6, %eax
    mov %eax, -32(%esp)  # arg output-port?
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref string->symbol) output-port?)
# emit-expr "not yet implemented"
# string literal
    jmp _L_71098
    .align 8,0x90
_L_71097 :
    .int 76
    .ascii "not yet implemented"
_L_71098:
    movl $_L_71097, %eax
    orl $6, %eax
    mov %eax, -24(%esp)    # arg not yet implemented
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
_L_71092:
     movl %eax, output$mport$q
# == explicit-begins  ==>
# (lambda (x) (error (quote open-output) "not yet implemented"))
# == eliminate-let*  ==>
# (lambda (x) (error (quote open-output) "not yet implemented"))
# == uniquify-variables  ==>
# (lambda (f8602) (error (quote open-output) "not yet implemented"))
# == vectorize-letrec  ==>
# (lambda (f8602) (error (quote open-output) "not yet implemented"))
# == eliminate-set!  ==>
# (lambda (f8602) (let ((f8602 f8602)) (error (quote open-output) "not yet implemented")))
# == close-free-variables  ==>
# (closure (f8602) (error open-output) (let ((f8602 f8602)) (error (quote open-output) "not yet implemented")))
# == eliminate-quote  ==>
# (closure (f8602) (error open-output) (let ((f8602 f8602)) (error (string->symbol "open-output") "not yet implemented")))
# == eliminate-when/unless  ==>
# (closure (f8602) (error open-output) (let ((f8602 f8602)) (error (string->symbol "open-output") "not yet implemented")))
# == eliminate-cond  ==>
# (closure (f8602) (error open-output) (let ((f8602 f8602)) (error (string->symbol "open-output") "not yet implemented")))
# == external-symbols  ==>
# (closure (f8602) ((primitive-ref error) open-output) (let ((f8602 f8602)) ((primitive-ref error) ((primitive-ref string->symbol) "open-output") "not yet implemented")))
# emit-expr (closure (f8602) ((primitive-ref error) open-output) (let ((f8602 f8602)) ((primitive-ref error) ((primitive-ref string->symbol) "open-output") "not yet implemented")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f8602) ((primitive-ref error) open-output) (let ((f8602 f8602)) ((primitive-ref error) ((primitive-ref string->symbol) "open-output") "not yet implemented")))
    movl $_L_71099, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var open-output not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_71100            # jump around closure body
_L_71099:
# check argument count
    cmp $4,%eax
    je _L_71101
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_71101:
# emit-tail-expr
# si=-12
# env=((f8602 . -8) (open-output . 8) ((primitive-ref error) . 4))
# expr=(let ((f8602 f8602)) ((primitive-ref error) ((primitive-ref string->symbol) "open-output") "not yet implemented"))
# emit-tail-let
#  si   = -12
#  env  = ((f8602 . -8) (open-output . 8) ((primitive-ref error) . 4))
#  bindings = ((f8602 f8602))
#  body = ((primitive-ref error) ((primitive-ref string->symbol) "open-output") "not yet implemented")
# emit-expr f8602
# emit-variable-ref
# env=((f8602 . -8) (open-output . 8) ((primitive-ref error) . 4))
# var=f8602
    movl -8(%esp), %eax  # stack load f8602
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f8602 . -12) (f8602 . -8) (open-output . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref string->symbol) "open-output") "not yet implemented")
# emit-tail-funcall
#    si   =-16
#    env  = ((f8602 . -12) (f8602 . -8) (open-output . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref string->symbol) "open-output") "not yet implemented")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref string->symbol) "open-output")
# funcall
#    si   =-20
#    env  = ((f8602 . -12) (f8602 . -8) (open-output . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref string->symbol) "open-output")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_71102"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_71102":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr "open-output"
# string literal
    jmp _L_71104
    .align 8,0x90
_L_71103 :
    .int 44
    .ascii "open-output"
_L_71104:
    movl $_L_71103, %eax
    orl $6, %eax
    mov %eax, -32(%esp)  # arg open-output
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref string->symbol) open-output)
# emit-expr "not yet implemented"
# string literal
    jmp _L_71106
    .align 8,0x90
_L_71105 :
    .int 76
    .ascii "not yet implemented"
_L_71106:
    movl $_L_71105, %eax
    orl $6, %eax
    mov %eax, -24(%esp)    # arg not yet implemented
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
_L_71100:
     movl %eax, open$moutput$mfile
# == explicit-begins  ==>
# (lambda (x) (error (quote close-output-port) "not yet implemented"))
# == eliminate-let*  ==>
# (lambda (x) (error (quote close-output-port) "not yet implemented"))
# == uniquify-variables  ==>
# (lambda (f8603) (error (quote close-output-port) "not yet implemented"))
# == vectorize-letrec  ==>
# (lambda (f8603) (error (quote close-output-port) "not yet implemented"))
# == eliminate-set!  ==>
# (lambda (f8603) (let ((f8603 f8603)) (error (quote close-output-port) "not yet implemented")))
# == close-free-variables  ==>
# (closure (f8603) (error close-output-port) (let ((f8603 f8603)) (error (quote close-output-port) "not yet implemented")))
# == eliminate-quote  ==>
# (closure (f8603) (error close-output-port) (let ((f8603 f8603)) (error (string->symbol "close-output-port") "not yet implemented")))
# == eliminate-when/unless  ==>
# (closure (f8603) (error close-output-port) (let ((f8603 f8603)) (error (string->symbol "close-output-port") "not yet implemented")))
# == eliminate-cond  ==>
# (closure (f8603) (error close-output-port) (let ((f8603 f8603)) (error (string->symbol "close-output-port") "not yet implemented")))
# == external-symbols  ==>
# (closure (f8603) ((primitive-ref error) close-output-port) (let ((f8603 f8603)) ((primitive-ref error) ((primitive-ref string->symbol) "close-output-port") "not yet implemented")))
# emit-expr (closure (f8603) ((primitive-ref error) close-output-port) (let ((f8603 f8603)) ((primitive-ref error) ((primitive-ref string->symbol) "close-output-port") "not yet implemented")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f8603) ((primitive-ref error) close-output-port) (let ((f8603 f8603)) ((primitive-ref error) ((primitive-ref string->symbol) "close-output-port") "not yet implemented")))
    movl $_L_71107, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var close-output-port not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_71108            # jump around closure body
_L_71107:
# check argument count
    cmp $4,%eax
    je _L_71109
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_71109:
# emit-tail-expr
# si=-12
# env=((f8603 . -8) (close-output-port . 8) ((primitive-ref error) . 4))
# expr=(let ((f8603 f8603)) ((primitive-ref error) ((primitive-ref string->symbol) "close-output-port") "not yet implemented"))
# emit-tail-let
#  si   = -12
#  env  = ((f8603 . -8) (close-output-port . 8) ((primitive-ref error) . 4))
#  bindings = ((f8603 f8603))
#  body = ((primitive-ref error) ((primitive-ref string->symbol) "close-output-port") "not yet implemented")
# emit-expr f8603
# emit-variable-ref
# env=((f8603 . -8) (close-output-port . 8) ((primitive-ref error) . 4))
# var=f8603
    movl -8(%esp), %eax  # stack load f8603
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f8603 . -12) (f8603 . -8) (close-output-port . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref string->symbol) "close-output-port") "not yet implemented")
# emit-tail-funcall
#    si   =-16
#    env  = ((f8603 . -12) (f8603 . -8) (close-output-port . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref string->symbol) "close-output-port") "not yet implemented")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref string->symbol) "close-output-port")
# funcall
#    si   =-20
#    env  = ((f8603 . -12) (f8603 . -8) (close-output-port . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref string->symbol) "close-output-port")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_71110"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_71110":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr "close-output-port"
# string literal
    jmp _L_71112
    .align 8,0x90
_L_71111 :
    .int 68
    .ascii "close-output-port"
_L_71112:
    movl $_L_71111, %eax
    orl $6, %eax
    mov %eax, -32(%esp)  # arg close-output-port
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref string->symbol) close-output-port)
# emit-expr "not yet implemented"
# string literal
    jmp _L_71114
    .align 8,0x90
_L_71113 :
    .int 76
    .ascii "not yet implemented"
_L_71114:
    movl $_L_71113, %eax
    orl $6, %eax
    mov %eax, -24(%esp)    # arg not yet implemented
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
_L_71108:
     movl %eax, close$moutput$mport
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
