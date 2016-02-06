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
# (let ((f2828 (cons (make-symbol "nil" ()) ()))) (lambda () f2828))
# == vectorize-letrec  ==>
# (let ((f2828 (cons (make-symbol "nil" ()) ()))) (lambda () f2828))
# == eliminate-set!  ==>
# (let ((f2828 (cons (make-symbol "nil" ()) ()))) (lambda () (let () f2828)))
# == close-free-variables  ==>
# (let ((f2828 (cons (make-symbol "nil" ()) ()))) (closure () (f2828) (let () f2828)))
# == eliminate-quote  ==>
# (let ((f2828 (cons (make-symbol "nil" ()) ()))) (closure () (f2828) (let () f2828)))
# == eliminate-when/unless  ==>
# (let ((f2828 (cons (make-symbol "nil" ()) ()))) (closure () (f2828) (let () f2828)))
# == eliminate-cond  ==>
# (let ((f2828 (cons (make-symbol "nil" ()) ()))) (closure () (f2828) (let () f2828)))
# == external-symbols  ==>
# (let ((f2828 (cons (make-symbol "nil" ()) ()))) (closure () (f2828) (let () f2828)))
# emit-expr (let ((f2828 (cons (make-symbol "nil" ()) ()))) (closure () (f2828) (let () f2828)))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f2828 (cons (make-symbol "nil" ()) ())))
#  body = (closure () (f2828) (let () f2828))
# emit-expr (cons (make-symbol "nil" ()) ())
# cons arg1=(make-symbol "nil" ()) arg2=()
# emit-expr (make-symbol "nil" ())
# make-symbol arg1="nil" arg2=()
# emit-expr "nil"
# string literal
    jmp _L_24903
    .align 8,0x90
_L_24902 :
    .int 12
    .ascii "nil"
_L_24903:
    movl $_L_24902, %eax
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
# emit-expr (closure () (f2828) (let () f2828))
# emit-closure
# si = -4
# env = ((f2828 . 0))
# expr = (closure () (f2828) (let () f2828))
    movl $_L_24904, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f2828 . 0))
# var=f2828
    movl 0(%esp), %eax  # stack load f2828
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f2828
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_24905            # jump around closure body
_L_24904:
# check argument count
    cmp $0,%eax
    je _L_24906
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_24906:
# emit-tail-expr
# si=-8
# env=((f2828 . 4) (f2828 . 0))
# expr=(let () f2828)
# emit-tail-let
#  si   = -8
#  env  = ((f2828 . 4) (f2828 . 0))
#  bindings = ()
#  body = f2828
# emit-tail-expr
# si=-8
# env=((f2828 . 4) (f2828 . 0))
# expr=f2828
# emit-tail-variable-ref
# emit-variable-ref
# env=((f2828 . 4) (f2828 . 0))
# var=f2828
    movl 2(%edi), %eax  # frame load f2828
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    .align 4,0x90
_L_24905:
     movl %eax, symbols
