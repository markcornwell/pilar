# (let ((a (string->symbol "goo")) (b (string->symbol "ber"))) #t)
# == eliminate-multi-element-body  ==>
# (let ((a (string->symbol "goo")) (b (string->symbol "ber"))) #t)
# == eliminate-let*  ==>
# (let ((a (string->symbol "goo")) (b (string->symbol "ber"))) #t)
# == eliminate-shadowing  ==>
# (let ((a (string->symbol "goo")) (b (string->symbol "ber"))) #t)
# == vectorize-letrec  ==>
# (let ((a (string->symbol "goo")) (b (string->symbol "ber"))) #t)
# == eliminate-set!  ==>
# (let ((a (string->symbol "goo")) (b (string->symbol "ber"))) #t)
# == close-free-variables  ==>
# (let ((a (string->symbol "goo")) (b (string->symbol "ber"))) #t)
# == eliminate-quote  ==>
# (let ((a (string->symbol "goo")) (b (string->symbol "ber"))) #t)
# == eliminate-when/unless  ==>
# (let ((a (string->symbol "goo")) (b (string->symbol "ber"))) #t)
# == eliminate-cond  ==>
# (let ((a (string->symbol "goo")) (b (string->symbol "ber"))) #t)
# emit-scheme-entry
    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
          .data
          .globl symbols  # symbol list as a datum 
          .globl s2sym
          .align 8
symbols:
          .int 0xFF  # holds (symbols)
          .align 8
s2sym:
          .int 0xFF  # holds pgm-str-sym
          .text
# emit-expr (cons (make-symbol "nil" ()) ())
# cons arg1=(make-symbol "nil" ()) arg2=()
# emit-expr (make-symbol "nil" ())
# make-symbol arg1="nil" arg2=()
# emit-expr "nil"
# string literal
    jmp _L_941
    .align 8,0x90
_L_940 :
    .int 12
    .ascii "nil"
_L_941:
    movl $_L_940, %eax
    orl $6, %eax
    movl %eax, -8(%esp)
