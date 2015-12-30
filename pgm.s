# (symbols)
# == explicit-begins  ==>
# (symbols)
# == eliminate-let*  ==>
# (symbols)
# == eliminate-shadowing  ==>
# (symbols)
# == vectorize-letrec  ==>
# (symbols)
# == eliminate-set!  ==>
# (symbols)
# == close-free-variables  ==>
# (symbols)
# == eliminate-quote  ==>
# (symbols)
# == eliminate-when/unless  ==>
# (symbols)
# == eliminate-cond  ==>
# (symbols)
# emit-scheme-entry
    .text
    .align 4,0x90
    .globl _L_scheme_entry
_L_scheme_entry:
    movl $0x66666666, %edi  # dummy for debugging
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
    jmp _L_1
    .align 8,0x90
_L_0 :
    .int 12
    .ascii "nil"
_L_1:
    movl $_L_0, %eax
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
# == explicit-begins  ==>
# (letrec (($slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) ($si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) ($si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if ($si= s1 s2 i) ($si<n= s1 s2 (fx+ i 1) n) #f)))) ($ss= (lambda (s1 s2) (if ($slen= s1 s2) ($si<n= s1 s2 0 (string-length s1)) #f))) ($str->sym1 (lambda (str symlist) (if ($ss= str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let* ((new-sym (make-symbol str #f)) (new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym)) ($str->sym1 str (cdr symlist))))))) (lambda (str) ($str->sym1 str (symbols))))
# == eliminate-let*  ==>
# (letrec (($slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) ($si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) ($si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if ($si= s1 s2 i) ($si<n= s1 s2 (fx+ i 1) n) #f)))) ($ss= (lambda (s1 s2) (if ($slen= s1 s2) ($si<n= s1 s2 0 (string-length s1)) #f))) ($str->sym1 (lambda (str symlist) (if ($ss= str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ($str->sym1 str (cdr symlist))))))) (lambda (str) ($str->sym1 str (symbols))))
# == eliminate-shadowing  ==>
# (letrec (($slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) ($si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) ($si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if ($si= s1 s2 i) ($si<n= s1 s2 (fx+ i 1) n) #f)))) ($ss= (lambda (s1 s2) (if ($slen= s1 s2) ($si<n= s1 s2 0 (string-length s1)) #f))) ($str->sym1 (lambda (str symlist) (if ($ss= str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ($str->sym1 str (cdr symlist))))))) (lambda (str) ($str->sym1 str (symbols))))
# == vectorize-letrec  ==>
# (let (($slen= (make-vector 1)) ($si= (make-vector 1)) ($si<n= (make-vector 1)) ($ss= (make-vector 1)) ($str->sym1 (make-vector 1))) (begin (begin (vector-set! $slen= 0 (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (vector-set! $si= 0 (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (vector-set! $si<n= 0 (lambda (s1 s2 i n) (if (fx= i n) #t (if ((vector-ref $si= 0) s1 s2 i) ((vector-ref $si<n= 0) s1 s2 (fx+ i 1) n) #f)))) (vector-set! $ss= 0 (lambda (s1 s2) (if ((vector-ref $slen= 0) s1 s2) ((vector-ref $si<n= 0) s1 s2 0 (string-length s1)) #f))) (vector-set! $str->sym1 0 (lambda (str symlist) (if ((vector-ref $ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref $str->sym1 0) str (cdr symlist))))))) (lambda (str) ((vector-ref $str->sym1 0) str (symbols)))))
# == eliminate-set!  ==>
# (let (($slen= (make-vector 1)) ($si= (make-vector 1)) ($si<n= (make-vector 1)) ($ss= (make-vector 1)) ($str->sym1 (make-vector 1))) (begin (begin (vector-set! $slen= 0 (lambda (s1 s2) (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! $si= 0 (lambda (s1 s2 i) (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! $si<n= 0 (lambda (s1 s2 i n) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref $si= 0) s1 s2 i) ((vector-ref $si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! $ss= 0 (lambda (s1 s2) (let ((s1 s1) (s2 s2)) (if ((vector-ref $slen= 0) s1 s2) ((vector-ref $si<n= 0) s1 s2 0 (string-length s1)) #f)))) (vector-set! $str->sym1 0 (lambda (str symlist) (let ((str str) (symlist symlist)) (if ((vector-ref $ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref $str->sym1 0) str (cdr symlist)))))))) (lambda (str) (let ((str str)) ((vector-ref $str->sym1 0) str (symbols))))))
# == close-free-variables  ==>
# (let (($slen= (make-vector 1)) ($si= (make-vector 1)) ($si<n= (make-vector 1)) ($ss= (make-vector 1)) ($str->sym1 (make-vector 1))) (begin (begin (vector-set! $slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! $si<n= 0 (closure (s1 s2 i n) ($si= $si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref $si= 0) s1 s2 i) ((vector-ref $si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! $ss= 0 (closure (s1 s2) ($slen= $si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref $slen= 0) s1 s2) ((vector-ref $si<n= 0) s1 s2 0 (string-length s1)) #f)))) (vector-set! $str->sym1 0 (closure (str symlist) ($ss= $str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref $ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref $str->sym1 0) str (cdr symlist)))))))) (closure (str) ($str->sym1) (let ((str str)) ((vector-ref $str->sym1 0) str (symbols))))))
# == eliminate-quote  ==>
# (let (($slen= (make-vector 1)) ($si= (make-vector 1)) ($si<n= (make-vector 1)) ($ss= (make-vector 1)) ($str->sym1 (make-vector 1))) (begin (begin (vector-set! $slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! $si<n= 0 (closure (s1 s2 i n) ($si= $si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref $si= 0) s1 s2 i) ((vector-ref $si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! $ss= 0 (closure (s1 s2) ($slen= $si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref $slen= 0) s1 s2) ((vector-ref $si<n= 0) s1 s2 0 (string-length s1)) #f)))) (vector-set! $str->sym1 0 (closure (str symlist) ($ss= $str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref $ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref $str->sym1 0) str (cdr symlist)))))))) (closure (str) ($str->sym1) (let ((str str)) ((vector-ref $str->sym1 0) str (symbols))))))
# == eliminate-when/unless  ==>
# (let (($slen= (make-vector 1)) ($si= (make-vector 1)) ($si<n= (make-vector 1)) ($ss= (make-vector 1)) ($str->sym1 (make-vector 1))) (begin (begin (vector-set! $slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! $si<n= 0 (closure (s1 s2 i n) ($si= $si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref $si= 0) s1 s2 i) ((vector-ref $si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! $ss= 0 (closure (s1 s2) ($slen= $si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref $slen= 0) s1 s2) ((vector-ref $si<n= 0) s1 s2 0 (string-length s1)) #f)))) (vector-set! $str->sym1 0 (closure (str symlist) ($ss= $str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref $ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref $str->sym1 0) str (cdr symlist)))))))) (closure (str) ($str->sym1) (let ((str str)) ((vector-ref $str->sym1 0) str (symbols))))))
# == eliminate-cond  ==>
# (let (($slen= (make-vector 1)) ($si= (make-vector 1)) ($si<n= (make-vector 1)) ($ss= (make-vector 1)) ($str->sym1 (make-vector 1))) (begin (begin (vector-set! $slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! $si<n= 0 (closure (s1 s2 i n) ($si= $si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref $si= 0) s1 s2 i) ((vector-ref $si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! $ss= 0 (closure (s1 s2) ($slen= $si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref $slen= 0) s1 s2) ((vector-ref $si<n= 0) s1 s2 0 (string-length s1)) #f)))) (vector-set! $str->sym1 0 (closure (str symlist) ($ss= $str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref $ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref $str->sym1 0) str (cdr symlist)))))))) (closure (str) ($str->sym1) (let ((str str)) ((vector-ref $str->sym1 0) str (symbols))))))
# emit-expr (let (($slen= (make-vector 1)) ($si= (make-vector 1)) ($si<n= (make-vector 1)) ($ss= (make-vector 1)) ($str->sym1 (make-vector 1))) (begin (begin (vector-set! $slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! $si<n= 0 (closure (s1 s2 i n) ($si= $si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref $si= 0) s1 s2 i) ((vector-ref $si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! $ss= 0 (closure (s1 s2) ($slen= $si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref $slen= 0) s1 s2) ((vector-ref $si<n= 0) s1 s2 0 (string-length s1)) #f)))) (vector-set! $str->sym1 0 (closure (str symlist) ($ss= $str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref $ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref $str->sym1 0) str (cdr symlist)))))))) (closure (str) ($str->sym1) (let ((str str)) ((vector-ref $str->sym1 0) str (symbols))))))
# emit-let
#  si   = -8
#  env  = ()
#  bindings = (($slen= (make-vector 1)) ($si= (make-vector 1)) ($si<n= (make-vector 1)) ($ss= (make-vector 1)) ($str->sym1 (make-vector 1)))
#  body = (begin (begin (vector-set! $slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! $si<n= 0 (closure (s1 s2 i n) ($si= $si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref $si= 0) s1 s2 i) ((vector-ref $si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! $ss= 0 (closure (s1 s2) ($slen= $si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref $slen= 0) s1 s2) ((vector-ref $si<n= 0) s1 s2 0 (string-length s1)) #f)))) (vector-set! $str->sym1 0 (closure (str symlist) ($ss= $str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref $ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref $str->sym1 0) str (cdr symlist)))))))) (closure (str) ($str->sym1) (let ((str str)) ((vector-ref $str->sym1 0) str (symbols)))))
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
    movl %eax, -24(%esp)  # stack save