# == explicit-begins  ==>
# (letrec ((slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if (si= s1 s2 i) (si<n= s1 s2 (fx+ i 1) n) #f)))) (ss= (lambda (s1 s2) (if (slen= s1 s2) (si<n= s1 s2 0 (string-length s1)) #f)))) ss=)
# == eliminate-let*  ==>
# (letrec ((slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if (si= s1 s2 i) (si<n= s1 s2 (fx+ i 1) n) #f)))) (ss= (lambda (s1 s2) (if (slen= s1 s2) (si<n= s1 s2 0 (string-length s1)) #f)))) ss=)
# == uniquify-variables  ==>
# (letrec ((f2832 (lambda (f2853 f2854) (fx= (string-length f2853) (string-length f2854)))) (f2831 (lambda (f2850 f2851 f2852) (char=? (string-ref f2850 f2852) (string-ref f2851 f2852)))) (f2830 (lambda (f2846 f2847 f2848 f2849) (if (fx= f2848 f2849) #t (if (f2831 f2846 f2847 f2848) (f2830 f2846 f2847 (fx+ f2848 1) f2849) #f)))) (f2829 (lambda (f2844 f2845) (if (f2832 f2844 f2845) (f2830 f2844 f2845 0 (string-length f2844)) #f)))) f2829)
# == vectorize-letrec  ==>
# (let ((f2832 (make-vector 1)) (f2831 (make-vector 1)) (f2830 (make-vector 1)) (f2829 (make-vector 1))) (begin (begin (vector-set! f2832 0 (lambda (f2853 f2854) (fx= (string-length f2853) (string-length f2854)))) (vector-set! f2831 0 (lambda (f2850 f2851 f2852) (char=? (string-ref f2850 f2852) (string-ref f2851 f2852)))) (vector-set! f2830 0 (lambda (f2846 f2847 f2848 f2849) (if (fx= f2848 f2849) #t (if ((vector-ref f2831 0) f2846 f2847 f2848) ((vector-ref f2830 0) f2846 f2847 (fx+ f2848 1) f2849) #f)))) (vector-set! f2829 0 (lambda (f2844 f2845) (if ((vector-ref f2832 0) f2844 f2845) ((vector-ref f2830 0) f2844 f2845 0 (string-length f2844)) #f)))) (vector-ref f2829 0)))
# == eliminate-set!  ==>
# (let ((f2832 (make-vector 1)) (f2831 (make-vector 1)) (f2830 (make-vector 1)) (f2829 (make-vector 1))) (begin (begin (vector-set! f2832 0 (lambda (f2853 f2854) (let ((f2853 f2853) (f2854 f2854)) (fx= (string-length f2853) (string-length f2854))))) (vector-set! f2831 0 (lambda (f2850 f2851 f2852) (let ((f2850 f2850) (f2851 f2851) (f2852 f2852)) (char=? (string-ref f2850 f2852) (string-ref f2851 f2852))))) (vector-set! f2830 0 (lambda (f2846 f2847 f2848 f2849) (let ((f2846 f2846) (f2847 f2847) (f2848 f2848) (f2849 f2849)) (if (fx= f2848 f2849) #t (if ((vector-ref f2831 0) f2846 f2847 f2848) ((vector-ref f2830 0) f2846 f2847 (fx+ f2848 1) f2849) #f))))) (vector-set! f2829 0 (lambda (f2844 f2845) (let ((f2844 f2844) (f2845 f2845)) (if ((vector-ref f2832 0) f2844 f2845) ((vector-ref f2830 0) f2844 f2845 0 (string-length f2844)) #f))))) (vector-ref f2829 0)))
# == close-free-variables  ==>
# (let ((f2832 (make-vector 1)) (f2831 (make-vector 1)) (f2830 (make-vector 1)) (f2829 (make-vector 1))) (begin (begin (vector-set! f2832 0 (closure (f2853 f2854) () (let ((f2853 f2853) (f2854 f2854)) (fx= (string-length f2853) (string-length f2854))))) (vector-set! f2831 0 (closure (f2850 f2851 f2852) () (let ((f2850 f2850) (f2851 f2851) (f2852 f2852)) (char=? (string-ref f2850 f2852) (string-ref f2851 f2852))))) (vector-set! f2830 0 (closure (f2846 f2847 f2848 f2849) (f2831 f2830) (let ((f2846 f2846) (f2847 f2847) (f2848 f2848) (f2849 f2849)) (if (fx= f2848 f2849) #t (if ((vector-ref f2831 0) f2846 f2847 f2848) ((vector-ref f2830 0) f2846 f2847 (fx+ f2848 1) f2849) #f))))) (vector-set! f2829 0 (closure (f2844 f2845) (f2832 f2830) (let ((f2844 f2844) (f2845 f2845)) (if ((vector-ref f2832 0) f2844 f2845) ((vector-ref f2830 0) f2844 f2845 0 (string-length f2844)) #f))))) (vector-ref f2829 0)))
# == eliminate-quote  ==>
# (let ((f2832 (make-vector 1)) (f2831 (make-vector 1)) (f2830 (make-vector 1)) (f2829 (make-vector 1))) (begin (begin (vector-set! f2832 0 (closure (f2853 f2854) () (let ((f2853 f2853) (f2854 f2854)) (fx= (string-length f2853) (string-length f2854))))) (vector-set! f2831 0 (closure (f2850 f2851 f2852) () (let ((f2850 f2850) (f2851 f2851) (f2852 f2852)) (char=? (string-ref f2850 f2852) (string-ref f2851 f2852))))) (vector-set! f2830 0 (closure (f2846 f2847 f2848 f2849) (f2831 f2830) (let ((f2846 f2846) (f2847 f2847) (f2848 f2848) (f2849 f2849)) (if (fx= f2848 f2849) #t (if ((vector-ref f2831 0) f2846 f2847 f2848) ((vector-ref f2830 0) f2846 f2847 (fx+ f2848 1) f2849) #f))))) (vector-set! f2829 0 (closure (f2844 f2845) (f2832 f2830) (let ((f2844 f2844) (f2845 f2845)) (if ((vector-ref f2832 0) f2844 f2845) ((vector-ref f2830 0) f2844 f2845 0 (string-length f2844)) #f))))) (vector-ref f2829 0)))
# == eliminate-when/unless  ==>
# (let ((f2832 (make-vector 1)) (f2831 (make-vector 1)) (f2830 (make-vector 1)) (f2829 (make-vector 1))) (begin (begin (vector-set! f2832 0 (closure (f2853 f2854) () (let ((f2853 f2853) (f2854 f2854)) (fx= (string-length f2853) (string-length f2854))))) (vector-set! f2831 0 (closure (f2850 f2851 f2852) () (let ((f2850 f2850) (f2851 f2851) (f2852 f2852)) (char=? (string-ref f2850 f2852) (string-ref f2851 f2852))))) (vector-set! f2830 0 (closure (f2846 f2847 f2848 f2849) (f2831 f2830) (let ((f2846 f2846) (f2847 f2847) (f2848 f2848) (f2849 f2849)) (if (fx= f2848 f2849) #t (if ((vector-ref f2831 0) f2846 f2847 f2848) ((vector-ref f2830 0) f2846 f2847 (fx+ f2848 1) f2849) #f))))) (vector-set! f2829 0 (closure (f2844 f2845) (f2832 f2830) (let ((f2844 f2844) (f2845 f2845)) (if ((vector-ref f2832 0) f2844 f2845) ((vector-ref f2830 0) f2844 f2845 0 (string-length f2844)) #f))))) (vector-ref f2829 0)))
# == eliminate-cond  ==>
# (let ((f2832 (make-vector 1)) (f2831 (make-vector 1)) (f2830 (make-vector 1)) (f2829 (make-vector 1))) (begin (begin (vector-set! f2832 0 (closure (f2853 f2854) () (let ((f2853 f2853) (f2854 f2854)) (fx= (string-length f2853) (string-length f2854))))) (vector-set! f2831 0 (closure (f2850 f2851 f2852) () (let ((f2850 f2850) (f2851 f2851) (f2852 f2852)) (char=? (string-ref f2850 f2852) (string-ref f2851 f2852))))) (vector-set! f2830 0 (closure (f2846 f2847 f2848 f2849) (f2831 f2830) (let ((f2846 f2846) (f2847 f2847) (f2848 f2848) (f2849 f2849)) (if (fx= f2848 f2849) #t (if ((vector-ref f2831 0) f2846 f2847 f2848) ((vector-ref f2830 0) f2846 f2847 (fx+ f2848 1) f2849) #f))))) (vector-set! f2829 0 (closure (f2844 f2845) (f2832 f2830) (let ((f2844 f2844) (f2845 f2845)) (if ((vector-ref f2832 0) f2844 f2845) ((vector-ref f2830 0) f2844 f2845 0 (string-length f2844)) #f))))) (vector-ref f2829 0)))
# == external-symbols  ==>
# (let ((f2832 (make-vector 1)) (f2831 (make-vector 1)) (f2830 (make-vector 1)) (f2829 (make-vector 1))) (begin (begin (vector-set! f2832 0 (closure (f2853 f2854) () (let ((f2853 f2853) (f2854 f2854)) (fx= (string-length f2853) (string-length f2854))))) (vector-set! f2831 0 (closure (f2850 f2851 f2852) () (let ((f2850 f2850) (f2851 f2851) (f2852 f2852)) (char=? (string-ref f2850 f2852) (string-ref f2851 f2852))))) (vector-set! f2830 0 (closure (f2846 f2847 f2848 f2849) (f2831 f2830) (let ((f2846 f2846) (f2847 f2847) (f2848 f2848) (f2849 f2849)) (if (fx= f2848 f2849) #t (if ((vector-ref f2831 0) f2846 f2847 f2848) ((vector-ref f2830 0) f2846 f2847 (fx+ f2848 1) f2849) #f))))) (vector-set! f2829 0 (closure (f2844 f2845) (f2832 f2830) (let ((f2844 f2844) (f2845 f2845)) (if ((vector-ref f2832 0) f2844 f2845) ((vector-ref f2830 0) f2844 f2845 0 (string-length f2844)) #f))))) (vector-ref f2829 0)))
# emit-expr (let ((f2832 (make-vector 1)) (f2831 (make-vector 1)) (f2830 (make-vector 1)) (f2829 (make-vector 1))) (begin (begin (vector-set! f2832 0 (closure (f2853 f2854) () (let ((f2853 f2853) (f2854 f2854)) (fx= (string-length f2853) (string-length f2854))))) (vector-set! f2831 0 (closure (f2850 f2851 f2852) () (let ((f2850 f2850) (f2851 f2851) (f2852 f2852)) (char=? (string-ref f2850 f2852) (string-ref f2851 f2852))))) (vector-set! f2830 0 (closure (f2846 f2847 f2848 f2849) (f2831 f2830) (let ((f2846 f2846) (f2847 f2847) (f2848 f2848) (f2849 f2849)) (if (fx= f2848 f2849) #t (if ((vector-ref f2831 0) f2846 f2847 f2848) ((vector-ref f2830 0) f2846 f2847 (fx+ f2848 1) f2849) #f))))) (vector-set! f2829 0 (closure (f2844 f2845) (f2832 f2830) (let ((f2844 f2844) (f2845 f2845)) (if ((vector-ref f2832 0) f2844 f2845) ((vector-ref f2830 0) f2844 f2845 0 (string-length f2844)) #f))))) (vector-ref f2829 0)))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f2832 (make-vector 1)) (f2831 (make-vector 1)) (f2830 (make-vector 1)) (f2829 (make-vector 1)))
#  body = (begin (begin (vector-set! f2832 0 (closure (f2853 f2854) () (let ((f2853 f2853) (f2854 f2854)) (fx= (string-length f2853) (string-length f2854))))) (vector-set! f2831 0 (closure (f2850 f2851 f2852) () (let ((f2850 f2850) (f2851 f2851) (f2852 f2852)) (char=? (string-ref f2850 f2852) (string-ref f2851 f2852))))) (vector-set! f2830 0 (closure (f2846 f2847 f2848 f2849) (f2831 f2830) (let ((f2846 f2846) (f2847 f2847) (f2848 f2848) (f2849 f2849)) (if (fx= f2848 f2849) #t (if ((vector-ref f2831 0) f2846 f2847 f2848) ((vector-ref f2830 0) f2846 f2847 (fx+ f2848 1) f2849) #f))))) (vector-set! f2829 0 (closure (f2844 f2845) (f2832 f2830) (let ((f2844 f2844) (f2845 f2845)) (if ((vector-ref f2832 0) f2844 f2845) ((vector-ref f2830 0) f2844 f2845 0 (string-length f2844)) #f))))) (vector-ref f2829 0))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_24907"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24907:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_24908
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24908:
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
    je "_L_24909"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24909:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_24910
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24910:
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
    je "_L_24911"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24911:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_24912
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24912:
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
    je "_L_24913"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24913:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_24914
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24914:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, -12(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f2832 0 (closure (f2853 f2854) () (let ((f2853 f2853) (f2854 f2854)) (fx= (string-length f2853) (string-length f2854))))) (vector-set! f2831 0 (closure (f2850 f2851 f2852) () (let ((f2850 f2850) (f2851 f2851) (f2852 f2852)) (char=? (string-ref f2850 f2852) (string-ref f2851 f2852))))) (vector-set! f2830 0 (closure (f2846 f2847 f2848 f2849) (f2831 f2830) (let ((f2846 f2846) (f2847 f2847) (f2848 f2848) (f2849 f2849)) (if (fx= f2848 f2849) #t (if ((vector-ref f2831 0) f2846 f2847 f2848) ((vector-ref f2830 0) f2846 f2847 (fx+ f2848 1) f2849) #f))))) (vector-set! f2829 0 (closure (f2844 f2845) (f2832 f2830) (let ((f2844 f2844) (f2845 f2845)) (if ((vector-ref f2832 0) f2844 f2845) ((vector-ref f2830 0) f2844 f2845 0 (string-length f2844)) #f))))) (vector-ref f2829 0))
# emit-begin
#   expr=(begin (begin (vector-set! f2832 0 (closure (f2853 f2854) () (let ((f2853 f2853) (f2854 f2854)) (fx= (string-length f2853) (string-length f2854))))) (vector-set! f2831 0 (closure (f2850 f2851 f2852) () (let ((f2850 f2850) (f2851 f2851) (f2852 f2852)) (char=? (string-ref f2850 f2852) (string-ref f2851 f2852))))) (vector-set! f2830 0 (closure (f2846 f2847 f2848 f2849) (f2831 f2830) (let ((f2846 f2846) (f2847 f2847) (f2848 f2848) (f2849 f2849)) (if (fx= f2848 f2849) #t (if ((vector-ref f2831 0) f2846 f2847 f2848) ((vector-ref f2830 0) f2846 f2847 (fx+ f2848 1) f2849) #f))))) (vector-set! f2829 0 (closure (f2844 f2845) (f2832 f2830) (let ((f2844 f2844) (f2845 f2845)) (if ((vector-ref f2832 0) f2844 f2845) ((vector-ref f2830 0) f2844 f2845 0 (string-length f2844)) #f))))) (vector-ref f2829 0))
#   env=((f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# emit-expr (begin (vector-set! f2832 0 (closure (f2853 f2854) () (let ((f2853 f2853) (f2854 f2854)) (fx= (string-length f2853) (string-length f2854))))) (vector-set! f2831 0 (closure (f2850 f2851 f2852) () (let ((f2850 f2850) (f2851 f2851) (f2852 f2852)) (char=? (string-ref f2850 f2852) (string-ref f2851 f2852))))) (vector-set! f2830 0 (closure (f2846 f2847 f2848 f2849) (f2831 f2830) (let ((f2846 f2846) (f2847 f2847) (f2848 f2848) (f2849 f2849)) (if (fx= f2848 f2849) #t (if ((vector-ref f2831 0) f2846 f2847 f2848) ((vector-ref f2830 0) f2846 f2847 (fx+ f2848 1) f2849) #f))))) (vector-set! f2829 0 (closure (f2844 f2845) (f2832 f2830) (let ((f2844 f2844) (f2845 f2845)) (if ((vector-ref f2832 0) f2844 f2845) ((vector-ref f2830 0) f2844 f2845 0 (string-length f2844)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f2832 0 (closure (f2853 f2854) () (let ((f2853 f2853) (f2854 f2854)) (fx= (string-length f2853) (string-length f2854))))) (vector-set! f2831 0 (closure (f2850 f2851 f2852) () (let ((f2850 f2850) (f2851 f2851) (f2852 f2852)) (char=? (string-ref f2850 f2852) (string-ref f2851 f2852))))) (vector-set! f2830 0 (closure (f2846 f2847 f2848 f2849) (f2831 f2830) (let ((f2846 f2846) (f2847 f2847) (f2848 f2848) (f2849 f2849)) (if (fx= f2848 f2849) #t (if ((vector-ref f2831 0) f2846 f2847 f2848) ((vector-ref f2830 0) f2846 f2847 (fx+ f2848 1) f2849) #f))))) (vector-set! f2829 0 (closure (f2844 f2845) (f2832 f2830) (let ((f2844 f2844) (f2845 f2845)) (if ((vector-ref f2832 0) f2844 f2845) ((vector-ref f2830 0) f2844 f2845 0 (string-length f2844)) #f)))))
#   env=((f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# emit-expr (vector-set! f2832 0 (closure (f2853 f2854) () (let ((f2853 f2853) (f2854 f2854)) (fx= (string-length f2853) (string-length f2854)))))
# emit-expr f2832
# emit-variable-ref
# env=((f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2832
    movl 0(%esp), %eax  # stack load f2832
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_24915
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24915:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_24916"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24916:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_24918
    cmp  $0,%eax
    jge _L_24917
_L_24918:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_24917:
    movl %eax, -20(%esp)
# emit-expr (closure (f2853 f2854) () (let ((f2853 f2853) (f2854 f2854)) (fx= (string-length f2853) (string-length f2854))))
# emit-closure
# si = -24
# env = ((f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# expr = (closure (f2853 f2854) () (let ((f2853 f2853) (f2854 f2854)) (fx= (string-length f2853) (string-length f2854))))
    movl $_L_24919, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_24920            # jump around closure body
_L_24919:
# check argument count
    cmp $8,%eax
    je _L_24921
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_24921:
# emit-tail-expr
# si=-16
# env=((f2854 . -12) (f2853 . -8) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# expr=(let ((f2853 f2853) (f2854 f2854)) (fx= (string-length f2853) (string-length f2854)))
# emit-tail-let
#  si   = -16
#  env  = ((f2854 . -12) (f2853 . -8) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
#  bindings = ((f2853 f2853) (f2854 f2854))
#  body = (fx= (string-length f2853) (string-length f2854))
# emit-expr f2853
# emit-variable-ref
# env=((f2854 . -12) (f2853 . -8) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2853
    movl -8(%esp), %eax  # stack load f2853
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f2854
# emit-variable-ref
# env=((f2854 . -12) (f2853 . -8) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2854
    movl -12(%esp), %eax  # stack load f2854
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f2854 . -20) (f2853 . -16) (f2854 . -12) (f2853 . -8) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# expr=(fx= (string-length f2853) (string-length f2854))
# tail primcall
# emit-expr (string-length f2854)
# emit-expr f2854
# emit-variable-ref
# env=((f2854 . -20) (f2853 . -16) (f2854 . -12) (f2853 . -8) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2854
    movl -20(%esp), %eax  # stack load f2854
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_24922
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24922:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_24923"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24923:
    movl %eax, -24(%esp)
# emit-expr (string-length f2853)
# emit-expr f2853
# emit-variable-ref
# env=((f2854 . -20) (f2853 . -16) (f2854 . -12) (f2853 . -8) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2853
    movl -16(%esp), %eax  # stack load f2853
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_24924
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24924:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_24925"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24925:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (fx= (string-length f2853) (string-length f2854))
    ret
    .align 4,0x90
_L_24920:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f2831 0 (closure (f2850 f2851 f2852) () (let ((f2850 f2850) (f2851 f2851) (f2852 f2852)) (char=? (string-ref f2850 f2852) (string-ref f2851 f2852))))) (vector-set! f2830 0 (closure (f2846 f2847 f2848 f2849) (f2831 f2830) (let ((f2846 f2846) (f2847 f2847) (f2848 f2848) (f2849 f2849)) (if (fx= f2848 f2849) #t (if ((vector-ref f2831 0) f2846 f2847 f2848) ((vector-ref f2830 0) f2846 f2847 (fx+ f2848 1) f2849) #f))))) (vector-set! f2829 0 (closure (f2844 f2845) (f2832 f2830) (let ((f2844 f2844) (f2845 f2845)) (if ((vector-ref f2832 0) f2844 f2845) ((vector-ref f2830 0) f2844 f2845 0 (string-length f2844)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f2831 0 (closure (f2850 f2851 f2852) () (let ((f2850 f2850) (f2851 f2851) (f2852 f2852)) (char=? (string-ref f2850 f2852) (string-ref f2851 f2852))))) (vector-set! f2830 0 (closure (f2846 f2847 f2848 f2849) (f2831 f2830) (let ((f2846 f2846) (f2847 f2847) (f2848 f2848) (f2849 f2849)) (if (fx= f2848 f2849) #t (if ((vector-ref f2831 0) f2846 f2847 f2848) ((vector-ref f2830 0) f2846 f2847 (fx+ f2848 1) f2849) #f))))) (vector-set! f2829 0 (closure (f2844 f2845) (f2832 f2830) (let ((f2844 f2844) (f2845 f2845)) (if ((vector-ref f2832 0) f2844 f2845) ((vector-ref f2830 0) f2844 f2845 0 (string-length f2844)) #f)))))
#   env=((f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# emit-expr (vector-set! f2831 0 (closure (f2850 f2851 f2852) () (let ((f2850 f2850) (f2851 f2851) (f2852 f2852)) (char=? (string-ref f2850 f2852) (string-ref f2851 f2852)))))
# emit-expr f2831
# emit-variable-ref
# env=((f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2831
    movl -4(%esp), %eax  # stack load f2831
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_24926
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24926:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_24927"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24927:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_24929
    cmp  $0,%eax
    jge _L_24928
_L_24929:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_24928:
    movl %eax, -20(%esp)
# emit-expr (closure (f2850 f2851 f2852) () (let ((f2850 f2850) (f2851 f2851) (f2852 f2852)) (char=? (string-ref f2850 f2852) (string-ref f2851 f2852))))
# emit-closure
# si = -24
# env = ((f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# expr = (closure (f2850 f2851 f2852) () (let ((f2850 f2850) (f2851 f2851) (f2852 f2852)) (char=? (string-ref f2850 f2852) (string-ref f2851 f2852))))
    movl $_L_24930, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_24931            # jump around closure body
_L_24930:
# check argument count
    cmp $12,%eax
    je _L_24932
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_24932:
# emit-tail-expr
# si=-20
# env=((f2852 . -16) (f2851 . -12) (f2850 . -8) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# expr=(let ((f2850 f2850) (f2851 f2851) (f2852 f2852)) (char=? (string-ref f2850 f2852) (string-ref f2851 f2852)))
# emit-tail-let
#  si   = -20
#  env  = ((f2852 . -16) (f2851 . -12) (f2850 . -8) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
#  bindings = ((f2850 f2850) (f2851 f2851) (f2852 f2852))
#  body = (char=? (string-ref f2850 f2852) (string-ref f2851 f2852))
# emit-expr f2850
# emit-variable-ref
# env=((f2852 . -16) (f2851 . -12) (f2850 . -8) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2850
    movl -8(%esp), %eax  # stack load f2850
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr f2851
# emit-variable-ref
# env=((f2852 . -16) (f2851 . -12) (f2850 . -8) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2851
    movl -12(%esp), %eax  # stack load f2851
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f2852
# emit-variable-ref
# env=((f2852 . -16) (f2851 . -12) (f2850 . -8) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2852
    movl -16(%esp), %eax  # stack load f2852
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((f2852 . -28) (f2851 . -24) (f2850 . -20) (f2852 . -16) (f2851 . -12) (f2850 . -8) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# expr=(char=? (string-ref f2850 f2852) (string-ref f2851 f2852))
# tail primcall
# char= c1=(string-ref f2850 f2852) c2=(string-ref f2851 f2852)
# emit-expr (string-ref f2850 f2852)
# emit-expr f2850
# emit-variable-ref
# env=((f2852 . -28) (f2851 . -24) (f2850 . -20) (f2852 . -16) (f2851 . -12) (f2850 . -8) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2850
    movl -20(%esp), %eax  # stack load f2850
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_24933
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24933:
    movl %eax, -32(%esp)
# emit-expr f2852
# emit-variable-ref
# env=((f2852 . -28) (f2851 . -24) (f2850 . -20) (f2852 . -16) (f2851 . -12) (f2850 . -8) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2852
    movl -28(%esp), %eax  # stack load f2852
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_24934"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24934:
# check bounds on string index
    movl -32(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_24936
    cmp  $0,%eax
    jge _L_24935
_L_24936:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_24935:
    sar $2, %eax
    movl -32(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_24937"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24937:
    movb %ah, -32(%esp)
# emit-expr (string-ref f2851 f2852)
# emit-expr f2851
# emit-variable-ref
# env=((f2852 . -28) (f2851 . -24) (f2850 . -20) (f2852 . -16) (f2851 . -12) (f2850 . -8) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2851
    movl -24(%esp), %eax  # stack load f2851
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_24938
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24938:
    movl %eax, -36(%esp)
# emit-expr f2852
# emit-variable-ref
# env=((f2852 . -28) (f2851 . -24) (f2850 . -20) (f2852 . -16) (f2851 . -12) (f2850 . -8) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2852
    movl -28(%esp), %eax  # stack load f2852
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_24939"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24939:
# check bounds on string index
    movl -36(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_24941
    cmp  $0,%eax
    jge _L_24940
_L_24941:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_24940:
    sar $2, %eax
    movl -36(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_24942"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24942:
    cmp %ah, -32(%esp)
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (char=? (string-ref f2850 f2852) (string-ref f2851 f2852))
    ret
    .align 4,0x90
_L_24931:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f2830 0 (closure (f2846 f2847 f2848 f2849) (f2831 f2830) (let ((f2846 f2846) (f2847 f2847) (f2848 f2848) (f2849 f2849)) (if (fx= f2848 f2849) #t (if ((vector-ref f2831 0) f2846 f2847 f2848) ((vector-ref f2830 0) f2846 f2847 (fx+ f2848 1) f2849) #f))))) (vector-set! f2829 0 (closure (f2844 f2845) (f2832 f2830) (let ((f2844 f2844) (f2845 f2845)) (if ((vector-ref f2832 0) f2844 f2845) ((vector-ref f2830 0) f2844 f2845 0 (string-length f2844)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f2830 0 (closure (f2846 f2847 f2848 f2849) (f2831 f2830) (let ((f2846 f2846) (f2847 f2847) (f2848 f2848) (f2849 f2849)) (if (fx= f2848 f2849) #t (if ((vector-ref f2831 0) f2846 f2847 f2848) ((vector-ref f2830 0) f2846 f2847 (fx+ f2848 1) f2849) #f))))) (vector-set! f2829 0 (closure (f2844 f2845) (f2832 f2830) (let ((f2844 f2844) (f2845 f2845)) (if ((vector-ref f2832 0) f2844 f2845) ((vector-ref f2830 0) f2844 f2845 0 (string-length f2844)) #f)))))
#   env=((f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# emit-expr (vector-set! f2830 0 (closure (f2846 f2847 f2848 f2849) (f2831 f2830) (let ((f2846 f2846) (f2847 f2847) (f2848 f2848) (f2849 f2849)) (if (fx= f2848 f2849) #t (if ((vector-ref f2831 0) f2846 f2847 f2848) ((vector-ref f2830 0) f2846 f2847 (fx+ f2848 1) f2849) #f)))))
# emit-expr f2830
# emit-variable-ref
# env=((f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2830
    movl -8(%esp), %eax  # stack load f2830
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_24943
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24943:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_24944"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24944:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_24946
    cmp  $0,%eax
    jge _L_24945
_L_24946:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_24945:
    movl %eax, -20(%esp)
# emit-expr (closure (f2846 f2847 f2848 f2849) (f2831 f2830) (let ((f2846 f2846) (f2847 f2847) (f2848 f2848) (f2849 f2849)) (if (fx= f2848 f2849) #t (if ((vector-ref f2831 0) f2846 f2847 f2848) ((vector-ref f2830 0) f2846 f2847 (fx+ f2848 1) f2849) #f))))
# emit-closure
# si = -24
# env = ((f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# expr = (closure (f2846 f2847 f2848 f2849) (f2831 f2830) (let ((f2846 f2846) (f2847 f2847) (f2848 f2848) (f2849 f2849)) (if (fx= f2848 f2849) #t (if ((vector-ref f2831 0) f2846 f2847 f2848) ((vector-ref f2830 0) f2846 f2847 (fx+ f2848 1) f2849) #f))))
    movl $_L_24947, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2831
    movl -4(%esp), %eax  # stack load f2831
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f2831
# emit-variable-ref
# env=((f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2830
    movl -8(%esp), %eax  # stack load f2830
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f2830
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_24948            # jump around closure body
_L_24947:
# check argument count
    cmp $16,%eax
    je _L_24949
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_24949:
# emit-tail-expr
# si=-24
# env=((f2849 . -20) (f2848 . -16) (f2847 . -12) (f2846 . -8) (f2830 . 8) (f2831 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# expr=(let ((f2846 f2846) (f2847 f2847) (f2848 f2848) (f2849 f2849)) (if (fx= f2848 f2849) #t (if ((vector-ref f2831 0) f2846 f2847 f2848) ((vector-ref f2830 0) f2846 f2847 (fx+ f2848 1) f2849) #f)))
# emit-tail-let
#  si   = -24
#  env  = ((f2849 . -20) (f2848 . -16) (f2847 . -12) (f2846 . -8) (f2830 . 8) (f2831 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
#  bindings = ((f2846 f2846) (f2847 f2847) (f2848 f2848) (f2849 f2849))
#  body = (if (fx= f2848 f2849) #t (if ((vector-ref f2831 0) f2846 f2847 f2848) ((vector-ref f2830 0) f2846 f2847 (fx+ f2848 1) f2849) #f))
# emit-expr f2846
# emit-variable-ref
# env=((f2849 . -20) (f2848 . -16) (f2847 . -12) (f2846 . -8) (f2830 . 8) (f2831 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2846
    movl -8(%esp), %eax  # stack load f2846
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f2847
# emit-variable-ref
# env=((f2849 . -20) (f2848 . -16) (f2847 . -12) (f2846 . -8) (f2830 . 8) (f2831 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2847
    movl -12(%esp), %eax  # stack load f2847
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-expr f2848
# emit-variable-ref
# env=((f2849 . -20) (f2848 . -16) (f2847 . -12) (f2846 . -8) (f2830 . 8) (f2831 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2848
    movl -16(%esp), %eax  # stack load f2848
# end emit-variable-ref
    movl %eax, -32(%esp)  # stack save
# emit-expr f2849
# emit-variable-ref
# env=((f2849 . -20) (f2848 . -16) (f2847 . -12) (f2846 . -8) (f2830 . 8) (f2831 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2849
    movl -20(%esp), %eax  # stack load f2849
# end emit-variable-ref
    movl %eax, -36(%esp)  # stack save
# emit-tail-expr
# si=-40
# env=((f2849 . -36) (f2848 . -32) (f2847 . -28) (f2846 . -24) (f2849 . -20) (f2848 . -16) (f2847 . -12) (f2846 . -8) (f2830 . 8) (f2831 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# expr=(if (fx= f2848 f2849) #t (if ((vector-ref f2831 0) f2846 f2847 f2848) ((vector-ref f2830 0) f2846 f2847 (fx+ f2848 1) f2849) #f))
# emit-expr (fx= f2848 f2849)
# emit-expr f2849
# emit-variable-ref
# env=((f2849 . -36) (f2848 . -32) (f2847 . -28) (f2846 . -24) (f2849 . -20) (f2848 . -16) (f2847 . -12) (f2846 . -8) (f2830 . 8) (f2831 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2849
    movl -36(%esp), %eax  # stack load f2849
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_24952"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24952:
    movl %eax, -40(%esp)
# emit-expr f2848
# emit-variable-ref
# env=((f2849 . -36) (f2848 . -32) (f2847 . -28) (f2846 . -24) (f2849 . -20) (f2848 . -16) (f2847 . -12) (f2846 . -8) (f2830 . 8) (f2831 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2848
    movl -32(%esp), %eax  # stack load f2848
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_24953"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24953:
    cmp -40(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_24950
# emit-tail-expr
# si=-40
# env=((f2849 . -36) (f2848 . -32) (f2847 . -28) (f2846 . -24) (f2849 . -20) (f2848 . -16) (f2847 . -12) (f2846 . -8) (f2830 . 8) (f2831 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# expr=#t
    movl $111, %eax     # immed #t
    ret                  # immediate tail return
    jmp _L_24951
_L_24950:
# emit-tail-expr
# si=-40
# env=((f2849 . -36) (f2848 . -32) (f2847 . -28) (f2846 . -24) (f2849 . -20) (f2848 . -16) (f2847 . -12) (f2846 . -8) (f2830 . 8) (f2831 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# expr=(if ((vector-ref f2831 0) f2846 f2847 f2848) ((vector-ref f2830 0) f2846 f2847 (fx+ f2848 1) f2849) #f)
# emit-expr ((vector-ref f2831 0) f2846 f2847 f2848)
# funcall
#    si   =-40
#    env  = ((f2849 . -36) (f2848 . -32) (f2847 . -28) (f2846 . -24) (f2849 . -20) (f2848 . -16) (f2847 . -12) (f2846 . -8) (f2830 . 8) (f2831 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
#    expr = (funcall (vector-ref f2831 0) f2846 f2847 f2848)
# emit-expr (vector-ref f2831 0)
# emit-expr f2831
# emit-variable-ref
# env=((f2849 . -36) (f2848 . -32) (f2847 . -28) (f2846 . -24) (f2849 . -20) (f2848 . -16) (f2847 . -12) (f2846 . -8) (f2830 . 8) (f2831 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2831
    movl 2(%edi), %eax  # frame load f2831
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_24956
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24956:
    movl %eax, -48(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_24957"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24957:
# check bounds on vector index
    movl -48(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_24959
    cmp  $0,%eax
    jge _L_24958
_L_24959:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_24958:
    movl -48(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_24960"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_24960":
   movl %eax,  -48(%esp)  # stash funcall-oper in closure slot
# emit-expr f2846
# emit-variable-ref
# env=((f2849 . -36) (f2848 . -32) (f2847 . -28) (f2846 . -24) (f2849 . -20) (f2848 . -16) (f2847 . -12) (f2846 . -8) (f2830 . 8) (f2831 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2846
    movl -24(%esp), %eax  # stack load f2846
# end emit-variable-ref
    mov %eax, -52(%esp)  # arg f2846
# emit-expr f2847
# emit-variable-ref
# env=((f2849 . -36) (f2848 . -32) (f2847 . -28) (f2846 . -24) (f2849 . -20) (f2848 . -16) (f2847 . -12) (f2846 . -8) (f2830 . 8) (f2831 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2847
    movl -28(%esp), %eax  # stack load f2847
# end emit-variable-ref
    mov %eax, -56(%esp)  # arg f2847
# emit-expr f2848
# emit-variable-ref
# env=((f2849 . -36) (f2848 . -32) (f2847 . -28) (f2846 . -24) (f2849 . -20) (f2848 . -16) (f2847 . -12) (f2846 . -8) (f2830 . 8) (f2831 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2848
    movl -32(%esp), %eax  # stack load f2848
# end emit-variable-ref
    mov %eax, -60(%esp)  # arg f2848
    movl -48(%esp), %edi   # load new closure to %edi
    add $-40, %esp   # adjust base
    movl $12,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $40, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_24954
# emit-tail-expr
# si=-40
# env=((f2849 . -36) (f2848 . -32) (f2847 . -28) (f2846 . -24) (f2849 . -20) (f2848 . -16) (f2847 . -12) (f2846 . -8) (f2830 . 8) (f2831 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# expr=((vector-ref f2830 0) f2846 f2847 (fx+ f2848 1) f2849)
# emit-tail-funcall
#    si   =-40
#    env  = ((f2849 . -36) (f2848 . -32) (f2847 . -28) (f2846 . -24) (f2849 . -20) (f2848 . -16) (f2847 . -12) (f2846 . -8) (f2830 . 8) (f2831 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
#    expr = (funcall (vector-ref f2830 0) f2846 f2847 (fx+ f2848 1) f2849)
# emit-expr (vector-ref f2830 0)
# emit-expr f2830
# emit-variable-ref
# env=((f2849 . -36) (f2848 . -32) (f2847 . -28) (f2846 . -24) (f2849 . -20) (f2848 . -16) (f2847 . -12) (f2846 . -8) (f2830 . 8) (f2831 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2830
    movl 6(%edi), %eax  # frame load f2830
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_24961
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24961:
    movl %eax, -40(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_24962"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24962:
# check bounds on vector index
    movl -40(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_24964
    cmp  $0,%eax
    jge _L_24963
_L_24964:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_24963:
    movl -40(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -40(%esp)  # stash funcall-oper in next closure slot
# emit-expr f2846
# emit-variable-ref
# env=((f2849 . -36) (f2848 . -32) (f2847 . -28) (f2846 . -24) (f2849 . -20) (f2848 . -16) (f2847 . -12) (f2846 . -8) (f2830 . 8) (f2831 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2846
    movl -24(%esp), %eax  # stack load f2846
# end emit-variable-ref
    mov %eax, -44(%esp)    # arg f2846
# emit-expr f2847
# emit-variable-ref
# env=((f2849 . -36) (f2848 . -32) (f2847 . -28) (f2846 . -24) (f2849 . -20) (f2848 . -16) (f2847 . -12) (f2846 . -8) (f2830 . 8) (f2831 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2847
    movl -28(%esp), %eax  # stack load f2847
# end emit-variable-ref
    mov %eax, -48(%esp)    # arg f2847
# emit-expr (fx+ f2848 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_24965"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24965:
    movl %eax, -52(%esp)  # fx+ push arg1
# emit-expr f2848
# emit-variable-ref
# env=((f2849 . -36) (f2848 . -32) (f2847 . -28) (f2846 . -24) (f2849 . -20) (f2848 . -16) (f2847 . -12) (f2846 . -8) (f2830 . 8) (f2831 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2848
    movl -32(%esp), %eax  # stack load f2848
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_24966"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24966:
    addl -52(%esp), %eax  # fx+ arg1 arg2
    mov %eax, -52(%esp)    # arg (fx+ f2848 1)
# emit-expr f2849
# emit-variable-ref
# env=((f2849 . -36) (f2848 . -32) (f2847 . -28) (f2846 . -24) (f2849 . -20) (f2848 . -16) (f2847 . -12) (f2846 . -8) (f2830 . 8) (f2831 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2849
    movl -36(%esp), %eax  # stack load f2849
# end emit-variable-ref
    mov %eax, -56(%esp)    # arg f2849
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
    jmp _L_24955
_L_24954:
# emit-tail-expr
# si=-40
# env=((f2849 . -36) (f2848 . -32) (f2847 . -28) (f2846 . -24) (f2849 . -20) (f2848 . -16) (f2847 . -12) (f2846 . -8) (f2830 . 8) (f2831 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_24955:
_L_24951:
    .align 4,0x90
_L_24948:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f2829 0 (closure (f2844 f2845) (f2832 f2830) (let ((f2844 f2844) (f2845 f2845)) (if ((vector-ref f2832 0) f2844 f2845) ((vector-ref f2830 0) f2844 f2845 0 (string-length f2844)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f2829 0 (closure (f2844 f2845) (f2832 f2830) (let ((f2844 f2844) (f2845 f2845)) (if ((vector-ref f2832 0) f2844 f2845) ((vector-ref f2830 0) f2844 f2845 0 (string-length f2844)) #f)))))
#   env=((f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# emit-expr (vector-set! f2829 0 (closure (f2844 f2845) (f2832 f2830) (let ((f2844 f2844) (f2845 f2845)) (if ((vector-ref f2832 0) f2844 f2845) ((vector-ref f2830 0) f2844 f2845 0 (string-length f2844)) #f))))
# emit-expr f2829
# emit-variable-ref
# env=((f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2829
    movl -12(%esp), %eax  # stack load f2829
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_24967
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24967:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_24968"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24968:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_24970
    cmp  $0,%eax
    jge _L_24969
_L_24970:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_24969:
    movl %eax, -20(%esp)
# emit-expr (closure (f2844 f2845) (f2832 f2830) (let ((f2844 f2844) (f2845 f2845)) (if ((vector-ref f2832 0) f2844 f2845) ((vector-ref f2830 0) f2844 f2845 0 (string-length f2844)) #f)))
# emit-closure
# si = -24
# env = ((f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# expr = (closure (f2844 f2845) (f2832 f2830) (let ((f2844 f2844) (f2845 f2845)) (if ((vector-ref f2832 0) f2844 f2845) ((vector-ref f2830 0) f2844 f2845 0 (string-length f2844)) #f)))
    movl $_L_24971, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2832
    movl 0(%esp), %eax  # stack load f2832
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f2832
# emit-variable-ref
# env=((f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2830
    movl -8(%esp), %eax  # stack load f2830
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f2830
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_24972            # jump around closure body
_L_24971:
# check argument count
    cmp $8,%eax
    je _L_24973
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_24973:
# emit-tail-expr
# si=-16
# env=((f2845 . -12) (f2844 . -8) (f2830 . 8) (f2832 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# expr=(let ((f2844 f2844) (f2845 f2845)) (if ((vector-ref f2832 0) f2844 f2845) ((vector-ref f2830 0) f2844 f2845 0 (string-length f2844)) #f))
# emit-tail-let
#  si   = -16
#  env  = ((f2845 . -12) (f2844 . -8) (f2830 . 8) (f2832 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
#  bindings = ((f2844 f2844) (f2845 f2845))
#  body = (if ((vector-ref f2832 0) f2844 f2845) ((vector-ref f2830 0) f2844 f2845 0 (string-length f2844)) #f)
# emit-expr f2844
# emit-variable-ref
# env=((f2845 . -12) (f2844 . -8) (f2830 . 8) (f2832 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2844
    movl -8(%esp), %eax  # stack load f2844
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f2845
# emit-variable-ref
# env=((f2845 . -12) (f2844 . -8) (f2830 . 8) (f2832 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2845
    movl -12(%esp), %eax  # stack load f2845
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f2845 . -20) (f2844 . -16) (f2845 . -12) (f2844 . -8) (f2830 . 8) (f2832 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# expr=(if ((vector-ref f2832 0) f2844 f2845) ((vector-ref f2830 0) f2844 f2845 0 (string-length f2844)) #f)
# emit-expr ((vector-ref f2832 0) f2844 f2845)
# funcall
#    si   =-24
#    env  = ((f2845 . -20) (f2844 . -16) (f2845 . -12) (f2844 . -8) (f2830 . 8) (f2832 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
#    expr = (funcall (vector-ref f2832 0) f2844 f2845)
# emit-expr (vector-ref f2832 0)
# emit-expr f2832
# emit-variable-ref
# env=((f2845 . -20) (f2844 . -16) (f2845 . -12) (f2844 . -8) (f2830 . 8) (f2832 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2832
    movl 2(%edi), %eax  # frame load f2832
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_24976
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24976:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_24977"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24977:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_24979
    cmp  $0,%eax
    jge _L_24978
_L_24979:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_24978:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_24980"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_24980":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f2844
# emit-variable-ref
# env=((f2845 . -20) (f2844 . -16) (f2845 . -12) (f2844 . -8) (f2830 . 8) (f2832 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2844
    movl -16(%esp), %eax  # stack load f2844
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f2844
# emit-expr f2845
# emit-variable-ref
# env=((f2845 . -20) (f2844 . -16) (f2845 . -12) (f2844 . -8) (f2830 . 8) (f2832 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2845
    movl -20(%esp), %eax  # stack load f2845
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg f2845
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_24974
# emit-tail-expr
# si=-24
# env=((f2845 . -20) (f2844 . -16) (f2845 . -12) (f2844 . -8) (f2830 . 8) (f2832 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# expr=((vector-ref f2830 0) f2844 f2845 0 (string-length f2844))
# emit-tail-funcall
#    si   =-24
#    env  = ((f2845 . -20) (f2844 . -16) (f2845 . -12) (f2844 . -8) (f2830 . 8) (f2832 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
#    expr = (funcall (vector-ref f2830 0) f2844 f2845 0 (string-length f2844))
# emit-expr (vector-ref f2830 0)
# emit-expr f2830
# emit-variable-ref
# env=((f2845 . -20) (f2844 . -16) (f2845 . -12) (f2844 . -8) (f2830 . 8) (f2832 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2830
    movl 6(%edi), %eax  # frame load f2830
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_24981
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24981:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_24982"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24982:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_24984
    cmp  $0,%eax
    jge _L_24983
_L_24984:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_24983:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr f2844
# emit-variable-ref
# env=((f2845 . -20) (f2844 . -16) (f2845 . -12) (f2844 . -8) (f2830 . 8) (f2832 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2844
    movl -16(%esp), %eax  # stack load f2844
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f2844
# emit-expr f2845
# emit-variable-ref
# env=((f2845 . -20) (f2844 . -16) (f2845 . -12) (f2844 . -8) (f2830 . 8) (f2832 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2845
    movl -20(%esp), %eax  # stack load f2845
# end emit-variable-ref
    mov %eax, -32(%esp)    # arg f2845
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -36(%esp)    # arg 0
# emit-expr (string-length f2844)
# emit-expr f2844
# emit-variable-ref
# env=((f2845 . -20) (f2844 . -16) (f2845 . -12) (f2844 . -8) (f2830 . 8) (f2832 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2844
    movl -16(%esp), %eax  # stack load f2844
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_24985
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24985:
    movl -6(%eax), %eax
    mov %eax, -40(%esp)    # arg (string-length f2844)
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
    jmp _L_24975
_L_24974:
# emit-tail-expr
# si=-24
# env=((f2845 . -20) (f2844 . -16) (f2845 . -12) (f2844 . -8) (f2830 . 8) (f2832 . 4) (f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_24975:
    .align 4,0x90
_L_24972:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# emit-expr (begin (vector-ref f2829 0))
# emit-begin
#   expr=(begin (vector-ref f2829 0))
#   env=((f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# emit-expr (vector-ref f2829 0)
# emit-expr f2829
# emit-variable-ref
# env=((f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
# var=f2829
    movl -12(%esp), %eax  # stack load f2829
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_24986
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24986:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_24987"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24987:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_24989
    cmp  $0,%eax
    jge _L_24988
_L_24989:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_24988:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f2829 . -12) (f2830 . -8) (f2831 . -4) (f2832 . 0))
     movl %eax, string$e$q
# == explicit-begins  ==>
# (letrec ((str->sym (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let* ((new-sym (make-symbol str #f)) (new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym)) (str->sym str (cdr symlist))))))) (lambda (str) (str->sym str (symbols))))
# == eliminate-let*  ==>
# (letrec ((str->sym (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) (str->sym str (cdr symlist))))))) (lambda (str) (str->sym str (symbols))))
# == uniquify-variables  ==>
# (letrec ((f2855 (lambda (f2864 f2865) (if (string=? f2864 (symbol->string (car f2865))) (car f2865) (if (null? (cdr f2865)) (let ((f2869 (make-symbol f2864 #f))) (let ((f2871 (cons f2869 ()))) (begin (set-cdr! f2865 f2871) f2869))) (f2855 f2864 (cdr f2865))))))) (lambda (f2873) (f2855 f2873 (symbols))))
# == vectorize-letrec  ==>
# (let ((f2855 (make-vector 1))) (begin (begin (vector-set! f2855 0 (lambda (f2864 f2865) (if (string=? f2864 (symbol->string (car f2865))) (car f2865) (if (null? (cdr f2865)) (let ((f2869 (make-symbol f2864 #f))) (let ((f2871 (cons f2869 ()))) (begin (set-cdr! f2865 f2871) f2869))) ((vector-ref f2855 0) f2864 (cdr f2865))))))) (lambda (f2873) ((vector-ref f2855 0) f2873 (symbols)))))
# == eliminate-set!  ==>
# (let ((f2855 (make-vector 1))) (begin (begin (vector-set! f2855 0 (lambda (f2864 f2865) (let ((f2864 f2864) (f2865 f2865)) (if (string=? f2864 (symbol->string (car f2865))) (car f2865) (if (null? (cdr f2865)) (let ((f2869 (make-symbol f2864 #f))) (let ((f2871 (cons f2869 ()))) (begin (set-cdr! f2865 f2871) f2869))) ((vector-ref f2855 0) f2864 (cdr f2865)))))))) (lambda (f2873) (let ((f2873 f2873)) ((vector-ref f2855 0) f2873 (symbols))))))
# == close-free-variables  ==>
# (let ((f2855 (make-vector 1))) (begin (begin (vector-set! f2855 0 (closure (f2864 f2865) (string=? f2855) (let ((f2864 f2864) (f2865 f2865)) (if (string=? f2864 (symbol->string (car f2865))) (car f2865) (if (null? (cdr f2865)) (let ((f2869 (make-symbol f2864 #f))) (let ((f2871 (cons f2869 ()))) (begin (set-cdr! f2865 f2871) f2869))) ((vector-ref f2855 0) f2864 (cdr f2865)))))))) (closure (f2873) (f2855 symbols) (let ((f2873 f2873)) ((vector-ref f2855 0) f2873 (symbols))))))
# == eliminate-quote  ==>
# (let ((f2855 (make-vector 1))) (begin (begin (vector-set! f2855 0 (closure (f2864 f2865) (string=? f2855) (let ((f2864 f2864) (f2865 f2865)) (if (string=? f2864 (symbol->string (car f2865))) (car f2865) (if (null? (cdr f2865)) (let ((f2869 (make-symbol f2864 #f))) (let ((f2871 (cons f2869 ()))) (begin (set-cdr! f2865 f2871) f2869))) ((vector-ref f2855 0) f2864 (cdr f2865)))))))) (closure (f2873) (f2855 symbols) (let ((f2873 f2873)) ((vector-ref f2855 0) f2873 (symbols))))))
# == eliminate-when/unless  ==>
# (let ((f2855 (make-vector 1))) (begin (begin (vector-set! f2855 0 (closure (f2864 f2865) (string=? f2855) (let ((f2864 f2864) (f2865 f2865)) (if (string=? f2864 (symbol->string (car f2865))) (car f2865) (if (null? (cdr f2865)) (let ((f2869 (make-symbol f2864 #f))) (let ((f2871 (cons f2869 ()))) (begin (set-cdr! f2865 f2871) f2869))) ((vector-ref f2855 0) f2864 (cdr f2865)))))))) (closure (f2873) (f2855 symbols) (let ((f2873 f2873)) ((vector-ref f2855 0) f2873 (symbols))))))
# == eliminate-cond  ==>
# (let ((f2855 (make-vector 1))) (begin (begin (vector-set! f2855 0 (closure (f2864 f2865) (string=? f2855) (let ((f2864 f2864) (f2865 f2865)) (if (string=? f2864 (symbol->string (car f2865))) (car f2865) (if (null? (cdr f2865)) (let ((f2869 (make-symbol f2864 #f))) (let ((f2871 (cons f2869 ()))) (begin (set-cdr! f2865 f2871) f2869))) ((vector-ref f2855 0) f2864 (cdr f2865)))))))) (closure (f2873) (f2855 symbols) (let ((f2873 f2873)) ((vector-ref f2855 0) f2873 (symbols))))))
# == external-symbols  ==>
# (let ((f2855 (make-vector 1))) (begin (begin (vector-set! f2855 0 (closure (f2864 f2865) ((primitive-ref string=?) f2855) (let ((f2864 f2864) (f2865 f2865)) (if ((primitive-ref string=?) f2864 (symbol->string (car f2865))) (car f2865) (if (null? (cdr f2865)) (let ((f2869 (make-symbol f2864 #f))) (let ((f2871 (cons f2869 ()))) (begin (set-cdr! f2865 f2871) f2869))) ((vector-ref f2855 0) f2864 (cdr f2865)))))))) (closure (f2873) (f2855 (primitive-ref symbols)) (let ((f2873 f2873)) ((vector-ref f2855 0) f2873 ((primitive-ref symbols)))))))
# emit-expr (let ((f2855 (make-vector 1))) (begin (begin (vector-set! f2855 0 (closure (f2864 f2865) ((primitive-ref string=?) f2855) (let ((f2864 f2864) (f2865 f2865)) (if ((primitive-ref string=?) f2864 (symbol->string (car f2865))) (car f2865) (if (null? (cdr f2865)) (let ((f2869 (make-symbol f2864 #f))) (let ((f2871 (cons f2869 ()))) (begin (set-cdr! f2865 f2871) f2869))) ((vector-ref f2855 0) f2864 (cdr f2865)))))))) (closure (f2873) (f2855 (primitive-ref symbols)) (let ((f2873 f2873)) ((vector-ref f2855 0) f2873 ((primitive-ref symbols)))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f2855 (make-vector 1)))
#  body = (begin (begin (vector-set! f2855 0 (closure (f2864 f2865) ((primitive-ref string=?) f2855) (let ((f2864 f2864) (f2865 f2865)) (if ((primitive-ref string=?) f2864 (symbol->string (car f2865))) (car f2865) (if (null? (cdr f2865)) (let ((f2869 (make-symbol f2864 #f))) (let ((f2871 (cons f2869 ()))) (begin (set-cdr! f2865 f2871) f2869))) ((vector-ref f2855 0) f2864 (cdr f2865)))))))) (closure (f2873) (f2855 (primitive-ref symbols)) (let ((f2873 f2873)) ((vector-ref f2855 0) f2873 ((primitive-ref symbols))))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_24990"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24990:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_24991
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24991:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f2855 0 (closure (f2864 f2865) ((primitive-ref string=?) f2855) (let ((f2864 f2864) (f2865 f2865)) (if ((primitive-ref string=?) f2864 (symbol->string (car f2865))) (car f2865) (if (null? (cdr f2865)) (let ((f2869 (make-symbol f2864 #f))) (let ((f2871 (cons f2869 ()))) (begin (set-cdr! f2865 f2871) f2869))) ((vector-ref f2855 0) f2864 (cdr f2865)))))))) (closure (f2873) (f2855 (primitive-ref symbols)) (let ((f2873 f2873)) ((vector-ref f2855 0) f2873 ((primitive-ref symbols))))))
# emit-begin
#   expr=(begin (begin (vector-set! f2855 0 (closure (f2864 f2865) ((primitive-ref string=?) f2855) (let ((f2864 f2864) (f2865 f2865)) (if ((primitive-ref string=?) f2864 (symbol->string (car f2865))) (car f2865) (if (null? (cdr f2865)) (let ((f2869 (make-symbol f2864 #f))) (let ((f2871 (cons f2869 ()))) (begin (set-cdr! f2865 f2871) f2869))) ((vector-ref f2855 0) f2864 (cdr f2865)))))))) (closure (f2873) (f2855 (primitive-ref symbols)) (let ((f2873 f2873)) ((vector-ref f2855 0) f2873 ((primitive-ref symbols))))))
#   env=((f2855 . 0))
# emit-expr (begin (vector-set! f2855 0 (closure (f2864 f2865) ((primitive-ref string=?) f2855) (let ((f2864 f2864) (f2865 f2865)) (if ((primitive-ref string=?) f2864 (symbol->string (car f2865))) (car f2865) (if (null? (cdr f2865)) (let ((f2869 (make-symbol f2864 #f))) (let ((f2871 (cons f2869 ()))) (begin (set-cdr! f2865 f2871) f2869))) ((vector-ref f2855 0) f2864 (cdr f2865))))))))
# emit-begin
#   expr=(begin (vector-set! f2855 0 (closure (f2864 f2865) ((primitive-ref string=?) f2855) (let ((f2864 f2864) (f2865 f2865)) (if ((primitive-ref string=?) f2864 (symbol->string (car f2865))) (car f2865) (if (null? (cdr f2865)) (let ((f2869 (make-symbol f2864 #f))) (let ((f2871 (cons f2869 ()))) (begin (set-cdr! f2865 f2871) f2869))) ((vector-ref f2855 0) f2864 (cdr f2865))))))))
#   env=((f2855 . 0))
# emit-expr (vector-set! f2855 0 (closure (f2864 f2865) ((primitive-ref string=?) f2855) (let ((f2864 f2864) (f2865 f2865)) (if ((primitive-ref string=?) f2864 (symbol->string (car f2865))) (car f2865) (if (null? (cdr f2865)) (let ((f2869 (make-symbol f2864 #f))) (let ((f2871 (cons f2869 ()))) (begin (set-cdr! f2865 f2871) f2869))) ((vector-ref f2855 0) f2864 (cdr f2865)))))))
# emit-expr f2855
# emit-variable-ref
# env=((f2855 . 0))
# var=f2855
    movl 0(%esp), %eax  # stack load f2855
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_24992
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24992:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_24993"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_24993:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_24995
    cmp  $0,%eax
    jge _L_24994
_L_24995:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_24994:
    movl %eax, -8(%esp)
# emit-expr (closure (f2864 f2865) ((primitive-ref string=?) f2855) (let ((f2864 f2864) (f2865 f2865)) (if ((primitive-ref string=?) f2864 (symbol->string (car f2865))) (car f2865) (if (null? (cdr f2865)) (let ((f2869 (make-symbol f2864 #f))) (let ((f2871 (cons f2869 ()))) (begin (set-cdr! f2865 f2871) f2869))) ((vector-ref f2855 0) f2864 (cdr f2865))))))
# emit-closure
# si = -12
# env = ((f2855 . 0))
# expr = (closure (f2864 f2865) ((primitive-ref string=?) f2855) (let ((f2864 f2864) (f2865 f2865)) (if ((primitive-ref string=?) f2864 (symbol->string (car f2865))) (car f2865) (if (null? (cdr f2865)) (let ((f2869 (make-symbol f2864 #f))) (let ((f2871 (cons f2869 ()))) (begin (set-cdr! f2865 f2871) f2869))) ((vector-ref f2855 0) f2864 (cdr f2865))))))
    movl $_L_24996, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref string=?) not defined in the environmnet
# emit-variable-ref
# env=((f2855 . 0))
# var=f2855
    movl 0(%esp), %eax  # stack load f2855
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f2855
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_24997            # jump around closure body
_L_24996:
# check argument count
    cmp $8,%eax
    je _L_24998
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_24998:
# emit-tail-expr
# si=-16
# env=((f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
# expr=(let ((f2864 f2864) (f2865 f2865)) (if ((primitive-ref string=?) f2864 (symbol->string (car f2865))) (car f2865) (if (null? (cdr f2865)) (let ((f2869 (make-symbol f2864 #f))) (let ((f2871 (cons f2869 ()))) (begin (set-cdr! f2865 f2871) f2869))) ((vector-ref f2855 0) f2864 (cdr f2865)))))
# emit-tail-let
#  si   = -16
#  env  = ((f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
#  bindings = ((f2864 f2864) (f2865 f2865))
#  body = (if ((primitive-ref string=?) f2864 (symbol->string (car f2865))) (car f2865) (if (null? (cdr f2865)) (let ((f2869 (make-symbol f2864 #f))) (let ((f2871 (cons f2869 ()))) (begin (set-cdr! f2865 f2871) f2869))) ((vector-ref f2855 0) f2864 (cdr f2865))))
# emit-expr f2864
# emit-variable-ref
# env=((f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
# var=f2864
    movl -8(%esp), %eax  # stack load f2864
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f2865
# emit-variable-ref
# env=((f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
# var=f2865
    movl -12(%esp), %eax  # stack load f2865
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f2865 . -20) (f2864 . -16) (f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
# expr=(if ((primitive-ref string=?) f2864 (symbol->string (car f2865))) (car f2865) (if (null? (cdr f2865)) (let ((f2869 (make-symbol f2864 #f))) (let ((f2871 (cons f2869 ()))) (begin (set-cdr! f2865 f2871) f2869))) ((vector-ref f2855 0) f2864 (cdr f2865))))
# emit-expr ((primitive-ref string=?) f2864 (symbol->string (car f2865)))
# funcall
#    si   =-24
#    env  = ((f2865 . -20) (f2864 . -16) (f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
#    expr = (funcall (primitive-ref string=?) f2864 (symbol->string (car f2865)))
# emit-expr (primitive-ref string=?)
    .extern string$e$q
    movl string$e$q,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25001"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25001":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f2864
# emit-variable-ref
# env=((f2865 . -20) (f2864 . -16) (f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
# var=f2864
    movl -16(%esp), %eax  # stack load f2864
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f2864
# emit-expr (symbol->string (car f2865))
# symbol->string (car f2865)
# emit-expr (car f2865)
# emit-expr f2865
# emit-variable-ref
# env=((f2865 . -20) (f2864 . -16) (f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
# var=f2865
    movl -20(%esp), %eax  # stack load f2865
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_25002
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25002:
    movl -1(%eax), %eax
    movl -3(%eax), %eax
    mov %eax, -40(%esp)  # arg (symbol->string (car f2865))
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_24999
# emit-tail-expr
# si=-24
# env=((f2865 . -20) (f2864 . -16) (f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
# expr=(car f2865)
# tail primcall
# emit-expr f2865
# emit-variable-ref
# env=((f2865 . -20) (f2864 . -16) (f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
# var=f2865
    movl -20(%esp), %eax  # stack load f2865
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_25003
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25003:
    movl -1(%eax), %eax
#return from tail (car f2865)
    ret
    jmp _L_25000
_L_24999:
# emit-tail-expr
# si=-24
# env=((f2865 . -20) (f2864 . -16) (f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
# expr=(if (null? (cdr f2865)) (let ((f2869 (make-symbol f2864 #f))) (let ((f2871 (cons f2869 ()))) (begin (set-cdr! f2865 f2871) f2869))) ((vector-ref f2855 0) f2864 (cdr f2865)))
# emit-expr (null? (cdr f2865))
# emit-expr (cdr f2865)
# emit-expr f2865
# emit-variable-ref
# env=((f2865 . -20) (f2864 . -16) (f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
# var=f2865
    movl -20(%esp), %eax  # stack load f2865
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_25006
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25006:
    movl 3(%eax), %eax
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_25004
# emit-tail-expr
# si=-24
# env=((f2865 . -20) (f2864 . -16) (f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
# expr=(let ((f2869 (make-symbol f2864 #f))) (let ((f2871 (cons f2869 ()))) (begin (set-cdr! f2865 f2871) f2869)))
# emit-tail-let
#  si   = -24
#  env  = ((f2865 . -20) (f2864 . -16) (f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
#  bindings = ((f2869 (make-symbol f2864 #f)))
#  body = (let ((f2871 (cons f2869 ()))) (begin (set-cdr! f2865 f2871) f2869))
# emit-expr (make-symbol f2864 #f)
# make-symbol arg1=f2864 arg2=#f
# emit-expr f2864
# emit-variable-ref
# env=((f2865 . -20) (f2864 . -16) (f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
# var=f2864
    movl -16(%esp), %eax  # stack load f2864
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
# env=((f2869 . -24) (f2865 . -20) (f2864 . -16) (f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
# expr=(let ((f2871 (cons f2869 ()))) (begin (set-cdr! f2865 f2871) f2869))
# emit-tail-let
#  si   = -28
#  env  = ((f2869 . -24) (f2865 . -20) (f2864 . -16) (f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
#  bindings = ((f2871 (cons f2869 ())))
#  body = (begin (set-cdr! f2865 f2871) f2869)
# emit-expr (cons f2869 ())
# cons arg1=f2869 arg2=()
# emit-expr f2869
# emit-variable-ref
# env=((f2869 . -24) (f2865 . -20) (f2864 . -16) (f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
# var=f2869
    movl -24(%esp), %eax  # stack load f2869
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
# env=((f2871 . -28) (f2869 . -24) (f2865 . -20) (f2864 . -16) (f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
# expr=(begin (set-cdr! f2865 f2871) f2869)
# tail-begin (begin (set-cdr! f2865 f2871) f2869)
#   env=((f2871 . -28) (f2869 . -24) (f2865 . -20) (f2864 . -16) (f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
# emit-expr (set-cdr! f2865 f2871)
# emit-expr f2865
# emit-variable-ref
# env=((f2871 . -28) (f2869 . -24) (f2865 . -20) (f2864 . -16) (f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
# var=f2865
    movl -20(%esp), %eax  # stack load f2865
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_25007
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25007:
    movl %eax, -32(%esp)
# emit-expr f2871
# emit-variable-ref
# env=((f2871 . -28) (f2869 . -24) (f2865 . -20) (f2864 . -16) (f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
# var=f2871
    movl -28(%esp), %eax  # stack load f2871
# end emit-variable-ref
    movl -32(%esp), %ebx
    movl %eax, 3(%ebx)
# emit-tail-expr
# si=-32
# env=((f2871 . -28) (f2869 . -24) (f2865 . -20) (f2864 . -16) (f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
# expr=(begin f2869)
# tail-begin (begin f2869)
#   env=((f2871 . -28) (f2869 . -24) (f2865 . -20) (f2864 . -16) (f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
# emit-tail-expr
# si=-32
# env=((f2871 . -28) (f2869 . -24) (f2865 . -20) (f2864 . -16) (f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
# expr=f2869
# emit-tail-variable-ref
# emit-variable-ref
# env=((f2871 . -28) (f2869 . -24) (f2865 . -20) (f2864 . -16) (f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
# var=f2869
    movl -24(%esp), %eax  # stack load f2869
# end emit-variable-ref
    ret
# end emit-tail-variable ref
     ret   # return thru stack
    jmp _L_25005
_L_25004:
# emit-tail-expr
# si=-24
# env=((f2865 . -20) (f2864 . -16) (f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
# expr=((vector-ref f2855 0) f2864 (cdr f2865))
# emit-tail-funcall
#    si   =-24
#    env  = ((f2865 . -20) (f2864 . -16) (f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
#    expr = (funcall (vector-ref f2855 0) f2864 (cdr f2865))
# emit-expr (vector-ref f2855 0)
# emit-expr f2855
# emit-variable-ref
# env=((f2865 . -20) (f2864 . -16) (f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
# var=f2855
    movl 6(%edi), %eax  # frame load f2855
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25008
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25008:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25009"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25009:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25011
    cmp  $0,%eax
    jge _L_25010
_L_25011:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25010:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr f2864
# emit-variable-ref
# env=((f2865 . -20) (f2864 . -16) (f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
# var=f2864
    movl -16(%esp), %eax  # stack load f2864
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f2864
# emit-expr (cdr f2865)
# emit-expr f2865
# emit-variable-ref
# env=((f2865 . -20) (f2864 . -16) (f2865 . -12) (f2864 . -8) (f2855 . 8) ((primitive-ref string=?) . 4) (f2855 . 0))
# var=f2865
    movl -20(%esp), %eax  # stack load f2865
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_25012
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25012:
    movl 3(%eax), %eax
    mov %eax, -32(%esp)    # arg (cdr f2865)
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
_L_25005:
_L_25000:
    .align 4,0x90
_L_24997:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f2855 . 0))
# emit-expr (begin (closure (f2873) (f2855 (primitive-ref symbols)) (let ((f2873 f2873)) ((vector-ref f2855 0) f2873 ((primitive-ref symbols))))))
# emit-begin
#   expr=(begin (closure (f2873) (f2855 (primitive-ref symbols)) (let ((f2873 f2873)) ((vector-ref f2855 0) f2873 ((primitive-ref symbols))))))
#   env=((f2855 . 0))
# emit-expr (closure (f2873) (f2855 (primitive-ref symbols)) (let ((f2873 f2873)) ((vector-ref f2855 0) f2873 ((primitive-ref symbols)))))
# emit-closure
# si = -4
# env = ((f2855 . 0))
# expr = (closure (f2873) (f2855 (primitive-ref symbols)) (let ((f2873 f2873)) ((vector-ref f2855 0) f2873 ((primitive-ref symbols)))))
    movl $_L_25013, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f2855 . 0))
# var=f2855
    movl 0(%esp), %eax  # stack load f2855
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f2855
# WARNING: free var (primitive-ref symbols) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_25014            # jump around closure body
_L_25013:
# check argument count
    cmp $4,%eax
    je _L_25015
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_25015:
# emit-tail-expr
# si=-12
# env=((f2873 . -8) ((primitive-ref symbols) . 8) (f2855 . 4) (f2855 . 0))
# expr=(let ((f2873 f2873)) ((vector-ref f2855 0) f2873 ((primitive-ref symbols))))
# emit-tail-let
#  si   = -12
#  env  = ((f2873 . -8) ((primitive-ref symbols) . 8) (f2855 . 4) (f2855 . 0))
#  bindings = ((f2873 f2873))
#  body = ((vector-ref f2855 0) f2873 ((primitive-ref symbols)))
# emit-expr f2873
# emit-variable-ref
# env=((f2873 . -8) ((primitive-ref symbols) . 8) (f2855 . 4) (f2855 . 0))
# var=f2873
    movl -8(%esp), %eax  # stack load f2873
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f2873 . -12) (f2873 . -8) ((primitive-ref symbols) . 8) (f2855 . 4) (f2855 . 0))
# expr=((vector-ref f2855 0) f2873 ((primitive-ref symbols)))
# emit-tail-funcall
#    si   =-16
#    env  = ((f2873 . -12) (f2873 . -8) ((primitive-ref symbols) . 8) (f2855 . 4) (f2855 . 0))
#    expr = (funcall (vector-ref f2855 0) f2873 ((primitive-ref symbols)))
# emit-expr (vector-ref f2855 0)
# emit-expr f2855
# emit-variable-ref
# env=((f2873 . -12) (f2873 . -8) ((primitive-ref symbols) . 8) (f2855 . 4) (f2855 . 0))
# var=f2855
    movl 2(%edi), %eax  # frame load f2855
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25016
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25016:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25017"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25017:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25019
    cmp  $0,%eax
    jge _L_25018
_L_25019:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25018:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f2873
# emit-variable-ref
# env=((f2873 . -12) (f2873 . -8) ((primitive-ref symbols) . 8) (f2855 . 4) (f2855 . 0))
# var=f2873
    movl -12(%esp), %eax  # stack load f2873
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f2873
# emit-expr ((primitive-ref symbols))
# funcall
#    si   =-24
#    env  = ((f2873 . -12) (f2873 . -8) ((primitive-ref symbols) . 8) (f2855 . 4) (f2855 . 0))
#    expr = (funcall (primitive-ref symbols))
# emit-expr (primitive-ref symbols)
    .extern symbols
    movl symbols,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25020"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25020":
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
_L_25014:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f2855 . 0))
     movl %eax, string$m$gsymbol
# == explicit-begins  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == eliminate-let*  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == uniquify-variables  ==>
# (lambda (f2874 f2875) (if (null? f2874) (cons e nil) (cons (car f2874) (append1 (cdr f2874) f2875))))
# == vectorize-letrec  ==>
# (lambda (f2874 f2875) (if (null? f2874) (cons e nil) (cons (car f2874) (append1 (cdr f2874) f2875))))
# == eliminate-set!  ==>
# (lambda (f2874 f2875) (let ((f2874 f2874) (f2875 f2875)) (if (null? f2874) (cons e nil) (cons (car f2874) (append1 (cdr f2874) f2875)))))
# == close-free-variables  ==>
# (closure (f2874 f2875) (e nil append1) (let ((f2874 f2874) (f2875 f2875)) (if (null? f2874) (cons e nil) (cons (car f2874) (append1 (cdr f2874) f2875)))))
# == eliminate-quote  ==>
# (closure (f2874 f2875) (e nil append1) (let ((f2874 f2874) (f2875 f2875)) (if (null? f2874) (cons e nil) (cons (car f2874) (append1 (cdr f2874) f2875)))))
# == eliminate-when/unless  ==>
# (closure (f2874 f2875) (e nil append1) (let ((f2874 f2874) (f2875 f2875)) (if (null? f2874) (cons e nil) (cons (car f2874) (append1 (cdr f2874) f2875)))))
# == eliminate-cond  ==>
# (closure (f2874 f2875) (e nil append1) (let ((f2874 f2874) (f2875 f2875)) (if (null? f2874) (cons e nil) (cons (car f2874) (append1 (cdr f2874) f2875)))))
# == external-symbols  ==>
# (closure (f2874 f2875) (e nil (primitive-ref append1)) (let ((f2874 f2874) (f2875 f2875)) (if (null? f2874) (cons e nil) (cons (car f2874) ((primitive-ref append1) (cdr f2874) f2875)))))
# emit-expr (closure (f2874 f2875) (e nil (primitive-ref append1)) (let ((f2874 f2874) (f2875 f2875)) (if (null? f2874) (cons e nil) (cons (car f2874) ((primitive-ref append1) (cdr f2874) f2875)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f2874 f2875) (e nil (primitive-ref append1)) (let ((f2874 f2874) (f2875 f2875)) (if (null? f2874) (cons e nil) (cons (car f2874) ((primitive-ref append1) (cdr f2874) f2875)))))
    movl $_L_25021, 0(%ebp)  # closure label
# WARNING: free var e not defined in the environmnet
# WARNING: free var nil not defined in the environmnet
# WARNING: free var (primitive-ref append1) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_25022            # jump around closure body
_L_25021:
# check argument count
    cmp $8,%eax
    je _L_25023
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_25023:
# emit-tail-expr
# si=-16
# env=((f2875 . -12) (f2874 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(let ((f2874 f2874) (f2875 f2875)) (if (null? f2874) (cons e nil) (cons (car f2874) ((primitive-ref append1) (cdr f2874) f2875))))
# emit-tail-let
#  si   = -16
#  env  = ((f2875 . -12) (f2874 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
#  bindings = ((f2874 f2874) (f2875 f2875))
#  body = (if (null? f2874) (cons e nil) (cons (car f2874) ((primitive-ref append1) (cdr f2874) f2875)))
# emit-expr f2874
# emit-variable-ref
# env=((f2875 . -12) (f2874 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f2874
    movl -8(%esp), %eax  # stack load f2874
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f2875
# emit-variable-ref
# env=((f2875 . -12) (f2874 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f2875
    movl -12(%esp), %eax  # stack load f2875
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f2875 . -20) (f2874 . -16) (f2875 . -12) (f2874 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(if (null? f2874) (cons e nil) (cons (car f2874) ((primitive-ref append1) (cdr f2874) f2875)))
# emit-expr (null? f2874)
# emit-expr f2874
# emit-variable-ref
# env=((f2875 . -20) (f2874 . -16) (f2875 . -12) (f2874 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f2874
    movl -16(%esp), %eax  # stack load f2874
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_25024
# emit-tail-expr
# si=-24
# env=((f2875 . -20) (f2874 . -16) (f2875 . -12) (f2874 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(cons e nil)
# tail primcall
# cons arg1=e arg2=nil
# emit-expr e
# emit-variable-ref
# env=((f2875 . -20) (f2874 . -16) (f2875 . -12) (f2874 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=e
    movl 2(%edi), %eax  # frame load e
# end emit-variable-ref
    movl %eax, -24(%esp)
# emit-expr nil
# emit-variable-ref
# env=((f2875 . -20) (f2874 . -16) (f2875 . -12) (f2874 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
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
    jmp _L_25025
_L_25024:
# emit-tail-expr
# si=-24
# env=((f2875 . -20) (f2874 . -16) (f2875 . -12) (f2874 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(cons (car f2874) ((primitive-ref append1) (cdr f2874) f2875))
# tail primcall
# cons arg1=(car f2874) arg2=((primitive-ref append1) (cdr f2874) f2875)
# emit-expr (car f2874)
# emit-expr f2874
# emit-variable-ref
# env=((f2875 . -20) (f2874 . -16) (f2875 . -12) (f2874 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f2874
    movl -16(%esp), %eax  # stack load f2874
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_25026
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25026:
    movl -1(%eax), %eax
    movl %eax, -24(%esp)
# emit-expr ((primitive-ref append1) (cdr f2874) f2875)
# funcall
#    si   =-28
#    env  = ((f2875 . -20) (f2874 . -16) (f2875 . -12) (f2874 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
#    expr = (funcall (primitive-ref append1) (cdr f2874) f2875)
# emit-expr (primitive-ref append1)
    .extern append1
    movl append1,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25027"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25027":
   movl %eax,  -36(%esp)  # stash funcall-oper in closure slot
# emit-expr (cdr f2874)
# emit-expr f2874
# emit-variable-ref
# env=((f2875 . -20) (f2874 . -16) (f2875 . -12) (f2874 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f2874
    movl -16(%esp), %eax  # stack load f2874
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_25028
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25028:
    movl 3(%eax), %eax
    mov %eax, -40(%esp)  # arg (cdr f2874)
# emit-expr f2875
# emit-variable-ref
# env=((f2875 . -20) (f2874 . -16) (f2875 . -12) (f2874 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f2875
    movl -20(%esp), %eax  # stack load f2875
# end emit-variable-ref
    mov %eax, -44(%esp)  # arg f2875
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
#return from tail (cons (car f2874) ((primitive-ref append1) (cdr f2874) f2875))
    ret
_L_25025:
    .align 4,0x90
_L_25022:
     movl %eax, append1
# == explicit-begins  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == eliminate-let*  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == uniquify-variables  ==>
# (lambda (f2876 f2877) (if (fx= f2877 0) (car f2876) (list-ref (cdr f2876) (fx- f2877 1))))
# == vectorize-letrec  ==>
# (lambda (f2876 f2877) (if (fx= f2877 0) (car f2876) (list-ref (cdr f2876) (fx- f2877 1))))
# == eliminate-set!  ==>
# (lambda (f2876 f2877) (let ((f2876 f2876) (f2877 f2877)) (if (fx= f2877 0) (car f2876) (list-ref (cdr f2876) (fx- f2877 1)))))
# == close-free-variables  ==>
# (closure (f2876 f2877) (list-ref) (let ((f2876 f2876) (f2877 f2877)) (if (fx= f2877 0) (car f2876) (list-ref (cdr f2876) (fx- f2877 1)))))
# == eliminate-quote  ==>
# (closure (f2876 f2877) (list-ref) (let ((f2876 f2876) (f2877 f2877)) (if (fx= f2877 0) (car f2876) (list-ref (cdr f2876) (fx- f2877 1)))))
# == eliminate-when/unless  ==>
# (closure (f2876 f2877) (list-ref) (let ((f2876 f2876) (f2877 f2877)) (if (fx= f2877 0) (car f2876) (list-ref (cdr f2876) (fx- f2877 1)))))
# == eliminate-cond  ==>
# (closure (f2876 f2877) (list-ref) (let ((f2876 f2876) (f2877 f2877)) (if (fx= f2877 0) (car f2876) (list-ref (cdr f2876) (fx- f2877 1)))))
# == external-symbols  ==>
# (closure (f2876 f2877) ((primitive-ref list-ref)) (let ((f2876 f2876) (f2877 f2877)) (if (fx= f2877 0) (car f2876) ((primitive-ref list-ref) (cdr f2876) (fx- f2877 1)))))
# emit-expr (closure (f2876 f2877) ((primitive-ref list-ref)) (let ((f2876 f2876) (f2877 f2877)) (if (fx= f2877 0) (car f2876) ((primitive-ref list-ref) (cdr f2876) (fx- f2877 1)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f2876 f2877) ((primitive-ref list-ref)) (let ((f2876 f2876) (f2877 f2877)) (if (fx= f2877 0) (car f2876) ((primitive-ref list-ref) (cdr f2876) (fx- f2877 1)))))
    movl $_L_25029, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_25030            # jump around closure body
_L_25029:
# check argument count
    cmp $8,%eax
    je _L_25031
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_25031:
# emit-tail-expr
# si=-16
# env=((f2877 . -12) (f2876 . -8) ((primitive-ref list-ref) . 4))
# expr=(let ((f2876 f2876) (f2877 f2877)) (if (fx= f2877 0) (car f2876) ((primitive-ref list-ref) (cdr f2876) (fx- f2877 1))))
# emit-tail-let
#  si   = -16
#  env  = ((f2877 . -12) (f2876 . -8) ((primitive-ref list-ref) . 4))
#  bindings = ((f2876 f2876) (f2877 f2877))
#  body = (if (fx= f2877 0) (car f2876) ((primitive-ref list-ref) (cdr f2876) (fx- f2877 1)))
# emit-expr f2876
# emit-variable-ref
# env=((f2877 . -12) (f2876 . -8) ((primitive-ref list-ref) . 4))
# var=f2876
    movl -8(%esp), %eax  # stack load f2876
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f2877
# emit-variable-ref
# env=((f2877 . -12) (f2876 . -8) ((primitive-ref list-ref) . 4))
# var=f2877
    movl -12(%esp), %eax  # stack load f2877
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f2877 . -20) (f2876 . -16) (f2877 . -12) (f2876 . -8) ((primitive-ref list-ref) . 4))
# expr=(if (fx= f2877 0) (car f2876) ((primitive-ref list-ref) (cdr f2876) (fx- f2877 1)))
# emit-expr (fx= f2877 0)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25034"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25034:
    movl %eax, -24(%esp)
# emit-expr f2877
# emit-variable-ref
# env=((f2877 . -20) (f2876 . -16) (f2877 . -12) (f2876 . -8) ((primitive-ref list-ref) . 4))
# var=f2877
    movl -20(%esp), %eax  # stack load f2877
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25035"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25035:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_25032
# emit-tail-expr
# si=-24
# env=((f2877 . -20) (f2876 . -16) (f2877 . -12) (f2876 . -8) ((primitive-ref list-ref) . 4))
# expr=(car f2876)
# tail primcall
# emit-expr f2876
# emit-variable-ref
# env=((f2877 . -20) (f2876 . -16) (f2877 . -12) (f2876 . -8) ((primitive-ref list-ref) . 4))
# var=f2876
    movl -16(%esp), %eax  # stack load f2876
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_25036
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25036:
    movl -1(%eax), %eax
#return from tail (car f2876)
    ret
    jmp _L_25033
_L_25032:
# emit-tail-expr
# si=-24
# env=((f2877 . -20) (f2876 . -16) (f2877 . -12) (f2876 . -8) ((primitive-ref list-ref) . 4))
# expr=((primitive-ref list-ref) (cdr f2876) (fx- f2877 1))
# emit-tail-funcall
#    si   =-24
#    env  = ((f2877 . -20) (f2876 . -16) (f2877 . -12) (f2876 . -8) ((primitive-ref list-ref) . 4))
#    expr = (funcall (primitive-ref list-ref) (cdr f2876) (fx- f2877 1))
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr (cdr f2876)
# emit-expr f2876
# emit-variable-ref
# env=((f2877 . -20) (f2876 . -16) (f2877 . -12) (f2876 . -8) ((primitive-ref list-ref) . 4))
# var=f2876
    movl -16(%esp), %eax  # stack load f2876
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_25037
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25037:
    movl 3(%eax), %eax
    mov %eax, -28(%esp)    # arg (cdr f2876)
# emit-expr (fx- f2877 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25038"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25038:
    movl %eax, -32(%esp)
# emit-expr f2877
# emit-variable-ref
# env=((f2877 . -20) (f2876 . -16) (f2877 . -12) (f2876 . -8) ((primitive-ref list-ref) . 4))
# var=f2877
    movl -20(%esp), %eax  # stack load f2877
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25039"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25039:
    subl -32(%esp), %eax
    mov %eax, -32(%esp)    # arg (fx- f2877 1)
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
_L_25033:
    .align 4,0x90
_L_25030:
     movl %eax, list$mref
# == explicit-begins  ==>
# (lambda (l) (if (null? l) 0 (fxadd1 (list-length (cdr l)))))
# == eliminate-let*  ==>
# (lambda (l) (if (null? l) 0 (fxadd1 (list-length (cdr l)))))
# == uniquify-variables  ==>
# (lambda (f2878) (if (null? f2878) 0 (fxadd1 (list-length (cdr f2878)))))
# == vectorize-letrec  ==>
# (lambda (f2878) (if (null? f2878) 0 (fxadd1 (list-length (cdr f2878)))))
# == eliminate-set!  ==>
# (lambda (f2878) (let ((f2878 f2878)) (if (null? f2878) 0 (fxadd1 (list-length (cdr f2878))))))
# == close-free-variables  ==>
# (closure (f2878) (list-length) (let ((f2878 f2878)) (if (null? f2878) 0 (fxadd1 (list-length (cdr f2878))))))
# == eliminate-quote  ==>
# (closure (f2878) (list-length) (let ((f2878 f2878)) (if (null? f2878) 0 (fxadd1 (list-length (cdr f2878))))))
# == eliminate-when/unless  ==>
# (closure (f2878) (list-length) (let ((f2878 f2878)) (if (null? f2878) 0 (fxadd1 (list-length (cdr f2878))))))
# == eliminate-cond  ==>
# (closure (f2878) (list-length) (let ((f2878 f2878)) (if (null? f2878) 0 (fxadd1 (list-length (cdr f2878))))))
# == external-symbols  ==>
# (closure (f2878) ((primitive-ref list-length)) (let ((f2878 f2878)) (if (null? f2878) 0 (fxadd1 ((primitive-ref list-length) (cdr f2878))))))
# emit-expr (closure (f2878) ((primitive-ref list-length)) (let ((f2878 f2878)) (if (null? f2878) 0 (fxadd1 ((primitive-ref list-length) (cdr f2878))))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f2878) ((primitive-ref list-length)) (let ((f2878 f2878)) (if (null? f2878) 0 (fxadd1 ((primitive-ref list-length) (cdr f2878))))))
    movl $_L_25040, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref list-length) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_25041            # jump around closure body
_L_25040:
# check argument count
    cmp $4,%eax
    je _L_25042
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_25042:
# emit-tail-expr
# si=-12
# env=((f2878 . -8) ((primitive-ref list-length) . 4))
# expr=(let ((f2878 f2878)) (if (null? f2878) 0 (fxadd1 ((primitive-ref list-length) (cdr f2878)))))
# emit-tail-let
#  si   = -12
#  env  = ((f2878 . -8) ((primitive-ref list-length) . 4))
#  bindings = ((f2878 f2878))
#  body = (if (null? f2878) 0 (fxadd1 ((primitive-ref list-length) (cdr f2878))))
# emit-expr f2878
# emit-variable-ref
# env=((f2878 . -8) ((primitive-ref list-length) . 4))
# var=f2878
    movl -8(%esp), %eax  # stack load f2878
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f2878 . -12) (f2878 . -8) ((primitive-ref list-length) . 4))
# expr=(if (null? f2878) 0 (fxadd1 ((primitive-ref list-length) (cdr f2878))))
# emit-expr (null? f2878)
# emit-expr f2878
# emit-variable-ref
# env=((f2878 . -12) (f2878 . -8) ((primitive-ref list-length) . 4))
# var=f2878
    movl -12(%esp), %eax  # stack load f2878
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_25043
# emit-tail-expr
# si=-16
# env=((f2878 . -12) (f2878 . -8) ((primitive-ref list-length) . 4))
# expr=0
    movl $0, %eax     # immed 0
    ret                  # immediate tail return
    jmp _L_25044
_L_25043:
# emit-tail-expr
# si=-16
# env=((f2878 . -12) (f2878 . -8) ((primitive-ref list-length) . 4))
# expr=(fxadd1 ((primitive-ref list-length) (cdr f2878)))
# tail primcall
# emit-expr ((primitive-ref list-length) (cdr f2878))
# funcall
#    si   =-16
#    env  = ((f2878 . -12) (f2878 . -8) ((primitive-ref list-length) . 4))
#    expr = (funcall (primitive-ref list-length) (cdr f2878))
# emit-expr (primitive-ref list-length)
    .extern list$mlength
    movl list$mlength,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25045"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25045":
   movl %eax,  -24(%esp)  # stash funcall-oper in closure slot
# emit-expr (cdr f2878)
# emit-expr f2878
# emit-variable-ref
# env=((f2878 . -12) (f2878 . -8) ((primitive-ref list-length) . 4))
# var=f2878
    movl -12(%esp), %eax  # stack load f2878
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_25046
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25046:
    movl 3(%eax), %eax
    mov %eax, -28(%esp)  # arg (cdr f2878)
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
    je "_L_25047"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25047:
     addl $4, %eax
#return from tail (fxadd1 ((primitive-ref list-length) (cdr f2878)))
    ret
_L_25044:
    .align 4,0x90
_L_25041:
     movl %eax, list$mlength
# == explicit-begins  ==>
# (letrec ((fill-vector (lambda (v k args) (if (null? args) v (begin (vector-set! v k (car args)) (fill-vector v (fxadd1 k) (cdr args))))))) (lambda args (let ((v (make-vector (list-length args)))) (fill-vector v 0 args))))
# == eliminate-let*  ==>
# (letrec ((fill-vector (lambda (v k args) (if (null? args) v (begin (vector-set! v k (car args)) (fill-vector v (fxadd1 k) (cdr args))))))) (lambda args (let ((v (make-vector (list-length args)))) (fill-vector v 0 args))))
# == uniquify-variables  ==>
# (letrec ((f2879 (lambda (f2883 f2884 f2885) (if (null? f2885) f2883 (begin (vector-set! f2883 f2884 (car f2885)) (f2879 f2883 (fxadd1 f2884) (cdr f2885))))))) (lambda f2889 (let ((f2891 (make-vector (list-length f2889)))) (f2879 f2891 0 f2889))))
# == vectorize-letrec  ==>
# (let ((f2879 (make-vector 1))) (begin (begin (vector-set! f2879 0 (lambda (f2883 f2884 f2885) (if (null? f2885) f2883 (begin (vector-set! f2883 f2884 (car f2885)) ((vector-ref f2879 0) f2883 (fxadd1 f2884) (cdr f2885))))))) (lambda f2889 (let ((f2891 (make-vector (list-length f2889)))) ((vector-ref f2879 0) f2891 0 f2889)))))
# == eliminate-set!  ==>
# (let ((f2879 (make-vector 1))) (begin (begin (vector-set! f2879 0 (lambda (f2883 f2884 f2885) (let ((f2883 f2883) (f2884 f2884) (f2885 f2885)) (if (null? f2885) f2883 (begin (vector-set! f2883 f2884 (car f2885)) ((vector-ref f2879 0) f2883 (fxadd1 f2884) (cdr f2885)))))))) (lambda f2889 (let () (let ((f2891 (make-vector (list-length f2889)))) ((vector-ref f2879 0) f2891 0 f2889))))))
# == close-free-variables  ==>
# (let ((f2879 (make-vector 1))) (begin (begin (vector-set! f2879 0 (closure (f2883 f2884 f2885) (f2879) (let ((f2883 f2883) (f2884 f2884) (f2885 f2885)) (if (null? f2885) f2883 (begin (vector-set! f2883 f2884 (car f2885)) ((vector-ref f2879 0) f2883 (fxadd1 f2884) (cdr f2885)))))))) (closure f2889 (f2879) (let () (let ((f2891 (make-vector (list-length f2889)))) ((vector-ref f2879 0) f2891 0 f2889))))))
# == eliminate-quote  ==>
# (let ((f2879 (make-vector 1))) (begin (begin (vector-set! f2879 0 (closure (f2883 f2884 f2885) (f2879) (let ((f2883 f2883) (f2884 f2884) (f2885 f2885)) (if (null? f2885) f2883 (begin (vector-set! f2883 f2884 (car f2885)) ((vector-ref f2879 0) f2883 (fxadd1 f2884) (cdr f2885)))))))) (closure f2889 (f2879) (let () (let ((f2891 (make-vector (list-length f2889)))) ((vector-ref f2879 0) f2891 0 f2889))))))
# == eliminate-when/unless  ==>
# (let ((f2879 (make-vector 1))) (begin (begin (vector-set! f2879 0 (closure (f2883 f2884 f2885) (f2879) (let ((f2883 f2883) (f2884 f2884) (f2885 f2885)) (if (null? f2885) f2883 (begin (vector-set! f2883 f2884 (car f2885)) ((vector-ref f2879 0) f2883 (fxadd1 f2884) (cdr f2885)))))))) (closure f2889 (f2879) (let () (let ((f2891 (make-vector (list-length f2889)))) ((vector-ref f2879 0) f2891 0 f2889))))))
# == eliminate-cond  ==>
# (let ((f2879 (make-vector 1))) (begin (begin (vector-set! f2879 0 (closure (f2883 f2884 f2885) (f2879) (let ((f2883 f2883) (f2884 f2884) (f2885 f2885)) (if (null? f2885) f2883 (begin (vector-set! f2883 f2884 (car f2885)) ((vector-ref f2879 0) f2883 (fxadd1 f2884) (cdr f2885)))))))) (closure f2889 (f2879) (let () (let ((f2891 (make-vector (list-length f2889)))) ((vector-ref f2879 0) f2891 0 f2889))))))
# == external-symbols  ==>
# (let ((f2879 (make-vector 1))) (begin (begin (vector-set! f2879 0 (closure (f2883 f2884 f2885) (f2879) (let ((f2883 f2883) (f2884 f2884) (f2885 f2885)) (if (null? f2885) f2883 (begin (vector-set! f2883 f2884 (car f2885)) ((vector-ref f2879 0) f2883 (fxadd1 f2884) (cdr f2885)))))))) (closure f2889 (f2879) (let () (let ((f2891 (make-vector ((primitive-ref list-length) f2889)))) ((vector-ref f2879 0) f2891 0 f2889))))))
# emit-expr (let ((f2879 (make-vector 1))) (begin (begin (vector-set! f2879 0 (closure (f2883 f2884 f2885) (f2879) (let ((f2883 f2883) (f2884 f2884) (f2885 f2885)) (if (null? f2885) f2883 (begin (vector-set! f2883 f2884 (car f2885)) ((vector-ref f2879 0) f2883 (fxadd1 f2884) (cdr f2885)))))))) (closure f2889 (f2879) (let () (let ((f2891 (make-vector ((primitive-ref list-length) f2889)))) ((vector-ref f2879 0) f2891 0 f2889))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f2879 (make-vector 1)))
#  body = (begin (begin (vector-set! f2879 0 (closure (f2883 f2884 f2885) (f2879) (let ((f2883 f2883) (f2884 f2884) (f2885 f2885)) (if (null? f2885) f2883 (begin (vector-set! f2883 f2884 (car f2885)) ((vector-ref f2879 0) f2883 (fxadd1 f2884) (cdr f2885)))))))) (closure f2889 (f2879) (let () (let ((f2891 (make-vector ((primitive-ref list-length) f2889)))) ((vector-ref f2879 0) f2891 0 f2889)))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25048"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25048:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_25049
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25049:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f2879 0 (closure (f2883 f2884 f2885) (f2879) (let ((f2883 f2883) (f2884 f2884) (f2885 f2885)) (if (null? f2885) f2883 (begin (vector-set! f2883 f2884 (car f2885)) ((vector-ref f2879 0) f2883 (fxadd1 f2884) (cdr f2885)))))))) (closure f2889 (f2879) (let () (let ((f2891 (make-vector ((primitive-ref list-length) f2889)))) ((vector-ref f2879 0) f2891 0 f2889)))))
# emit-begin
#   expr=(begin (begin (vector-set! f2879 0 (closure (f2883 f2884 f2885) (f2879) (let ((f2883 f2883) (f2884 f2884) (f2885 f2885)) (if (null? f2885) f2883 (begin (vector-set! f2883 f2884 (car f2885)) ((vector-ref f2879 0) f2883 (fxadd1 f2884) (cdr f2885)))))))) (closure f2889 (f2879) (let () (let ((f2891 (make-vector ((primitive-ref list-length) f2889)))) ((vector-ref f2879 0) f2891 0 f2889)))))
#   env=((f2879 . 0))
# emit-expr (begin (vector-set! f2879 0 (closure (f2883 f2884 f2885) (f2879) (let ((f2883 f2883) (f2884 f2884) (f2885 f2885)) (if (null? f2885) f2883 (begin (vector-set! f2883 f2884 (car f2885)) ((vector-ref f2879 0) f2883 (fxadd1 f2884) (cdr f2885))))))))
# emit-begin
#   expr=(begin (vector-set! f2879 0 (closure (f2883 f2884 f2885) (f2879) (let ((f2883 f2883) (f2884 f2884) (f2885 f2885)) (if (null? f2885) f2883 (begin (vector-set! f2883 f2884 (car f2885)) ((vector-ref f2879 0) f2883 (fxadd1 f2884) (cdr f2885))))))))
#   env=((f2879 . 0))
# emit-expr (vector-set! f2879 0 (closure (f2883 f2884 f2885) (f2879) (let ((f2883 f2883) (f2884 f2884) (f2885 f2885)) (if (null? f2885) f2883 (begin (vector-set! f2883 f2884 (car f2885)) ((vector-ref f2879 0) f2883 (fxadd1 f2884) (cdr f2885)))))))
# emit-expr f2879
# emit-variable-ref
# env=((f2879 . 0))
# var=f2879
    movl 0(%esp), %eax  # stack load f2879
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25050
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25050:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25051"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25051:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25053
    cmp  $0,%eax
    jge _L_25052
_L_25053:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25052:
    movl %eax, -8(%esp)
# emit-expr (closure (f2883 f2884 f2885) (f2879) (let ((f2883 f2883) (f2884 f2884) (f2885 f2885)) (if (null? f2885) f2883 (begin (vector-set! f2883 f2884 (car f2885)) ((vector-ref f2879 0) f2883 (fxadd1 f2884) (cdr f2885))))))
# emit-closure
# si = -12
# env = ((f2879 . 0))
# expr = (closure (f2883 f2884 f2885) (f2879) (let ((f2883 f2883) (f2884 f2884) (f2885 f2885)) (if (null? f2885) f2883 (begin (vector-set! f2883 f2884 (car f2885)) ((vector-ref f2879 0) f2883 (fxadd1 f2884) (cdr f2885))))))
    movl $_L_25054, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f2879 . 0))
# var=f2879
    movl 0(%esp), %eax  # stack load f2879
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f2879
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_25055            # jump around closure body
_L_25054:
# check argument count
    cmp $12,%eax
    je _L_25056
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_25056:
# emit-tail-expr
# si=-20
# env=((f2885 . -16) (f2884 . -12) (f2883 . -8) (f2879 . 4) (f2879 . 0))
# expr=(let ((f2883 f2883) (f2884 f2884) (f2885 f2885)) (if (null? f2885) f2883 (begin (vector-set! f2883 f2884 (car f2885)) ((vector-ref f2879 0) f2883 (fxadd1 f2884) (cdr f2885)))))
# emit-tail-let
#  si   = -20
#  env  = ((f2885 . -16) (f2884 . -12) (f2883 . -8) (f2879 . 4) (f2879 . 0))
#  bindings = ((f2883 f2883) (f2884 f2884) (f2885 f2885))
#  body = (if (null? f2885) f2883 (begin (vector-set! f2883 f2884 (car f2885)) ((vector-ref f2879 0) f2883 (fxadd1 f2884) (cdr f2885))))
# emit-expr f2883
# emit-variable-ref
# env=((f2885 . -16) (f2884 . -12) (f2883 . -8) (f2879 . 4) (f2879 . 0))
# var=f2883
    movl -8(%esp), %eax  # stack load f2883
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr f2884
# emit-variable-ref
# env=((f2885 . -16) (f2884 . -12) (f2883 . -8) (f2879 . 4) (f2879 . 0))
# var=f2884
    movl -12(%esp), %eax  # stack load f2884
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f2885
# emit-variable-ref
# env=((f2885 . -16) (f2884 . -12) (f2883 . -8) (f2879 . 4) (f2879 . 0))
# var=f2885
    movl -16(%esp), %eax  # stack load f2885
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((f2885 . -28) (f2884 . -24) (f2883 . -20) (f2885 . -16) (f2884 . -12) (f2883 . -8) (f2879 . 4) (f2879 . 0))
# expr=(if (null? f2885) f2883 (begin (vector-set! f2883 f2884 (car f2885)) ((vector-ref f2879 0) f2883 (fxadd1 f2884) (cdr f2885))))
# emit-expr (null? f2885)
# emit-expr f2885
# emit-variable-ref
# env=((f2885 . -28) (f2884 . -24) (f2883 . -20) (f2885 . -16) (f2884 . -12) (f2883 . -8) (f2879 . 4) (f2879 . 0))
# var=f2885
    movl -28(%esp), %eax  # stack load f2885
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_25057
# emit-tail-expr
# si=-32
# env=((f2885 . -28) (f2884 . -24) (f2883 . -20) (f2885 . -16) (f2884 . -12) (f2883 . -8) (f2879 . 4) (f2879 . 0))
# expr=f2883
# emit-tail-variable-ref
# emit-variable-ref
# env=((f2885 . -28) (f2884 . -24) (f2883 . -20) (f2885 . -16) (f2884 . -12) (f2883 . -8) (f2879 . 4) (f2879 . 0))
# var=f2883
    movl -20(%esp), %eax  # stack load f2883
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    jmp _L_25058
_L_25057:
# emit-tail-expr
# si=-32
# env=((f2885 . -28) (f2884 . -24) (f2883 . -20) (f2885 . -16) (f2884 . -12) (f2883 . -8) (f2879 . 4) (f2879 . 0))
# expr=(begin (vector-set! f2883 f2884 (car f2885)) ((vector-ref f2879 0) f2883 (fxadd1 f2884) (cdr f2885)))
# tail-begin (begin (vector-set! f2883 f2884 (car f2885)) ((vector-ref f2879 0) f2883 (fxadd1 f2884) (cdr f2885)))
#   env=((f2885 . -28) (f2884 . -24) (f2883 . -20) (f2885 . -16) (f2884 . -12) (f2883 . -8) (f2879 . 4) (f2879 . 0))
# emit-expr (vector-set! f2883 f2884 (car f2885))
# emit-expr f2883
# emit-variable-ref
# env=((f2885 . -28) (f2884 . -24) (f2883 . -20) (f2885 . -16) (f2884 . -12) (f2883 . -8) (f2879 . 4) (f2879 . 0))
# var=f2883
    movl -20(%esp), %eax  # stack load f2883
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25059
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25059:
    movl %eax, -32(%esp)
# emit-expr f2884
# emit-variable-ref
# env=((f2885 . -28) (f2884 . -24) (f2883 . -20) (f2885 . -16) (f2884 . -12) (f2883 . -8) (f2879 . 4) (f2879 . 0))
# var=f2884
    movl -24(%esp), %eax  # stack load f2884
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25060"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25060:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25062
    cmp  $0,%eax
    jge _L_25061
_L_25062:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25061:
    movl %eax, -36(%esp)
# emit-expr (car f2885)
# emit-expr f2885
# emit-variable-ref
# env=((f2885 . -28) (f2884 . -24) (f2883 . -20) (f2885 . -16) (f2884 . -12) (f2883 . -8) (f2879 . 4) (f2879 . 0))
# var=f2885
    movl -28(%esp), %eax  # stack load f2885
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_25063
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25063:
    movl -1(%eax), %eax
    movl -32(%esp), %ebx
    movl -36(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-tail-expr
# si=-32
# env=((f2885 . -28) (f2884 . -24) (f2883 . -20) (f2885 . -16) (f2884 . -12) (f2883 . -8) (f2879 . 4) (f2879 . 0))
# expr=(begin ((vector-ref f2879 0) f2883 (fxadd1 f2884) (cdr f2885)))
# tail-begin (begin ((vector-ref f2879 0) f2883 (fxadd1 f2884) (cdr f2885)))
#   env=((f2885 . -28) (f2884 . -24) (f2883 . -20) (f2885 . -16) (f2884 . -12) (f2883 . -8) (f2879 . 4) (f2879 . 0))
# emit-tail-expr
# si=-32
# env=((f2885 . -28) (f2884 . -24) (f2883 . -20) (f2885 . -16) (f2884 . -12) (f2883 . -8) (f2879 . 4) (f2879 . 0))
# expr=((vector-ref f2879 0) f2883 (fxadd1 f2884) (cdr f2885))
# emit-tail-funcall
#    si   =-32
#    env  = ((f2885 . -28) (f2884 . -24) (f2883 . -20) (f2885 . -16) (f2884 . -12) (f2883 . -8) (f2879 . 4) (f2879 . 0))
#    expr = (funcall (vector-ref f2879 0) f2883 (fxadd1 f2884) (cdr f2885))
# emit-expr (vector-ref f2879 0)
# emit-expr f2879
# emit-variable-ref
# env=((f2885 . -28) (f2884 . -24) (f2883 . -20) (f2885 . -16) (f2884 . -12) (f2883 . -8) (f2879 . 4) (f2879 . 0))
# var=f2879
    movl 2(%edi), %eax  # frame load f2879
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25064
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25064:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25065"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25065:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25067
    cmp  $0,%eax
    jge _L_25066
_L_25067:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25066:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -32(%esp)  # stash funcall-oper in next closure slot
# emit-expr f2883
# emit-variable-ref
# env=((f2885 . -28) (f2884 . -24) (f2883 . -20) (f2885 . -16) (f2884 . -12) (f2883 . -8) (f2879 . 4) (f2879 . 0))
# var=f2883
    movl -20(%esp), %eax  # stack load f2883
# end emit-variable-ref
    mov %eax, -36(%esp)    # arg f2883
# emit-expr (fxadd1 f2884)
# emit-expr f2884
# emit-variable-ref
# env=((f2885 . -28) (f2884 . -24) (f2883 . -20) (f2885 . -16) (f2884 . -12) (f2883 . -8) (f2879 . 4) (f2879 . 0))
# var=f2884
    movl -24(%esp), %eax  # stack load f2884
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25068"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25068:
     addl $4, %eax
    mov %eax, -40(%esp)    # arg (fxadd1 f2884)
# emit-expr (cdr f2885)
# emit-expr f2885
# emit-variable-ref
# env=((f2885 . -28) (f2884 . -24) (f2883 . -20) (f2885 . -16) (f2884 . -12) (f2883 . -8) (f2879 . 4) (f2879 . 0))
# var=f2885
    movl -28(%esp), %eax  # stack load f2885
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_25069
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25069:
    movl 3(%eax), %eax
    mov %eax, -44(%esp)    # arg (cdr f2885)
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
_L_25058:
    .align 4,0x90
_L_25055:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f2879 . 0))
# emit-expr (begin (closure f2889 (f2879) (let () (let ((f2891 (make-vector ((primitive-ref list-length) f2889)))) ((vector-ref f2879 0) f2891 0 f2889)))))
# emit-begin
#   expr=(begin (closure f2889 (f2879) (let () (let ((f2891 (make-vector ((primitive-ref list-length) f2889)))) ((vector-ref f2879 0) f2891 0 f2889)))))
#   env=((f2879 . 0))
# emit-expr (closure f2889 (f2879) (let () (let ((f2891 (make-vector ((primitive-ref list-length) f2889)))) ((vector-ref f2879 0) f2891 0 f2889))))
# emit-closure
# si = -4
# env = ((f2879 . 0))
# expr = (closure f2889 (f2879) (let () (let ((f2891 (make-vector ((primitive-ref list-length) f2889)))) ((vector-ref f2879 0) f2891 0 f2889))))
    movl $_L_25070, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f2879 . 0))
# var=f2879
    movl 0(%esp), %eax  # stack load f2879
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f2879
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_25071            # jump around closure body
_L_25070:
# check argument count
    cmp $0,%eax
    jge _L_25072
# invoke error handler eh_argcount_min
    .extern eh$uargcount$umin
    movl eh$uargcount$umin, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_25072:
# emit-build-varargs-list
    movl $63, %esi       # args <- () 
    lea -4(%esp),%edi    # edi <- esp-4
    subl %eax, %edi      # edi <- esp-4-eax    addr of arg[K+N] on stack
_L_25074:
    lea -4(%esp),%ebx    # addr of arg[K] on stack
    cmp %edi, %ebx       # while edi <> esp+(si+4)
    je _L_25073
    movl (%edi),%ebx     # arg i -> car
    movl %ebx, 0(%ebp)
    movl %esi, 4(%ebp)  # esi -> cdr
    movl %ebp, %esi
    addl $1, %esi       # tag as pair
    addl $8,%ebp         # bump heap ptr
    addl $4,%edi         # move to next previous arg from the end
    jmp _L_25074
_L_25073:
    movl %esi, -8(%esp)  # set args
# emit-tail-expr
# si=-12
# env=((f2889 . -8) (f2879 . 4) (f2879 . 0))
# expr=(let () (let ((f2891 (make-vector ((primitive-ref list-length) f2889)))) ((vector-ref f2879 0) f2891 0 f2889)))
# emit-tail-let
#  si   = -12
#  env  = ((f2889 . -8) (f2879 . 4) (f2879 . 0))
#  bindings = ()
#  body = (let ((f2891 (make-vector ((primitive-ref list-length) f2889)))) ((vector-ref f2879 0) f2891 0 f2889))
# emit-tail-expr
# si=-12
# env=((f2889 . -8) (f2879 . 4) (f2879 . 0))
# expr=(let ((f2891 (make-vector ((primitive-ref list-length) f2889)))) ((vector-ref f2879 0) f2891 0 f2889))
# emit-tail-let
#  si   = -12
#  env  = ((f2889 . -8) (f2879 . 4) (f2879 . 0))
#  bindings = ((f2891 (make-vector ((primitive-ref list-length) f2889))))
#  body = ((vector-ref f2879 0) f2891 0 f2889)
# emit-expr (make-vector ((primitive-ref list-length) f2889))
# make-vector ((primitive-ref list-length) f2889)
# emit-expr ((primitive-ref list-length) f2889)
# funcall
#    si   =-12
#    env  = ((f2889 . -8) (f2879 . 4) (f2879 . 0))
#    expr = (funcall (primitive-ref list-length) f2889)
# emit-expr (primitive-ref list-length)
    .extern list$mlength
    movl list$mlength,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25075"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25075":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr f2889
# emit-variable-ref
# env=((f2889 . -8) (f2879 . 4) (f2879 . 0))
# var=f2889
    movl -8(%esp), %eax  # stack load f2889
# end emit-variable-ref
    mov %eax, -24(%esp)  # arg f2889
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
    je "_L_25076"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25076:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_25077
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25077:
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
# env=((f2891 . -12) (f2889 . -8) (f2879 . 4) (f2879 . 0))
# expr=((vector-ref f2879 0) f2891 0 f2889)
# emit-tail-funcall
#    si   =-16
#    env  = ((f2891 . -12) (f2889 . -8) (f2879 . 4) (f2879 . 0))
#    expr = (funcall (vector-ref f2879 0) f2891 0 f2889)
# emit-expr (vector-ref f2879 0)
# emit-expr f2879
# emit-variable-ref
# env=((f2891 . -12) (f2889 . -8) (f2879 . 4) (f2879 . 0))
# var=f2879
    movl 2(%edi), %eax  # frame load f2879
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25078
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25078:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25079"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25079:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25081
    cmp  $0,%eax
    jge _L_25080
_L_25081:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25080:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f2891
# emit-variable-ref
# env=((f2891 . -12) (f2889 . -8) (f2879 . 4) (f2879 . 0))
# var=f2891
    movl -12(%esp), %eax  # stack load f2891
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f2891
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -24(%esp)    # arg 0
# emit-expr f2889
# emit-variable-ref
# env=((f2891 . -12) (f2889 . -8) (f2879 . 4) (f2879 . 0))
# var=f2889
    movl -8(%esp), %eax  # stack load f2889
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f2889
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
_L_25071:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f2879 . 0))
     movl %eax, vector
# == explicit-begins  ==>
# (let* ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s)))) (write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))
# == eliminate-let*  ==>
# (let ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s))))) (let ((write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1)))))
# == uniquify-variables  ==>
# (let ((f2892 (lambda (f2893) (foreign-call "s_write" 2 f2893 (string-length f2893))))) (let ((f2901 (lambda (f2902 f2903) (begin (f2892 "error:") (f2892 (symbol->string f2902)) (f2892 ": ") (f2892 f2903) (f2892 "\n"))))) (lambda (f2906 f2907) (begin (f2901 f2906 f2907) (foreign-call "s_exit" 1)))))
# == vectorize-letrec  ==>
# (let ((f2892 (lambda (f2893) (foreign-call "s_write" 2 f2893 (string-length f2893))))) (let ((f2901 (lambda (f2902 f2903) (begin (f2892 "error:") (f2892 (symbol->string f2902)) (f2892 ": ") (f2892 f2903) (f2892 "\n"))))) (lambda (f2906 f2907) (begin (f2901 f2906 f2907) (foreign-call "s_exit" 1)))))
# == eliminate-set!  ==>
# (let ((f2892 (lambda (f2893) (let ((f2893 f2893)) (foreign-call "s_write" 2 f2893 (string-length f2893)))))) (let ((f2901 (lambda (f2902 f2903) (let ((f2902 f2902) (f2903 f2903)) (begin (f2892 "error:") (f2892 (symbol->string f2902)) (f2892 ": ") (f2892 f2903) (f2892 "\n")))))) (lambda (f2906 f2907) (let ((f2906 f2906) (f2907 f2907)) (begin (f2901 f2906 f2907) (foreign-call "s_exit" 1))))))
# == close-free-variables  ==>
# (let ((f2892 (closure (f2893) () (let ((f2893 f2893)) (foreign-call "s_write" 2 f2893 (string-length f2893)))))) (let ((f2901 (closure (f2902 f2903) (f2892 f2892 f2892 f2892 f2892) (let ((f2902 f2902) (f2903 f2903)) (begin (f2892 "error:") (f2892 (symbol->string f2902)) (f2892 ": ") (f2892 f2903) (f2892 "\n")))))) (closure (f2906 f2907) (f2901) (let ((f2906 f2906) (f2907 f2907)) (begin (f2901 f2906 f2907) (foreign-call "s_exit" 1))))))
# == eliminate-quote  ==>
# (let ((f2892 (closure (f2893) () (let ((f2893 f2893)) (foreign-call "s_write" 2 f2893 (string-length f2893)))))) (let ((f2901 (closure (f2902 f2903) (f2892 f2892 f2892 f2892 f2892) (let ((f2902 f2902) (f2903 f2903)) (begin (f2892 "error:") (f2892 (symbol->string f2902)) (f2892 ": ") (f2892 f2903) (f2892 "\n")))))) (closure (f2906 f2907) (f2901) (let ((f2906 f2906) (f2907 f2907)) (begin (f2901 f2906 f2907) (foreign-call "s_exit" 1))))))
# == eliminate-when/unless  ==>
# (let ((f2892 (closure (f2893) () (let ((f2893 f2893)) (foreign-call "s_write" 2 f2893 (string-length f2893)))))) (let ((f2901 (closure (f2902 f2903) (f2892 f2892 f2892 f2892 f2892) (let ((f2902 f2902) (f2903 f2903)) (begin (f2892 "error:") (f2892 (symbol->string f2902)) (f2892 ": ") (f2892 f2903) (f2892 "\n")))))) (closure (f2906 f2907) (f2901) (let ((f2906 f2906) (f2907 f2907)) (begin (f2901 f2906 f2907) (foreign-call "s_exit" 1))))))
# == eliminate-cond  ==>
# (let ((f2892 (closure (f2893) () (let ((f2893 f2893)) (foreign-call "s_write" 2 f2893 (string-length f2893)))))) (let ((f2901 (closure (f2902 f2903) (f2892 f2892 f2892 f2892 f2892) (let ((f2902 f2902) (f2903 f2903)) (begin (f2892 "error:") (f2892 (symbol->string f2902)) (f2892 ": ") (f2892 f2903) (f2892 "\n")))))) (closure (f2906 f2907) (f2901) (let ((f2906 f2906) (f2907 f2907)) (begin (f2901 f2906 f2907) (foreign-call "s_exit" 1))))))
# == external-symbols  ==>
# (let ((f2892 (closure (f2893) () (let ((f2893 f2893)) (foreign-call "s_write" 2 f2893 (string-length f2893)))))) (let ((f2901 (closure (f2902 f2903) (f2892 f2892 f2892 f2892 f2892) (let ((f2902 f2902) (f2903 f2903)) (begin (f2892 "error:") (f2892 (symbol->string f2902)) (f2892 ": ") (f2892 f2903) (f2892 "\n")))))) (closure (f2906 f2907) (f2901) (let ((f2906 f2906) (f2907 f2907)) (begin (f2901 f2906 f2907) (foreign-call "s_exit" 1))))))
# emit-expr (let ((f2892 (closure (f2893) () (let ((f2893 f2893)) (foreign-call "s_write" 2 f2893 (string-length f2893)))))) (let ((f2901 (closure (f2902 f2903) (f2892 f2892 f2892 f2892 f2892) (let ((f2902 f2902) (f2903 f2903)) (begin (f2892 "error:") (f2892 (symbol->string f2902)) (f2892 ": ") (f2892 f2903) (f2892 "\n")))))) (closure (f2906 f2907) (f2901) (let ((f2906 f2906) (f2907 f2907)) (begin (f2901 f2906 f2907) (foreign-call "s_exit" 1))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f2892 (closure (f2893) () (let ((f2893 f2893)) (foreign-call "s_write" 2 f2893 (string-length f2893))))))
#  body = (let ((f2901 (closure (f2902 f2903) (f2892 f2892 f2892 f2892 f2892) (let ((f2902 f2902) (f2903 f2903)) (begin (f2892 "error:") (f2892 (symbol->string f2902)) (f2892 ": ") (f2892 f2903) (f2892 "\n")))))) (closure (f2906 f2907) (f2901) (let ((f2906 f2906) (f2907 f2907)) (begin (f2901 f2906 f2907) (foreign-call "s_exit" 1)))))
# emit-expr (closure (f2893) () (let ((f2893 f2893)) (foreign-call "s_write" 2 f2893 (string-length f2893))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f2893) () (let ((f2893 f2893)) (foreign-call "s_write" 2 f2893 (string-length f2893))))
    movl $_L_25082, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_25083            # jump around closure body
_L_25082:
# check argument count
    cmp $4,%eax
    je _L_25084
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_25084:
# emit-tail-expr
# si=-12
# env=((f2893 . -8))
# expr=(let ((f2893 f2893)) (foreign-call "s_write" 2 f2893 (string-length f2893)))
# emit-tail-let
#  si   = -12
#  env  = ((f2893 . -8))
#  bindings = ((f2893 f2893))
#  body = (foreign-call "s_write" 2 f2893 (string-length f2893))
# emit-expr f2893
# emit-variable-ref
# env=((f2893 . -8))
# var=f2893
    movl -8(%esp), %eax  # stack load f2893
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f2893 . -12) (f2893 . -8))
# expr=(foreign-call "s_write" 2 f2893 (string-length f2893))
    movl %ecx,-16(%esp)
    movl %esp,-20(%esp)
# emit-expr (string-length f2893)
# emit-expr f2893
# emit-variable-ref
# env=((f2893 . -12) (f2893 . -8))
# var=f2893
    movl -12(%esp), %eax  # stack load f2893
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_25085
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25085:
    movl -6(%eax), %eax
    movl %eax, -24(%esp)
# emit-expr f2893
# emit-variable-ref
# env=((f2893 . -12) (f2893 . -8))
# var=f2893
    movl -12(%esp), %eax  # stack load f2893
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
_L_25083:
    movl %eax, 0(%esp)  # stack save
# emit-expr (let ((f2901 (closure (f2902 f2903) (f2892 f2892 f2892 f2892 f2892) (let ((f2902 f2902) (f2903 f2903)) (begin (f2892 "error:") (f2892 (symbol->string f2902)) (f2892 ": ") (f2892 f2903) (f2892 "\n")))))) (closure (f2906 f2907) (f2901) (let ((f2906 f2906) (f2907 f2907)) (begin (f2901 f2906 f2907) (foreign-call "s_exit" 1)))))
# emit-let
#  si   = -4
#  env  = ((f2892 . 0))
#  bindings = ((f2901 (closure (f2902 f2903) (f2892 f2892 f2892 f2892 f2892) (let ((f2902 f2902) (f2903 f2903)) (begin (f2892 "error:") (f2892 (symbol->string f2902)) (f2892 ": ") (f2892 f2903) (f2892 "\n"))))))
#  body = (closure (f2906 f2907) (f2901) (let ((f2906 f2906) (f2907 f2907)) (begin (f2901 f2906 f2907) (foreign-call "s_exit" 1))))
# emit-expr (closure (f2902 f2903) (f2892 f2892 f2892 f2892 f2892) (let ((f2902 f2902) (f2903 f2903)) (begin (f2892 "error:") (f2892 (symbol->string f2902)) (f2892 ": ") (f2892 f2903) (f2892 "\n"))))
# emit-closure
# si = -4
# env = ((f2892 . 0))
# expr = (closure (f2902 f2903) (f2892 f2892 f2892 f2892 f2892) (let ((f2902 f2902) (f2903 f2903)) (begin (f2892 "error:") (f2892 (symbol->string f2902)) (f2892 ": ") (f2892 f2903) (f2892 "\n"))))
    movl $_L_25086, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f2892 . 0))
# var=f2892
    movl 0(%esp), %eax  # stack load f2892
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f2892
# emit-variable-ref
# env=((f2892 . 0))
# var=f2892
    movl 0(%esp), %eax  # stack load f2892
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f2892
# emit-variable-ref
# env=((f2892 . 0))
# var=f2892
    movl 0(%esp), %eax  # stack load f2892
# end emit-variable-ref
   movl  %eax, 12(%ebp)  # f2892
# emit-variable-ref
# env=((f2892 . 0))
# var=f2892
    movl 0(%esp), %eax  # stack load f2892
# end emit-variable-ref
   movl  %eax, 16(%ebp)  # f2892
# emit-variable-ref
# env=((f2892 . 0))
# var=f2892
    movl 0(%esp), %eax  # stack load f2892
# end emit-variable-ref
   movl  %eax, 20(%ebp)  # f2892
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $24, %ebp     # bump ebp
    jmp _L_25087            # jump around closure body
_L_25086:
# check argument count
    cmp $8,%eax
    je _L_25088
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_25088:
# emit-tail-expr
# si=-16
# env=((f2903 . -12) (f2902 . -8) (f2892 . 20) (f2892 . 16) (f2892 . 12) (f2892 . 8) (f2892 . 4) (f2892 . 0))
# expr=(let ((f2902 f2902) (f2903 f2903)) (begin (f2892 "error:") (f2892 (symbol->string f2902)) (f2892 ": ") (f2892 f2903) (f2892 "\n")))
# emit-tail-let
#  si   = -16
#  env  = ((f2903 . -12) (f2902 . -8) (f2892 . 20) (f2892 . 16) (f2892 . 12) (f2892 . 8) (f2892 . 4) (f2892 . 0))
#  bindings = ((f2902 f2902) (f2903 f2903))
#  body = (begin (f2892 "error:") (f2892 (symbol->string f2902)) (f2892 ": ") (f2892 f2903) (f2892 "\n"))
# emit-expr f2902
# emit-variable-ref
# env=((f2903 . -12) (f2902 . -8) (f2892 . 20) (f2892 . 16) (f2892 . 12) (f2892 . 8) (f2892 . 4) (f2892 . 0))
# var=f2902
    movl -8(%esp), %eax  # stack load f2902
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f2903
# emit-variable-ref
# env=((f2903 . -12) (f2902 . -8) (f2892 . 20) (f2892 . 16) (f2892 . 12) (f2892 . 8) (f2892 . 4) (f2892 . 0))
# var=f2903
    movl -12(%esp), %eax  # stack load f2903
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f2903 . -20) (f2902 . -16) (f2903 . -12) (f2902 . -8) (f2892 . 20) (f2892 . 16) (f2892 . 12) (f2892 . 8) (f2892 . 4) (f2892 . 0))
# expr=(begin (f2892 "error:") (f2892 (symbol->string f2902)) (f2892 ": ") (f2892 f2903) (f2892 "\n"))
# tail-begin (begin (f2892 "error:") (f2892 (symbol->string f2902)) (f2892 ": ") (f2892 f2903) (f2892 "\n"))
#   env=((f2903 . -20) (f2902 . -16) (f2903 . -12) (f2902 . -8) (f2892 . 20) (f2892 . 16) (f2892 . 12) (f2892 . 8) (f2892 . 4) (f2892 . 0))
# emit-expr (f2892 "error:")
# funcall
#    si   =-24
#    env  = ((f2903 . -20) (f2902 . -16) (f2903 . -12) (f2902 . -8) (f2892 . 20) (f2892 . 16) (f2892 . 12) (f2892 . 8) (f2892 . 4) (f2892 . 0))
#    expr = (funcall f2892 "error:")
# emit-expr f2892
# emit-variable-ref
# env=((f2903 . -20) (f2902 . -16) (f2903 . -12) (f2902 . -8) (f2892 . 20) (f2892 . 16) (f2892 . 12) (f2892 . 8) (f2892 . 4) (f2892 . 0))
# var=f2892
    movl 18(%edi), %eax  # frame load f2892
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25089"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25089":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr "error:"
# string literal
    jmp _L_25091
    .align 8,0x90
_L_25090 :
    .int 24
    .ascii "error:"
_L_25091:
    movl $_L_25090, %eax
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
# env=((f2903 . -20) (f2902 . -16) (f2903 . -12) (f2902 . -8) (f2892 . 20) (f2892 . 16) (f2892 . 12) (f2892 . 8) (f2892 . 4) (f2892 . 0))
# expr=(begin (f2892 (symbol->string f2902)) (f2892 ": ") (f2892 f2903) (f2892 "\n"))
# tail-begin (begin (f2892 (symbol->string f2902)) (f2892 ": ") (f2892 f2903) (f2892 "\n"))
#   env=((f2903 . -20) (f2902 . -16) (f2903 . -12) (f2902 . -8) (f2892 . 20) (f2892 . 16) (f2892 . 12) (f2892 . 8) (f2892 . 4) (f2892 . 0))
# emit-expr (f2892 (symbol->string f2902))
# funcall
#    si   =-24
#    env  = ((f2903 . -20) (f2902 . -16) (f2903 . -12) (f2902 . -8) (f2892 . 20) (f2892 . 16) (f2892 . 12) (f2892 . 8) (f2892 . 4) (f2892 . 0))
#    expr = (funcall f2892 (symbol->string f2902))
# emit-expr f2892
# emit-variable-ref
# env=((f2903 . -20) (f2902 . -16) (f2903 . -12) (f2902 . -8) (f2892 . 20) (f2892 . 16) (f2892 . 12) (f2892 . 8) (f2892 . 4) (f2892 . 0))
# var=f2892
    movl 18(%edi), %eax  # frame load f2892
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25092"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25092":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr (symbol->string f2902)
# symbol->string f2902
# emit-expr f2902
# emit-variable-ref
# env=((f2903 . -20) (f2902 . -16) (f2903 . -12) (f2902 . -8) (f2892 . 20) (f2892 . 16) (f2892 . 12) (f2892 . 8) (f2892 . 4) (f2892 . 0))
# var=f2902
    movl -16(%esp), %eax  # stack load f2902
# end emit-variable-ref
    movl -3(%eax), %eax
    mov %eax, -36(%esp)  # arg (symbol->string f2902)
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f2903 . -20) (f2902 . -16) (f2903 . -12) (f2902 . -8) (f2892 . 20) (f2892 . 16) (f2892 . 12) (f2892 . 8) (f2892 . 4) (f2892 . 0))
# expr=(begin (f2892 ": ") (f2892 f2903) (f2892 "\n"))
# tail-begin (begin (f2892 ": ") (f2892 f2903) (f2892 "\n"))
#   env=((f2903 . -20) (f2902 . -16) (f2903 . -12) (f2902 . -8) (f2892 . 20) (f2892 . 16) (f2892 . 12) (f2892 . 8) (f2892 . 4) (f2892 . 0))
# emit-expr (f2892 ": ")
# funcall
#    si   =-24
#    env  = ((f2903 . -20) (f2902 . -16) (f2903 . -12) (f2902 . -8) (f2892 . 20) (f2892 . 16) (f2892 . 12) (f2892 . 8) (f2892 . 4) (f2892 . 0))
#    expr = (funcall f2892 ": ")
# emit-expr f2892
# emit-variable-ref
# env=((f2903 . -20) (f2902 . -16) (f2903 . -12) (f2902 . -8) (f2892 . 20) (f2892 . 16) (f2892 . 12) (f2892 . 8) (f2892 . 4) (f2892 . 0))
# var=f2892
    movl 18(%edi), %eax  # frame load f2892
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25093"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25093":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr ": "
# string literal
    jmp _L_25095
    .align 8,0x90
_L_25094 :
    .int 8
    .ascii ": "
_L_25095:
    movl $_L_25094, %eax
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
# env=((f2903 . -20) (f2902 . -16) (f2903 . -12) (f2902 . -8) (f2892 . 20) (f2892 . 16) (f2892 . 12) (f2892 . 8) (f2892 . 4) (f2892 . 0))
# expr=(begin (f2892 f2903) (f2892 "\n"))
# tail-begin (begin (f2892 f2903) (f2892 "\n"))
#   env=((f2903 . -20) (f2902 . -16) (f2903 . -12) (f2902 . -8) (f2892 . 20) (f2892 . 16) (f2892 . 12) (f2892 . 8) (f2892 . 4) (f2892 . 0))
# emit-expr (f2892 f2903)
# funcall
#    si   =-24
#    env  = ((f2903 . -20) (f2902 . -16) (f2903 . -12) (f2902 . -8) (f2892 . 20) (f2892 . 16) (f2892 . 12) (f2892 . 8) (f2892 . 4) (f2892 . 0))
#    expr = (funcall f2892 f2903)
# emit-expr f2892
# emit-variable-ref
# env=((f2903 . -20) (f2902 . -16) (f2903 . -12) (f2902 . -8) (f2892 . 20) (f2892 . 16) (f2892 . 12) (f2892 . 8) (f2892 . 4) (f2892 . 0))
# var=f2892
    movl 18(%edi), %eax  # frame load f2892
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25096"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25096":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f2903
# emit-variable-ref
# env=((f2903 . -20) (f2902 . -16) (f2903 . -12) (f2902 . -8) (f2892 . 20) (f2892 . 16) (f2892 . 12) (f2892 . 8) (f2892 . 4) (f2892 . 0))
# var=f2903
    movl -20(%esp), %eax  # stack load f2903
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f2903
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f2903 . -20) (f2902 . -16) (f2903 . -12) (f2902 . -8) (f2892 . 20) (f2892 . 16) (f2892 . 12) (f2892 . 8) (f2892 . 4) (f2892 . 0))
# expr=(begin (f2892 "\n"))
# tail-begin (begin (f2892 "\n"))
#   env=((f2903 . -20) (f2902 . -16) (f2903 . -12) (f2902 . -8) (f2892 . 20) (f2892 . 16) (f2892 . 12) (f2892 . 8) (f2892 . 4) (f2892 . 0))
# emit-tail-expr
# si=-24
# env=((f2903 . -20) (f2902 . -16) (f2903 . -12) (f2902 . -8) (f2892 . 20) (f2892 . 16) (f2892 . 12) (f2892 . 8) (f2892 . 4) (f2892 . 0))
# expr=(f2892 "\n")
# emit-tail-funcall
#    si   =-24
#    env  = ((f2903 . -20) (f2902 . -16) (f2903 . -12) (f2902 . -8) (f2892 . 20) (f2892 . 16) (f2892 . 12) (f2892 . 8) (f2892 . 4) (f2892 . 0))
#    expr = (funcall f2892 "\n")
# emit-expr f2892
# emit-variable-ref
# env=((f2903 . -20) (f2902 . -16) (f2903 . -12) (f2902 . -8) (f2892 . 20) (f2892 . 16) (f2892 . 12) (f2892 . 8) (f2892 . 4) (f2892 . 0))
# var=f2892
    movl 18(%edi), %eax  # frame load f2892