# emit-expr ()
    movl $63, %eax     # immed ()
    movl %eax, 4(%ebp)
    movl -8(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $3, %eax
    add  $8, %ebp
# make-symbol end
    movl %eax, -8(%esp)
# emit-expr ()
    movl $63, %eax     # immed ()
    movl %eax, 4(%ebp)
    movl -8(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl %eax, symbols
# == eliminate-multi-element-body  ==>
# (letrec ((s= (lambda (s1 i s2 j) (let ((l1 (string-length s1)) (l2 (string-length s2))) (if (not (fx= l1 l2)) #f (if (fx= i l1) #t (if (char=? (string-ref s1 i) (string-ref s2 j)) (s= s1 (fx+ i 1) s2 (fx+ j 1)) #f)))))) (ss= (lambda (s1 s2) (s= s1 0 s2 0))) (str->sym1 (lambda (str symlist) (if (ss= str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (begin (set-cdr! symlist (cons new-sym ())) new-sym)) (str->sym1 str (cdr symlist)))))) (str->sym (lambda (str) (str->sym1 str (symbols))))) str->sym)
# == eliminate-let*  ==>
# (letrec ((s= (lambda (s1 i s2 j) (let ((l1 (string-length s1)) (l2 (string-length s2))) (if (not (fx= l1 l2)) #f (if (fx= i l1) #t (if (char=? (string-ref s1 i) (string-ref s2 j)) (s= s1 (fx+ i 1) s2 (fx+ j 1)) #f)))))) (ss= (lambda (s1 s2) (s= s1 0 s2 0))) (str->sym1 (lambda (str symlist) (if (ss= str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (begin (set-cdr! symlist (cons new-sym ())) new-sym)) (str->sym1 str (cdr symlist)))))) (str->sym (lambda (str) (str->sym1 str (symbols))))) str->sym)
# == eliminate-shadowing  ==>
# (letrec ((s= (lambda (s1 i s2 j) (let ((l1 (string-length s1)) (l2 (string-length s2))) (if (not (fx= l1 l2)) #f (if (fx= i l1) #t (if (char=? (string-ref s1 i) (string-ref s2 j)) (s= s1 (fx+ i 1) s2 (fx+ j 1)) #f)))))) (ss= (lambda (s1 s2) (s= s1 0 s2 0))) (str->sym1 (lambda (str symlist) (if (ss= str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (begin (set-cdr! symlist (cons new-sym ())) new-sym)) (str->sym1 str (cdr symlist)))))) (str->sym (lambda (str) (str->sym1 str (symbols))))) str->sym)
# == vectorize-letrec  ==>
# (let ((s= (make-vector 1)) (ss= (make-vector 1)) (str->sym1 (make-vector 1)) (str->sym (make-vector 1))) (begin (begin (vector-set! s= 0 (lambda (s1 i s2 j) (let ((l1 (string-length s1)) (l2 (string-length s2))) (if (not (fx= l1 l2)) #f (if (fx= i l1) #t (if (char=? (string-ref s1 i) (string-ref s2 j)) ((vector-ref s= 0) s1 (fx+ i 1) s2 (fx+ j 1)) #f)))))) (vector-set! ss= 0 (lambda (s1 s2) ((vector-ref s= 0) s1 0 s2 0))) (vector-set! str->sym1 0 (lambda (str symlist) (if ((vector-ref ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (begin (set-cdr! symlist (cons new-sym ())) new-sym)) ((vector-ref str->sym1 0) str (cdr symlist)))))) (vector-set! str->sym 0 (lambda (str) ((vector-ref str->sym1 0) str (symbols))))) (vector-ref str->sym 0)))
# == eliminate-set!  ==>
# (let ((s= (make-vector 1)) (ss= (make-vector 1)) (str->sym1 (make-vector 1)) (str->sym (make-vector 1))) (begin (begin (vector-set! s= 0 (lambda (s1 i s2 j) (let ((s1 s1) (i i) (s2 s2) (j j)) (let ((l1 (string-length s1)) (l2 (string-length s2))) (if (not (fx= l1 l2)) #f (if (fx= i l1) #t (if (char=? (string-ref s1 i) (string-ref s2 j)) ((vector-ref s= 0) s1 (fx+ i 1) s2 (fx+ j 1)) #f))))))) (vector-set! ss= 0 (lambda (s1 s2) (let ((s1 s1) (s2 s2)) ((vector-ref s= 0) s1 0 s2 0)))) (vector-set! str->sym1 0 (lambda (str symlist) (let ((str str) (symlist symlist)) (if ((vector-ref ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (begin (set-cdr! symlist (cons new-sym ())) new-sym)) ((vector-ref str->sym1 0) str (cdr symlist))))))) (vector-set! str->sym 0 (lambda (str) (let ((str str)) ((vector-ref str->sym1 0) str (symbols)))))) (vector-ref str->sym 0)))
# == close-free-variables  ==>
# (let ((s= (make-vector 1)) (ss= (make-vector 1)) (str->sym1 (make-vector 1)) (str->sym (make-vector 1))) (begin (begin (vector-set! s= 0 (closure (s1 i s2 j) (s=) (let ((s1 s1) (i i) (s2 s2) (j j)) (let ((l1 (string-length s1)) (l2 (string-length s2))) (if (not (fx= l1 l2)) #f (if (fx= i l1) #t (if (char=? (string-ref s1 i) (string-ref s2 j)) ((vector-ref s= 0) s1 (fx+ i 1) s2 (fx+ j 1)) #f))))))) (vector-set! ss= 0 (closure (s1 s2) (s=) (let ((s1 s1) (s2 s2)) ((vector-ref s= 0) s1 0 s2 0)))) (vector-set! str->sym1 0 (closure (str symlist) (ss= str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (begin (set-cdr! symlist (cons new-sym ())) new-sym)) ((vector-ref str->sym1 0) str (cdr symlist))))))) (vector-set! str->sym 0 (closure (str) (str->sym1) (let ((str str)) ((vector-ref str->sym1 0) str (symbols)))))) (vector-ref str->sym 0)))
# == eliminate-quote  ==>
# (let ((s= (make-vector 1)) (ss= (make-vector 1)) (str->sym1 (make-vector 1)) (str->sym (make-vector 1))) (begin (begin (vector-set! s= 0 (closure (s1 i s2 j) (s=) (let ((s1 s1) (i i) (s2 s2) (j j)) (let ((l1 (string-length s1)) (l2 (string-length s2))) (if (not (fx= l1 l2)) #f (if (fx= i l1) #t (if (char=? (string-ref s1 i) (string-ref s2 j)) ((vector-ref s= 0) s1 (fx+ i 1) s2 (fx+ j 1)) #f))))))) (vector-set! ss= 0 (closure (s1 s2) (s=) (let ((s1 s1) (s2 s2)) ((vector-ref s= 0) s1 0 s2 0)))) (vector-set! str->sym1 0 (closure (str symlist) (ss= str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (begin (set-cdr! symlist (cons new-sym ())) new-sym)) ((vector-ref str->sym1 0) str (cdr symlist))))))) (vector-set! str->sym 0 (closure (str) (str->sym1) (let ((str str)) ((vector-ref str->sym1 0) str (symbols)))))) (vector-ref str->sym 0)))
# == eliminate-when/unless  ==>
# (let ((s= (make-vector 1)) (ss= (make-vector 1)) (str->sym1 (make-vector 1)) (str->sym (make-vector 1))) (begin (begin (vector-set! s= 0 (closure (s1 i s2 j) (s=) (let ((s1 s1) (i i) (s2 s2) (j j)) (let ((l1 (string-length s1)) (l2 (string-length s2))) (if (not (fx= l1 l2)) #f (if (fx= i l1) #t (if (char=? (string-ref s1 i) (string-ref s2 j)) ((vector-ref s= 0) s1 (fx+ i 1) s2 (fx+ j 1)) #f))))))) (vector-set! ss= 0 (closure (s1 s2) (s=) (let ((s1 s1) (s2 s2)) ((vector-ref s= 0) s1 0 s2 0)))) (vector-set! str->sym1 0 (closure (str symlist) (ss= str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (begin (set-cdr! symlist (cons new-sym ())) new-sym)) ((vector-ref str->sym1 0) str (cdr symlist))))))) (vector-set! str->sym 0 (closure (str) (str->sym1) (let ((str str)) ((vector-ref str->sym1 0) str (symbols)))))) (vector-ref str->sym 0)))
# == eliminate-cond  ==>
# (let ((s= (make-vector 1)) (ss= (make-vector 1)) (str->sym1 (make-vector 1)) (str->sym (make-vector 1))) (begin (begin (vector-set! s= 0 (closure (s1 i s2 j) (s=) (let ((s1 s1) (i i) (s2 s2) (j j)) (let ((l1 (string-length s1)) (l2 (string-length s2))) (if (not (fx= l1 l2)) #f (if (fx= i l1) #t (if (char=? (string-ref s1 i) (string-ref s2 j)) ((vector-ref s= 0) s1 (fx+ i 1) s2 (fx+ j 1)) #f))))))) (vector-set! ss= 0 (closure (s1 s2) (s=) (let ((s1 s1) (s2 s2)) ((vector-ref s= 0) s1 0 s2 0)))) (vector-set! str->sym1 0 (closure (str symlist) (ss= str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (begin (set-cdr! symlist (cons new-sym ())) new-sym)) ((vector-ref str->sym1 0) str (cdr symlist))))))) (vector-set! str->sym 0 (closure (str) (str->sym1) (let ((str str)) ((vector-ref str->sym1 0) str (symbols)))))) (vector-ref str->sym 0)))
# emit-expr (let ((s= (make-vector 1)) (ss= (make-vector 1)) (str->sym1 (make-vector 1)) (str->sym (make-vector 1))) (begin (begin (vector-set! s= 0 (closure (s1 i s2 j) (s=) (let ((s1 s1) (i i) (s2 s2) (j j)) (let ((l1 (string-length s1)) (l2 (string-length s2))) (if (not (fx= l1 l2)) #f (if (fx= i l1) #t (if (char=? (string-ref s1 i) (string-ref s2 j)) ((vector-ref s= 0) s1 (fx+ i 1) s2 (fx+ j 1)) #f))))))) (vector-set! ss= 0 (closure (s1 s2) (s=) (let ((s1 s1) (s2 s2)) ((vector-ref s= 0) s1 0 s2 0)))) (vector-set! str->sym1 0 (closure (str symlist) (ss= str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (begin (set-cdr! symlist (cons new-sym ())) new-sym)) ((vector-ref str->sym1 0) str (cdr symlist))))))) (vector-set! str->sym 0 (closure (str) (str->sym1) (let ((str str)) ((vector-ref str->sym1 0) str (symbols)))))) (vector-ref str->sym 0)))
# emit-let
#  si   = -8
#  env  = ()
#  bindings = ((s= (make-vector 1)) (ss= (make-vector 1)) (str->sym1 (make-vector 1)) (str->sym (make-vector 1)))
#  body = (begin (begin (vector-set! s= 0 (closure (s1 i s2 j) (s=) (let ((s1 s1) (i i) (s2 s2) (j j)) (let ((l1 (string-length s1)) (l2 (string-length s2))) (if (not (fx= l1 l2)) #f (if (fx= i l1) #t (if (char=? (string-ref s1 i) (string-ref s2 j)) ((vector-ref s= 0) s1 (fx+ i 1) s2 (fx+ j 1)) #f))))))) (vector-set! ss= 0 (closure (s1 s2) (s=) (let ((s1 s1) (s2 s2)) ((vector-ref s= 0) s1 0 s2 0)))) (vector-set! str->sym1 0 (closure (str symlist) (ss= str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (begin (set-cdr! symlist (cons new-sym ())) new-sym)) ((vector-ref str->sym1 0) str (cdr symlist))))))) (vector-set! str->sym 0 (closure (str) (str->sym1) (let ((str str)) ((vector-ref str->sym1 0) str (symbols)))))) (vector-ref str->sym 0))
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
    movl %eax, -16(%esp)  # stack save
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
    movl %eax, -20(%esp)  # stack save
# emit-expr (begin (begin (vector-set! s= 0 (closure (s1 i s2 j) (s=) (let ((s1 s1) (i i) (s2 s2) (j j)) (let ((l1 (string-length s1)) (l2 (string-length s2))) (if (not (fx= l1 l2)) #f (if (fx= i l1) #t (if (char=? (string-ref s1 i) (string-ref s2 j)) ((vector-ref s= 0) s1 (fx+ i 1) s2 (fx+ j 1)) #f))))))) (vector-set! ss= 0 (closure (s1 s2) (s=) (let ((s1 s1) (s2 s2)) ((vector-ref s= 0) s1 0 s2 0)))) (vector-set! str->sym1 0 (closure (str symlist) (ss= str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (begin (set-cdr! symlist (cons new-sym ())) new-sym)) ((vector-ref str->sym1 0) str (cdr symlist))))))) (vector-set! str->sym 0 (closure (str) (str->sym1) (let ((str str)) ((vector-ref str->sym1 0) str (symbols)))))) (vector-ref str->sym 0))
# emit-begin
#   expr=(begin (begin (vector-set! s= 0 (closure (s1 i s2 j) (s=) (let ((s1 s1) (i i) (s2 s2) (j j)) (let ((l1 (string-length s1)) (l2 (string-length s2))) (if (not (fx= l1 l2)) #f (if (fx= i l1) #t (if (char=? (string-ref s1 i) (string-ref s2 j)) ((vector-ref s= 0) s1 (fx+ i 1) s2 (fx+ j 1)) #f))))))) (vector-set! ss= 0 (closure (s1 s2) (s=) (let ((s1 s1) (s2 s2)) ((vector-ref s= 0) s1 0 s2 0)))) (vector-set! str->sym1 0 (closure (str symlist) (ss= str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (begin (set-cdr! symlist (cons new-sym ())) new-sym)) ((vector-ref str->sym1 0) str (cdr symlist))))))) (vector-set! str->sym 0 (closure (str) (str->sym1) (let ((str str)) ((vector-ref str->sym1 0) str (symbols)))))) (vector-ref str->sym 0))
#   env=((str->sym . -20) (str->sym1 . -16) (ss= . -12) (s= . -8))
# emit-expr (begin (vector-set! s= 0 (closure (s1 i s2 j) (s=) (let ((s1 s1) (i i) (s2 s2) (j j)) (let ((l1 (string-length s1)) (l2 (string-length s2))) (if (not (fx= l1 l2)) #f (if (fx= i l1) #t (if (char=? (string-ref s1 i) (string-ref s2 j)) ((vector-ref s= 0) s1 (fx+ i 1) s2 (fx+ j 1)) #f))))))) (vector-set! ss= 0 (closure (s1 s2) (s=) (let ((s1 s1) (s2 s2)) ((vector-ref s= 0) s1 0 s2 0)))) (vector-set! str->sym1 0 (closure (str symlist) (ss= str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (begin (set-cdr! symlist (cons new-sym ())) new-sym)) ((vector-ref str->sym1 0) str (cdr symlist))))))) (vector-set! str->sym 0 (closure (str) (str->sym1) (let ((str str)) ((vector-ref str->sym1 0) str (symbols))))))
# emit-begin
#   expr=(begin (vector-set! s= 0 (closure (s1 i s2 j) (s=) (let ((s1 s1) (i i) (s2 s2) (j j)) (let ((l1 (string-length s1)) (l2 (string-length s2))) (if (not (fx= l1 l2)) #f (if (fx= i l1) #t (if (char=? (string-ref s1 i) (string-ref s2 j)) ((vector-ref s= 0) s1 (fx+ i 1) s2 (fx+ j 1)) #f))))))) (vector-set! ss= 0 (closure (s1 s2) (s=) (let ((s1 s1) (s2 s2)) ((vector-ref s= 0) s1 0 s2 0)))) (vector-set! str->sym1 0 (closure (str symlist) (ss= str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (begin (set-cdr! symlist (cons new-sym ())) new-sym)) ((vector-ref str->sym1 0) str (cdr symlist))))))) (vector-set! str->sym 0 (closure (str) (str->sym1) (let ((str str)) ((vector-ref str->sym1 0) str (symbols))))))
#   env=((str->sym . -20) (str->sym1 . -16) (ss= . -12) (s= . -8))
# emit-expr (vector-set! s= 0 (closure (s1 i s2 j) (s=) (let ((s1 s1) (i i) (s2 s2) (j j)) (let ((l1 (string-length s1)) (l2 (string-length s2))) (if (not (fx= l1 l2)) #f (if (fx= i l1) #t (if (char=? (string-ref s1 i) (string-ref s2 j)) ((vector-ref s= 0) s1 (fx+ i 1) s2 (fx+ j 1)) #f)))))))
# emit-expr s=
# emit-variable-ref
# env=((str->sym . -20) (str->sym1 . -16) (ss= . -12) (s= . -8))
# var=s=
    movl -8(%esp), %eax  # stack load s=
# end emit-variable-ref
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl %eax, -28(%esp)
# emit-expr (closure (s1 i s2 j) (s=) (let ((s1 s1) (i i) (s2 s2) (j j)) (let ((l1 (string-length s1)) (l2 (string-length s2))) (if (not (fx= l1 l2)) #f (if (fx= i l1) #t (if (char=? (string-ref s1 i) (string-ref s2 j)) ((vector-ref s= 0) s1 (fx+ i 1) s2 (fx+ j 1)) #f))))))
# emit-closure
# si = -32
# env = ((str->sym . -20) (str->sym1 . -16) (ss= . -12) (s= . -8))
# expr = (closure (s1 i s2 j) (s=) (let ((s1 s1) (i i) (s2 s2) (j j)) (let ((l1 (string-length s1)) (l2 (string-length s2))) (if (not (fx= l1 l2)) #f (if (fx= i l1) #t (if (char=? (string-ref s1 i) (string-ref s2 j)) ((vector-ref s= 0) s1 (fx+ i 1) s2 (fx+ j 1)) #f))))))
    movl $_L_942, 0(%ebp)  # closure label
# emit-variable-ref
# env=((str->sym . -20) (str->sym1 . -16) (ss= . -12) (s= . -8))
# var=s=
    movl -8(%esp), %eax  # stack load s=
# end emit-variable-ref
   movl  %eax, 4(%ebp)
    movl %ebp, %eax    # return base ptr
    add $2, %eax      # closure tag
    add $8, %ebp      # bump ebp
    jmp _L_943
_L_942:
# emit-tail-expr
# si=-24
# env=((j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# expr=(begin (let ((s1 s1) (i i) (s2 s2) (j j)) (let ((l1 (string-length s1)) (l2 (string-length s2))) (if (not (fx= l1 l2)) #f (if (fx= i l1) #t (if (char=? (string-ref s1 i) (string-ref s2 j)) ((vector-ref s= 0) s1 (fx+ i 1) s2 (fx+ j 1)) #f))))))
# tail-begin (begin (let ((s1 s1) (i i) (s2 s2) (j j)) (let ((l1 (string-length s1)) (l2 (string-length s2))) (if (not (fx= l1 l2)) #f (if (fx= i l1) #t (if (char=? (string-ref s1 i) (string-ref s2 j)) ((vector-ref s= 0) s1 (fx+ i 1) s2 (fx+ j 1)) #f))))))
#   env=((j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# emit-tail-expr
# si=-24
# env=((j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# expr=(let ((s1 s1) (i i) (s2 s2) (j j)) (let ((l1 (string-length s1)) (l2 (string-length s2))) (if (not (fx= l1 l2)) #f (if (fx= i l1) #t (if (char=? (string-ref s1 i) (string-ref s2 j)) ((vector-ref s= 0) s1 (fx+ i 1) s2 (fx+ j 1)) #f)))))
# emit-tail-let
#  si   = -24
#  env  = ((j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
#  bindings = ((s1 s1) (i i) (s2 s2) (j j))
#  body = (let ((l1 (string-length s1)) (l2 (string-length s2))) (if (not (fx= l1 l2)) #f (if (fx= i l1) #t (if (char=? (string-ref s1 i) (string-ref s2 j)) ((vector-ref s= 0) s1 (fx+ i 1) s2 (fx+ j 1)) #f))))
# emit-expr s1
# emit-variable-ref
# env=((j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# var=s1
    movl -8(%esp), %eax  # stack load s1
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr i
# emit-variable-ref
# env=((j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# var=i
    movl -12(%esp), %eax  # stack load i
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-expr s2
# emit-variable-ref
# env=((j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# var=s2
    movl -16(%esp), %eax  # stack load s2
# end emit-variable-ref
    movl %eax, -32(%esp)  # stack save
# emit-expr j
# emit-variable-ref
# env=((j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# var=j
    movl -20(%esp), %eax  # stack load j
# end emit-variable-ref
    movl %eax, -36(%esp)  # stack save
# emit-tail-expr
# si=-40
# env=((j . -36) (s2 . -32) (i . -28) (s1 . -24) (j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# expr=(let ((l1 (string-length s1)) (l2 (string-length s2))) (if (not (fx= l1 l2)) #f (if (fx= i l1) #t (if (char=? (string-ref s1 i) (string-ref s2 j)) ((vector-ref s= 0) s1 (fx+ i 1) s2 (fx+ j 1)) #f))))
# emit-tail-let
#  si   = -40
#  env  = ((j . -36) (s2 . -32) (i . -28) (s1 . -24) (j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
#  bindings = ((l1 (string-length s1)) (l2 (string-length s2)))
#  body = (if (not (fx= l1 l2)) #f (if (fx= i l1) #t (if (char=? (string-ref s1 i) (string-ref s2 j)) ((vector-ref s= 0) s1 (fx+ i 1) s2 (fx+ j 1)) #f)))
# emit-expr (string-length s1)
# emit-expr s1
# emit-variable-ref
# env=((j . -36) (s2 . -32) (i . -28) (s1 . -24) (j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# var=s1
    movl -24(%esp), %eax  # stack load s1
# end emit-variable-ref
    movl -6(%eax), %eax
    movl %eax, -40(%esp)  # stack save
# emit-expr (string-length s2)
# emit-expr s2
# emit-variable-ref
# env=((j . -36) (s2 . -32) (i . -28) (s1 . -24) (j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# var=s2
    movl -32(%esp), %eax  # stack load s2
# end emit-variable-ref
    movl -6(%eax), %eax
    movl %eax, -44(%esp)  # stack save
# emit-tail-expr
# si=-48
# env=((l2 . -44) (l1 . -40) (j . -36) (s2 . -32) (i . -28) (s1 . -24) (j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# expr=(if (not (fx= l1 l2)) #f (if (fx= i l1) #t (if (char=? (string-ref s1 i) (string-ref s2 j)) ((vector-ref s= 0) s1 (fx+ i 1) s2 (fx+ j 1)) #f)))
# emit-expr (not (fx= l1 l2))
# emit-expr (fx= l1 l2)
# emit-expr l2
# emit-variable-ref
# env=((l2 . -44) (l1 . -40) (j . -36) (s2 . -32) (i . -28) (s1 . -24) (j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# var=l2
    movl -44(%esp), %eax  # stack load l2
# end emit-variable-ref
    movl %eax, -48(%esp)
# emit-expr l1
# emit-variable-ref
# env=((l2 . -44) (l1 . -40) (j . -36) (s2 . -32) (i . -28) (s1 . -24) (j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# var=l1
    movl -40(%esp), %eax  # stack load l1
# end emit-variable-ref
    cmp -48(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_944
# emit-tail-expr
# si=-48
# env=((l2 . -44) (l1 . -40) (j . -36) (s2 . -32) (i . -28) (s1 . -24) (j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # tail return
    jmp _L_945
_L_944:
# emit-tail-expr
# si=-48
# env=((l2 . -44) (l1 . -40) (j . -36) (s2 . -32) (i . -28) (s1 . -24) (j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# expr=(if (fx= i l1) #t (if (char=? (string-ref s1 i) (string-ref s2 j)) ((vector-ref s= 0) s1 (fx+ i 1) s2 (fx+ j 1)) #f))
# emit-expr (fx= i l1)
# emit-expr l1
# emit-variable-ref
# env=((l2 . -44) (l1 . -40) (j . -36) (s2 . -32) (i . -28) (s1 . -24) (j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# var=l1
    movl -40(%esp), %eax  # stack load l1
# end emit-variable-ref
    movl %eax, -48(%esp)
# emit-expr i
# emit-variable-ref
# env=((l2 . -44) (l1 . -40) (j . -36) (s2 . -32) (i . -28) (s1 . -24) (j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# var=i
    movl -28(%esp), %eax  # stack load i
# end emit-variable-ref
    cmp -48(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_946
# emit-tail-expr
# si=-48
# env=((l2 . -44) (l1 . -40) (j . -36) (s2 . -32) (i . -28) (s1 . -24) (j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# expr=#t
    movl $111, %eax     # immed #t
    ret                  # tail return
    jmp _L_947
_L_946:
# emit-tail-expr
# si=-48
# env=((l2 . -44) (l1 . -40) (j . -36) (s2 . -32) (i . -28) (s1 . -24) (j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# expr=(if (char=? (string-ref s1 i) (string-ref s2 j)) ((vector-ref s= 0) s1 (fx+ i 1) s2 (fx+ j 1)) #f)
# emit-expr (char=? (string-ref s1 i) (string-ref s2 j))
# char= c1=(string-ref s1 i) c2=(string-ref s2 j)
# emit-expr (string-ref s1 i)
# emit-expr s1
# emit-variable-ref
# env=((l2 . -44) (l1 . -40) (j . -36) (s2 . -32) (i . -28) (s1 . -24) (j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# var=s1
    movl -24(%esp), %eax  # stack load s1
# end emit-variable-ref
    movl %eax, -48(%esp)
# emit-expr i
# emit-variable-ref
# env=((l2 . -44) (l1 . -40) (j . -36) (s2 . -32) (i . -28) (s1 . -24) (j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# var=i
    movl -28(%esp), %eax  # stack load i
# end emit-variable-ref
    sar $2, %eax
    movl -48(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
    movb %ah, -48(%esp)
# emit-expr (string-ref s2 j)
# emit-expr s2
# emit-variable-ref
# env=((l2 . -44) (l1 . -40) (j . -36) (s2 . -32) (i . -28) (s1 . -24) (j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# var=s2
    movl -32(%esp), %eax  # stack load s2
# end emit-variable-ref
    movl %eax, -52(%esp)
# emit-expr j
# emit-variable-ref
# env=((l2 . -44) (l1 . -40) (j . -36) (s2 . -32) (i . -28) (s1 . -24) (j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# var=j
    movl -36(%esp), %eax  # stack load j
# end emit-variable-ref
    sar $2, %eax
    movl -52(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
    cmp %ah, -48(%esp)
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_948
# emit-tail-expr
# si=-48
# env=((l2 . -44) (l1 . -40) (j . -36) (s2 . -32) (i . -28) (s1 . -24) (j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# expr=((vector-ref s= 0) s1 (fx+ i 1) s2 (fx+ j 1))
# emit-tail-funcall
#    si   =-48
#    env  = ((l2 . -44) (l1 . -40) (j . -36) (s2 . -32) (i . -28) (s1 . -24) (j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
#    expr = (funcall (vector-ref s= 0) s1 (fx+ i 1) s2 (fx+ j 1))
# emit-expr s1
# emit-variable-ref
# env=((l2 . -44) (l1 . -40) (j . -36) (s2 . -32) (i . -28) (s1 . -24) (j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# var=s1
    movl -24(%esp), %eax  # stack load s1
# end emit-variable-ref
    mov %eax, -56(%esp)    # arg 
# emit-expr (fx+ i 1)
# emit-expr 1
    movl $4, %eax     # immed 1
    movl %eax, -60(%esp)  # fx+ push arg1
# emit-expr i
# emit-variable-ref
# env=((l2 . -44) (l1 . -40) (j . -36) (s2 . -32) (i . -28) (s1 . -24) (j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# var=i
    movl -28(%esp), %eax  # stack load i
# end emit-variable-ref
    addl -60(%esp), %eax  # fx+ arg1 arg2
    mov %eax, -60(%esp)    # arg 
# emit-expr s2
# emit-variable-ref
# env=((l2 . -44) (l1 . -40) (j . -36) (s2 . -32) (i . -28) (s1 . -24) (j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# var=s2
    movl -32(%esp), %eax  # stack load s2
# end emit-variable-ref
    mov %eax, -64(%esp)    # arg 
# emit-expr (fx+ j 1)
# emit-expr 1
    movl $4, %eax     # immed 1
    movl %eax, -68(%esp)  # fx+ push arg1
# emit-expr j
# emit-variable-ref
# env=((l2 . -44) (l1 . -40) (j . -36) (s2 . -32) (i . -28) (s1 . -24) (j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# var=j
    movl -36(%esp), %eax  # stack load j
# end emit-variable-ref
    addl -68(%esp), %eax  # fx+ arg1 arg2
    mov %eax, -68(%esp)    # arg 
# emit-expr (vector-ref s= 0)
# emit-expr s=
# emit-variable-ref
# env=((l2 . -44) (l1 . -40) (j . -36) (s2 . -32) (i . -28) (s1 . -24) (j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# var=s=
    movl 2(%edi), %eax  # frame load s=
# end emit-variable-ref
    movl %eax, -72(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl -72(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, %edi  # evaluated funcall op -> %edi
# emit-shift-args:  argc=4   si=-56  delta=48
    mov -56(%esp), %ebx  # shift arg
    mov %ebx, -8(%esp)  # down to base
# emit-shift-args:  argc=3   si=-60  delta=48
    mov -60(%esp), %ebx  # shift arg
    mov %ebx, -12(%esp)  # down to base
# emit-shift-args:  argc=2   si=-64  delta=48
    mov -64(%esp), %ebx  # shift arg
    mov %ebx, -16(%esp)  # down to base
# emit-shift-args:  argc=1   si=-68  delta=48
    mov -68(%esp), %ebx  # shift arg
    mov %ebx, -20(%esp)  # down to base
# emit-shift-args:  argc=0   si=-72  delta=48
    jmp *-2(%edi)  # tail-funcall
    jmp _L_949
_L_948:
# emit-tail-expr
# si=-48
# env=((l2 . -44) (l1 . -40) (j . -36) (s2 . -32) (i . -28) (s1 . -24) (j . -20) (s2 . -16) (i . -12) (s1 . -8) (s= . 4))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # tail return
_L_949:
_L_947:
_L_945:
     ret   # return thru stack
    .align 4,0x90
_L_943:
    movl -24(%esp), %ebx
    movl -28(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! ss= 0 (closure (s1 s2) (s=) (let ((s1 s1) (s2 s2)) ((vector-ref s= 0) s1 0 s2 0)))) (vector-set! str->sym1 0 (closure (str symlist) (ss= str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (begin (set-cdr! symlist (cons new-sym ())) new-sym)) ((vector-ref str->sym1 0) str (cdr symlist))))))) (vector-set! str->sym 0 (closure (str) (str->sym1) (let ((str str)) ((vector-ref str->sym1 0) str (symbols))))))
# emit-begin
#   expr=(begin (vector-set! ss= 0 (closure (s1 s2) (s=) (let ((s1 s1) (s2 s2)) ((vector-ref s= 0) s1 0 s2 0)))) (vector-set! str->sym1 0 (closure (str symlist) (ss= str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (begin (set-cdr! symlist (cons new-sym ())) new-sym)) ((vector-ref str->sym1 0) str (cdr symlist))))))) (vector-set! str->sym 0 (closure (str) (str->sym1) (let ((str str)) ((vector-ref str->sym1 0) str (symbols))))))
#   env=((str->sym . -20) (str->sym1 . -16) (ss= . -12) (s= . -8))
# emit-expr (vector-set! ss= 0 (closure (s1 s2) (s=) (let ((s1 s1) (s2 s2)) ((vector-ref s= 0) s1 0 s2 0))))
# emit-expr ss=
# emit-variable-ref
# env=((str->sym . -20) (str->sym1 . -16) (ss= . -12) (s= . -8))
# var=ss=
    movl -12(%esp), %eax  # stack load ss=
# end emit-variable-ref
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl %eax, -28(%esp)
# emit-expr (closure (s1 s2) (s=) (let ((s1 s1) (s2 s2)) ((vector-ref s= 0) s1 0 s2 0)))
# emit-closure
# si = -32
# env = ((str->sym . -20) (str->sym1 . -16) (ss= . -12) (s= . -8))
# expr = (closure (s1 s2) (s=) (let ((s1 s1) (s2 s2)) ((vector-ref s= 0) s1 0 s2 0)))
    movl $_L_950, 0(%ebp)  # closure label
# emit-variable-ref
# env=((str->sym . -20) (str->sym1 . -16) (ss= . -12) (s= . -8))
# var=s=
    movl -8(%esp), %eax  # stack load s=
# end emit-variable-ref
   movl  %eax, 4(%ebp)
    movl %ebp, %eax    # return base ptr
    add $2, %eax      # closure tag
    add $8, %ebp      # bump ebp
    jmp _L_951
_L_950:
# emit-tail-expr
# si=-16
# env=((s2 . -12) (s1 . -8) (s= . 4))
# expr=(begin (let ((s1 s1) (s2 s2)) ((vector-ref s= 0) s1 0 s2 0)))
# tail-begin (begin (let ((s1 s1) (s2 s2)) ((vector-ref s= 0) s1 0 s2 0)))
#   env=((s2 . -12) (s1 . -8) (s= . 4))
# emit-tail-expr
# si=-16
# env=((s2 . -12) (s1 . -8) (s= . 4))
# expr=(let ((s1 s1) (s2 s2)) ((vector-ref s= 0) s1 0 s2 0))
# emit-tail-let
#  si   = -16
#  env  = ((s2 . -12) (s1 . -8) (s= . 4))
#  bindings = ((s1 s1) (s2 s2))
#  body = ((vector-ref s= 0) s1 0 s2 0)
# emit-expr s1
# emit-variable-ref
# env=((s2 . -12) (s1 . -8) (s= . 4))
# var=s1
    movl -8(%esp), %eax  # stack load s1
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr s2
# emit-variable-ref
# env=((s2 . -12) (s1 . -8) (s= . 4))
# var=s2
    movl -12(%esp), %eax  # stack load s2
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (s= . 4))
# expr=((vector-ref s= 0) s1 0 s2 0)
# emit-tail-funcall
#    si   =-24
#    env  = ((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (s= . 4))
#    expr = (funcall (vector-ref s= 0) s1 0 s2 0)
# emit-expr s1
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (s= . 4))
# var=s1
    movl -16(%esp), %eax  # stack load s1
# end emit-variable-ref
    mov %eax, -32(%esp)    # arg 
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -36(%esp)    # arg 
# emit-expr s2
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (s= . 4))
# var=s2
    movl -20(%esp), %eax  # stack load s2
# end emit-variable-ref
    mov %eax, -40(%esp)    # arg 
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -44(%esp)    # arg 
# emit-expr (vector-ref s= 0)
# emit-expr s=
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) (s= . 4))
# var=s=
    movl 2(%edi), %eax  # frame load s=
