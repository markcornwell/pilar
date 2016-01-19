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
    jmp _L_685840
    .align 8,0x90
_L_685839 :
    .int 12
    .ascii "nil"
_L_685840:
    movl $_L_685839, %eax
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
    movl $_L_685841, 0(%ebp)  # closure label
# emit-variable-ref
# env=((interned-symbols . 0))
# var=interned-symbols
    movl 0(%esp), %eax  # stack load interned-symbols
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # interned-symbols
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_685842            # jump around closure body
_L_685841:
# check argument count
    cmp $0,%eax
    je _L_685843
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_685843:
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
_L_685842:
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
    je "_L_685844"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685844:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_685845
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685845:
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
    je "_L_685846"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685846:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_685847
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685847:
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
    je "_L_685848"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685848:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_685849
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685849:
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
    je "_L_685850"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685850:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_685851
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685851:
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
    je _L_685852
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685852:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_685853"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685853:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_685855
    cmp  $0,%eax
    jge _L_685854
_L_685855:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_685854:
    movl %eax, -20(%esp)
# emit-expr (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))
# emit-closure
# si = -24
# env = ((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr = (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))
    movl $_L_685856, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_685857            # jump around closure body
_L_685856:
# check argument count
    cmp $8,%eax
    je _L_685858
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_685858:
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
    je _L_685859
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685859:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_685860"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685860:
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
    je _L_685861
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685861:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_685862"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685862:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (fx= (string-length s1) (string-length s2))
    ret
    .align 4,0x90
_L_685857:
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
    je _L_685863
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685863:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_685864"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685864:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_685866
    cmp  $0,%eax
    jge _L_685865
_L_685866:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_685865:
    movl %eax, -20(%esp)
# emit-expr (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))
# emit-closure
# si = -24
# env = ((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr = (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))
    movl $_L_685867, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_685868            # jump around closure body
_L_685867:
# check argument count
    cmp $12,%eax
    je _L_685869
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_685869:
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
    je _L_685870
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685870:
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
    je "_L_685871"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685871:
# check bounds on string index
    movl -32(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_685873
    cmp  $0,%eax
    jge _L_685872
_L_685873:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_685872:
    sar $2, %eax
    movl -32(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_685874"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685874:
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
    je _L_685875
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685875:
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
    je "_L_685876"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685876:
# check bounds on string index
    movl -36(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_685878
    cmp  $0,%eax
    jge _L_685877
_L_685878:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_685877:
    sar $2, %eax
    movl -36(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_685879"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685879:
    cmp %ah, -32(%esp)
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (char=? (string-ref s1 i) (string-ref s2 i))
    ret
    .align 4,0x90
_L_685868:
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
    je _L_685880
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685880:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_685881"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685881:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_685883
    cmp  $0,%eax
    jge _L_685882
_L_685883:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_685882:
    movl %eax, -20(%esp)
# emit-expr (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))
# emit-closure
# si = -24
# env = ((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr = (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))
    movl $_L_685884, 0(%ebp)  # closure label
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
    jmp _L_685885            # jump around closure body
_L_685884:
# check argument count
    cmp $16,%eax
    je _L_685886
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_685886:
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
    je "_L_685889"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685889:
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
    je "_L_685890"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685890:
    cmp -40(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_685887
# emit-tail-expr
# si=-40
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=#t
    movl $111, %eax     # immed #t
    ret                  # immediate tail return
    jmp _L_685888
_L_685887:
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
    je _L_685893
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685893:
    movl %eax, -48(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_685894"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685894:
# check bounds on vector index
    movl -48(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_685896
    cmp  $0,%eax
    jge _L_685895
_L_685896:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_685895:
    movl -48(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_685897"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_685897":
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
    je _L_685891
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
    je _L_685898
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685898:
    movl %eax, -40(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_685899"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685899:
# check bounds on vector index
    movl -40(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_685901
    cmp  $0,%eax
    jge _L_685900
_L_685901:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_685900:
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
    je "_L_685902"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685902:
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
    je "_L_685903"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685903:
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
    jmp _L_685892
_L_685891:
# emit-tail-expr
# si=-40
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_685892:
_L_685888:
    .align 4,0x90
_L_685885:
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
    je _L_685904
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685904:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_685905"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685905:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_685907
    cmp  $0,%eax
    jge _L_685906
_L_685907:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_685906:
    movl %eax, -20(%esp)
# emit-expr (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)))
# emit-closure
# si = -24
# env = ((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr = (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)))
    movl $_L_685908, 0(%ebp)  # closure label
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
    jmp _L_685909            # jump around closure body
_L_685908:
# check argument count
    cmp $8,%eax
    je _L_685910
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_685910:
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
    je _L_685913
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685913:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_685914"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685914:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_685916
    cmp  $0,%eax
    jge _L_685915
_L_685916:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_685915:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_685917"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_685917":
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
    je _L_685911
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
    je _L_685918
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685918:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_685919"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685919:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_685921
    cmp  $0,%eax
    jge _L_685920
_L_685921:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_685920:
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
    je _L_685922
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685922:
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
    jmp _L_685912
_L_685911:
# emit-tail-expr
# si=-24
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_685912:
    .align 4,0x90
_L_685909:
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
    je _L_685923
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685923:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_685924"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685924:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_685926
    cmp  $0,%eax
    jge _L_685925
_L_685926:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_685925:
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
    je "_L_685927"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685927:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_685928
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685928:
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
    je _L_685929
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685929:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_685930"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685930:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_685932
    cmp  $0,%eax
    jge _L_685931
_L_685932:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_685931:
    movl %eax, -8(%esp)
# emit-expr (closure (str symlist) ((primitive-ref string=?) str->sym) (let ((str str) (symlist symlist)) (if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist))))))
# emit-closure
# si = -12
# env = ((str->sym . 0))
# expr = (closure (str symlist) ((primitive-ref string=?) str->sym) (let ((str str) (symlist symlist)) (if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist))))))
    movl $_L_685933, 0(%ebp)  # closure label
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
    jmp _L_685934            # jump around closure body
_L_685933:
# check argument count
    cmp $8,%eax
    je _L_685935
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_685935:
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
    je "_L_685938"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_685938":
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
    je _L_685939
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685939:
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
    je _L_685936
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
    je _L_685940
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685940:
    movl -1(%eax), %eax
#return from tail (car symlist)
    ret
    jmp _L_685937
_L_685936:
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
    je _L_685943
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685943:
    movl 3(%eax), %eax
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_685941
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
    je _L_685944
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685944:
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
    jmp _L_685942
_L_685941:
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
    je _L_685945
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685945:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_685946"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685946:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_685948
    cmp  $0,%eax
    jge _L_685947
_L_685948:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_685947:
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
    je _L_685949
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685949:
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
_L_685942:
_L_685937:
    .align 4,0x90
_L_685934:
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
    movl $_L_685950, 0(%ebp)  # closure label
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
    jmp _L_685951            # jump around closure body
_L_685950:
# check argument count
    cmp $4,%eax
    je _L_685952
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_685952:
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
    je _L_685953
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685953:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_685954"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685954:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_685956
    cmp  $0,%eax
    jge _L_685955
_L_685956:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_685955:
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
    je "_L_685957"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_685957":
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
_L_685951:
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
    movl $_L_685958, 0(%ebp)  # closure label
# WARNING: free var e not defined in the environmnet
# WARNING: free var nil not defined in the environmnet
# WARNING: free var (primitive-ref append1) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_685959            # jump around closure body
_L_685958:
# check argument count
    cmp $8,%eax
    je _L_685960
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_685960:
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
    je _L_685961
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
    jmp _L_685962
_L_685961:
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
    je _L_685963
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685963:
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
    je "_L_685964"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_685964":
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
    je _L_685965
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685965:
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
_L_685962:
    .align 4,0x90
_L_685959:
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
    movl $_L_685966, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_685967            # jump around closure body
_L_685966:
# check argument count
    cmp $8,%eax
    je _L_685968
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_685968:
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
    je "_L_685971"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685971:
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
    je "_L_685972"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685972:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_685969
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
    je _L_685973
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685973:
    movl -1(%eax), %eax
#return from tail (car l)
    ret
    jmp _L_685970
_L_685969:
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
    je _L_685974
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685974:
    movl 3(%eax), %eax
    mov %eax, -28(%esp)    # arg (cdr l)
# emit-expr (fx- k 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_685975"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685975:
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
    je "_L_685976"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685976:
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
_L_685970:
    .align 4,0x90
_L_685967:
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
    movl $_L_685977, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_685978            # jump around closure body
_L_685977:
# check argument count
    cmp $4,%eax
    je _L_685979
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_685979:
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
    je _L_685980
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685980:
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
_L_685978:
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
    movl $_L_685981, 0(%ebp)  # closure label
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
    jmp _L_685982            # jump around closure body
_L_685981:
# check argument count
    cmp $8,%eax
    je _L_685983
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_685983:
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
    je "_L_685984"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_685984":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr "error:"
# string literal
    jmp _L_685986
    .align 8,0x90
_L_685985 :
    .int 24
    .ascii "error:"
_L_685986:
    movl $_L_685985, %eax
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
    je "_L_685987"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_685987":
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
    je "_L_685988"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_685988":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr ": "
# string literal
    jmp _L_685990
    .align 8,0x90
_L_685989 :
    .int 8
    .ascii ": "
_L_685990:
    movl $_L_685989, %eax
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
    je "_L_685991"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_685991":
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
    jmp _L_685993
    .align 8,0x90
_L_685992 :
    .int 4
    .ascii "\n"
_L_685993:
    movl $_L_685992, %eax
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
_L_685982:
    movl %eax, -4(%esp)  # stack save
# emit-expr (closure (sym emsg) (write-errmsg) (let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))
# emit-closure
# si = -8
# env = ((write-errmsg . -4) (write-stderr . 0))
# expr = (closure (sym emsg) (write-errmsg) (let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))
    movl $_L_685994, 0(%ebp)  # closure label
# emit-variable-ref
# env=((write-errmsg . -4) (write-stderr . 0))
# var=write-errmsg
    movl -4(%esp), %eax  # stack load write-errmsg
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # write-errmsg
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_685995            # jump around closure body
_L_685994:
# check argument count
    cmp $8,%eax
    je _L_685996
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_685996:
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
    je "_L_685997"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_685997":
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
_L_685995:
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
    je "_L_685998"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685998:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_685999
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_685999:
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
    je _L_686000
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686000:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686001"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686001:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686003
    cmp  $0,%eax
    jge _L_686002
_L_686003:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686002:
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
    je "_L_686004"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686004":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "procedure?"
# string literal
    jmp _L_686006
    .align 8,0x90
_L_686005 :
    .int 40
    .ascii "procedure?"
_L_686006:
    movl $_L_686005, %eax
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
    je _L_686007
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686007:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686008"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686008:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686010
    cmp  $0,%eax
    jge _L_686009
_L_686010:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686009:
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
    je _L_686011
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686011:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686012"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686012:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686014
    cmp  $0,%eax
    jge _L_686013
_L_686014:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686013:
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
    je "_L_686015"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686015":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_686017
    .align 8,0x90
_L_686016 :
    .int 12
    .ascii "cdr"
_L_686017:
    movl $_L_686016, %eax
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
    je _L_686018
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686018:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686019"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686019:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686021
    cmp  $0,%eax
    jge _L_686020
_L_686021:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686020:
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
    je _L_686022
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686022:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686023"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686023:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686025
    cmp  $0,%eax
    jge _L_686024
_L_686025:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686024:
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
    je "_L_686026"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686026":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_686028
    .align 8,0x90
_L_686027 :
    .int 12
    .ascii "car"
_L_686028:
    movl $_L_686027, %eax
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
    je _L_686029
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686029:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686030"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686030:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686032
    cmp  $0,%eax
    jge _L_686031
_L_686032:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686031:
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
    je _L_686033
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686033:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686034"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686034:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686036
    cmp  $0,%eax
    jge _L_686035
_L_686036:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686035:
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
    je "_L_686037"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686037":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol-value"
# string literal
    jmp _L_686039
    .align 8,0x90
_L_686038 :
    .int 48
    .ascii "symbol-value"
_L_686039:
    movl $_L_686038, %eax
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
    je _L_686040
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686040:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686041"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686041:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686043
    cmp  $0,%eax
    jge _L_686042
_L_686043:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686042:
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
    je _L_686044
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686044:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686045"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686045:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686047
    cmp  $0,%eax
    jge _L_686046
_L_686047:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686046:
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
    je "_L_686048"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686048":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol->string"
# string literal
    jmp _L_686050
    .align 8,0x90
_L_686049 :
    .int 56
    .ascii "symbol->string"
_L_686050:
    movl $_L_686049, %eax
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
    je _L_686051
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686051:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686052"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686052:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686054
    cmp  $0,%eax
    jge _L_686053
_L_686054:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686053:
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
    je _L_686055
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686055:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686056"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686056:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686058
    cmp  $0,%eax
    jge _L_686057
_L_686058:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686057:
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
    je "_L_686059"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686059":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-symbol"
# string literal
    jmp _L_686061
    .align 8,0x90
_L_686060 :
    .int 44
    .ascii "make-symbol"
_L_686061:
    movl $_L_686060, %eax
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
    je _L_686062
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686062:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686063"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686063:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686065
    cmp  $0,%eax
    jge _L_686064
_L_686065:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686064:
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
    je _L_686066
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686066:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686067"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686067:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686069
    cmp  $0,%eax
    jge _L_686068
_L_686069:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686068:
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
    je "_L_686070"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686070":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol?"
# string literal
    jmp _L_686072
    .align 8,0x90
_L_686071 :
    .int 28
    .ascii "symbol?"
_L_686072:
    movl $_L_686071, %eax
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
    je _L_686073
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686073:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686074"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686074:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686076
    cmp  $0,%eax
    jge _L_686075
_L_686076:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686075:
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
    je _L_686077
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686077:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686078"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686078:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686080
    cmp  $0,%eax
    jge _L_686079
_L_686080:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686079:
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
    je "_L_686081"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686081":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-set!"
# string literal
    jmp _L_686083
    .align 8,0x90
_L_686082 :
    .int 44
    .ascii "string-set!"
_L_686083:
    movl $_L_686082, %eax
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
    je _L_686084
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686084:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686085"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686085:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686087
    cmp  $0,%eax
    jge _L_686086
_L_686087:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686086:
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
    je _L_686088
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686088:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686089"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686089:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686091
    cmp  $0,%eax
    jge _L_686090
_L_686091:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686090:
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
    je "_L_686092"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686092":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-ref"
# string literal
    jmp _L_686094
    .align 8,0x90
_L_686093 :
    .int 40
    .ascii "string-ref"
_L_686094:
    movl $_L_686093, %eax
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
    je _L_686095
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686095:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686096"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686096:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686098
    cmp  $0,%eax
    jge _L_686097
_L_686098:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686097:
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
    je _L_686099
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686099:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686100"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686100:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686102
    cmp  $0,%eax
    jge _L_686101
_L_686102:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686101:
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
    je "_L_686103"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686103":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-length"
# string literal
    jmp _L_686105
    .align 8,0x90
_L_686104 :
    .int 52
    .ascii "string-length"
_L_686105:
    movl $_L_686104, %eax
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
    je _L_686106
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686106:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686107"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686107:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686109
    cmp  $0,%eax
    jge _L_686108
_L_686109:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686108:
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
    je _L_686110
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686110:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686111"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686111:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686113
    cmp  $0,%eax
    jge _L_686112
_L_686113:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686112:
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
    je "_L_686114"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686114":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string?"
# string literal
    jmp _L_686116
    .align 8,0x90
_L_686115 :
    .int 28
    .ascii "string?"
_L_686116:
    movl $_L_686115, %eax
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
    je _L_686117
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686117:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686118"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686118:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686120
    cmp  $0,%eax
    jge _L_686119
_L_686120:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686119:
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
    je _L_686121
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686121:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686122"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686122:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686124
    cmp  $0,%eax
    jge _L_686123
_L_686124:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686123:
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
    je "_L_686125"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686125":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-string"
# string literal
    jmp _L_686127
    .align 8,0x90
_L_686126 :
    .int 44
    .ascii "make-string"
_L_686127:
    movl $_L_686126, %eax
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
    je _L_686128
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686128:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686129"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686129:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686131
    cmp  $0,%eax
    jge _L_686130
_L_686131:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686130:
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
    je _L_686132
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686132:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686133"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686133:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686135
    cmp  $0,%eax
    jge _L_686134
_L_686135:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686134:
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
    je "_L_686136"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686136":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector"
# string literal
    jmp _L_686138
    .align 8,0x90
_L_686137 :
    .int 24
    .ascii "vector"
_L_686138:
    movl $_L_686137, %eax
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
    je _L_686139
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686139:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686140"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686140:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686142
    cmp  $0,%eax
    jge _L_686141
_L_686142:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686141:
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
    je _L_686143
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686143:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686144"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686144:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686146
    cmp  $0,%eax
    jge _L_686145
_L_686146:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686145:
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
    je "_L_686147"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686147":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-ref"
# string literal
    jmp _L_686149
    .align 8,0x90
_L_686148 :
    .int 40
    .ascii "vector-ref"
_L_686149:
    movl $_L_686148, %eax
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
    je _L_686150
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686150:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686151"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686151:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686153
    cmp  $0,%eax
    jge _L_686152
_L_686153:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686152:
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
    je _L_686154
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686154:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686155"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686155:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686157
    cmp  $0,%eax
    jge _L_686156
_L_686157:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686156:
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
    je "_L_686158"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686158":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-set!"
# string literal
    jmp _L_686160
    .align 8,0x90
_L_686159 :
    .int 44
    .ascii "vector-set!"
_L_686160:
    movl $_L_686159, %eax
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
    je _L_686161
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686161:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686162"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686162:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686164
    cmp  $0,%eax
    jge _L_686163
_L_686164:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686163:
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
    je _L_686165
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686165:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686166"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686166:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686168
    cmp  $0,%eax
    jge _L_686167
_L_686168:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686167:
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
    je "_L_686169"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686169":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-length"
# string literal
    jmp _L_686171
    .align 8,0x90
_L_686170 :
    .int 52
    .ascii "vector-length"
_L_686171:
    movl $_L_686170, %eax
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
    je _L_686172
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686172:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686173"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686173:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686175
    cmp  $0,%eax
    jge _L_686174
_L_686175:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686174:
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
    je _L_686176
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686176:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686177"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686177:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686179
    cmp  $0,%eax
    jge _L_686178
_L_686179:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686178:
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
    je "_L_686180"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686180":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-vector"
# string literal
    jmp _L_686182
    .align 8,0x90
_L_686181 :
    .int 44
    .ascii "make-vector"
_L_686182:
    movl $_L_686181, %eax
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
    je _L_686183
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686183:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686184"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686184:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686186
    cmp  $0,%eax
    jge _L_686185
_L_686186:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686185:
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
    je _L_686187
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686187:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686188"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686188:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686190
    cmp  $0,%eax
    jge _L_686189
_L_686190:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686189:
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
    je "_L_686191"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686191":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector?"
# string literal
    jmp _L_686193
    .align 8,0x90
_L_686192 :
    .int 28
    .ascii "vector?"
_L_686193:
    movl $_L_686192, %eax
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
    je _L_686194
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686194:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686195"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686195:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686197
    cmp  $0,%eax
    jge _L_686196
_L_686197:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686196:
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
    je _L_686198
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686198:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686199"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686199:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686201
    cmp  $0,%eax
    jge _L_686200
_L_686201:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686200:
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
    je "_L_686202"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686202":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-cdr!"
# string literal
    jmp _L_686204
    .align 8,0x90
_L_686203 :
    .int 32
    .ascii "set-cdr!"
_L_686204:
    movl $_L_686203, %eax
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
    je _L_686205
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686205:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686206"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686206:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686208
    cmp  $0,%eax
    jge _L_686207
_L_686208:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686207:
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
    je _L_686209
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686209:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686210"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686210:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686212
    cmp  $0,%eax
    jge _L_686211
_L_686212:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686211:
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
    je "_L_686213"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686213":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-car!"
# string literal
    jmp _L_686215
    .align 8,0x90
_L_686214 :
    .int 32
    .ascii "set-car!"
_L_686215:
    movl $_L_686214, %eax
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
    je _L_686216
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686216:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686217"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686217:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686219
    cmp  $0,%eax
    jge _L_686218
_L_686219:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686218:
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
    je _L_686220
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686220:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686221"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686221:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686223
    cmp  $0,%eax
    jge _L_686222
_L_686223:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686222:
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
    je "_L_686224"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686224":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_686226
    .align 8,0x90
_L_686225 :
    .int 12
    .ascii "cdr"
_L_686226:
    movl $_L_686225, %eax
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
    je _L_686227
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686227:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686228"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686228:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686230
    cmp  $0,%eax
    jge _L_686229
_L_686230:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686229:
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
    je _L_686231
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686231:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686232"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686232:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686234
    cmp  $0,%eax
    jge _L_686233
_L_686234:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686233:
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
    je "_L_686235"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686235":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_686237
    .align 8,0x90
_L_686236 :
    .int 12
    .ascii "car"
_L_686237:
    movl $_L_686236, %eax
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
    je _L_686238
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686238:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686239"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686239:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686241
    cmp  $0,%eax
    jge _L_686240
_L_686241:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686240:
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
    je _L_686242
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686242:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686243"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686243:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686245
    cmp  $0,%eax
    jge _L_686244
_L_686245:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686244:
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
    je "_L_686246"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686246":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cons"
# string literal
    jmp _L_686248
    .align 8,0x90
_L_686247 :
    .int 16
    .ascii "cons"
_L_686248:
    movl $_L_686247, %eax
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
    je _L_686249
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686249:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686250"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686250:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686252
    cmp  $0,%eax
    jge _L_686251
_L_686252:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686251:
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
    je _L_686253
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686253:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686254"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686254:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686256
    cmp  $0,%eax
    jge _L_686255
_L_686256:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686255:
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
    je "_L_686257"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686257":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "pair?"
# string literal
    jmp _L_686259
    .align 8,0x90
_L_686258 :
    .int 20
    .ascii "pair?"
_L_686259:
    movl $_L_686258, %eax
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
    je _L_686260
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686260:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686261"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686261:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686263
    cmp  $0,%eax
    jge _L_686262
_L_686263:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686262:
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
    je _L_686264
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686264:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686265"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686265:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686267
    cmp  $0,%eax
    jge _L_686266
_L_686267:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686266:
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
    je "_L_686268"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686268":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx*"
# string literal
    jmp _L_686270
    .align 8,0x90
_L_686269 :
    .int 12
    .ascii "fx*"
_L_686270:
    movl $_L_686269, %eax
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
    je _L_686271
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686271:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686272"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686272:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686274
    cmp  $0,%eax
    jge _L_686273
_L_686274:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686273:
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
    je _L_686275
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686275:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686276"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686276:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686278
    cmp  $0,%eax
    jge _L_686277
_L_686278:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686277:
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
    je "_L_686279"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686279":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx-"
# string literal
    jmp _L_686281
    .align 8,0x90
_L_686280 :
    .int 12
    .ascii "fx-"
_L_686281:
    movl $_L_686280, %eax
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
    je _L_686282
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686282:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686283"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686283:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686285
    cmp  $0,%eax
    jge _L_686284
_L_686285:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686284:
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
    je _L_686286
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686286:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686287"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686287:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686289
    cmp  $0,%eax
    jge _L_686288
_L_686289:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686288:
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
    je "_L_686290"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686290":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx+"
# string literal
    jmp _L_686292
    .align 8,0x90
_L_686291 :
    .int 12
    .ascii "fx+"
_L_686292:
    movl $_L_686291, %eax
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
    je _L_686293
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686293:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686294"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686294:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686296
    cmp  $0,%eax
    jge _L_686295
_L_686296:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686295:
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
    je _L_686297
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686297:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686298"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686298:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686300
    cmp  $0,%eax
    jge _L_686299
_L_686300:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686299:
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
    je "_L_686301"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686301":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>="
# string literal
    jmp _L_686303
    .align 8,0x90
_L_686302 :
    .int 16
    .ascii "fx>="
_L_686303:
    movl $_L_686302, %eax
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
    je _L_686304
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686304:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686305"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686305:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686307
    cmp  $0,%eax
    jge _L_686306
_L_686307:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686306:
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
    je _L_686308
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686308:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686309"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686309:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686311
    cmp  $0,%eax
    jge _L_686310
_L_686311:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686310:
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
    je "_L_686312"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686312":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>"
# string literal
    jmp _L_686314
    .align 8,0x90
_L_686313 :
    .int 12
    .ascii "fx>"
_L_686314:
    movl $_L_686313, %eax
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
    je _L_686315
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686315:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686316"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686316:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686318
    cmp  $0,%eax
    jge _L_686317
_L_686318:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686317:
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
    je _L_686319
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686319:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686320"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686320:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686322
    cmp  $0,%eax
    jge _L_686321
_L_686322:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686321:
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
    je "_L_686323"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686323":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<="
# string literal
    jmp _L_686325
    .align 8,0x90
_L_686324 :
    .int 16
    .ascii "fx<="
_L_686325:
    movl $_L_686324, %eax
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
    je _L_686326
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686326:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686327"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686327:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686329
    cmp  $0,%eax
    jge _L_686328
_L_686329:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686328:
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
    je _L_686330
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686330:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686331"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686331:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686333
    cmp  $0,%eax
    jge _L_686332
_L_686333:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686332:
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
    je "_L_686334"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686334":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<"
# string literal
    jmp _L_686336
    .align 8,0x90
_L_686335 :
    .int 12
    .ascii "fx<"
_L_686336:
    movl $_L_686335, %eax
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
    je _L_686337
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686337:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686338"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686338:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686340
    cmp  $0,%eax
    jge _L_686339
_L_686340:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686339:
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
    je _L_686341
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686341:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686342"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686342:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686344
    cmp  $0,%eax
    jge _L_686343
_L_686344:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686343:
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
    je "_L_686345"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686345":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx="
# string literal
    jmp _L_686347
    .align 8,0x90
_L_686346 :
    .int 12
    .ascii "fx="
_L_686347:
    movl $_L_686346, %eax
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
    je _L_686348
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686348:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686349"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686349:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686351
    cmp  $0,%eax
    jge _L_686350
_L_686351:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686350:
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
    je _L_686352
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686352:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686353"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686353:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686355
    cmp  $0,%eax
    jge _L_686354
_L_686355:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686354:
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
    je "_L_686356"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686356":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxzero?"
# string literal
    jmp _L_686358
    .align 8,0x90
_L_686357 :
    .int 28
    .ascii "fxzero?"
_L_686358:
    movl $_L_686357, %eax
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
    je _L_686359
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686359:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686360"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686360:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686362
    cmp  $0,%eax
    jge _L_686361
_L_686362:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686361:
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
    je _L_686363
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686363:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686364"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686364:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686366
    cmp  $0,%eax
    jge _L_686365
_L_686366:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686365:
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
    je "_L_686367"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686367":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxsub1"
# string literal
    jmp _L_686369
    .align 8,0x90
_L_686368 :
    .int 24
    .ascii "fxsub1"
_L_686369:
    movl $_L_686368, %eax
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
    je _L_686370
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686370:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686371"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686371:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686373
    cmp  $0,%eax
    jge _L_686372
_L_686373:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686372:
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
    je _L_686374
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686374:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686375"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686375:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686377
    cmp  $0,%eax
    jge _L_686376
_L_686377:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686376:
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
    je "_L_686378"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686378":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxadd1"
# string literal
    jmp _L_686380
    .align 8,0x90
_L_686379 :
    .int 24
    .ascii "fxadd1"
_L_686380:
    movl $_L_686379, %eax
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
    je _L_686381
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686381:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686382"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686382:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686384
    cmp  $0,%eax
    jge _L_686383
_L_686384:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686383:
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
    je _L_686385
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686385:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686386"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686386:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686388
    cmp  $0,%eax
    jge _L_686387
_L_686388:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686387:
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
    je "_L_686389"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686389":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogor"
# string literal
    jmp _L_686391
    .align 8,0x90
_L_686390 :
    .int 28
    .ascii "fxlogor"
_L_686391:
    movl $_L_686390, %eax
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
    je _L_686392
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686392:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686393"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686393:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686395
    cmp  $0,%eax
    jge _L_686394
_L_686395:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686394:
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
    je _L_686396
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686396:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686397"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686397:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686399
    cmp  $0,%eax
    jge _L_686398
_L_686399:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686398:
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
    je "_L_686400"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686400":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogand"
# string literal
    jmp _L_686402
    .align 8,0x90
_L_686401 :
    .int 32
    .ascii "fxlogand"
_L_686402:
    movl $_L_686401, %eax
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
    je _L_686403
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686403:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686404"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686404:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686406
    cmp  $0,%eax
    jge _L_686405
_L_686406:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686405:
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
    je _L_686407
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686407:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686408"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686408:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686410
    cmp  $0,%eax
    jge _L_686409
_L_686410:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686409:
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
    je "_L_686411"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686411":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlognot"
# string literal
    jmp _L_686413
    .align 8,0x90
_L_686412 :
    .int 32
    .ascii "fxlognot"
_L_686413:
    movl $_L_686412, %eax
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
    je _L_686414
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686414:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686415"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686415:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686417
    cmp  $0,%eax
    jge _L_686416
_L_686417:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686416:
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
    je _L_686418
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686418:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686419"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686419:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686421
    cmp  $0,%eax
    jge _L_686420
_L_686421:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686420:
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
    je "_L_686422"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686422":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char=?"
# string literal
    jmp _L_686424
    .align 8,0x90
_L_686423 :
    .int 24
    .ascii "char=?"
_L_686424:
    movl $_L_686423, %eax
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
    je _L_686425
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686425:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686426"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686426:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686428
    cmp  $0,%eax
    jge _L_686427
_L_686428:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686427:
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
    je _L_686429
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686429:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686430"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686430:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686432
    cmp  $0,%eax
    jge _L_686431
_L_686432:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686431:
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
    je "_L_686433"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686433":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "eq?"
# string literal
    jmp _L_686435
    .align 8,0x90
_L_686434 :
    .int 12
    .ascii "eq?"
_L_686435:
    movl $_L_686434, %eax
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
    je _L_686436
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686436:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686437"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686437:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686439
    cmp  $0,%eax
    jge _L_686438
_L_686439:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686438:
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
    je _L_686440
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686440:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686441"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686441:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686443
    cmp  $0,%eax
    jge _L_686442
_L_686443:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686442:
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
    je "_L_686444"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686444":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "not"
# string literal
    jmp _L_686446
    .align 8,0x90
_L_686445 :
    .int 12
    .ascii "not"
_L_686446:
    movl $_L_686445, %eax
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
    je _L_686447
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686447:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686448"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686448:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686450
    cmp  $0,%eax
    jge _L_686449
_L_686450:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686449:
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
    je _L_686451
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686451:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686452"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686452:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686454
    cmp  $0,%eax
    jge _L_686453
_L_686454:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686453:
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
    je "_L_686455"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686455":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "boolean?"
# string literal
    jmp _L_686457
    .align 8,0x90
_L_686456 :
    .int 32
    .ascii "boolean?"
_L_686457:
    movl $_L_686456, %eax
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
    je _L_686458
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686458:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686459"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686459:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686461
    cmp  $0,%eax
    jge _L_686460
_L_686461:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686460:
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
    je _L_686462
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686462:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686463"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686463:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686465
    cmp  $0,%eax
    jge _L_686464
_L_686465:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686464:
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
    je "_L_686466"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686466":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum?"
# string literal
    jmp _L_686468
    .align 8,0x90
_L_686467 :
    .int 28
    .ascii "fixnum?"
_L_686468:
    movl $_L_686467, %eax
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
    je _L_686469
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686469:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686470"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686470:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686472
    cmp  $0,%eax
    jge _L_686471
_L_686472:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686471:
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
    je _L_686473
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686473:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686474"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686474:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686476
    cmp  $0,%eax
    jge _L_686475
_L_686476:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686475:
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
    je "_L_686477"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686477":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char?"
# string literal
    jmp _L_686479
    .align 8,0x90
_L_686478 :
    .int 20
    .ascii "char?"
_L_686479:
    movl $_L_686478, %eax
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
    je _L_686480
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686480:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686481"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686481:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686483
    cmp  $0,%eax
    jge _L_686482
_L_686483:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686482:
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
    je _L_686484
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686484:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686485"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686485:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686487
    cmp  $0,%eax
    jge _L_686486
_L_686487:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686486:
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
    je "_L_686488"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686488":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "null?"
# string literal
    jmp _L_686490
    .align 8,0x90
_L_686489 :
    .int 20
    .ascii "null?"
_L_686490:
    movl $_L_686489, %eax
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
    je _L_686491
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686491:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686492"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686492:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686494
    cmp  $0,%eax
    jge _L_686493
_L_686494:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686493:
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
    je _L_686495
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686495:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686496"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686496:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686498
    cmp  $0,%eax
    jge _L_686497
_L_686498:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686497:
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
    je "_L_686499"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686499":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char->fixnum"
# string literal
    jmp _L_686501
    .align 8,0x90
_L_686500 :
    .int 48
    .ascii "char->fixnum"
_L_686501:
    movl $_L_686500, %eax
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
    je _L_686502
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686502:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686503"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686503:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686505
    cmp  $0,%eax
    jge _L_686504
_L_686505:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686504:
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
    je _L_686506
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686506:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686507"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686507:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686509
    cmp  $0,%eax
    jge _L_686508
_L_686509:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686508:
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
    je "_L_686510"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686510":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum->char"
# string literal
    jmp _L_686512
    .align 8,0x90
_L_686511 :
    .int 48
    .ascii "fixnum->char"
_L_686512:
    movl $_L_686511, %eax
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
    je _L_686513
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686513:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686514"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686514:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686516
    cmp  $0,%eax
    jge _L_686515
_L_686516:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686515:
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
    movl $_L_686517, 0(%ebp)  # closure label
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # p
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_686518            # jump around closure body
_L_686517:
# check argument count
    cmp $0,%eax
    je _L_686519
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_686519:
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
    je _L_686520
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686520:
    movl %eax, -8(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_686521"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_686521:
# check bounds on vector index
    movl -8(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_686523
    cmp  $0,%eax
    jge _L_686522
_L_686523:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_686522:
    movl -8(%esp), %esi
    movl -1(%eax,%esi), %eax
#return from tail (vector-ref p 0)
    ret
    .align 4,0x90
_L_686518:
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
    movl $_L_686524, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_686525            # jump around closure body
_L_686524:
# check argument count
    cmp $0,%eax
    je _L_686526
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_686526:
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
    je "_L_686527"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686527":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_686529
    .align 8,0x90
_L_686528 :
    .int 28
    .ascii "funcall"
_L_686529:
    movl $_L_686528, %eax
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
    jmp _L_686531
    .align 8,0x90
_L_686530 :
    .int 100
    .ascii "arg 1 must be a procedure"
_L_686531:
    movl $_L_686530, %eax
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
_L_686525:
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
    movl $_L_686532, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_686533            # jump around closure body
_L_686532:
# check argument count
    cmp $0,%eax
    je _L_686534
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_686534:
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
    je "_L_686535"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686535":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_686537
    .align 8,0x90
_L_686536 :
    .int 28
    .ascii "funcall"
_L_686537:
    movl $_L_686536, %eax
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
    jmp _L_686539
    .align 8,0x90
_L_686538 :
    .int 80
    .ascii "wrong number of args"
_L_686539:
    movl $_L_686538, %eax
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
_L_686533:
     movl %eax, eh$uargcount
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
    movl $_L_686540, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_686541            # jump around closure body
_L_686540:
# check argument count
    cmp $4,%eax
    je _L_686542
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_686542:
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
    je "_L_686543"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686543":
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
    je "_L_686544"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686544":
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
    jmp _L_686546
    .align 8,0x90
_L_686545 :
    .int 80
    .ascii "arg must be a fixnum"
_L_686546:
    movl $_L_686545, %eax
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
_L_686541:
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
    movl $_L_686547, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_686548            # jump around closure body
_L_686547:
# check argument count
    cmp $4,%eax
    je _L_686549
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_686549:
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
    je "_L_686550"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686550":
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
    je "_L_686551"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686551":
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
    jmp _L_686553
    .align 8,0x90
_L_686552 :
    .int 80
    .ascii "arg must be a string"
_L_686553:
    movl $_L_686552, %eax
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
_L_686548:
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
    movl $_L_686554, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_686555            # jump around closure body
_L_686554:
# check argument count
    cmp $4,%eax
    je _L_686556
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_686556:
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
    je "_L_686557"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686557":
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
    je "_L_686558"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686558":
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
    jmp _L_686560
    .align 8,0x90
_L_686559 :
    .int 92
    .ascii "arg must be a character"
_L_686560:
    movl $_L_686559, %eax
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
_L_686555:
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
    movl $_L_686561, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_686562            # jump around closure body
_L_686561:
# check argument count
    cmp $4,%eax
    je _L_686563
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_686563:
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
    je "_L_686564"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686564":
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
    je "_L_686565"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686565":
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
    jmp _L_686567
    .align 8,0x90
_L_686566 :
    .int 72
    .ascii "arg must be a pair"
_L_686567:
    movl $_L_686566, %eax
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
_L_686562:
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
    movl $_L_686568, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_686569            # jump around closure body
_L_686568:
# check argument count
    cmp $4,%eax
    je _L_686570
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_686570:
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
    je "_L_686571"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686571":
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
    je "_L_686572"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686572":
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
    jmp _L_686574
    .align 8,0x90
_L_686573 :
    .int 80
    .ascii "arg must be a vector"
_L_686574:
    movl $_L_686573, %eax
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
_L_686569:
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
    movl $_L_686575, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_686576            # jump around closure body
_L_686575:
# check argument count
    cmp $4,%eax
    je _L_686577
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_686577:
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
    je "_L_686578"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686578":
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
    je "_L_686579"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686579":
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
    jmp _L_686581
    .align 8,0x90
_L_686580 :
    .int 112
    .ascii "length must be a fixnum >= 0"
_L_686581:
    movl $_L_686580, %eax
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
_L_686576:
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
    movl $_L_686582, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_686583            # jump around closure body
_L_686582:
# check argument count
    cmp $4,%eax
    je _L_686584
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_686584:
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
    je "_L_686585"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686585":
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
    je "_L_686586"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686586":
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
    jmp _L_686588
    .align 8,0x90
_L_686587 :
    .int 76
    .ascii "index out of bounds"
_L_686588:
    movl $_L_686587, %eax
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
_L_686583:
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
    movl $_L_686589, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_686590            # jump around closure body
_L_686589:
# check argument count
    cmp $4,%eax
    je _L_686591
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_686591:
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
    je "_L_686592"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686592":
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
    je "_L_686593"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_686593":
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
    jmp _L_686595
    .align 8,0x90
_L_686594 :
    .int 76
    .ascii "index out of bounds"
_L_686595:
    movl $_L_686594, %eax
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
_L_686590:
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