# end emit-variable-ref
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr "\n"
# string literal
    jmp _L_25098
    .align 8,0x90
_L_25097 :
    .int 4
    .ascii "\n"
_L_25098:
    movl $_L_25097, %eax
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
_L_25087:
    movl %eax, -4(%esp)  # stack save
# emit-expr (closure (f2906 f2907) (f2901) (let ((f2906 f2906) (f2907 f2907)) (begin (f2901 f2906 f2907) (foreign-call "s_exit" 1))))
# emit-closure
# si = -8
# env = ((f2901 . -4) (f2892 . 0))
# expr = (closure (f2906 f2907) (f2901) (let ((f2906 f2906) (f2907 f2907)) (begin (f2901 f2906 f2907) (foreign-call "s_exit" 1))))
    movl $_L_25099, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f2901 . -4) (f2892 . 0))
# var=f2901
    movl -4(%esp), %eax  # stack load f2901
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f2901
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_25100            # jump around closure body
_L_25099:
# check argument count
    cmp $8,%eax
    je _L_25101
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_25101:
# emit-tail-expr
# si=-16
# env=((f2907 . -12) (f2906 . -8) (f2901 . 4) (f2901 . -4) (f2892 . 0))
# expr=(let ((f2906 f2906) (f2907 f2907)) (begin (f2901 f2906 f2907) (foreign-call "s_exit" 1)))
# emit-tail-let
#  si   = -16
#  env  = ((f2907 . -12) (f2906 . -8) (f2901 . 4) (f2901 . -4) (f2892 . 0))
#  bindings = ((f2906 f2906) (f2907 f2907))
#  body = (begin (f2901 f2906 f2907) (foreign-call "s_exit" 1))
# emit-expr f2906
# emit-variable-ref
# env=((f2907 . -12) (f2906 . -8) (f2901 . 4) (f2901 . -4) (f2892 . 0))
# var=f2906
    movl -8(%esp), %eax  # stack load f2906
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f2907
# emit-variable-ref
# env=((f2907 . -12) (f2906 . -8) (f2901 . 4) (f2901 . -4) (f2892 . 0))
# var=f2907
    movl -12(%esp), %eax  # stack load f2907
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f2907 . -20) (f2906 . -16) (f2907 . -12) (f2906 . -8) (f2901 . 4) (f2901 . -4) (f2892 . 0))
# expr=(begin (f2901 f2906 f2907) (foreign-call "s_exit" 1))
# tail-begin (begin (f2901 f2906 f2907) (foreign-call "s_exit" 1))
#   env=((f2907 . -20) (f2906 . -16) (f2907 . -12) (f2906 . -8) (f2901 . 4) (f2901 . -4) (f2892 . 0))
# emit-expr (f2901 f2906 f2907)
# funcall
#    si   =-24
#    env  = ((f2907 . -20) (f2906 . -16) (f2907 . -12) (f2906 . -8) (f2901 . 4) (f2901 . -4) (f2892 . 0))
#    expr = (funcall f2901 f2906 f2907)
# emit-expr f2901
# emit-variable-ref
# env=((f2907 . -20) (f2906 . -16) (f2907 . -12) (f2906 . -8) (f2901 . 4) (f2901 . -4) (f2892 . 0))
# var=f2901
    movl 2(%edi), %eax  # frame load f2901
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25102"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25102":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f2906
# emit-variable-ref
# env=((f2907 . -20) (f2906 . -16) (f2907 . -12) (f2906 . -8) (f2901 . 4) (f2901 . -4) (f2892 . 0))
# var=f2906
    movl -16(%esp), %eax  # stack load f2906
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f2906
# emit-expr f2907
# emit-variable-ref
# env=((f2907 . -20) (f2906 . -16) (f2907 . -12) (f2906 . -8) (f2901 . 4) (f2901 . -4) (f2892 . 0))
# var=f2907
    movl -20(%esp), %eax  # stack load f2907
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg f2907
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f2907 . -20) (f2906 . -16) (f2907 . -12) (f2906 . -8) (f2901 . 4) (f2901 . -4) (f2892 . 0))
# expr=(begin (foreign-call "s_exit" 1))
# tail-begin (begin (foreign-call "s_exit" 1))
#   env=((f2907 . -20) (f2906 . -16) (f2907 . -12) (f2906 . -8) (f2901 . 4) (f2901 . -4) (f2892 . 0))
# emit-tail-expr
# si=-24
# env=((f2907 . -20) (f2906 . -16) (f2907 . -12) (f2906 . -8) (f2901 . 4) (f2901 . -4) (f2892 . 0))
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
_L_25100:
     movl %eax, error