# end emit-variable-ref
    movl %eax, -48(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl -48(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, %edi  # evaluated funcall op -> %edi
# emit-shift-args:  argc=4   si=-32  delta=24
    mov -32(%esp), %ebx  # shift arg
    mov %ebx, -8(%esp)  # down to base
# emit-shift-args:  argc=3   si=-36  delta=24
    mov -36(%esp), %ebx  # shift arg
    mov %ebx, -12(%esp)  # down to base
# emit-shift-args:  argc=2   si=-40  delta=24
    mov -40(%esp), %ebx  # shift arg
    mov %ebx, -16(%esp)  # down to base
# emit-shift-args:  argc=1   si=-44  delta=24
    mov -44(%esp), %ebx  # shift arg
    mov %ebx, -20(%esp)  # down to base
# emit-shift-args:  argc=0   si=-48  delta=24
    jmp *-2(%edi)  # tail-funcall
     ret   # return thru stack
    .align 4,0x90
_L_951:
    movl -24(%esp), %ebx
    movl -28(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! str->sym1 0 (closure (str symlist) (ss= str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (begin (set-cdr! symlist (cons new-sym ())) new-sym)) ((vector-ref str->sym1 0) str (cdr symlist))))))) (vector-set! str->sym 0 (closure (str) (str->sym1) (let ((str str)) ((vector-ref str->sym1 0) str (symbols))))))