# emit-expr (begin (begin (vector-set! $slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! $si<n= 0 (closure (s1 s2 i n) ($si= $si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref $si= 0) s1 s2 i) ((vector-ref $si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! $ss= 0 (closure (s1 s2) ($slen= $si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref $slen= 0) s1 s2) ((vector-ref $si<n= 0) s1 s2 0 (string-length s1)) #f)))) (vector-set! $str->sym1 0 (closure (str symlist) ($ss= $str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref $ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref $str->sym1 0) str (cdr symlist)))))))) (closure (str) ($str->sym1) (let ((str str)) ((vector-ref $str->sym1 0) str (symbols)))))
# emit-begin
#   expr=(begin (begin (vector-set! $slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! $si<n= 0 (closure (s1 s2 i n) ($si= $si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref $si= 0) s1 s2 i) ((vector-ref $si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! $ss= 0 (closure (s1 s2) ($slen= $si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref $slen= 0) s1 s2) ((vector-ref $si<n= 0) s1 s2 0 (string-length s1)) #f)))) (vector-set! $str->sym1 0 (closure (str symlist) ($ss= $str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref $ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref $str->sym1 0) str (cdr symlist)))))))) (closure (str) ($str->sym1) (let ((str str)) ((vector-ref $str->sym1 0) str (symbols)))))
#   env=(($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# emit-expr (begin (vector-set! $slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! $si<n= 0 (closure (s1 s2 i n) ($si= $si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref $si= 0) s1 s2 i) ((vector-ref $si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! $ss= 0 (closure (s1 s2) ($slen= $si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref $slen= 0) s1 s2) ((vector-ref $si<n= 0) s1 s2 0 (string-length s1)) #f)))) (vector-set! $str->sym1 0 (closure (str symlist) ($ss= $str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref $ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref $str->sym1 0) str (cdr symlist))))))))
# emit-begin
#   expr=(begin (vector-set! $slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))) (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! $si<n= 0 (closure (s1 s2 i n) ($si= $si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref $si= 0) s1 s2 i) ((vector-ref $si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! $ss= 0 (closure (s1 s2) ($slen= $si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref $slen= 0) s1 s2) ((vector-ref $si<n= 0) s1 s2 0 (string-length s1)) #f)))) (vector-set! $str->sym1 0 (closure (str symlist) ($ss= $str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref $ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref $str->sym1 0) str (cdr symlist))))))))
#   env=(($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# emit-expr (vector-set! $slen= 0 (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2)))))
# emit-expr $slen=
# emit-variable-ref
# env=(($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=$slen=
    movl -8(%esp), %eax  # stack load $slen=