# == explicit-begins  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == eliminate-let*  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == uniquify-variables  ==>
# (let ((f2908 (quote ()))) (begin (set! f2908 (cons (quote procedure?) f2908)) (set! f2908 (cons (quote cdr) f2908)) (set! f2908 (cons (quote car) f2908)) (set! f2908 (cons (quote symbol-value) f2908)) (set! f2908 (cons (quote symbol->string) f2908)) (set! f2908 (cons (quote make-symbol) f2908)) (set! f2908 (cons (quote symbol?) f2908)) (set! f2908 (cons (quote string-set!) f2908)) (set! f2908 (cons (quote string-ref) f2908)) (set! f2908 (cons (quote string-length) f2908)) (set! f2908 (cons (quote string?) f2908)) (set! f2908 (cons (quote make-string) f2908)) (set! f2908 (cons (quote vector-ref) f2908)) (set! f2908 (cons (quote vector-set!) f2908)) (set! f2908 (cons (quote vector-length) f2908)) (set! f2908 (cons (quote make-vector) f2908)) (set! f2908 (cons (quote vector?) f2908)) (set! f2908 (cons (quote set-cdr!) f2908)) (set! f2908 (cons (quote set-car!) f2908)) (set! f2908 (cons (quote cdr) f2908)) (set! f2908 (cons (quote car) f2908)) (set! f2908 (cons (quote cons) f2908)) (set! f2908 (cons (quote pair?) f2908)) (set! f2908 (cons (quote fx*) f2908)) (set! f2908 (cons (quote fx-) f2908)) (set! f2908 (cons (quote fx+) f2908)) (set! f2908 (cons (quote fx>=) f2908)) (set! f2908 (cons (quote fx>) f2908)) (set! f2908 (cons (quote fx<=) f2908)) (set! f2908 (cons (quote fx<) f2908)) (set! f2908 (cons (quote fx=) f2908)) (set! f2908 (cons (quote fxzero?) f2908)) (set! f2908 (cons (quote fxsub1) f2908)) (set! f2908 (cons (quote fxadd1) f2908)) (set! f2908 (cons (quote fxlogor) f2908)) (set! f2908 (cons (quote fxlogand) f2908)) (set! f2908 (cons (quote fxlognot) f2908)) (set! f2908 (cons (quote char=?) f2908)) (set! f2908 (cons (quote eq?) f2908)) (set! f2908 (cons (quote not) f2908)) (set! f2908 (cons (quote boolean?) f2908)) (set! f2908 (cons (quote fixnum?) f2908)) (set! f2908 (cons (quote char?) f2908)) (set! f2908 (cons (quote null?) f2908)) (set! f2908 (cons (quote char->fixnum) f2908)) (set! f2908 (cons (quote fixnum->char) f2908)) (lambda () f2908)))
# == vectorize-letrec  ==>
# (let ((f2908 (quote ()))) (begin (set! f2908 (cons (quote procedure?) f2908)) (set! f2908 (cons (quote cdr) f2908)) (set! f2908 (cons (quote car) f2908)) (set! f2908 (cons (quote symbol-value) f2908)) (set! f2908 (cons (quote symbol->string) f2908)) (set! f2908 (cons (quote make-symbol) f2908)) (set! f2908 (cons (quote symbol?) f2908)) (set! f2908 (cons (quote string-set!) f2908)) (set! f2908 (cons (quote string-ref) f2908)) (set! f2908 (cons (quote string-length) f2908)) (set! f2908 (cons (quote string?) f2908)) (set! f2908 (cons (quote make-string) f2908)) (set! f2908 (cons (quote vector-ref) f2908)) (set! f2908 (cons (quote vector-set!) f2908)) (set! f2908 (cons (quote vector-length) f2908)) (set! f2908 (cons (quote make-vector) f2908)) (set! f2908 (cons (quote vector?) f2908)) (set! f2908 (cons (quote set-cdr!) f2908)) (set! f2908 (cons (quote set-car!) f2908)) (set! f2908 (cons (quote cdr) f2908)) (set! f2908 (cons (quote car) f2908)) (set! f2908 (cons (quote cons) f2908)) (set! f2908 (cons (quote pair?) f2908)) (set! f2908 (cons (quote fx*) f2908)) (set! f2908 (cons (quote fx-) f2908)) (set! f2908 (cons (quote fx+) f2908)) (set! f2908 (cons (quote fx>=) f2908)) (set! f2908 (cons (quote fx>) f2908)) (set! f2908 (cons (quote fx<=) f2908)) (set! f2908 (cons (quote fx<) f2908)) (set! f2908 (cons (quote fx=) f2908)) (set! f2908 (cons (quote fxzero?) f2908)) (set! f2908 (cons (quote fxsub1) f2908)) (set! f2908 (cons (quote fxadd1) f2908)) (set! f2908 (cons (quote fxlogor) f2908)) (set! f2908 (cons (quote fxlogand) f2908)) (set! f2908 (cons (quote fxlognot) f2908)) (set! f2908 (cons (quote char=?) f2908)) (set! f2908 (cons (quote eq?) f2908)) (set! f2908 (cons (quote not) f2908)) (set! f2908 (cons (quote boolean?) f2908)) (set! f2908 (cons (quote fixnum?) f2908)) (set! f2908 (cons (quote char?) f2908)) (set! f2908 (cons (quote null?) f2908)) (set! f2908 (cons (quote char->fixnum) f2908)) (set! f2908 (cons (quote fixnum->char) f2908)) (lambda () f2908)))
# == eliminate-set!  ==>
# (let ((f2908 (vector (quote ())))) (begin (vector-set! f2908 0 (cons (quote procedure?) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote cdr) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote car) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote symbol-value) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote symbol->string) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote make-symbol) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote symbol?) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote string-set!) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote string-ref) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote string-length) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote string?) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote make-string) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote vector-ref) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote vector-set!) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote vector-length) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote make-vector) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote vector?) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote set-cdr!) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote set-car!) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote cdr) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote car) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote cons) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote pair?) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fx*) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fx-) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fx+) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fx>=) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fx>) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fx<=) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fx<) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fx=) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fxzero?) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fxsub1) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fxadd1) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fxlogor) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fxlogand) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fxlognot) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote char=?) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote eq?) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote not) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote boolean?) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fixnum?) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote char?) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote null?) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote char->fixnum) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fixnum->char) (vector-ref f2908 0))) (lambda () (let () (vector-ref f2908 0)))))
# == close-free-variables  ==>
# (let ((f2908 (vector (quote ())))) (begin (vector-set! f2908 0 (cons (quote procedure?) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote cdr) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote car) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote symbol-value) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote symbol->string) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote make-symbol) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote symbol?) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote string-set!) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote string-ref) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote string-length) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote string?) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote make-string) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote vector-ref) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote vector-set!) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote vector-length) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote make-vector) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote vector?) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote set-cdr!) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote set-car!) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote cdr) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote car) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote cons) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote pair?) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fx*) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fx-) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fx+) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fx>=) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fx>) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fx<=) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fx<) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fx=) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fxzero?) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fxsub1) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fxadd1) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fxlogor) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fxlogand) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fxlognot) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote char=?) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote eq?) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote not) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote boolean?) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fixnum?) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote char?) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote null?) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote char->fixnum) (vector-ref f2908 0))) (vector-set! f2908 0 (cons (quote fixnum->char) (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0)))))
# == eliminate-quote  ==>
# (let ((f2908 (vector ()))) (begin (vector-set! f2908 0 (cons (string->symbol "procedure?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "symbol-value") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "symbol->string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "make-symbol") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "symbol?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "string-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "string-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "string-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "string?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0)))))
# == eliminate-when/unless  ==>
# (let ((f2908 (vector ()))) (begin (vector-set! f2908 0 (cons (string->symbol "procedure?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "symbol-value") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "symbol->string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "make-symbol") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "symbol?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "string-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "string-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "string-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "string?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0)))))
# == eliminate-cond  ==>
# (let ((f2908 (vector ()))) (begin (vector-set! f2908 0 (cons (string->symbol "procedure?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "symbol-value") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "symbol->string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "make-symbol") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "symbol?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "string-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "string-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "string-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "string?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons (string->symbol "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0)))))
# == external-symbols  ==>
# (let ((f2908 ((primitive-ref vector) ()))) (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0)))))
# emit-expr (let ((f2908 ((primitive-ref vector) ()))) (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0)))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f2908 ((primitive-ref vector) ())))
#  body = (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
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
    je "_L_25103"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25103":
   movl %eax,  -8(%esp)  # stash funcall-oper in closure slot