# emit-begin
#   expr=(begin (vector-set! str->sym1 0 (closure (str symlist) (ss= str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (begin (set-cdr! symlist (cons new-sym ())) new-sym)) ((vector-ref str->sym1 0) str (cdr symlist))))))) (vector-set! str->sym 0 (closure (str) (str->sym1) (let ((str str)) ((vector-ref str->sym1 0) str (symbols))))))
#   env=((str->sym . -20) (str->sym1 . -16) (ss= . -12) (s= . -8))
# emit-expr (vector-set! str->sym1 0 (closure (str symlist) (ss= str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (begin (set-cdr! symlist (cons new-sym ())) new-sym)) ((vector-ref str->sym1 0) str (cdr symlist)))))))
# emit-expr str->sym1
# emit-variable-ref
# env=((str->sym . -20) (str->sym1 . -16) (ss= . -12) (s= . -8))
# var=str->sym1
    movl -16(%esp), %eax  # stack load str->sym1
# end emit-variable-ref
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl %eax, -28(%esp)
# emit-expr (closure (str symlist) (ss= str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (begin (set-cdr! symlist (cons new-sym ())) new-sym)) ((vector-ref str->sym1 0) str (cdr symlist))))))
# emit-closure
# si = -32
# env = ((str->sym . -20) (str->sym1 . -16) (ss= . -12) (s= . -8))
# expr = (closure (str symlist) (ss= str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (begin (set-cdr! symlist (cons new-sym ())) new-sym)) ((vector-ref str->sym1 0) str (cdr symlist))))))
    movl $_L_952, 0(%ebp)  # closure label
