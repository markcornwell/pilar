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
    jmp _L_207618
    .align 8,0x90
_L_207617 :
    .int 12
    .ascii "nil"
_L_207618:
    movl $_L_207617, %eax
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
    movl $_L_207619, 0(%ebp)  # closure label
# emit-variable-ref
# env=((interned-symbols . 0))
# var=interned-symbols
    movl 0(%esp), %eax  # stack load interned-symbols
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # interned-symbols
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_207620            # jump around closure body
_L_207619:
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
_L_207620:
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl %eax, -20(%esp)
# emit-expr (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))
# emit-closure
# si = -24
# env = ((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr = (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))
    movl $_L_207621, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_207622            # jump around closure body
_L_207621:
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
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_207623"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $0, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
"_L_207623":
    movl %eax, -24(%esp)
# emit-expr (string-length s1)
# emit-expr s1
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s1
    movl -16(%esp), %eax  # stack load s1
# end emit-variable-ref
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_207624"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $0, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
"_L_207624":
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (fx= (string-length s1) (string-length s2))
    ret
    .align 4,0x90
_L_207622:
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl %eax, -20(%esp)
# emit-expr (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))
# emit-closure
# si = -24
# env = ((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr = (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))
    movl $_L_207625, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_207626            # jump around closure body
_L_207625:
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
    movl %eax, -32(%esp)
# emit-expr i
# emit-variable-ref
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=i
    movl -28(%esp), %eax  # stack load i