# emit-expr ()
    movl $63, %eax     # immed ()
    mov %eax, -12(%esp)  # arg ()
    movl -8(%esp), %edi   # load new closure to %edi
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25104
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25104:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25105"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25105:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25107
    cmp  $0,%eax
    jge _L_25106
_L_25107:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25106:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "procedure?") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "procedure?")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "procedure?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25108"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25108":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "procedure?"
# string literal
    jmp _L_25110
    .align 8,0x90
_L_25109 :
    .int 40
    .ascii "procedure?"
_L_25110:
    movl $_L_25109, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg procedure?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25111
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25111:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25112"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25112:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25114
    cmp  $0,%eax
    jge _L_25113
_L_25114:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25113:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25115
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25115:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25116"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25116:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25118
    cmp  $0,%eax
    jge _L_25117
_L_25118:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25117:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "cdr") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "cdr")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cdr")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25119"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25119":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_25121
    .align 8,0x90
_L_25120 :
    .int 12
    .ascii "cdr"
_L_25121:
    movl $_L_25120, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cdr
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25122
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25122:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25123"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25123:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25125
    cmp  $0,%eax
    jge _L_25124
_L_25125:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25124:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25126
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25126:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25127"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25127:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25129
    cmp  $0,%eax
    jge _L_25128