# emit-variable-ref
# env=((str->sym . -20) (str->sym1 . -16) (ss= . -12) (s= . -8))
# var=ss=
    movl -12(%esp), %eax  # stack load ss=
# end emit-variable-ref
   movl  %eax, 4(%ebp)
# emit-variable-ref
# env=((str->sym . -20) (str->sym1 . -16) (ss= . -12) (s= . -8))
# var=str->sym1
    movl -16(%esp), %eax  # stack load str->sym1
# end emit-variable-ref
   movl  %eax, 8(%ebp)
    movl %ebp, %eax    # return base ptr
    add $2, %eax      # closure tag
    add $16, %ebp      # bump ebp
    jmp _L_953
_L_952:
# emit-tail-expr
# si=-16
# env=((symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
# expr=(begin (let ((str str) (symlist symlist)) (if ((vector-ref ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (begin (set-cdr! symlist (cons new-sym ())) new-sym)) ((vector-ref str->sym1 0) str (cdr symlist))))))
# tail-begin (begin (let ((str str) (symlist symlist)) (if ((vector-ref ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (begin (set-cdr! symlist (cons new-sym ())) new-sym)) ((vector-ref str->sym1 0) str (cdr symlist))))))
#   env=((symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
# emit-tail-expr
# si=-16
# env=((symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
# expr=(let ((str str) (symlist symlist)) (if ((vector-ref ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (begin (set-cdr! symlist (cons new-sym ())) new-sym)) ((vector-ref str->sym1 0) str (cdr symlist)))))
# emit-tail-let
#  si   = -16
#  env  = ((symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
#  bindings = ((str str) (symlist symlist))
#  body = (if ((vector-ref ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (begin (set-cdr! symlist (cons new-sym ())) new-sym)) ((vector-ref str->sym1 0) str (cdr symlist))))
# emit-expr str
# emit-variable-ref
# env=((symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
# var=str
    movl -8(%esp), %eax  # stack load str
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr symlist
# emit-variable-ref
# env=((symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
# var=symlist
    movl -12(%esp), %eax  # stack load symlist
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
# expr=(if ((vector-ref ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (begin (set-cdr! symlist (cons new-sym ())) new-sym)) ((vector-ref str->sym1 0) str (cdr symlist))))
# emit-expr ((vector-ref ss= 0) str (symbol->string (car symlist)))
# funcall
#    si   =-24
#    env  = ((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
#    expr = (funcall (vector-ref ss= 0) str (symbol->string (car symlist)))
# emit-expr (vector-ref ss= 0)
# emit-expr ss=
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
# var=ss=
    movl 2(%edi), %eax  # frame load ss=