# end emit-variable-ref
    sar $2, %eax
    movl -32(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_207627"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $0, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
"_L_207627":
    movb %ah, -32(%esp)
# emit-expr (string-ref s2 i)
# emit-expr s2
# emit-variable-ref
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s2
    movl -24(%esp), %eax  # stack load s2
# end emit-variable-ref
    movl %eax, -36(%esp)
# emit-expr i
# emit-variable-ref
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=i
    movl -28(%esp), %eax  # stack load i
# end emit-variable-ref
    sar $2, %eax
    movl -36(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_207628"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $0, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
"_L_207628":
    cmp %ah, -32(%esp)
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (char=? (string-ref s1 i) (string-ref s2 i))
    ret
    .align 4,0x90
_L_207626:
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl %eax, -20(%esp)
# emit-expr (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))
# emit-closure
# si = -24
# env = ((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr = (closure (s1 s2 i n) (si= si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref si= 0) s1 s2 i) ((vector-ref si<n= 0) s1 s2 (fx+ i 1) n) #f))))
    movl $_L_207629, 0(%ebp)  # closure label
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
    jmp _L_207630            # jump around closure body
_L_207629:
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
    je "_L_207633"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $0, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
"_L_207633":
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
    je "_L_207634"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $0, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
"_L_207634":
    cmp -40(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_207631
# emit-tail-expr
# si=-40
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=#t
    movl $111, %eax     # immed #t
    ret                  # immediate tail return
    jmp _L_207632
_L_207631:
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
    movl %eax, -48(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl -48(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_207637"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207637":
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
    call *-2(%edi)        # call thru closure ptr
    add $40, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_207635
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
    movl %eax, -40(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207638"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $0, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
"_L_207638":
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
    je "_L_207639"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $0, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
"_L_207639":
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
    jmp *-2(%edi)  # tail-funcall
    jmp _L_207636
_L_207635:
# emit-tail-expr
# si=-40
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_207636:
_L_207632:
    .align 4,0x90
_L_207630:
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl %eax, -20(%esp)
# emit-expr (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)))
# emit-closure
# si = -24
# env = ((ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr = (closure (s1 s2) (slen= si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref slen= 0) s1 s2) ((vector-ref si<n= 0) s1 s2 0 (string-length s1)) #f)))
    movl $_L_207640, 0(%ebp)  # closure label
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
    jmp _L_207641            # jump around closure body
_L_207640:
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
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_207644"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207644":
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
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_207642
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
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    jmp *-2(%edi)  # tail-funcall
    jmp _L_207643
_L_207642:
# emit-tail-expr
# si=-24
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_207643:
    .align 4,0x90
_L_207641:
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl %eax, -8(%esp)
# emit-expr (closure (str symlist) ((primitive-ref string=?) str->sym) (let ((str str) (symlist symlist)) (if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist))))))
# emit-closure
# si = -12
# env = ((str->sym . 0))
# expr = (closure (str symlist) ((primitive-ref string=?) str->sym) (let ((str str) (symlist symlist)) (if ((primitive-ref string=?) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref str->sym 0) str (cdr symlist))))))
    movl $_L_207645, 0(%ebp)  # closure label
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
    jmp _L_207646            # jump around closure body
_L_207645:
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
    je "_L_207649"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207649":
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
    movl -1(%eax), %eax
    movl -3(%eax), %eax
    mov %eax, -40(%esp)  # arg (symbol->string (car symlist))
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_207647
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
    movl -1(%eax), %eax
#return from tail (car symlist)
    ret
    jmp _L_207648
_L_207647:
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
    movl 3(%eax), %eax
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_207650
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
    jmp _L_207651
_L_207650:
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
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    jmp *-2(%edi)  # tail-funcall
_L_207651:
_L_207648:
    .align 4,0x90
_L_207646:
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
    movl $_L_207652, 0(%ebp)  # closure label
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
    jmp _L_207653            # jump around closure body
_L_207652:
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207654"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207654":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
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
    jmp *-2(%edi)  # tail-funcall
    .align 4,0x90
_L_207653:
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
    movl $_L_207655, 0(%ebp)  # closure label
# WARNING: free var e not defined in the environmnet
# WARNING: free var nil not defined in the environmnet
# WARNING: free var (primitive-ref append1) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_207656            # jump around closure body
_L_207655:
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
    je _L_207657
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
    jmp _L_207658
_L_207657:
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
    je "_L_207659"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207659":
   movl %eax,  -36(%esp)  # stash funcall-oper in closure slot
# emit-expr (cdr lst)
# emit-expr lst
# emit-variable-ref
# env=((elt . -20) (lst . -16) (elt . -12) (lst . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=lst
    movl -16(%esp), %eax  # stack load lst
# end emit-variable-ref
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
_L_207658:
    .align 4,0x90
_L_207656:
     movl %eax, append1
# == explicit-begins  ==>
# (lambda (lst k) (if (fx= k 0) (car lst) (list-ref (cdr lst) (fx- k 1))))
# == eliminate-let*  ==>
# (lambda (lst k) (if (fx= k 0) (car lst) (list-ref (cdr lst) (fx- k 1))))
# == eliminate-shadowing  ==>
# (lambda (lst k) (if (fx= k 0) (car lst) (list-ref (cdr lst) (fx- k 1))))
# == vectorize-letrec  ==>
# (lambda (lst k) (if (fx= k 0) (car lst) (list-ref (cdr lst) (fx- k 1))))
# == eliminate-set!  ==>
# (lambda (lst k) (let ((lst lst) (k k)) (if (fx= k 0) (car lst) (list-ref (cdr lst) (fx- k 1)))))
# == close-free-variables  ==>
# (closure (lst k) (list-ref) (let ((lst lst) (k k)) (if (fx= k 0) (car lst) (list-ref (cdr lst) (fx- k 1)))))
# == eliminate-quote  ==>
# (closure (lst k) (list-ref) (let ((lst lst) (k k)) (if (fx= k 0) (car lst) (list-ref (cdr lst) (fx- k 1)))))
# == eliminate-when/unless  ==>
# (closure (lst k) (list-ref) (let ((lst lst) (k k)) (if (fx= k 0) (car lst) (list-ref (cdr lst) (fx- k 1)))))
# == eliminate-cond  ==>
# (closure (lst k) (list-ref) (let ((lst lst) (k k)) (if (fx= k 0) (car lst) (list-ref (cdr lst) (fx- k 1)))))
# == external-symbols  ==>
# (closure (lst k) ((primitive-ref list-ref)) (let ((lst lst) (k k)) (if (fx= k 0) (car lst) ((primitive-ref list-ref) (cdr lst) (fx- k 1)))))
# emit-expr (closure (lst k) ((primitive-ref list-ref)) (let ((lst lst) (k k)) (if (fx= k 0) (car lst) ((primitive-ref list-ref) (cdr lst) (fx- k 1)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (lst k) ((primitive-ref list-ref)) (let ((lst lst) (k k)) (if (fx= k 0) (car lst) ((primitive-ref list-ref) (cdr lst) (fx- k 1)))))
    movl $_L_207660, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_207661            # jump around closure body
_L_207660:
# emit-tail-expr
# si=-16
# env=((k . -12) (lst . -8) ((primitive-ref list-ref) . 4))
# expr=(let ((lst lst) (k k)) (if (fx= k 0) (car lst) ((primitive-ref list-ref) (cdr lst) (fx- k 1))))
# emit-tail-let
#  si   = -16
#  env  = ((k . -12) (lst . -8) ((primitive-ref list-ref) . 4))
#  bindings = ((lst lst) (k k))
#  body = (if (fx= k 0) (car lst) ((primitive-ref list-ref) (cdr lst) (fx- k 1)))
# emit-expr lst
# emit-variable-ref
# env=((k . -12) (lst . -8) ((primitive-ref list-ref) . 4))
# var=lst
    movl -8(%esp), %eax  # stack load lst
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr k
# emit-variable-ref
# env=((k . -12) (lst . -8) ((primitive-ref list-ref) . 4))
# var=k
    movl -12(%esp), %eax  # stack load k
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((k . -20) (lst . -16) (k . -12) (lst . -8) ((primitive-ref list-ref) . 4))
# expr=(if (fx= k 0) (car lst) ((primitive-ref list-ref) (cdr lst) (fx- k 1)))
# emit-expr (fx= k 0)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_207664"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $0, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
"_L_207664":
    movl %eax, -24(%esp)
# emit-expr k
# emit-variable-ref
# env=((k . -20) (lst . -16) (k . -12) (lst . -8) ((primitive-ref list-ref) . 4))
# var=k
    movl -20(%esp), %eax  # stack load k
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_207665"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $0, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
"_L_207665":
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_207662
# emit-tail-expr
# si=-24
# env=((k . -20) (lst . -16) (k . -12) (lst . -8) ((primitive-ref list-ref) . 4))
# expr=(car lst)
# tail primcall
# emit-expr lst
# emit-variable-ref
# env=((k . -20) (lst . -16) (k . -12) (lst . -8) ((primitive-ref list-ref) . 4))
# var=lst
    movl -16(%esp), %eax  # stack load lst
# end emit-variable-ref
    movl -1(%eax), %eax
#return from tail (car lst)
    ret
    jmp _L_207663
_L_207662:
# emit-tail-expr
# si=-24
# env=((k . -20) (lst . -16) (k . -12) (lst . -8) ((primitive-ref list-ref) . 4))
# expr=((primitive-ref list-ref) (cdr lst) (fx- k 1))
# emit-tail-funcall
#    si   =-24
#    env  = ((k . -20) (lst . -16) (k . -12) (lst . -8) ((primitive-ref list-ref) . 4))
#    expr = (funcall (primitive-ref list-ref) (cdr lst) (fx- k 1))
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr (cdr lst)
# emit-expr lst
# emit-variable-ref
# env=((k . -20) (lst . -16) (k . -12) (lst . -8) ((primitive-ref list-ref) . 4))
# var=lst
    movl -16(%esp), %eax  # stack load lst
# end emit-variable-ref
    movl 3(%eax), %eax
    mov %eax, -28(%esp)    # arg (cdr lst)
# emit-expr (fx- k 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_207666"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $0, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
"_L_207666":
    movl %eax, -32(%esp)
# emit-expr k
# emit-variable-ref
# env=((k . -20) (lst . -16) (k . -12) (lst . -8) ((primitive-ref list-ref) . 4))
# var=k
    movl -20(%esp), %eax  # stack load k
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_207667"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $0, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
"_L_207667":
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
    jmp *-2(%edi)  # tail-funcall
_L_207663:
    .align 4,0x90
_L_207661:
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
    movl $_L_207668, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_207669            # jump around closure body
_L_207668:
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
_L_207669:
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
    movl $_L_207670, 0(%ebp)  # closure label
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
    jmp _L_207671            # jump around closure body
_L_207670:
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
    je "_L_207672"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207672":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr "error:"
# string literal
    jmp _L_207674
    .align 8,0x90
_L_207673 :
    .int 24
    .ascii "error:"
_L_207674:
    movl $_L_207673, %eax
    orl $6, %eax
    mov %eax, -36(%esp)  # arg error:
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
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
    je "_L_207675"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207675":
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
    je "_L_207676"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207676":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr ": "
# string literal
    jmp _L_207678
    .align 8,0x90
_L_207677 :
    .int 8
    .ascii ": "
_L_207678:
    movl $_L_207677, %eax
    orl $6, %eax
    mov %eax, -36(%esp)  # arg : 
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
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
    je "_L_207679"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207679":
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
    jmp _L_207681
    .align 8,0x90
_L_207680 :
    .int 4
    .ascii "\n"
_L_207681:
    movl $_L_207680, %eax
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
    jmp *-2(%edi)  # tail-funcall
     ret   # return thru stack
    .align 4,0x90
_L_207671:
    movl %eax, -4(%esp)  # stack save
# emit-expr (closure (sym emsg) (write-errmsg) (let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))
# emit-closure
# si = -8
# env = ((write-errmsg . -4) (write-stderr . 0))
# expr = (closure (sym emsg) (write-errmsg) (let ((sym sym) (emsg emsg)) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))
    movl $_L_207682, 0(%ebp)  # closure label
# emit-variable-ref
# env=((write-errmsg . -4) (write-stderr . 0))
# var=write-errmsg
    movl -4(%esp), %eax  # stack load write-errmsg
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # write-errmsg
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_207683            # jump around closure body
_L_207682:
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
    je "_L_207684"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207684":
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
_L_207683:
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207685"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207685":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "procedure?"
# string literal
    jmp _L_207687
    .align 8,0x90
_L_207686 :
    .int 40
    .ascii "procedure?"
_L_207687:
    movl $_L_207686, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg procedure?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207688"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207688":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_207690
    .align 8,0x90
_L_207689 :
    .int 12
    .ascii "cdr"
_L_207690:
    movl $_L_207689, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cdr
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207691"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207691":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_207693
    .align 8,0x90
_L_207692 :
    .int 12
    .ascii "car"
_L_207693:
    movl $_L_207692, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg car
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207694"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207694":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol-value"
# string literal
    jmp _L_207696
    .align 8,0x90
_L_207695 :
    .int 48
    .ascii "symbol-value"
_L_207696:
    movl $_L_207695, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol-value
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207697"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207697":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol->string"
# string literal
    jmp _L_207699
    .align 8,0x90
_L_207698 :
    .int 56
    .ascii "symbol->string"
_L_207699:
    movl $_L_207698, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol->string
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207700"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207700":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-symbol"
# string literal
    jmp _L_207702
    .align 8,0x90
_L_207701 :
    .int 44
    .ascii "make-symbol"
_L_207702:
    movl $_L_207701, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-symbol
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207703"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207703":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol?"
# string literal
    jmp _L_207705
    .align 8,0x90
_L_207704 :
    .int 28
    .ascii "symbol?"
_L_207705:
    movl $_L_207704, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207706"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207706":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-set!"
# string literal
    jmp _L_207708
    .align 8,0x90
_L_207707 :
    .int 44
    .ascii "string-set!"
_L_207708:
    movl $_L_207707, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-set!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207709"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207709":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-ref"
# string literal
    jmp _L_207711
    .align 8,0x90
_L_207710 :
    .int 40
    .ascii "string-ref"
_L_207711:
    movl $_L_207710, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-ref
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207712"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207712":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-length"
# string literal
    jmp _L_207714
    .align 8,0x90
_L_207713 :
    .int 52
    .ascii "string-length"
_L_207714:
    movl $_L_207713, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-length
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207715"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207715":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string?"
# string literal
    jmp _L_207717
    .align 8,0x90
_L_207716 :
    .int 28
    .ascii "string?"
_L_207717:
    movl $_L_207716, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207718"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207718":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-string"
# string literal
    jmp _L_207720
    .align 8,0x90
_L_207719 :
    .int 44
    .ascii "make-string"
_L_207720:
    movl $_L_207719, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-string
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207721"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207721":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector"
# string literal
    jmp _L_207723
    .align 8,0x90
_L_207722 :
    .int 24
    .ascii "vector"
_L_207723:
    movl $_L_207722, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207724"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207724":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-ref"
# string literal
    jmp _L_207726
    .align 8,0x90
_L_207725 :
    .int 40
    .ascii "vector-ref"
_L_207726:
    movl $_L_207725, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-ref
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207727"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207727":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-set!"
# string literal
    jmp _L_207729
    .align 8,0x90
_L_207728 :
    .int 44
    .ascii "vector-set!"
_L_207729:
    movl $_L_207728, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-set!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207730"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207730":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-length"
# string literal
    jmp _L_207732
    .align 8,0x90
_L_207731 :
    .int 52
    .ascii "vector-length"
_L_207732:
    movl $_L_207731, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-length
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207733"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207733":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-vector"
# string literal
    jmp _L_207735
    .align 8,0x90
_L_207734 :
    .int 44
    .ascii "make-vector"
_L_207735:
    movl $_L_207734, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-vector
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207736"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207736":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector?"
# string literal
    jmp _L_207738
    .align 8,0x90
_L_207737 :
    .int 28
    .ascii "vector?"
_L_207738:
    movl $_L_207737, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207739"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207739":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-cdr!"
# string literal
    jmp _L_207741
    .align 8,0x90
_L_207740 :
    .int 32
    .ascii "set-cdr!"
_L_207741:
    movl $_L_207740, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg set-cdr!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207742"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207742":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-car!"
# string literal
    jmp _L_207744
    .align 8,0x90
_L_207743 :
    .int 32
    .ascii "set-car!"
_L_207744:
    movl $_L_207743, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg set-car!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207745"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207745":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_207747
    .align 8,0x90
_L_207746 :
    .int 12
    .ascii "cdr"
_L_207747:
    movl $_L_207746, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cdr
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207748"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207748":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_207750
    .align 8,0x90
_L_207749 :
    .int 12
    .ascii "car"
_L_207750:
    movl $_L_207749, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg car
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207751"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207751":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cons"
# string literal
    jmp _L_207753
    .align 8,0x90
_L_207752 :
    .int 16
    .ascii "cons"
_L_207753:
    movl $_L_207752, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cons
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207754"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207754":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "pair?"
# string literal
    jmp _L_207756
    .align 8,0x90
_L_207755 :
    .int 20
    .ascii "pair?"
_L_207756:
    movl $_L_207755, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg pair?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207757"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207757":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx*"
# string literal
    jmp _L_207759
    .align 8,0x90
_L_207758 :
    .int 12
    .ascii "fx*"
_L_207759:
    movl $_L_207758, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx*
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207760"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207760":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx-"
# string literal
    jmp _L_207762
    .align 8,0x90
_L_207761 :
    .int 12
    .ascii "fx-"
_L_207762:
    movl $_L_207761, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx-
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207763"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207763":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx+"
# string literal
    jmp _L_207765
    .align 8,0x90
_L_207764 :
    .int 12
    .ascii "fx+"
_L_207765:
    movl $_L_207764, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx+
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207766"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207766":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>="
# string literal
    jmp _L_207768
    .align 8,0x90
_L_207767 :
    .int 16
    .ascii "fx>="
_L_207768:
    movl $_L_207767, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx>=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207769"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207769":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>"
# string literal
    jmp _L_207771
    .align 8,0x90
_L_207770 :
    .int 12
    .ascii "fx>"
_L_207771:
    movl $_L_207770, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx>
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207772"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207772":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<="
# string literal
    jmp _L_207774
    .align 8,0x90
_L_207773 :
    .int 16
    .ascii "fx<="
_L_207774:
    movl $_L_207773, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx<=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207775"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207775":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<"
# string literal
    jmp _L_207777
    .align 8,0x90
_L_207776 :
    .int 12
    .ascii "fx<"
_L_207777:
    movl $_L_207776, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx<
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207778"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207778":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx="
# string literal
    jmp _L_207780
    .align 8,0x90
_L_207779 :
    .int 12
    .ascii "fx="
_L_207780:
    movl $_L_207779, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207781"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207781":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxzero?"
# string literal
    jmp _L_207783
    .align 8,0x90
_L_207782 :
    .int 28
    .ascii "fxzero?"
_L_207783:
    movl $_L_207782, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxzero?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207784"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207784":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxsub1"
# string literal
    jmp _L_207786
    .align 8,0x90
_L_207785 :
    .int 24
    .ascii "fxsub1"
_L_207786:
    movl $_L_207785, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxsub1
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207787"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207787":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxadd1"
# string literal
    jmp _L_207789
    .align 8,0x90
_L_207788 :
    .int 24
    .ascii "fxadd1"
_L_207789:
    movl $_L_207788, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxadd1
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207790"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207790":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogor"
# string literal
    jmp _L_207792
    .align 8,0x90
_L_207791 :
    .int 28
    .ascii "fxlogor"
_L_207792:
    movl $_L_207791, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlogor
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207793"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207793":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogand"
# string literal
    jmp _L_207795
    .align 8,0x90
_L_207794 :
    .int 32
    .ascii "fxlogand"
_L_207795:
    movl $_L_207794, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlogand
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207796"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207796":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlognot"
# string literal
    jmp _L_207798
    .align 8,0x90
_L_207797 :
    .int 32
    .ascii "fxlognot"
_L_207798:
    movl $_L_207797, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlognot
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207799"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207799":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char=?"
# string literal
    jmp _L_207801
    .align 8,0x90
_L_207800 :
    .int 24
    .ascii "char=?"
_L_207801:
    movl $_L_207800, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char=?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207802"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207802":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "eq?"
# string literal
    jmp _L_207804
    .align 8,0x90
_L_207803 :
    .int 12
    .ascii "eq?"
_L_207804:
    movl $_L_207803, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg eq?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207805"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207805":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "not"
# string literal
    jmp _L_207807
    .align 8,0x90
_L_207806 :
    .int 12
    .ascii "not"
_L_207807:
    movl $_L_207806, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg not
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207808"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207808":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "boolean?"
# string literal
    jmp _L_207810
    .align 8,0x90
_L_207809 :
    .int 32
    .ascii "boolean?"
_L_207810:
    movl $_L_207809, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg boolean?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207811"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207811":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum?"
# string literal
    jmp _L_207813
    .align 8,0x90
_L_207812 :
    .int 28
    .ascii "fixnum?"
_L_207813:
    movl $_L_207812, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fixnum?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207814"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207814":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char?"
# string literal
    jmp _L_207816
    .align 8,0x90
_L_207815 :
    .int 20
    .ascii "char?"
_L_207816:
    movl $_L_207815, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207817"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207817":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "null?"
# string literal
    jmp _L_207819
    .align 8,0x90
_L_207818 :
    .int 20
    .ascii "null?"
_L_207819:
    movl $_L_207818, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg null?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207820"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207820":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char->fixnum"
# string literal
    jmp _L_207822
    .align 8,0x90
_L_207821 :
    .int 48
    .ascii "char->fixnum"
_L_207822:
    movl $_L_207821, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char->fixnum
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    je "_L_207823"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207823":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum->char"
# string literal
    jmp _L_207825
    .align 8,0x90
_L_207824 :
    .int 48
    .ascii "fixnum->char"
_L_207825:
    movl $_L_207824, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fixnum->char
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
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
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
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
    movl $_L_207826, 0(%ebp)  # closure label
# emit-variable-ref
# env=((p . 0))
# var=p
    movl 0(%esp), %eax  # stack load p
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # p
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_207827            # jump around closure body
_L_207826:
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
    movl %eax, -8(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl -8(%esp), %esi
    movl -1(%eax,%esi), %eax
#return from tail (vector-ref p 0)
    ret
    .align 4,0x90
_L_207827:
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
    movl $_L_207828, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_207829            # jump around closure body
_L_207828:
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
    je "_L_207830"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207830":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_207832
    .align 8,0x90
_L_207831 :
    .int 28
    .ascii "funcall"
_L_207832:
    movl $_L_207831, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg funcall
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -12(%esp)    # arg ((primitive-ref string->symbol) funcall)
# emit-expr "arg 1 must be a procedure"
# string literal
    jmp _L_207834
    .align 8,0x90
_L_207833 :
    .int 100
    .ascii "arg 1 must be a procedure"
_L_207834:
    movl $_L_207833, %eax
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
    jmp *-2(%edi)  # tail-funcall
    .align 4,0x90
_L_207829:
     movl %eax, eh$uprocedure
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
    movl $_L_207835, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_207836            # jump around closure body
_L_207835:
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
    je "_L_207837"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207837":
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
    je "_L_207838"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207838":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
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
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr "arg must be a fixnum"
# string literal
    jmp _L_207840
    .align 8,0x90
_L_207839 :
    .int 80
    .ascii "arg must be a fixnum"
_L_207840:
    movl $_L_207839, %eax
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
    jmp *-2(%edi)  # tail-funcall
    .align 4,0x90
_L_207836:
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
    movl $_L_207841, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_207842            # jump around closure body
_L_207841:
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
    je "_L_207843"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207843":
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
    je "_L_207844"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207844":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
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
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr "arg must be a string"
# string literal
    jmp _L_207846
    .align 8,0x90
_L_207845 :
    .int 80
    .ascii "arg must be a string"
_L_207846:
    movl $_L_207845, %eax
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
    jmp *-2(%edi)  # tail-funcall
    .align 4,0x90
_L_207842:
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
    movl $_L_207847, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_207848            # jump around closure body
_L_207847:
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
    je "_L_207849"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207849":
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
    je "_L_207850"
# invoke error handler funcall_non_procedure
    .extern eh_procedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_207850":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
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
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) i)
# emit-expr "arg must be a character"
# string literal
    jmp _L_207852
    .align 8,0x90
_L_207851 :
    .int 92
    .ascii "arg must be a character"
_L_207852:
    movl $_L_207851, %eax
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
    jmp *-2(%edi)  # tail-funcall
    .align 4,0x90
_L_207848:
     movl %eax, eh$ucharacter
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