_L_25129:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25128:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "car") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "car")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "car")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25130"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25130":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_25132
    .align 8,0x90
_L_25131 :
    .int 12
    .ascii "car"
_L_25132:
    movl $_L_25131, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg car
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25133
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25133:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25134"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25134:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25136
    cmp  $0,%eax
    jge _L_25135
_L_25136:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25135:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25137
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25137:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25138"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25138:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25140
    cmp  $0,%eax
    jge _L_25139
_L_25140:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25139:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "symbol-value") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "symbol-value")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol-value")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25141"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25141":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol-value"
# string literal
    jmp _L_25143
    .align 8,0x90
_L_25142 :
    .int 48
    .ascii "symbol-value"
_L_25143:
    movl $_L_25142, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol-value
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25144
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25144:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25145"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25145:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25147
    cmp  $0,%eax
    jge _L_25146
_L_25147:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25146:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25148
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25148:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25149"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25149:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25151
    cmp  $0,%eax
    jge _L_25150
_L_25151:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25150:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "symbol->string") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "symbol->string")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol->string")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25152"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25152":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol->string"
# string literal
    jmp _L_25154
    .align 8,0x90
_L_25153 :
    .int 56
    .ascii "symbol->string"
_L_25154:
    movl $_L_25153, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol->string
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25155
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25155:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25156"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25156:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25158
    cmp  $0,%eax
    jge _L_25157