# end emit-variable-ref
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr str
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
# var=str
    movl -16(%esp), %eax  # stack load str
# end emit-variable-ref
    mov %eax, -36(%esp)    # arg str
# emit-expr (symbol->string (car symlist))
# symbol->string (car symlist)
# emit-expr (car symlist)
# emit-expr symlist
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
# var=symlist
    movl -20(%esp), %eax  # stack load symlist
# end emit-variable-ref
    movl -1(%eax), %eax
    movl -3(%eax), %eax
    mov %eax, -40(%esp)    # arg (symbol->string (car symlist))
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp    # adjust base
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp    # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_954
# emit-tail-expr
# si=-24
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
# expr=(car symlist)
# tail primcall
# emit-expr symlist
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
# var=symlist
    movl -20(%esp), %eax  # stack load symlist
# end emit-variable-ref
    movl -1(%eax), %eax
#return from tail (car symlist)
    ret
    jmp _L_955
_L_954:
# emit-tail-expr
# si=-24
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
# expr=(if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (begin (set-cdr! symlist (cons new-sym ())) new-sym)) ((vector-ref str->sym1 0) str (cdr symlist)))
# emit-expr (null? (cdr symlist))
# emit-expr (cdr symlist)
# emit-expr symlist
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
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
    je _L_956