# end emit-variable-ref
    movl %eax, -28(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl %eax, -32(%esp)
# emit-expr (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))
# emit-closure
# si = -36
# env = (($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr = (closure (s1 s2) () (let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2))))
    movl $_L_2, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_3            # jump around closure body
_L_2:
# emit-tail-expr
# si=-16
# env=((s2 . -12) (s1 . -8) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr=(let ((s1 s1) (s2 s2)) (fx= (string-length s1) (string-length s2)))
# emit-tail-let
#  si   = -16
#  env  = ((s2 . -12) (s1 . -8) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
#  bindings = ((s1 s1) (s2 s2))
#  body = (fx= (string-length s1) (string-length s2))
# emit-expr s1
# emit-variable-ref
# env=((s2 . -12) (s1 . -8) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=s1
    movl -8(%esp), %eax  # stack load s1
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr s2
# emit-variable-ref
# env=((s2 . -12) (s1 . -8) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=s2
    movl -12(%esp), %eax  # stack load s2
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr=(fx= (string-length s1) (string-length s2))
# tail primcall
# emit-expr (string-length s2)
# emit-expr s2
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=s2
    movl -20(%esp), %eax  # stack load s2
# end emit-variable-ref
    movl -6(%eax), %eax
    movl %eax, -24(%esp)
# emit-expr (string-length s1)
# emit-expr s1
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
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
_L_3:
    movl -28(%esp), %ebx
    movl -32(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! $si<n= 0 (closure (s1 s2 i n) ($si= $si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref $si= 0) s1 s2 i) ((vector-ref $si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! $ss= 0 (closure (s1 s2) ($slen= $si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref $slen= 0) s1 s2) ((vector-ref $si<n= 0) s1 s2 0 (string-length s1)) #f)))) (vector-set! $str->sym1 0 (closure (str symlist) ($ss= $str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref $ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref $str->sym1 0) str (cdr symlist))))))))
# emit-begin
#   expr=(begin (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))) (vector-set! $si<n= 0 (closure (s1 s2 i n) ($si= $si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref $si= 0) s1 s2 i) ((vector-ref $si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! $ss= 0 (closure (s1 s2) ($slen= $si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref $slen= 0) s1 s2) ((vector-ref $si<n= 0) s1 s2 0 (string-length s1)) #f)))) (vector-set! $str->sym1 0 (closure (str symlist) ($ss= $str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref $ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref $str->sym1 0) str (cdr symlist))))))))
#   env=(($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# emit-expr (vector-set! $si= 0 (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i)))))
# emit-expr $si=
# emit-variable-ref
# env=(($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=$si=
    movl -12(%esp), %eax  # stack load $si=
# end emit-variable-ref
    movl %eax, -28(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl %eax, -32(%esp)
# emit-expr (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))
# emit-closure
# si = -36
# env = (($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr = (closure (s1 s2 i) () (let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i))))
    movl $_L_4, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_5            # jump around closure body
_L_4:
# emit-tail-expr
# si=-20
# env=((i . -16) (s2 . -12) (s1 . -8) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr=(let ((s1 s1) (s2 s2) (i i)) (char=? (string-ref s1 i) (string-ref s2 i)))
# emit-tail-let
#  si   = -20
#  env  = ((i . -16) (s2 . -12) (s1 . -8) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
#  bindings = ((s1 s1) (s2 s2) (i i))
#  body = (char=? (string-ref s1 i) (string-ref s2 i))
# emit-expr s1
# emit-variable-ref
# env=((i . -16) (s2 . -12) (s1 . -8) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=s1
    movl -8(%esp), %eax  # stack load s1
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr s2
# emit-variable-ref
# env=((i . -16) (s2 . -12) (s1 . -8) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=s2
    movl -12(%esp), %eax  # stack load s2
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr i
# emit-variable-ref
# env=((i . -16) (s2 . -12) (s1 . -8) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=i
    movl -16(%esp), %eax  # stack load i
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr=(char=? (string-ref s1 i) (string-ref s2 i))
# tail primcall
# char= c1=(string-ref s1 i) c2=(string-ref s2 i)
# emit-expr (string-ref s1 i)
# emit-expr s1
# emit-variable-ref
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=s1
    movl -20(%esp), %eax  # stack load s1
# end emit-variable-ref
    movl %eax, -32(%esp)
# emit-expr i
# emit-variable-ref
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
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
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=s2
    movl -24(%esp), %eax  # stack load s2
# end emit-variable-ref
    movl %eax, -36(%esp)
# emit-expr i
# emit-variable-ref
# env=((i . -28) (s2 . -24) (s1 . -20) (i . -16) (s2 . -12) (s1 . -8) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
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
_L_5:
    movl -28(%esp), %ebx
    movl -32(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! $si<n= 0 (closure (s1 s2 i n) ($si= $si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref $si= 0) s1 s2 i) ((vector-ref $si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! $ss= 0 (closure (s1 s2) ($slen= $si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref $slen= 0) s1 s2) ((vector-ref $si<n= 0) s1 s2 0 (string-length s1)) #f)))) (vector-set! $str->sym1 0 (closure (str symlist) ($ss= $str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref $ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref $str->sym1 0) str (cdr symlist))))))))
# emit-begin
#   expr=(begin (vector-set! $si<n= 0 (closure (s1 s2 i n) ($si= $si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref $si= 0) s1 s2 i) ((vector-ref $si<n= 0) s1 s2 (fx+ i 1) n) #f))))) (vector-set! $ss= 0 (closure (s1 s2) ($slen= $si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref $slen= 0) s1 s2) ((vector-ref $si<n= 0) s1 s2 0 (string-length s1)) #f)))) (vector-set! $str->sym1 0 (closure (str symlist) ($ss= $str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref $ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref $str->sym1 0) str (cdr symlist))))))))
#   env=(($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# emit-expr (vector-set! $si<n= 0 (closure (s1 s2 i n) ($si= $si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref $si= 0) s1 s2 i) ((vector-ref $si<n= 0) s1 s2 (fx+ i 1) n) #f)))))
# emit-expr $si<n=
# emit-variable-ref
# env=(($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=$si<n=
    movl -16(%esp), %eax  # stack load $si<n=
# end emit-variable-ref
    movl %eax, -28(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl %eax, -32(%esp)
# emit-expr (closure (s1 s2 i n) ($si= $si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref $si= 0) s1 s2 i) ((vector-ref $si<n= 0) s1 s2 (fx+ i 1) n) #f))))
# emit-closure
# si = -36
# env = (($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr = (closure (s1 s2 i n) ($si= $si<n=) (let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref $si= 0) s1 s2 i) ((vector-ref $si<n= 0) s1 s2 (fx+ i 1) n) #f))))
    movl $_L_6, 0(%ebp)  # closure label
# emit-variable-ref
# env=(($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=$si=
    movl -12(%esp), %eax  # stack load $si=
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # $si=
# emit-variable-ref
# env=(($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=$si<n=
    movl -16(%esp), %eax  # stack load $si<n=
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # $si<n=
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_7            # jump around closure body
_L_6:
# emit-tail-expr
# si=-24
# env=((n . -20) (i . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($si= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr=(let ((s1 s1) (s2 s2) (i i) (n n)) (if (fx= i n) #t (if ((vector-ref $si= 0) s1 s2 i) ((vector-ref $si<n= 0) s1 s2 (fx+ i 1) n) #f)))
# emit-tail-let
#  si   = -24
#  env  = ((n . -20) (i . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($si= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
#  bindings = ((s1 s1) (s2 s2) (i i) (n n))
#  body = (if (fx= i n) #t (if ((vector-ref $si= 0) s1 s2 i) ((vector-ref $si<n= 0) s1 s2 (fx+ i 1) n) #f))
# emit-expr s1
# emit-variable-ref
# env=((n . -20) (i . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($si= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=s1
    movl -8(%esp), %eax  # stack load s1
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr s2
# emit-variable-ref
# env=((n . -20) (i . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($si= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=s2
    movl -12(%esp), %eax  # stack load s2
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-expr i
# emit-variable-ref
# env=((n . -20) (i . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($si= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=i
    movl -16(%esp), %eax  # stack load i
# end emit-variable-ref
    movl %eax, -32(%esp)  # stack save
# emit-expr n
# emit-variable-ref
# env=((n . -20) (i . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($si= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=n
    movl -20(%esp), %eax  # stack load n
# end emit-variable-ref
    movl %eax, -36(%esp)  # stack save
# emit-tail-expr
# si=-40
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($si= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr=(if (fx= i n) #t (if ((vector-ref $si= 0) s1 s2 i) ((vector-ref $si<n= 0) s1 s2 (fx+ i 1) n) #f))
# emit-expr (fx= i n)
# emit-expr n
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($si= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=n
    movl -36(%esp), %eax  # stack load n
# end emit-variable-ref
    movl %eax, -40(%esp)
# emit-expr i
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($si= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=i
    movl -32(%esp), %eax  # stack load i
# end emit-variable-ref
    cmp -40(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_8
# emit-tail-expr
# si=-40
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($si= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr=#t
    movl $111, %eax     # immed #t
    ret                  # tail return
    jmp _L_9
_L_8:
# emit-tail-expr
# si=-40
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($si= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr=(if ((vector-ref $si= 0) s1 s2 i) ((vector-ref $si<n= 0) s1 s2 (fx+ i 1) n) #f)
# emit-expr ((vector-ref $si= 0) s1 s2 i)
# funcall
#    si   =-40
#    env  = ((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($si= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
#    expr = (funcall (vector-ref $si= 0) s1 s2 i)
# emit-expr (vector-ref $si= 0)
# emit-expr $si=
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($si= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=$si=
    movl 2(%edi), %eax  # frame load $si=
# end emit-variable-ref
    movl %eax, -48(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl -48(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -48(%esp)  # stash funcall-oper in closure slot
# emit-expr s1
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($si= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=s1
    movl -24(%esp), %eax  # stack load s1
# end emit-variable-ref
    mov %eax, -52(%esp)  # arg s1
# emit-expr s2
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($si= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=s2
    movl -28(%esp), %eax  # stack load s2
# end emit-variable-ref
    mov %eax, -56(%esp)  # arg s2
# emit-expr i
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($si= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
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
    je _L_10
# emit-tail-expr
# si=-40
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($si= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr=((vector-ref $si<n= 0) s1 s2 (fx+ i 1) n)
# emit-tail-funcall
#    si   =-40
#    env  = ((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($si= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
#    expr = (funcall (vector-ref $si<n= 0) s1 s2 (fx+ i 1) n)
# emit-expr (vector-ref $si<n= 0)
# emit-expr $si<n=
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($si= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=$si<n=
    movl 6(%edi), %eax  # frame load $si<n=
# end emit-variable-ref
    movl %eax, -40(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl -40(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -40(%esp)  # stash funcall-oper in next closure slot
# emit-expr s1
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($si= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=s1
    movl -24(%esp), %eax  # stack load s1
# end emit-variable-ref
    mov %eax, -44(%esp)    # arg s1
# emit-expr s2
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($si= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
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
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($si= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=i
    movl -32(%esp), %eax  # stack load i
# end emit-variable-ref
    addl -52(%esp), %eax  # fx+ arg1 arg2
    mov %eax, -52(%esp)    # arg (fx+ i 1)
# emit-expr n
# emit-variable-ref
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($si= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
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
    jmp _L_11
_L_10:
# emit-tail-expr
# si=-40
# env=((n . -36) (i . -32) (s2 . -28) (s1 . -24) (n . -20) (i . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($si= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # tail return
_L_11:
_L_9:
    .align 4,0x90
_L_7:
    movl -28(%esp), %ebx
    movl -32(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! $ss= 0 (closure (s1 s2) ($slen= $si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref $slen= 0) s1 s2) ((vector-ref $si<n= 0) s1 s2 0 (string-length s1)) #f)))) (vector-set! $str->sym1 0 (closure (str symlist) ($ss= $str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref $ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref $str->sym1 0) str (cdr symlist))))))))
# emit-begin
#   expr=(begin (vector-set! $ss= 0 (closure (s1 s2) ($slen= $si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref $slen= 0) s1 s2) ((vector-ref $si<n= 0) s1 s2 0 (string-length s1)) #f)))) (vector-set! $str->sym1 0 (closure (str symlist) ($ss= $str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref $ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref $str->sym1 0) str (cdr symlist))))))))
#   env=(($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# emit-expr (vector-set! $ss= 0 (closure (s1 s2) ($slen= $si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref $slen= 0) s1 s2) ((vector-ref $si<n= 0) s1 s2 0 (string-length s1)) #f))))
# emit-expr $ss=
# emit-variable-ref
# env=(($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=$ss=
    movl -20(%esp), %eax  # stack load $ss=
# end emit-variable-ref
    movl %eax, -28(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl %eax, -32(%esp)
# emit-expr (closure (s1 s2) ($slen= $si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref $slen= 0) s1 s2) ((vector-ref $si<n= 0) s1 s2 0 (string-length s1)) #f)))
# emit-closure
# si = -36
# env = (($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr = (closure (s1 s2) ($slen= $si<n=) (let ((s1 s1) (s2 s2)) (if ((vector-ref $slen= 0) s1 s2) ((vector-ref $si<n= 0) s1 s2 0 (string-length s1)) #f)))
    movl $_L_12, 0(%ebp)  # closure label
# emit-variable-ref
# env=(($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=$slen=
    movl -8(%esp), %eax  # stack load $slen=
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # $slen=
# emit-variable-ref
# env=(($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=$si<n=
    movl -16(%esp), %eax  # stack load $si<n=
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # $si<n=
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_13            # jump around closure body
_L_12:
# emit-tail-expr
# si=-16
# env=((s2 . -12) (s1 . -8) ($si<n= . 8) ($slen= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr=(let ((s1 s1) (s2 s2)) (if ((vector-ref $slen= 0) s1 s2) ((vector-ref $si<n= 0) s1 s2 0 (string-length s1)) #f))
# emit-tail-let
#  si   = -16
#  env  = ((s2 . -12) (s1 . -8) ($si<n= . 8) ($slen= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
#  bindings = ((s1 s1) (s2 s2))
#  body = (if ((vector-ref $slen= 0) s1 s2) ((vector-ref $si<n= 0) s1 s2 0 (string-length s1)) #f)
# emit-expr s1
# emit-variable-ref
# env=((s2 . -12) (s1 . -8) ($si<n= . 8) ($slen= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=s1
    movl -8(%esp), %eax  # stack load s1
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr s2
# emit-variable-ref
# env=((s2 . -12) (s1 . -8) ($si<n= . 8) ($slen= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=s2
    movl -12(%esp), %eax  # stack load s2
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($slen= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr=(if ((vector-ref $slen= 0) s1 s2) ((vector-ref $si<n= 0) s1 s2 0 (string-length s1)) #f)
# emit-expr ((vector-ref $slen= 0) s1 s2)
# funcall
#    si   =-24
#    env  = ((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($slen= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
#    expr = (funcall (vector-ref $slen= 0) s1 s2)
# emit-expr (vector-ref $slen= 0)
# emit-expr $slen=
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($slen= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=$slen=
    movl 2(%edi), %eax  # frame load $slen=
# end emit-variable-ref
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr s1
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($slen= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=s1
    movl -16(%esp), %eax  # stack load s1
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg s1
# emit-expr s2
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($slen= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
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
    je _L_14
# emit-tail-expr
# si=-24
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($slen= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr=((vector-ref $si<n= 0) s1 s2 0 (string-length s1))
# emit-tail-funcall
#    si   =-24
#    env  = ((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($slen= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
#    expr = (funcall (vector-ref $si<n= 0) s1 s2 0 (string-length s1))
# emit-expr (vector-ref $si<n= 0)
# emit-expr $si<n=
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($slen= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=$si<n=
    movl 6(%edi), %eax  # frame load $si<n=
# end emit-variable-ref
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr s1
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($slen= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=s1
    movl -16(%esp), %eax  # stack load s1
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg s1
# emit-expr s2
# emit-variable-ref
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($slen= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
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
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($slen= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
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
    jmp _L_15
_L_14:
# emit-tail-expr
# si=-24
# env=((s2 . -20) (s1 . -16) (s2 . -12) (s1 . -8) ($si<n= . 8) ($slen= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # tail return
_L_15:
    .align 4,0x90
_L_13:
    movl -28(%esp), %ebx
    movl -32(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! $str->sym1 0 (closure (str symlist) ($ss= $str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref $ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref $str->sym1 0) str (cdr symlist))))))))
# emit-begin
#   expr=(begin (vector-set! $str->sym1 0 (closure (str symlist) ($ss= $str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref $ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref $str->sym1 0) str (cdr symlist))))))))
#   env=(($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# emit-expr (vector-set! $str->sym1 0 (closure (str symlist) ($ss= $str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref $ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref $str->sym1 0) str (cdr symlist)))))))
# emit-expr $str->sym1
# emit-variable-ref
# env=(($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=$str->sym1
    movl -24(%esp), %eax  # stack load $str->sym1
# end emit-variable-ref
    movl %eax, -28(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl %eax, -32(%esp)
# emit-expr (closure (str symlist) ($ss= $str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref $ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref $str->sym1 0) str (cdr symlist))))))
# emit-closure
# si = -36
# env = (($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr = (closure (str symlist) ($ss= $str->sym1) (let ((str str) (symlist symlist)) (if ((vector-ref $ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref $str->sym1 0) str (cdr symlist))))))
    movl $_L_16, 0(%ebp)  # closure label
# emit-variable-ref
# env=(($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=$ss=
    movl -20(%esp), %eax  # stack load $ss=
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # $ss=
# emit-variable-ref
# env=(($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=$str->sym1
    movl -24(%esp), %eax  # stack load $str->sym1
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # $str->sym1
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_17            # jump around closure body
_L_16:
# emit-tail-expr
# si=-16
# env=((symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr=(let ((str str) (symlist symlist)) (if ((vector-ref $ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref $str->sym1 0) str (cdr symlist)))))
# emit-tail-let
#  si   = -16
#  env  = ((symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
#  bindings = ((str str) (symlist symlist))
#  body = (if ((vector-ref $ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref $str->sym1 0) str (cdr symlist))))
# emit-expr str
# emit-variable-ref
# env=((symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=str
    movl -8(%esp), %eax  # stack load str
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr symlist
# emit-variable-ref
# env=((symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=symlist
    movl -12(%esp), %eax  # stack load symlist
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr=(if ((vector-ref $ss= 0) str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref $str->sym1 0) str (cdr symlist))))
# emit-expr ((vector-ref $ss= 0) str (symbol->string (car symlist)))
# funcall
#    si   =-24
#    env  = ((symlist . -20) (str . -16) (symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
#    expr = (funcall (vector-ref $ss= 0) str (symbol->string (car symlist)))
# emit-expr (vector-ref $ss= 0)
# emit-expr $ss=
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=$ss=
    movl 2(%edi), %eax  # frame load $ss=
# end emit-variable-ref
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr str
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=str
    movl -16(%esp), %eax  # stack load str
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg str
# emit-expr (symbol->string (car symlist))
# symbol->string (car symlist)
# emit-expr (car symlist)
# emit-expr symlist
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
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
    je _L_18
# emit-tail-expr
# si=-24
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr=(car symlist)
# tail primcall
# emit-expr symlist
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=symlist
    movl -20(%esp), %eax  # stack load symlist
# end emit-variable-ref
    movl -1(%eax), %eax
#return from tail (car symlist)
    ret
    jmp _L_19
_L_18:
# emit-tail-expr
# si=-24
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr=(if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) ((vector-ref $str->sym1 0) str (cdr symlist)))
# emit-expr (null? (cdr symlist))
# emit-expr (cdr symlist)
# emit-expr symlist
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
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
    je _L_20
# emit-tail-expr
# si=-24
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr=(let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym)))
# emit-tail-let
#  si   = -24
#  env  = ((symlist . -20) (str . -16) (symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
#  bindings = ((new-sym (make-symbol str #f)))
#  body = (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))
# emit-expr (make-symbol str #f)
# make-symbol arg1=str arg2=#f
# emit-expr str
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
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
# env=((new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr=(let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))
# emit-tail-let
#  si   = -28
#  env  = ((new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
#  bindings = ((new-cdr (cons new-sym ())))
#  body = (begin (set-cdr! symlist new-cdr) new-sym)
# emit-expr (cons new-sym ())
# cons arg1=new-sym arg2=()
# emit-expr new-sym
# emit-variable-ref
# env=((new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
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
# env=((new-cdr . -28) (new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr=(begin (set-cdr! symlist new-cdr) new-sym)
# tail-begin (begin (set-cdr! symlist new-cdr) new-sym)
#   env=((new-cdr . -28) (new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# emit-expr (set-cdr! symlist new-cdr)
# emit-expr symlist
# emit-variable-ref
# env=((new-cdr . -28) (new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=symlist
    movl -20(%esp), %eax  # stack load symlist
# end emit-variable-ref
    movl %eax, -32(%esp)
# emit-expr new-cdr
# emit-variable-ref
# env=((new-cdr . -28) (new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=new-cdr
    movl -28(%esp), %eax  # stack load new-cdr
# end emit-variable-ref
    movl -32(%esp), %ebx
    movl %eax, 3(%ebx)
# emit-tail-expr
# si=-32
# env=((new-cdr . -28) (new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr=(begin new-sym)
# tail-begin (begin new-sym)
#   env=((new-cdr . -28) (new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# emit-tail-expr
# si=-32
# env=((new-cdr . -28) (new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr=new-sym
# emit-tail-variable-ref
# emit-variable-ref
# env=((new-cdr . -28) (new-sym . -24) (symlist . -20) (str . -16) (symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=new-sym
    movl -24(%esp), %eax  # stack load new-sym
# end emit-variable-ref
    ret
# end emit-tail-variable ref
     ret   # return thru stack
    jmp _L_21
_L_20:
# emit-tail-expr
# si=-24
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr=((vector-ref $str->sym1 0) str (cdr symlist))
# emit-tail-funcall
#    si   =-24
#    env  = ((symlist . -20) (str . -16) (symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
#    expr = (funcall (vector-ref $str->sym1 0) str (cdr symlist))
# emit-expr (vector-ref $str->sym1 0)
# emit-expr $str->sym1
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=$str->sym1
    movl 6(%edi), %eax  # frame load $str->sym1
# end emit-variable-ref
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr str
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=str
    movl -16(%esp), %eax  # stack load str
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg str
# emit-expr (cdr symlist)
# emit-expr symlist
# emit-variable-ref
# env=((symlist . -20) (str . -16) (symlist . -12) (str . -8) ($str->sym1 . 8) ($ss= . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
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
_L_21:
_L_19:
    .align 4,0x90
_L_17:
    movl -28(%esp), %ebx
    movl -32(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=(($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# emit-expr (begin (closure (str) ($str->sym1) (let ((str str)) ((vector-ref $str->sym1 0) str (symbols)))))
# emit-begin
#   expr=(begin (closure (str) ($str->sym1) (let ((str str)) ((vector-ref $str->sym1 0) str (symbols)))))
#   env=(($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# emit-expr (closure (str) ($str->sym1) (let ((str str)) ((vector-ref $str->sym1 0) str (symbols))))
# emit-closure
# si = -28
# env = (($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr = (closure (str) ($str->sym1) (let ((str str)) ((vector-ref $str->sym1 0) str (symbols))))
    movl $_L_22, 0(%ebp)  # closure label
# emit-variable-ref
# env=(($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=$str->sym1
    movl -24(%esp), %eax  # stack load $str->sym1
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # $str->sym1
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_23            # jump around closure body
_L_22:
# emit-tail-expr
# si=-12
# env=((str . -8) ($str->sym1 . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr=(let ((str str)) ((vector-ref $str->sym1 0) str (symbols)))
# emit-tail-let
#  si   = -12
#  env  = ((str . -8) ($str->sym1 . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
#  bindings = ((str str))
#  body = ((vector-ref $str->sym1 0) str (symbols))
# emit-expr str
# emit-variable-ref
# env=((str . -8) ($str->sym1 . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=str
    movl -8(%esp), %eax  # stack load str
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((str . -12) (str . -8) ($str->sym1 . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# expr=((vector-ref $str->sym1 0) str (symbols))
# emit-tail-funcall
#    si   =-16
#    env  = ((str . -12) (str . -8) ($str->sym1 . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
#    expr = (funcall (vector-ref $str->sym1 0) str (symbols))
# emit-expr (vector-ref $str->sym1 0)
# emit-expr $str->sym1
# emit-variable-ref
# env=((str . -12) (str . -8) ($str->sym1 . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=$str->sym1
    movl 2(%edi), %eax  # frame load $str->sym1
# end emit-variable-ref
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr str
# emit-variable-ref
# env=((str . -12) (str . -8) ($str->sym1 . 4) ($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
# var=str
    movl -12(%esp), %eax  # stack load str
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg str
# emit-expr (symbols)
    movl symbols, %eax
    mov %eax, -24(%esp)    # arg (symbols)
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
_L_23:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=(($str->sym1 . -24) ($ss= . -20) ($si<n= . -16) ($si= . -12) ($slen= . -8))
    movl %eax, s2sym
# emit-expr (symbols)
    movl symbols, %eax
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