_L_25158:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25157:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25159
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25159:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25160"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25160:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25162
    cmp  $0,%eax
    jge _L_25161
_L_25162:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25161:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "make-symbol") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "make-symbol")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-symbol")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25163"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25163":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-symbol"
# string literal
    jmp _L_25165
    .align 8,0x90
_L_25164 :
    .int 44
    .ascii "make-symbol"
_L_25165:
    movl $_L_25164, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-symbol
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25166
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25166:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25167"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25167:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25169
    cmp  $0,%eax
    jge _L_25168
_L_25169:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25168:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25170
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25170:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25171"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25171:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25173
    cmp  $0,%eax
    jge _L_25172
_L_25173:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25172:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "symbol?") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "symbol?")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25174"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25174":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol?"
# string literal
    jmp _L_25176
    .align 8,0x90
_L_25175 :
    .int 28
    .ascii "symbol?"
_L_25176:
    movl $_L_25175, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25177
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25177:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25178"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25178:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25180
    cmp  $0,%eax
    jge _L_25179
_L_25180:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25179:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25181
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25181:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25182"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25182:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25184
    cmp  $0,%eax
    jge _L_25183
_L_25184:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25183:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "string-set!") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "string-set!")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-set!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25185"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25185":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-set!"
# string literal
    jmp _L_25187
    .align 8,0x90
_L_25186 :
    .int 44
    .ascii "string-set!"
_L_25187:
    movl $_L_25186, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-set!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25188
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25188:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25189"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25189:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25191
    cmp  $0,%eax
    jge _L_25190
_L_25191:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25190:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25192
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25192:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25193"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25193:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25195
    cmp  $0,%eax
    jge _L_25194
_L_25195:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25194:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "string-ref") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "string-ref")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-ref")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25196"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25196":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-ref"
# string literal
    jmp _L_25198
    .align 8,0x90
_L_25197 :
    .int 40
    .ascii "string-ref"
_L_25198:
    movl $_L_25197, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-ref
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25199
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25199:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25200"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25200:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25202
    cmp  $0,%eax
    jge _L_25201
_L_25202:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25201:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25203
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25203:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25204"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25204:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25206
    cmp  $0,%eax
    jge _L_25205
_L_25206:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25205:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-length") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "string-length") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "string-length")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-length")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25207"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25207":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-length"
# string literal
    jmp _L_25209
    .align 8,0x90
_L_25208 :
    .int 52
    .ascii "string-length"
_L_25209:
    movl $_L_25208, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-length
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25210
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25210:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25211"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25211:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25213
    cmp  $0,%eax
    jge _L_25212
_L_25213:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25212:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25214
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25214:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25215"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25215:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25217
    cmp  $0,%eax
    jge _L_25216
_L_25217:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25216:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string?") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "string?") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "string?")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25218"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25218":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string?"
# string literal
    jmp _L_25220
    .align 8,0x90
_L_25219 :
    .int 28
    .ascii "string?"
_L_25220:
    movl $_L_25219, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25221
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25221:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25222"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25222:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25224
    cmp  $0,%eax
    jge _L_25223
_L_25224:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25223:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25225
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25225:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25226"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25226:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25228
    cmp  $0,%eax
    jge _L_25227
_L_25228:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25227:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-string") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "make-string") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "make-string")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-string")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25229"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25229":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-string"
# string literal
    jmp _L_25231
    .align 8,0x90
_L_25230 :
    .int 44
    .ascii "make-string"
_L_25231:
    movl $_L_25230, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-string
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25232
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25232:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25233"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25233:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25235
    cmp  $0,%eax
    jge _L_25234
_L_25235:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25234:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25236
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25236:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25237"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25237:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25239
    cmp  $0,%eax
    jge _L_25238
_L_25239:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25238:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "vector-ref") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "vector-ref")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-ref")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25240"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25240":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-ref"
# string literal
    jmp _L_25242
    .align 8,0x90
_L_25241 :
    .int 40
    .ascii "vector-ref"
_L_25242:
    movl $_L_25241, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-ref
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25243
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25243:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25244"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25244:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25246
    cmp  $0,%eax
    jge _L_25245
_L_25246:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25245:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25247
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25247:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25248"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25248:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25250
    cmp  $0,%eax
    jge _L_25249
_L_25250:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25249:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "vector-set!") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "vector-set!")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-set!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25251"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25251":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-set!"
# string literal
    jmp _L_25253
    .align 8,0x90
_L_25252 :
    .int 44
    .ascii "vector-set!"
_L_25253:
    movl $_L_25252, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-set!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25254
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25254:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25255"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25255:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25257
    cmp  $0,%eax
    jge _L_25256
_L_25257:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25256:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25258
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25258:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25259"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25259:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25261
    cmp  $0,%eax
    jge _L_25260
_L_25261:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25260:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "vector-length") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "vector-length")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-length")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25262"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25262":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-length"
# string literal
    jmp _L_25264
    .align 8,0x90
_L_25263 :
    .int 52
    .ascii "vector-length"
_L_25264:
    movl $_L_25263, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-length
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25265
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25265:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25266"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25266:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25268
    cmp  $0,%eax
    jge _L_25267
_L_25268:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25267:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25269
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25269:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25270"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25270:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25272
    cmp  $0,%eax
    jge _L_25271
_L_25272:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25271:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "make-vector") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "make-vector")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-vector")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25273"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25273":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-vector"
# string literal
    jmp _L_25275
    .align 8,0x90
_L_25274 :
    .int 44
    .ascii "make-vector"
_L_25275:
    movl $_L_25274, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-vector
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25276
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25276:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25277"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25277:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25279
    cmp  $0,%eax
    jge _L_25278
_L_25279:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25278:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25280
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25280:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25281"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25281:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25283
    cmp  $0,%eax
    jge _L_25282
_L_25283:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25282:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector?") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "vector?") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "vector?")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25284"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25284":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector?"
# string literal
    jmp _L_25286
    .align 8,0x90
_L_25285 :
    .int 28
    .ascii "vector?"
_L_25286:
    movl $_L_25285, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25287
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25287:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25288"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25288:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25290
    cmp  $0,%eax
    jge _L_25289
_L_25290:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25289:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25291
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25291:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25292"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25292:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25294
    cmp  $0,%eax
    jge _L_25293
_L_25294:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25293:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "set-cdr!") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "set-cdr!")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "set-cdr!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25295"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25295":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-cdr!"
# string literal
    jmp _L_25297
    .align 8,0x90
_L_25296 :
    .int 32
    .ascii "set-cdr!"
_L_25297:
    movl $_L_25296, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg set-cdr!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25298
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25298:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25299"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25299:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25301
    cmp  $0,%eax
    jge _L_25300
_L_25301:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25300:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25302
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25302:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25303"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25303:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25305
    cmp  $0,%eax
    jge _L_25304
_L_25305:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25304:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "set-car!") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "set-car!")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "set-car!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25306"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25306":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-car!"
# string literal
    jmp _L_25308
    .align 8,0x90
_L_25307 :
    .int 32
    .ascii "set-car!"
_L_25308:
    movl $_L_25307, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg set-car!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25309
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25309:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25310"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25310:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25312
    cmp  $0,%eax
    jge _L_25311
_L_25312:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25311:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25313
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25313:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25314"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25314:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25316
    cmp  $0,%eax
    jge _L_25315
_L_25316:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25315:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cdr") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "cdr") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "cdr")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cdr")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25317"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25317":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_25319
    .align 8,0x90
_L_25318 :
    .int 12
    .ascii "cdr"
_L_25319:
    movl $_L_25318, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cdr
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25320
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25320:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25321"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25321:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25323
    cmp  $0,%eax
    jge _L_25322
_L_25323:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25322:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25324
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25324:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25325"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25325:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25327
    cmp  $0,%eax
    jge _L_25326
_L_25327:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25326:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "car") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "car") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "car")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "car")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25328"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25328":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_25330
    .align 8,0x90
_L_25329 :
    .int 12
    .ascii "car"
_L_25330:
    movl $_L_25329, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg car
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25331
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25331:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25332"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25332:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25334
    cmp  $0,%eax
    jge _L_25333
_L_25334:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25333:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25335
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25335:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25336"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25336:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25338
    cmp  $0,%eax
    jge _L_25337
_L_25338:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25337:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cons") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "cons") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "cons")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cons")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25339"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25339":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cons"
# string literal
    jmp _L_25341
    .align 8,0x90
_L_25340 :
    .int 16
    .ascii "cons"
_L_25341:
    movl $_L_25340, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cons
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25342
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25342:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25343"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25343:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25345
    cmp  $0,%eax
    jge _L_25344
_L_25345:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25344:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25346
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25346:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25347"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25347:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25349
    cmp  $0,%eax
    jge _L_25348
_L_25349:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25348:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "pair?") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "pair?") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "pair?")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "pair?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25350"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25350":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "pair?"
# string literal
    jmp _L_25352
    .align 8,0x90
_L_25351 :
    .int 20
    .ascii "pair?"
_L_25352:
    movl $_L_25351, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg pair?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25353
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25353:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25354"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25354:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25356
    cmp  $0,%eax
    jge _L_25355
_L_25356:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25355:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25357
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25357:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25358"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25358:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25360
    cmp  $0,%eax
    jge _L_25359
_L_25360:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25359:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx*") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "fx*") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "fx*")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx*")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25361"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25361":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx*"
# string literal
    jmp _L_25363
    .align 8,0x90
_L_25362 :
    .int 12
    .ascii "fx*"
_L_25363:
    movl $_L_25362, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx*
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25364
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25364:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25365"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25365:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25367
    cmp  $0,%eax
    jge _L_25366
_L_25367:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25366:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25368
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25368:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25369"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25369:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25371
    cmp  $0,%eax
    jge _L_25370
_L_25371:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25370:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx-") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "fx-") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "fx-")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx-")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25372"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25372":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx-"
# string literal
    jmp _L_25374
    .align 8,0x90
_L_25373 :
    .int 12
    .ascii "fx-"
_L_25374:
    movl $_L_25373, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx-
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25375
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25375:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25376"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25376:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25378
    cmp  $0,%eax
    jge _L_25377
_L_25378:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25377:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25379
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25379:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25380"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25380:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25382
    cmp  $0,%eax
    jge _L_25381
_L_25382:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25381:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx+") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "fx+") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "fx+")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx+")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25383"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25383":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx+"
# string literal
    jmp _L_25385
    .align 8,0x90
_L_25384 :
    .int 12
    .ascii "fx+"
_L_25385:
    movl $_L_25384, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx+
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25386
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25386:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25387"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25387:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25389
    cmp  $0,%eax
    jge _L_25388
_L_25389:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25388:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25390
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25390:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25391"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25391:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25393
    cmp  $0,%eax
    jge _L_25392
_L_25393:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25392:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "fx>=") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "fx>=")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx>=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25394"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25394":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>="
# string literal
    jmp _L_25396
    .align 8,0x90
_L_25395 :
    .int 16
    .ascii "fx>="
_L_25396:
    movl $_L_25395, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx>=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25397
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25397:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25398"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25398:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25400
    cmp  $0,%eax
    jge _L_25399
_L_25400:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25399:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25401
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25401:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25402"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25402:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25404
    cmp  $0,%eax
    jge _L_25403
_L_25404:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25403:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx>") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "fx>") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "fx>")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx>")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25405"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25405":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>"
# string literal
    jmp _L_25407
    .align 8,0x90
_L_25406 :
    .int 12
    .ascii "fx>"
_L_25407:
    movl $_L_25406, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx>
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25408
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25408:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25409"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25409:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25411
    cmp  $0,%eax
    jge _L_25410
_L_25411:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25410:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25412
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25412:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25413"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25413:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25415
    cmp  $0,%eax
    jge _L_25414
_L_25415:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25414:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "fx<=") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "fx<=")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx<=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25416"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25416":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<="
# string literal
    jmp _L_25418
    .align 8,0x90
_L_25417 :
    .int 16
    .ascii "fx<="
_L_25418:
    movl $_L_25417, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx<=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25419
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25419:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25420"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25420:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25422
    cmp  $0,%eax
    jge _L_25421
_L_25422:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25421:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25423
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25423:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25424"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25424:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25426
    cmp  $0,%eax
    jge _L_25425
_L_25426:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25425:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx<") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "fx<") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "fx<")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx<")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25427"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25427":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<"
# string literal
    jmp _L_25429
    .align 8,0x90
_L_25428 :
    .int 12
    .ascii "fx<"
_L_25429:
    movl $_L_25428, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx<
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25430
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25430:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25431"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25431:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25433
    cmp  $0,%eax
    jge _L_25432
_L_25433:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25432:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25434
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25434:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25435"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25435:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25437
    cmp  $0,%eax
    jge _L_25436
_L_25437:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25436:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx=") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "fx=") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "fx=")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25438"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25438":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx="
# string literal
    jmp _L_25440
    .align 8,0x90
_L_25439 :
    .int 12
    .ascii "fx="
_L_25440:
    movl $_L_25439, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25441
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25441:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25442"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25442:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25444
    cmp  $0,%eax
    jge _L_25443
_L_25444:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25443:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25445
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25445:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25446"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25446:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25448
    cmp  $0,%eax
    jge _L_25447
_L_25448:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25447:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "fxzero?") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "fxzero?")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxzero?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25449"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25449":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxzero?"
# string literal
    jmp _L_25451
    .align 8,0x90
_L_25450 :
    .int 28
    .ascii "fxzero?"
_L_25451:
    movl $_L_25450, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxzero?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25452
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25452:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25453"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25453:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25455
    cmp  $0,%eax
    jge _L_25454
_L_25455:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25454:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25456
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25456:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25457"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25457:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25459
    cmp  $0,%eax
    jge _L_25458
_L_25459:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25458:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "fxsub1") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "fxsub1")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxsub1")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25460"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25460":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxsub1"
# string literal
    jmp _L_25462
    .align 8,0x90
_L_25461 :
    .int 24
    .ascii "fxsub1"
_L_25462:
    movl $_L_25461, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxsub1
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25463
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25463:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25464"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25464:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25466
    cmp  $0,%eax
    jge _L_25465
_L_25466:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25465:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25467
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25467:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25468"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25468:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25470
    cmp  $0,%eax
    jge _L_25469
_L_25470:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25469:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "fxadd1") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "fxadd1")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxadd1")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25471"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25471":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxadd1"
# string literal
    jmp _L_25473
    .align 8,0x90
_L_25472 :
    .int 24
    .ascii "fxadd1"
_L_25473:
    movl $_L_25472, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxadd1
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25474
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25474:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25475"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25475:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25477
    cmp  $0,%eax
    jge _L_25476
_L_25477:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25476:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25478
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25478:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25479"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25479:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25481
    cmp  $0,%eax
    jge _L_25480
_L_25481:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25480:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "fxlogor") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "fxlogor")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlogor")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25482"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25482":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogor"
# string literal
    jmp _L_25484
    .align 8,0x90
_L_25483 :
    .int 28
    .ascii "fxlogor"
_L_25484:
    movl $_L_25483, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlogor
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25485
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25485:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25486"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25486:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25488
    cmp  $0,%eax
    jge _L_25487
_L_25488:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25487:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25489
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25489:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25490"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25490:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25492
    cmp  $0,%eax
    jge _L_25491
_L_25492:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25491:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "fxlogand") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "fxlogand")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlogand")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25493"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25493":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogand"
# string literal
    jmp _L_25495
    .align 8,0x90
_L_25494 :
    .int 32
    .ascii "fxlogand"
_L_25495:
    movl $_L_25494, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlogand
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25496
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25496:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25497"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25497:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25499
    cmp  $0,%eax
    jge _L_25498
_L_25499:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25498:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25500
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25500:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25501"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25501:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25503
    cmp  $0,%eax
    jge _L_25502
_L_25503:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25502:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "fxlognot") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "fxlognot")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlognot")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25504"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25504":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlognot"
# string literal
    jmp _L_25506
    .align 8,0x90
_L_25505 :
    .int 32
    .ascii "fxlognot"
_L_25506:
    movl $_L_25505, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlognot
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25507
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25507:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25508"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25508:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25510
    cmp  $0,%eax
    jge _L_25509
_L_25510:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25509:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25511
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25511:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25512"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25512:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25514
    cmp  $0,%eax
    jge _L_25513
_L_25514:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25513:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char=?") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "char=?") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "char=?")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char=?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25515"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25515":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char=?"
# string literal
    jmp _L_25517
    .align 8,0x90
_L_25516 :
    .int 24
    .ascii "char=?"
_L_25517:
    movl $_L_25516, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char=?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25518
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25518:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25519"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25519:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25521
    cmp  $0,%eax
    jge _L_25520
_L_25521:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25520:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25522
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25522:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25523"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25523:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25525
    cmp  $0,%eax
    jge _L_25524
_L_25525:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25524:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "eq?") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "eq?") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "eq?")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "eq?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25526"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25526":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "eq?"
# string literal
    jmp _L_25528
    .align 8,0x90
_L_25527 :
    .int 12
    .ascii "eq?"
_L_25528:
    movl $_L_25527, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg eq?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25529
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25529:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25530"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25530:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25532
    cmp  $0,%eax
    jge _L_25531
_L_25532:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25531:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25533
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25533:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25534"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25534:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25536
    cmp  $0,%eax
    jge _L_25535
_L_25536:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25535:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "not") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "not") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "not")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "not")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25537"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25537":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "not"
# string literal
    jmp _L_25539
    .align 8,0x90
_L_25538 :
    .int 12
    .ascii "not"
_L_25539:
    movl $_L_25538, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg not
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25540
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25540:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25541"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25541:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25543
    cmp  $0,%eax
    jge _L_25542
_L_25543:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25542:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25544
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25544:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25545"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25545:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25547
    cmp  $0,%eax
    jge _L_25546
_L_25547:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25546:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "boolean?") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "boolean?")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "boolean?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25548"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25548":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "boolean?"
# string literal
    jmp _L_25550
    .align 8,0x90
_L_25549 :
    .int 32
    .ascii "boolean?"
_L_25550:
    movl $_L_25549, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg boolean?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25551
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25551:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25552"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25552:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25554
    cmp  $0,%eax
    jge _L_25553
_L_25554:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25553:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25555
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25555:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25556"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25556:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25558
    cmp  $0,%eax
    jge _L_25557
_L_25558:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25557:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "fixnum?") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "fixnum?")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fixnum?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25559"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25559":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum?"
# string literal
    jmp _L_25561
    .align 8,0x90
_L_25560 :
    .int 28
    .ascii "fixnum?"
_L_25561:
    movl $_L_25560, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fixnum?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25562
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25562:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25563"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25563:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25565
    cmp  $0,%eax
    jge _L_25564
_L_25565:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25564:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25566
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25566:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25567"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25567:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25569
    cmp  $0,%eax
    jge _L_25568
_L_25569:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25568:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char?") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "char?") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "char?")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25570"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25570":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char?"
# string literal
    jmp _L_25572
    .align 8,0x90
_L_25571 :
    .int 20
    .ascii "char?"
_L_25572:
    movl $_L_25571, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25573
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25573:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25574"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25574:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25576
    cmp  $0,%eax
    jge _L_25575
_L_25576:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25575:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25577
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25577:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25578"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25578:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25580
    cmp  $0,%eax
    jge _L_25579
_L_25580:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25579:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "null?") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "null?") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "null?")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "null?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25581"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25581":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "null?"
# string literal
    jmp _L_25583
    .align 8,0x90
_L_25582 :
    .int 20
    .ascii "null?"
_L_25583:
    movl $_L_25582, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg null?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25584
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25584:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25585"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25585:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25587
    cmp  $0,%eax
    jge _L_25586
_L_25587:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25586:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))) (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25588
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25588:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25589"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25589:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25591
    cmp  $0,%eax
    jge _L_25590
_L_25591:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25590:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "char->fixnum") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "char->fixnum")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char->fixnum")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25592"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25592":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char->fixnum"
# string literal
    jmp _L_25594
    .align 8,0x90
_L_25593 :
    .int 48
    .ascii "char->fixnum"
_L_25594:
    movl $_L_25593, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char->fixnum
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25595
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25595:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25596"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25596:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25598
    cmp  $0,%eax
    jge _L_25597
_L_25598:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25597:
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
# emit-expr (begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))) (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (vector-set! f2908 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0)))
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25599
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25599:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25600"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25600:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25602
    cmp  $0,%eax
    jge _L_25601
_L_25602:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25601:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f2908 0))
# cons arg1=((primitive-ref string->symbol) "fixnum->char") arg2=(vector-ref f2908 0)
# emit-expr ((primitive-ref string->symbol) "fixnum->char")
# funcall
#    si   =-12
#    env  = ((f2908 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fixnum->char")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25603"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25603":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum->char"
# string literal
    jmp _L_25605
    .align 8,0x90
_L_25604 :
    .int 48
    .ascii "fixnum->char"
_L_25605:
    movl $_L_25604, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fixnum->char
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f2908 0)
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25606
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25606:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25607"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25607:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25609
    cmp  $0,%eax
    jge _L_25608
_L_25609:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25608:
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
# emit-expr (begin (closure () (f2908) (let () (vector-ref f2908 0))))
# emit-begin
#   expr=(begin (closure () (f2908) (let () (vector-ref f2908 0))))
#   env=((f2908 . 0))
# emit-expr (closure () (f2908) (let () (vector-ref f2908 0)))
# emit-closure
# si = -4
# env = ((f2908 . 0))
# expr = (closure () (f2908) (let () (vector-ref f2908 0)))
    movl $_L_25610, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f2908 . 0))