# emit-tail-expr
# si=-24
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
# expr=(let ((new-sym (make-symbol str #f))) (begin (set-cdr! symlist (cons new-sym ())) new-sym))
# emit-tail-let
#  si   = -24
#  env  = ((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
#  bindings = ((new-sym (make-symbol str #f)))
#  body = (begin (set-cdr! symlist (cons new-sym ())) new-sym)
# emit-expr (make-symbol str #f)
# make-symbol arg1=str arg2=#f
# emit-expr str
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
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
# env=((new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
# expr=(begin (set-cdr! symlist (cons new-sym ())) new-sym)
# tail-begin (begin (set-cdr! symlist (cons new-sym ())) new-sym)
#   env=((new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
# emit-expr (set-cdr! symlist (cons new-sym ()))
# emit-expr symlist
# emit-variable-ref
# env=((new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
# var=symlist
    movl -20(%esp), %eax  # stack load symlist
# end emit-variable-ref
    movl %eax, -28(%esp)
# emit-expr (cons new-sym ())
# cons arg1=new-sym arg2=()
# emit-expr new-sym
# emit-variable-ref
# env=((new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
# var=new-sym
    movl -24(%esp), %eax  # stack load new-sym
# end emit-variable-ref
    movl %eax, -32(%esp)
# emit-expr ()
    movl $63, %eax     # immed ()
    movl %eax, 4(%ebp)
    movl -32(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -28(%esp), %ebx
    movl %eax, 3(%ebx)
# emit-tail-expr
# si=-28
# env=((new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
# expr=(begin new-sym)
# tail-begin (begin new-sym)
#   env=((new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
# emit-tail-expr
# si=-28
# env=((new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
# expr=new-sym
# emit-tail-variable-ref
# emit-variable-ref
# env=((new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
# var=new-sym
    movl -24(%esp), %eax  # stack load new-sym
# end emit-variable-ref
    ret
# end emit-tail-variable ref
     ret   # return thru stack
    jmp _L_957
_L_956:
# emit-tail-expr
# si=-24
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
# expr=((vector-ref str->sym1 0) str (cdr symlist))
# emit-tail-funcall
#    si   =-24
#    env  = ((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
#    expr = (funcall (vector-ref str->sym1 0) str (cdr symlist))
# emit-expr str
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
# var=str
    movl -16(%esp), %eax  # stack load str
# end emit-variable-ref
    mov %eax, -32(%esp)    # arg 
# emit-expr (cdr symlist)
# emit-expr symlist
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
# var=symlist
    movl -20(%esp), %eax  # stack load symlist
# end emit-variable-ref
    movl 3(%eax), %eax
    mov %eax, -36(%esp)    # arg 
# emit-expr (vector-ref str->sym1 0)
# emit-expr str->sym1
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) (str->sym1 . 8) (ss= . 4))
# var=str->sym1
    movl 6(%edi), %eax  # frame load str->sym1
