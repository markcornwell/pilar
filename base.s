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
    jmp _L_331
    .align 8,0x90
_L_330 :
    .int 12
    .ascii "nil"
_L_331:
    movl $_L_330, %eax
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
    movl $_L_332, 0(%ebp)  # closure label
# emit-variable-ref
# env=((interned-symbols . 0))
# var=interned-symbols
    movl 0(%esp), %eax  # stack load interned-symbols
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # interned-symbols
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_333            # jump around closure body
_L_332:
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
_L_333:
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
    movl $_L_334, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_335            # jump around closure body
_L_334:
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
    movl %eax, -24(%esp)
# emit-expr (string-length s1)
# emit-expr s1
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=s1
    movl -16(%esp), %eax  # stack load s1
# end emit-variable-ref
    movl -6(%eax), %eax
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (fx= (string-length s1) (string-length s2))
    ret
    .align 4,0x90
_L_335:
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
    movl $_L_336, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_337            # jump around closure body
_L_336:
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
    cmp %ah, -32(%esp)
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (char=? (string-ref s1 i) (string-ref s2 i))
    ret
    .align 4,0x90
_L_337:
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
    movl $_L_338, 0(%ebp)  # closure label
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
    jmp _L_339            # jump around closure body
_L_338:
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
    movl %eax, -40(%esp)
# emit-expr i
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=i
    movl -32(%esp), %eax  # stack load i
# end emit-variable-ref
    cmp -40(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_340
# emit-tail-expr
# si=-40
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=#t
    movl $111, %eax     # immed #t
    ret                  # immediate tail return
    jmp _L_341
_L_340:
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
    je _L_342
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
    movl %eax, -52(%esp)  # fx+ push arg1
# emit-expr i
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# var=i
    movl -32(%esp), %eax  # stack load i
# end emit-variable-ref
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
    jmp _L_343
_L_342:
# emit-tail-expr
# si=-40
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (si= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_343:
_L_341:
    .align 4,0x90
_L_339:
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
    movl $_L_344, 0(%ebp)  # closure label
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
    jmp _L_345            # jump around closure body
_L_344:
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
    je _L_346
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
    jmp _L_347
_L_346:
# emit-tail-expr
# si=-24
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (si<n= . 8) (slen= . 4) (ss= . -12) (si<n= . -8) (si= . -4) (slen= . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_347:
    .align 4,0x90
_L_345:
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
    movl $_L_348, 0(%ebp)  # closure label
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
    jmp _L_349            # jump around closure body
_L_348:
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
    je _L_350
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
    jmp _L_351
_L_350:
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
    je _L_352
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
    jmp _L_353
_L_352:
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
_L_353:
_L_351:
    .align 4,0x90
_L_349:
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
    movl $_L_354, 0(%ebp)  # closure label
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
    jmp _L_355            # jump around closure body
_L_354:
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
_L_355:
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
    movl $_L_356, 0(%ebp)  # closure label
# WARNING: free var e not defined in the environmnet
# WARNING: free var nil not defined in the environmnet
# WARNING: free var (primitive-ref append1) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_357            # jump around closure body
_L_356:
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
    je _L_358
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
    jmp _L_359
_L_358:
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
_L_359:
    .align 4,0x90
_L_357:
     movl %eax, append1
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