# var=f2908
    movl 0(%esp), %eax  # stack load f2908
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f2908
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_25611            # jump around closure body
_L_25610:
# check argument count
    cmp $0,%eax
    je _L_25612
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_25612:
# emit-tail-expr
# si=-8
# env=((f2908 . 4) (f2908 . 0))
# expr=(let () (vector-ref f2908 0))
# emit-tail-let
#  si   = -8
#  env  = ((f2908 . 4) (f2908 . 0))
#  bindings = ()
#  body = (vector-ref f2908 0)
# emit-tail-expr
# si=-8
# env=((f2908 . 4) (f2908 . 0))
# expr=(vector-ref f2908 0)
# tail primcall
# emit-expr f2908
# emit-variable-ref
# env=((f2908 . 4) (f2908 . 0))
# var=f2908
    movl 2(%edi), %eax  # frame load f2908
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_25613
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25613:
    movl %eax, -8(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_25614"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_25614:
# check bounds on vector index
    movl -8(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_25616
    cmp  $0,%eax
    jge _L_25615
_L_25616:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_25615:
    movl -8(%esp), %esi
    movl -1(%eax,%esi), %eax
#return from tail (vector-ref f2908 0)
    ret
    .align 4,0x90
_L_25611:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f2908 . 0))
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
    movl $_L_25617, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_25618            # jump around closure body
_L_25617:
# check argument count
    cmp $0,%eax
    je _L_25619
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_25619:
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
    je "_L_25620"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25620":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_25622
    .align 8,0x90
_L_25621 :
    .int 28
    .ascii "funcall"
_L_25622:
    movl $_L_25621, %eax
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
    jmp _L_25624
    .align 8,0x90
_L_25623 :
    .int 100
    .ascii "arg 1 must be a procedure"
_L_25624:
    movl $_L_25623, %eax
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
_L_25618:
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
    movl $_L_25625, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_25626            # jump around closure body
_L_25625:
# check argument count
    cmp $0,%eax
    je _L_25627
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_25627:
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
    je "_L_25628"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25628":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_25630
    .align 8,0x90
_L_25629 :
    .int 28
    .ascii "funcall"
_L_25630:
    movl $_L_25629, %eax
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
    jmp _L_25632
    .align 8,0x90
_L_25631 :
    .int 80
    .ascii "wrong number of args"
_L_25632:
    movl $_L_25631, %eax
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
_L_25626:
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
    movl $_L_25633, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_25634            # jump around closure body
_L_25633:
# check argument count
    cmp $0,%eax
    je _L_25635
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_25635:
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
    je "_L_25636"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25636":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_25638
    .align 8,0x90
_L_25637 :
    .int 28
    .ascii "funcall"
_L_25638:
    movl $_L_25637, %eax
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
    jmp _L_25640
    .align 8,0x90
_L_25639 :
    .int 48
    .ascii "too few args"
_L_25640:
    movl $_L_25639, %eax
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
_L_25634:
     movl %eax, eh$uargcount$umin
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == uniquify-variables  ==>
# (lambda (f2909) (error (list-ref (primitives) f2909) "arg must be a fixnum"))
# == vectorize-letrec  ==>
# (lambda (f2909) (error (list-ref (primitives) f2909) "arg must be a fixnum"))
# == eliminate-set!  ==>
# (lambda (f2909) (let ((f2909 f2909)) (error (list-ref (primitives) f2909) "arg must be a fixnum")))
# == close-free-variables  ==>
# (closure (f2909) (error list-ref primitives) (let ((f2909 f2909)) (error (list-ref (primitives) f2909) "arg must be a fixnum")))
# == eliminate-quote  ==>
# (closure (f2909) (error list-ref primitives) (let ((f2909 f2909)) (error (list-ref (primitives) f2909) "arg must be a fixnum")))
# == eliminate-when/unless  ==>
# (closure (f2909) (error list-ref primitives) (let ((f2909 f2909)) (error (list-ref (primitives) f2909) "arg must be a fixnum")))
# == eliminate-cond  ==>
# (closure (f2909) (error list-ref primitives) (let ((f2909 f2909)) (error (list-ref (primitives) f2909) "arg must be a fixnum")))
# == external-symbols  ==>
# (closure (f2909) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f2909 f2909)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2909) "arg must be a fixnum")))
# emit-expr (closure (f2909) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f2909 f2909)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2909) "arg must be a fixnum")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f2909) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f2909 f2909)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2909) "arg must be a fixnum")))
    movl $_L_25641, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_25642            # jump around closure body
_L_25641:
# check argument count
    cmp $4,%eax
    je _L_25643
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_25643:
# emit-tail-expr
# si=-12
# env=((f2909 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f2909 f2909)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2909) "arg must be a fixnum"))
# emit-tail-let
#  si   = -12
#  env  = ((f2909 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f2909 f2909))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2909) "arg must be a fixnum")
# emit-expr f2909
# emit-variable-ref
# env=((f2909 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f2909
    movl -8(%esp), %eax  # stack load f2909
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f2909 . -12) (f2909 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2909) "arg must be a fixnum")
# emit-tail-funcall
#    si   =-16
#    env  = ((f2909 . -12) (f2909 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2909) "arg must be a fixnum")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f2909)
# funcall
#    si   =-20
#    env  = ((f2909 . -12) (f2909 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f2909)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25644"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25644":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f2909 . -12) (f2909 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25645"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25645":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f2909
# emit-variable-ref
# env=((f2909 . -12) (f2909 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f2909
    movl -12(%esp), %eax  # stack load f2909
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f2909
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f2909)
# emit-expr "arg must be a fixnum"
# string literal
    jmp _L_25647
    .align 8,0x90
_L_25646 :
    .int 80
    .ascii "arg must be a fixnum"
_L_25647:
    movl $_L_25646, %eax
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
_L_25642:
     movl %eax, eh$ufixnum
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == uniquify-variables  ==>
# (lambda (f2910) (error (list-ref (primitives) f2910) "arg must be a string"))
# == vectorize-letrec  ==>
# (lambda (f2910) (error (list-ref (primitives) f2910) "arg must be a string"))
# == eliminate-set!  ==>
# (lambda (f2910) (let ((f2910 f2910)) (error (list-ref (primitives) f2910) "arg must be a string")))
# == close-free-variables  ==>
# (closure (f2910) (error list-ref primitives) (let ((f2910 f2910)) (error (list-ref (primitives) f2910) "arg must be a string")))
# == eliminate-quote  ==>
# (closure (f2910) (error list-ref primitives) (let ((f2910 f2910)) (error (list-ref (primitives) f2910) "arg must be a string")))
# == eliminate-when/unless  ==>
# (closure (f2910) (error list-ref primitives) (let ((f2910 f2910)) (error (list-ref (primitives) f2910) "arg must be a string")))
# == eliminate-cond  ==>
# (closure (f2910) (error list-ref primitives) (let ((f2910 f2910)) (error (list-ref (primitives) f2910) "arg must be a string")))
# == external-symbols  ==>
# (closure (f2910) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f2910 f2910)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2910) "arg must be a string")))
# emit-expr (closure (f2910) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f2910 f2910)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2910) "arg must be a string")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f2910) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f2910 f2910)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2910) "arg must be a string")))
    movl $_L_25648, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_25649            # jump around closure body
_L_25648:
# check argument count
    cmp $4,%eax
    je _L_25650
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_25650:
# emit-tail-expr
# si=-12
# env=((f2910 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f2910 f2910)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2910) "arg must be a string"))
# emit-tail-let
#  si   = -12
#  env  = ((f2910 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f2910 f2910))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2910) "arg must be a string")
# emit-expr f2910
# emit-variable-ref
# env=((f2910 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f2910
    movl -8(%esp), %eax  # stack load f2910
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f2910 . -12) (f2910 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2910) "arg must be a string")
# emit-tail-funcall
#    si   =-16
#    env  = ((f2910 . -12) (f2910 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2910) "arg must be a string")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f2910)
# funcall
#    si   =-20
#    env  = ((f2910 . -12) (f2910 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f2910)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25651"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25651":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f2910 . -12) (f2910 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25652"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25652":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f2910
# emit-variable-ref
# env=((f2910 . -12) (f2910 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f2910
    movl -12(%esp), %eax  # stack load f2910
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f2910
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f2910)
# emit-expr "arg must be a string"
# string literal
    jmp _L_25654
    .align 8,0x90
_L_25653 :
    .int 80
    .ascii "arg must be a string"
_L_25654:
    movl $_L_25653, %eax
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
_L_25649:
     movl %eax, eh$ustring
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == uniquify-variables  ==>
# (lambda (f2911) (error (list-ref (primitives) f2911) "arg must be a character"))
# == vectorize-letrec  ==>
# (lambda (f2911) (error (list-ref (primitives) f2911) "arg must be a character"))
# == eliminate-set!  ==>
# (lambda (f2911) (let ((f2911 f2911)) (error (list-ref (primitives) f2911) "arg must be a character")))
# == close-free-variables  ==>
# (closure (f2911) (error list-ref primitives) (let ((f2911 f2911)) (error (list-ref (primitives) f2911) "arg must be a character")))
# == eliminate-quote  ==>
# (closure (f2911) (error list-ref primitives) (let ((f2911 f2911)) (error (list-ref (primitives) f2911) "arg must be a character")))
# == eliminate-when/unless  ==>
# (closure (f2911) (error list-ref primitives) (let ((f2911 f2911)) (error (list-ref (primitives) f2911) "arg must be a character")))
# == eliminate-cond  ==>
# (closure (f2911) (error list-ref primitives) (let ((f2911 f2911)) (error (list-ref (primitives) f2911) "arg must be a character")))
# == external-symbols  ==>
# (closure (f2911) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f2911 f2911)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2911) "arg must be a character")))
# emit-expr (closure (f2911) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f2911 f2911)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2911) "arg must be a character")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f2911) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f2911 f2911)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2911) "arg must be a character")))
    movl $_L_25655, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_25656            # jump around closure body
_L_25655:
# check argument count
    cmp $4,%eax
    je _L_25657
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_25657:
# emit-tail-expr
# si=-12
# env=((f2911 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f2911 f2911)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2911) "arg must be a character"))
# emit-tail-let
#  si   = -12
#  env  = ((f2911 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f2911 f2911))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2911) "arg must be a character")
# emit-expr f2911
# emit-variable-ref
# env=((f2911 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f2911
    movl -8(%esp), %eax  # stack load f2911
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f2911 . -12) (f2911 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2911) "arg must be a character")
# emit-tail-funcall
#    si   =-16
#    env  = ((f2911 . -12) (f2911 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2911) "arg must be a character")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f2911)
# funcall
#    si   =-20
#    env  = ((f2911 . -12) (f2911 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f2911)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25658"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25658":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f2911 . -12) (f2911 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25659"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25659":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f2911
# emit-variable-ref
# env=((f2911 . -12) (f2911 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f2911
    movl -12(%esp), %eax  # stack load f2911
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f2911
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f2911)
# emit-expr "arg must be a character"
# string literal
    jmp _L_25661
    .align 8,0x90
_L_25660 :
    .int 92
    .ascii "arg must be a character"
_L_25661:
    movl $_L_25660, %eax
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
_L_25656:
     movl %eax, eh$ucharacter
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == uniquify-variables  ==>
# (lambda (f2912) (error (list-ref (primitives) f2912) "arg must be a pair"))
# == vectorize-letrec  ==>
# (lambda (f2912) (error (list-ref (primitives) f2912) "arg must be a pair"))
# == eliminate-set!  ==>
# (lambda (f2912) (let ((f2912 f2912)) (error (list-ref (primitives) f2912) "arg must be a pair")))
# == close-free-variables  ==>
# (closure (f2912) (error list-ref primitives) (let ((f2912 f2912)) (error (list-ref (primitives) f2912) "arg must be a pair")))
# == eliminate-quote  ==>
# (closure (f2912) (error list-ref primitives) (let ((f2912 f2912)) (error (list-ref (primitives) f2912) "arg must be a pair")))
# == eliminate-when/unless  ==>
# (closure (f2912) (error list-ref primitives) (let ((f2912 f2912)) (error (list-ref (primitives) f2912) "arg must be a pair")))
# == eliminate-cond  ==>
# (closure (f2912) (error list-ref primitives) (let ((f2912 f2912)) (error (list-ref (primitives) f2912) "arg must be a pair")))
# == external-symbols  ==>
# (closure (f2912) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f2912 f2912)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2912) "arg must be a pair")))
# emit-expr (closure (f2912) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f2912 f2912)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2912) "arg must be a pair")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f2912) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f2912 f2912)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2912) "arg must be a pair")))
    movl $_L_25662, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_25663            # jump around closure body
_L_25662:
# check argument count
    cmp $4,%eax
    je _L_25664
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_25664:
# emit-tail-expr
# si=-12
# env=((f2912 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f2912 f2912)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2912) "arg must be a pair"))
# emit-tail-let
#  si   = -12
#  env  = ((f2912 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f2912 f2912))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2912) "arg must be a pair")
# emit-expr f2912
# emit-variable-ref
# env=((f2912 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f2912
    movl -8(%esp), %eax  # stack load f2912
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f2912 . -12) (f2912 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2912) "arg must be a pair")
# emit-tail-funcall
#    si   =-16
#    env  = ((f2912 . -12) (f2912 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2912) "arg must be a pair")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f2912)
# funcall
#    si   =-20
#    env  = ((f2912 . -12) (f2912 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f2912)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25665"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25665":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f2912 . -12) (f2912 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25666"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25666":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f2912
# emit-variable-ref
# env=((f2912 . -12) (f2912 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f2912
    movl -12(%esp), %eax  # stack load f2912
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f2912
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f2912)
# emit-expr "arg must be a pair"
# string literal
    jmp _L_25668
    .align 8,0x90
_L_25667 :
    .int 72
    .ascii "arg must be a pair"
_L_25668:
    movl $_L_25667, %eax
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
_L_25663:
     movl %eax, eh$upair
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == uniquify-variables  ==>
# (lambda (f2913) (error (list-ref (primitives) f2913) "arg must be a vector"))
# == vectorize-letrec  ==>
# (lambda (f2913) (error (list-ref (primitives) f2913) "arg must be a vector"))
# == eliminate-set!  ==>
# (lambda (f2913) (let ((f2913 f2913)) (error (list-ref (primitives) f2913) "arg must be a vector")))
# == close-free-variables  ==>
# (closure (f2913) (error list-ref primitives) (let ((f2913 f2913)) (error (list-ref (primitives) f2913) "arg must be a vector")))
# == eliminate-quote  ==>
# (closure (f2913) (error list-ref primitives) (let ((f2913 f2913)) (error (list-ref (primitives) f2913) "arg must be a vector")))
# == eliminate-when/unless  ==>
# (closure (f2913) (error list-ref primitives) (let ((f2913 f2913)) (error (list-ref (primitives) f2913) "arg must be a vector")))
# == eliminate-cond  ==>
# (closure (f2913) (error list-ref primitives) (let ((f2913 f2913)) (error (list-ref (primitives) f2913) "arg must be a vector")))
# == external-symbols  ==>
# (closure (f2913) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f2913 f2913)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2913) "arg must be a vector")))
# emit-expr (closure (f2913) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f2913 f2913)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2913) "arg must be a vector")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f2913) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f2913 f2913)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2913) "arg must be a vector")))
    movl $_L_25669, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_25670            # jump around closure body
_L_25669:
# check argument count
    cmp $4,%eax
    je _L_25671
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_25671:
# emit-tail-expr
# si=-12
# env=((f2913 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f2913 f2913)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2913) "arg must be a vector"))
# emit-tail-let
#  si   = -12
#  env  = ((f2913 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f2913 f2913))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2913) "arg must be a vector")
# emit-expr f2913
# emit-variable-ref
# env=((f2913 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f2913
    movl -8(%esp), %eax  # stack load f2913
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f2913 . -12) (f2913 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2913) "arg must be a vector")
# emit-tail-funcall
#    si   =-16
#    env  = ((f2913 . -12) (f2913 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2913) "arg must be a vector")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f2913)
# funcall
#    si   =-20
#    env  = ((f2913 . -12) (f2913 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f2913)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25672"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25672":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f2913 . -12) (f2913 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25673"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25673":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f2913
# emit-variable-ref
# env=((f2913 . -12) (f2913 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f2913
    movl -12(%esp), %eax  # stack load f2913
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f2913
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f2913)
# emit-expr "arg must be a vector"
# string literal
    jmp _L_25675
    .align 8,0x90
_L_25674 :
    .int 80
    .ascii "arg must be a vector"
_L_25675:
    movl $_L_25674, %eax
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
_L_25670:
     movl %eax, eh$uvector
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == uniquify-variables  ==>
# (lambda (f2914) (error (list-ref (primitives) f2914) "length must be a fixnum >= 0"))
# == vectorize-letrec  ==>
# (lambda (f2914) (error (list-ref (primitives) f2914) "length must be a fixnum >= 0"))
# == eliminate-set!  ==>
# (lambda (f2914) (let ((f2914 f2914)) (error (list-ref (primitives) f2914) "length must be a fixnum >= 0")))
# == close-free-variables  ==>
# (closure (f2914) (error list-ref primitives) (let ((f2914 f2914)) (error (list-ref (primitives) f2914) "length must be a fixnum >= 0")))
# == eliminate-quote  ==>
# (closure (f2914) (error list-ref primitives) (let ((f2914 f2914)) (error (list-ref (primitives) f2914) "length must be a fixnum >= 0")))
# == eliminate-when/unless  ==>
# (closure (f2914) (error list-ref primitives) (let ((f2914 f2914)) (error (list-ref (primitives) f2914) "length must be a fixnum >= 0")))
# == eliminate-cond  ==>
# (closure (f2914) (error list-ref primitives) (let ((f2914 f2914)) (error (list-ref (primitives) f2914) "length must be a fixnum >= 0")))
# == external-symbols  ==>
# (closure (f2914) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f2914 f2914)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2914) "length must be a fixnum >= 0")))
# emit-expr (closure (f2914) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f2914 f2914)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2914) "length must be a fixnum >= 0")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f2914) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f2914 f2914)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2914) "length must be a fixnum >= 0")))
    movl $_L_25676, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_25677            # jump around closure body
_L_25676:
# check argument count
    cmp $4,%eax
    je _L_25678
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_25678:
# emit-tail-expr
# si=-12
# env=((f2914 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f2914 f2914)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2914) "length must be a fixnum >= 0"))
# emit-tail-let
#  si   = -12
#  env  = ((f2914 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f2914 f2914))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2914) "length must be a fixnum >= 0")
# emit-expr f2914
# emit-variable-ref
# env=((f2914 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f2914
    movl -8(%esp), %eax  # stack load f2914
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f2914 . -12) (f2914 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2914) "length must be a fixnum >= 0")
# emit-tail-funcall
#    si   =-16
#    env  = ((f2914 . -12) (f2914 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2914) "length must be a fixnum >= 0")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f2914)
# funcall
#    si   =-20
#    env  = ((f2914 . -12) (f2914 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f2914)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25679"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25679":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f2914 . -12) (f2914 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25680"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25680":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f2914
# emit-variable-ref
# env=((f2914 . -12) (f2914 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f2914
    movl -12(%esp), %eax  # stack load f2914
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f2914
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f2914)
# emit-expr "length must be a fixnum >= 0"
# string literal
    jmp _L_25682
    .align 8,0x90
_L_25681 :
    .int 112
    .ascii "length must be a fixnum >= 0"
_L_25682:
    movl $_L_25681, %eax
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
_L_25677:
     movl %eax, eh$ulength
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == uniquify-variables  ==>
# (lambda (f2915) (error (list-ref (primitives) f2915) "index out of bounds"))
# == vectorize-letrec  ==>
# (lambda (f2915) (error (list-ref (primitives) f2915) "index out of bounds"))
# == eliminate-set!  ==>
# (lambda (f2915) (let ((f2915 f2915)) (error (list-ref (primitives) f2915) "index out of bounds")))
# == close-free-variables  ==>
# (closure (f2915) (error list-ref primitives) (let ((f2915 f2915)) (error (list-ref (primitives) f2915) "index out of bounds")))
# == eliminate-quote  ==>
# (closure (f2915) (error list-ref primitives) (let ((f2915 f2915)) (error (list-ref (primitives) f2915) "index out of bounds")))
# == eliminate-when/unless  ==>
# (closure (f2915) (error list-ref primitives) (let ((f2915 f2915)) (error (list-ref (primitives) f2915) "index out of bounds")))
# == eliminate-cond  ==>
# (closure (f2915) (error list-ref primitives) (let ((f2915 f2915)) (error (list-ref (primitives) f2915) "index out of bounds")))
# == external-symbols  ==>
# (closure (f2915) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f2915 f2915)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2915) "index out of bounds")))
# emit-expr (closure (f2915) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f2915 f2915)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2915) "index out of bounds")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f2915) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f2915 f2915)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2915) "index out of bounds")))
    movl $_L_25683, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_25684            # jump around closure body
_L_25683:
# check argument count
    cmp $4,%eax
    je _L_25685
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_25685:
# emit-tail-expr
# si=-12
# env=((f2915 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f2915 f2915)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2915) "index out of bounds"))
# emit-tail-let
#  si   = -12
#  env  = ((f2915 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f2915 f2915))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2915) "index out of bounds")
# emit-expr f2915
# emit-variable-ref
# env=((f2915 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f2915
    movl -8(%esp), %eax  # stack load f2915
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f2915 . -12) (f2915 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2915) "index out of bounds")
# emit-tail-funcall
#    si   =-16
#    env  = ((f2915 . -12) (f2915 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2915) "index out of bounds")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f2915)
# funcall
#    si   =-20
#    env  = ((f2915 . -12) (f2915 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f2915)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25686"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25686":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f2915 . -12) (f2915 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25687"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25687":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f2915
# emit-variable-ref
# env=((f2915 . -12) (f2915 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f2915
    movl -12(%esp), %eax  # stack load f2915
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f2915
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f2915)
# emit-expr "index out of bounds"
# string literal
    jmp _L_25689
    .align 8,0x90
_L_25688 :
    .int 76
    .ascii "index out of bounds"
_L_25689:
    movl $_L_25688, %eax
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
_L_25684:
     movl %eax, eh$uvector$uindex
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == uniquify-variables  ==>
# (lambda (f2916) (error (list-ref (primitives) f2916) "index out of bounds"))
# == vectorize-letrec  ==>
# (lambda (f2916) (error (list-ref (primitives) f2916) "index out of bounds"))
# == eliminate-set!  ==>
# (lambda (f2916) (let ((f2916 f2916)) (error (list-ref (primitives) f2916) "index out of bounds")))
# == close-free-variables  ==>
# (closure (f2916) (error list-ref primitives) (let ((f2916 f2916)) (error (list-ref (primitives) f2916) "index out of bounds")))
# == eliminate-quote  ==>
# (closure (f2916) (error list-ref primitives) (let ((f2916 f2916)) (error (list-ref (primitives) f2916) "index out of bounds")))
# == eliminate-when/unless  ==>
# (closure (f2916) (error list-ref primitives) (let ((f2916 f2916)) (error (list-ref (primitives) f2916) "index out of bounds")))
# == eliminate-cond  ==>
# (closure (f2916) (error list-ref primitives) (let ((f2916 f2916)) (error (list-ref (primitives) f2916) "index out of bounds")))
# == external-symbols  ==>
# (closure (f2916) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f2916 f2916)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2916) "index out of bounds")))
# emit-expr (closure (f2916) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f2916 f2916)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2916) "index out of bounds")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f2916) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f2916 f2916)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2916) "index out of bounds")))
    movl $_L_25690, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_25691            # jump around closure body
_L_25690:
# check argument count
    cmp $4,%eax
    je _L_25692
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_25692:
# emit-tail-expr
# si=-12
# env=((f2916 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f2916 f2916)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2916) "index out of bounds"))
# emit-tail-let
#  si   = -12
#  env  = ((f2916 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f2916 f2916))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2916) "index out of bounds")
# emit-expr f2916
# emit-variable-ref
# env=((f2916 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f2916
    movl -8(%esp), %eax  # stack load f2916
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f2916 . -12) (f2916 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2916) "index out of bounds")
# emit-tail-funcall
#    si   =-16
#    env  = ((f2916 . -12) (f2916 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f2916) "index out of bounds")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f2916)
# funcall
#    si   =-20
#    env  = ((f2916 . -12) (f2916 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f2916)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25693"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25693":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f2916 . -12) (f2916 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_25694"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_25694":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f2916
# emit-variable-ref
# env=((f2916 . -12) (f2916 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f2916
    movl -12(%esp), %eax  # stack load f2916
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f2916
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f2916)
# emit-expr "index out of bounds"
# string literal
    jmp _L_25696
    .align 8,0x90
_L_25695 :
    .int 76
    .ascii "index out of bounds"
_L_25696:
    movl $_L_25695, %eax
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
_L_25691:
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