# end emit-variable-ref
    movl %eax, -40(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl -40(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, %edi  # evaluated funcall op -> %edi
# emit-shift-args:  argc=2   si=-32  delta=24
    mov -32(%esp), %ebx  # shift arg
    mov %ebx, -8(%esp)  # down to base
# emit-shift-args:  argc=1   si=-36  delta=24
    mov -36(%esp), %ebx  # shift arg
    mov %ebx, -12(%esp)  # down to base
# emit-shift-args:  argc=0   si=-40  delta=24
    jmp *-2(%edi)  # tail-funcall
_L_957:
_L_955:
     ret   # return thru stack
    .align 4,0x90
_L_953:
    movl -24(%esp), %ebx
    movl -28(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! str->sym 0 (closure (str) (str->sym1) (let ((str str)) ((vector-ref str->sym1 0) str (symbols))))))
# emit-begin
#   expr=(begin (vector-set! str->sym 0 (closure (str) (str->sym1) (let ((str str)) ((vector-ref str->sym1 0) str (symbols))))))
#   env=((str->sym . -20) (str->sym1 . -16) (ss= . -12) (s= . -8))
# emit-expr (vector-set! str->sym 0 (closure (str) (str->sym1) (let ((str str)) ((vector-ref str->sym1 0) str (symbols)))))
# emit-expr str->sym
# emit-variable-ref
# env=((str->sym . -20) (str->sym1 . -16) (ss= . -12) (s= . -8))
# var=str->sym
    movl -20(%esp), %eax  # stack load str->sym
# end emit-variable-ref
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl %eax, -28(%esp)
# emit-expr (closure (str) (str->sym1) (let ((str str)) ((vector-ref str->sym1 0) str (symbols))))
# emit-closure
# si = -32
# env = ((str->sym . -20) (str->sym1 . -16) (ss= . -12) (s= . -8))
# expr = (closure (str) (str->sym1) (let ((str str)) ((vector-ref str->sym1 0) str (symbols))))
    movl $_L_958, 0(%ebp)  # closure label
# emit-variable-ref
# env=((str->sym . -20) (str->sym1 . -16) (ss= . -12) (s= . -8))
# var=str->sym1
    movl -16(%esp), %eax  # stack load str->sym1
# end emit-variable-ref
   movl  %eax, 4(%ebp)
    movl %ebp, %eax    # return base ptr
    add $2, %eax      # closure tag
    add $8, %ebp      # bump ebp
    jmp _L_959
_L_958:
# emit-tail-expr
# si=-12
# env=((str . -8) (str->sym1 . 4))
# expr=(begin (let ((str str)) ((vector-ref str->sym1 0) str (symbols))))
# tail-begin (begin (let ((str str)) ((vector-ref str->sym1 0) str (symbols))))
#   env=((str . -8) (str->sym1 . 4))
# emit-tail-expr
# si=-12
# env=((str . -8) (str->sym1 . 4))
# expr=(let ((str str)) ((vector-ref str->sym1 0) str (symbols)))
# emit-tail-let
#  si   = -12
#  env  = ((str . -8) (str->sym1 . 4))
#  bindings = ((str str))
#  body = ((vector-ref str->sym1 0) str (symbols))
# emit-expr str
# emit-variable-ref
# env=((str . -8) (str->sym1 . 4))
# var=str
    movl -8(%esp), %eax  # stack load str
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((str . -12) (str . -8) (str->sym1 . 4))
# expr=((vector-ref str->sym1 0) str (symbols))
# emit-tail-funcall
#    si   =-16
#    env  = ((str . -12) (str . -8) (str->sym1 . 4))
#    expr = (funcall (vector-ref str->sym1 0) str (symbols))
# emit-expr str
# emit-variable-ref
# env=((str . -12) (str . -8) (str->sym1 . 4))
# var=str
    movl -12(%esp), %eax  # stack load str
# end emit-variable-ref
    mov %eax, -24(%esp)    # arg 
# emit-expr (symbols)
    movl symbols, %eax
    mov %eax, -28(%esp)    # arg 
# emit-expr (vector-ref str->sym1 0)
# emit-expr str->sym1
# emit-variable-ref
# env=((str . -12) (str . -8) (str->sym1 . 4))
# var=str->sym1
    movl 2(%edi), %eax  # frame load str->sym1
# end emit-variable-ref
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, %edi  # evaluated funcall op -> %edi
# emit-shift-args:  argc=2   si=-24  delta=16
    mov -24(%esp), %ebx  # shift arg
    mov %ebx, -8(%esp)  # down to base
# emit-shift-args:  argc=1   si=-28  delta=16
    mov -28(%esp), %ebx  # shift arg
    mov %ebx, -12(%esp)  # down to base
# emit-shift-args:  argc=0   si=-32  delta=16
    jmp *-2(%edi)  # tail-funcall
     ret   # return thru stack
    .align 4,0x90
_L_959:
    movl -24(%esp), %ebx
    movl -28(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((str->sym . -20) (str->sym1 . -16) (ss= . -12) (s= . -8))
# emit-expr (begin (vector-ref str->sym 0))
# emit-begin
#   expr=(begin (vector-ref str->sym 0))
#   env=((str->sym . -20) (str->sym1 . -16) (ss= . -12) (s= . -8))
# emit-expr (vector-ref str->sym 0)
# emit-expr str->sym
# emit-variable-ref
# env=((str->sym . -20) (str->sym1 . -16) (ss= . -12) (s= . -8))
# var=str->sym
    movl -20(%esp), %eax  # stack load str->sym
# end emit-variable-ref
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((str->sym . -20) (str->sym1 . -16) (ss= . -12) (s= . -8))
    movl %eax, s2sym
# emit-expr (let ((a (string->symbol "goo")) (b (string->symbol "ber"))) #t)
# emit-let
#  si   = -8
#  env  = ()
#  bindings = ((a (string->symbol "goo")) (b (string->symbol "ber")))
#  body = #t
# emit-expr (string->symbol "goo")
# funcall
#    si   =-8
#    env  = ()
#    expr = (funcall (primitive-str->sym) "goo")
# emit-expr (primitive-str->sym)
    movl s2sym, %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in closure slot
# emit-expr "goo"
# string literal
    jmp _L_961
    .align 8,0x90
_L_960 :
    .int 12
    .ascii "goo"
_L_961:
    movl $_L_960, %eax
    orl $6, %eax
    mov %eax, -20(%esp)    # arg goo
    movl -16(%esp), %edi   # load new closure to %edi
    add $-8, %esp    # adjust base
    call *-2(%edi)        # call thru closure ptr
    add $8, %esp    # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -8(%esp)  # stack save
# emit-expr (string->symbol "ber")
# funcall
#    si   =-12
#    env  = ()
#    expr = (funcall (primitive-str->sym) "ber")
# emit-expr (primitive-str->sym)
    movl s2sym, %eax
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "ber"
# string literal
    jmp _L_963
    .align 8,0x90
_L_962 :
    .int 12
    .ascii "ber"
_L_963:
    movl $_L_962, %eax
    orl $6, %eax
    mov %eax, -24(%esp)    # arg ber
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp    # adjust base
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp    # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)  # stack save
# emit-expr #t
    movl $111, %eax     # immed #t
    ret
    .text
    .align 4,0x90
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
