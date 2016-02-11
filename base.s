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
     .global "write"
     .align 8
write:
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
# (let ((f3876 (cons (make-symbol "nil" ()) ()))) (lambda () f3876))
# == vectorize-letrec  ==>
# (let ((f3876 (cons (make-symbol "nil" ()) ()))) (lambda () f3876))
# == eliminate-set!  ==>
# (let ((f3876 (cons (make-symbol "nil" ()) ()))) (lambda () (let () f3876)))
# == close-free-variables  ==>
# (let ((f3876 (cons (make-symbol "nil" ()) ()))) (closure () (f3876) (let () f3876)))
# == eliminate-quote  ==>
# (let ((f3876 (cons (make-symbol "nil" ()) ()))) (closure () (f3876) (let () f3876)))
# == eliminate-when/unless  ==>
# (let ((f3876 (cons (make-symbol "nil" ()) ()))) (closure () (f3876) (let () f3876)))
# == eliminate-cond  ==>
# (let ((f3876 (cons (make-symbol "nil" ()) ()))) (closure () (f3876) (let () f3876)))
# == external-symbols  ==>
# (let ((f3876 (cons (make-symbol "nil" ()) ()))) (closure () (f3876) (let () f3876)))
# emit-expr (let ((f3876 (cons (make-symbol "nil" ()) ()))) (closure () (f3876) (let () f3876)))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f3876 (cons (make-symbol "nil" ()) ())))
#  body = (closure () (f3876) (let () f3876))
# emit-expr (cons (make-symbol "nil" ()) ())
# cons arg1=(make-symbol "nil" ()) arg2=()
# emit-expr (make-symbol "nil" ())
# make-symbol arg1="nil" arg2=()
# emit-expr "nil"
# string literal
    jmp _L_32418
    .align 8,0x90
_L_32417 :
    .int 12
    .ascii "nil"
_L_32418:
    movl $_L_32417, %eax
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
# emit-expr (closure () (f3876) (let () f3876))
# emit-closure
# si = -4
# env = ((f3876 . 0))
# expr = (closure () (f3876) (let () f3876))
    movl $_L_32419, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f3876 . 0))
# var=f3876
    movl 0(%esp), %eax  # stack load f3876
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f3876
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_32420            # jump around closure body
_L_32419:
# check argument count
    cmp $0,%eax
    je _L_32421
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_32421:
# emit-tail-expr
# si=-8
# env=((f3876 . 4) (f3876 . 0))
# expr=(let () f3876)
# emit-tail-let
#  si   = -8
#  env  = ((f3876 . 4) (f3876 . 0))
#  bindings = ()
#  body = f3876
# emit-tail-expr
# si=-8
# env=((f3876 . 4) (f3876 . 0))
# expr=f3876
# emit-tail-variable-ref
# emit-variable-ref
# env=((f3876 . 4) (f3876 . 0))
# var=f3876
    movl 2(%edi), %eax  # frame load f3876
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    .align 4,0x90
_L_32420:
     movl %eax, symbols
# == explicit-begins  ==>
# (letrec ((slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if (si= s1 s2 i) (si<n= s1 s2 (fx+ i 1) n) #f)))) (ss= (lambda (s1 s2) (if (slen= s1 s2) (si<n= s1 s2 0 (string-length s1)) #f)))) ss=)
# == eliminate-let*  ==>
# (letrec ((slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if (si= s1 s2 i) (si<n= s1 s2 (fx+ i 1) n) #f)))) (ss= (lambda (s1 s2) (if (slen= s1 s2) (si<n= s1 s2 0 (string-length s1)) #f)))) ss=)
# == uniquify-variables  ==>
# (letrec ((f3880 (lambda (f3901 f3902) (fx= (string-length f3901) (string-length f3902)))) (f3879 (lambda (f3898 f3899 f3900) (char=? (string-ref f3898 f3900) (string-ref f3899 f3900)))) (f3878 (lambda (f3894 f3895 f3896 f3897) (if (fx= f3896 f3897) #t (if (f3879 f3894 f3895 f3896) (f3878 f3894 f3895 (fx+ f3896 1) f3897) #f)))) (f3877 (lambda (f3892 f3893) (if (f3880 f3892 f3893) (f3878 f3892 f3893 0 (string-length f3892)) #f)))) f3877)
# == vectorize-letrec  ==>
# (let ((f3880 (make-vector 1)) (f3879 (make-vector 1)) (f3878 (make-vector 1)) (f3877 (make-vector 1))) (begin (begin (vector-set! f3880 0 (lambda (f3901 f3902) (fx= (string-length f3901) (string-length f3902)))) (vector-set! f3879 0 (lambda (f3898 f3899 f3900) (char=? (string-ref f3898 f3900) (string-ref f3899 f3900)))) (vector-set! f3878 0 (lambda (f3894 f3895 f3896 f3897) (if (fx= f3896 f3897) #t (if ((vector-ref f3879 0) f3894 f3895 f3896) ((vector-ref f3878 0) f3894 f3895 (fx+ f3896 1) f3897) #f)))) (vector-set! f3877 0 (lambda (f3892 f3893) (if ((vector-ref f3880 0) f3892 f3893) ((vector-ref f3878 0) f3892 f3893 0 (string-length f3892)) #f)))) (vector-ref f3877 0)))
# == eliminate-set!  ==>
# (let ((f3880 (make-vector 1)) (f3879 (make-vector 1)) (f3878 (make-vector 1)) (f3877 (make-vector 1))) (begin (begin (vector-set! f3880 0 (lambda (f3901 f3902) (let ((f3901 f3901) (f3902 f3902)) (fx= (string-length f3901) (string-length f3902))))) (vector-set! f3879 0 (lambda (f3898 f3899 f3900) (let ((f3898 f3898) (f3899 f3899) (f3900 f3900)) (char=? (string-ref f3898 f3900) (string-ref f3899 f3900))))) (vector-set! f3878 0 (lambda (f3894 f3895 f3896 f3897) (let ((f3894 f3894) (f3895 f3895) (f3896 f3896) (f3897 f3897)) (if (fx= f3896 f3897) #t (if ((vector-ref f3879 0) f3894 f3895 f3896) ((vector-ref f3878 0) f3894 f3895 (fx+ f3896 1) f3897) #f))))) (vector-set! f3877 0 (lambda (f3892 f3893) (let ((f3892 f3892) (f3893 f3893)) (if ((vector-ref f3880 0) f3892 f3893) ((vector-ref f3878 0) f3892 f3893 0 (string-length f3892)) #f))))) (vector-ref f3877 0)))
# == close-free-variables  ==>
# (let ((f3880 (make-vector 1)) (f3879 (make-vector 1)) (f3878 (make-vector 1)) (f3877 (make-vector 1))) (begin (begin (vector-set! f3880 0 (closure (f3901 f3902) () (let ((f3901 f3901) (f3902 f3902)) (fx= (string-length f3901) (string-length f3902))))) (vector-set! f3879 0 (closure (f3898 f3899 f3900) () (let ((f3898 f3898) (f3899 f3899) (f3900 f3900)) (char=? (string-ref f3898 f3900) (string-ref f3899 f3900))))) (vector-set! f3878 0 (closure (f3894 f3895 f3896 f3897) (f3879 f3878) (let ((f3894 f3894) (f3895 f3895) (f3896 f3896) (f3897 f3897)) (if (fx= f3896 f3897) #t (if ((vector-ref f3879 0) f3894 f3895 f3896) ((vector-ref f3878 0) f3894 f3895 (fx+ f3896 1) f3897) #f))))) (vector-set! f3877 0 (closure (f3892 f3893) (f3880 f3878) (let ((f3892 f3892) (f3893 f3893)) (if ((vector-ref f3880 0) f3892 f3893) ((vector-ref f3878 0) f3892 f3893 0 (string-length f3892)) #f))))) (vector-ref f3877 0)))
# == eliminate-quote  ==>
# (let ((f3880 (make-vector 1)) (f3879 (make-vector 1)) (f3878 (make-vector 1)) (f3877 (make-vector 1))) (begin (begin (vector-set! f3880 0 (closure (f3901 f3902) () (let ((f3901 f3901) (f3902 f3902)) (fx= (string-length f3901) (string-length f3902))))) (vector-set! f3879 0 (closure (f3898 f3899 f3900) () (let ((f3898 f3898) (f3899 f3899) (f3900 f3900)) (char=? (string-ref f3898 f3900) (string-ref f3899 f3900))))) (vector-set! f3878 0 (closure (f3894 f3895 f3896 f3897) (f3879 f3878) (let ((f3894 f3894) (f3895 f3895) (f3896 f3896) (f3897 f3897)) (if (fx= f3896 f3897) #t (if ((vector-ref f3879 0) f3894 f3895 f3896) ((vector-ref f3878 0) f3894 f3895 (fx+ f3896 1) f3897) #f))))) (vector-set! f3877 0 (closure (f3892 f3893) (f3880 f3878) (let ((f3892 f3892) (f3893 f3893)) (if ((vector-ref f3880 0) f3892 f3893) ((vector-ref f3878 0) f3892 f3893 0 (string-length f3892)) #f))))) (vector-ref f3877 0)))
# == eliminate-when/unless  ==>
# (let ((f3880 (make-vector 1)) (f3879 (make-vector 1)) (f3878 (make-vector 1)) (f3877 (make-vector 1))) (begin (begin (vector-set! f3880 0 (closure (f3901 f3902) () (let ((f3901 f3901) (f3902 f3902)) (fx= (string-length f3901) (string-length f3902))))) (vector-set! f3879 0 (closure (f3898 f3899 f3900) () (let ((f3898 f3898) (f3899 f3899) (f3900 f3900)) (char=? (string-ref f3898 f3900) (string-ref f3899 f3900))))) (vector-set! f3878 0 (closure (f3894 f3895 f3896 f3897) (f3879 f3878) (let ((f3894 f3894) (f3895 f3895) (f3896 f3896) (f3897 f3897)) (if (fx= f3896 f3897) #t (if ((vector-ref f3879 0) f3894 f3895 f3896) ((vector-ref f3878 0) f3894 f3895 (fx+ f3896 1) f3897) #f))))) (vector-set! f3877 0 (closure (f3892 f3893) (f3880 f3878) (let ((f3892 f3892) (f3893 f3893)) (if ((vector-ref f3880 0) f3892 f3893) ((vector-ref f3878 0) f3892 f3893 0 (string-length f3892)) #f))))) (vector-ref f3877 0)))
# == eliminate-cond  ==>
# (let ((f3880 (make-vector 1)) (f3879 (make-vector 1)) (f3878 (make-vector 1)) (f3877 (make-vector 1))) (begin (begin (vector-set! f3880 0 (closure (f3901 f3902) () (let ((f3901 f3901) (f3902 f3902)) (fx= (string-length f3901) (string-length f3902))))) (vector-set! f3879 0 (closure (f3898 f3899 f3900) () (let ((f3898 f3898) (f3899 f3899) (f3900 f3900)) (char=? (string-ref f3898 f3900) (string-ref f3899 f3900))))) (vector-set! f3878 0 (closure (f3894 f3895 f3896 f3897) (f3879 f3878) (let ((f3894 f3894) (f3895 f3895) (f3896 f3896) (f3897 f3897)) (if (fx= f3896 f3897) #t (if ((vector-ref f3879 0) f3894 f3895 f3896) ((vector-ref f3878 0) f3894 f3895 (fx+ f3896 1) f3897) #f))))) (vector-set! f3877 0 (closure (f3892 f3893) (f3880 f3878) (let ((f3892 f3892) (f3893 f3893)) (if ((vector-ref f3880 0) f3892 f3893) ((vector-ref f3878 0) f3892 f3893 0 (string-length f3892)) #f))))) (vector-ref f3877 0)))
# == external-symbols  ==>
# (let ((f3880 (make-vector 1)) (f3879 (make-vector 1)) (f3878 (make-vector 1)) (f3877 (make-vector 1))) (begin (begin (vector-set! f3880 0 (closure (f3901 f3902) () (let ((f3901 f3901) (f3902 f3902)) (fx= (string-length f3901) (string-length f3902))))) (vector-set! f3879 0 (closure (f3898 f3899 f3900) () (let ((f3898 f3898) (f3899 f3899) (f3900 f3900)) (char=? (string-ref f3898 f3900) (string-ref f3899 f3900))))) (vector-set! f3878 0 (closure (f3894 f3895 f3896 f3897) (f3879 f3878) (let ((f3894 f3894) (f3895 f3895) (f3896 f3896) (f3897 f3897)) (if (fx= f3896 f3897) #t (if ((vector-ref f3879 0) f3894 f3895 f3896) ((vector-ref f3878 0) f3894 f3895 (fx+ f3896 1) f3897) #f))))) (vector-set! f3877 0 (closure (f3892 f3893) (f3880 f3878) (let ((f3892 f3892) (f3893 f3893)) (if ((vector-ref f3880 0) f3892 f3893) ((vector-ref f3878 0) f3892 f3893 0 (string-length f3892)) #f))))) (vector-ref f3877 0)))
# emit-expr (let ((f3880 (make-vector 1)) (f3879 (make-vector 1)) (f3878 (make-vector 1)) (f3877 (make-vector 1))) (begin (begin (vector-set! f3880 0 (closure (f3901 f3902) () (let ((f3901 f3901) (f3902 f3902)) (fx= (string-length f3901) (string-length f3902))))) (vector-set! f3879 0 (closure (f3898 f3899 f3900) () (let ((f3898 f3898) (f3899 f3899) (f3900 f3900)) (char=? (string-ref f3898 f3900) (string-ref f3899 f3900))))) (vector-set! f3878 0 (closure (f3894 f3895 f3896 f3897) (f3879 f3878) (let ((f3894 f3894) (f3895 f3895) (f3896 f3896) (f3897 f3897)) (if (fx= f3896 f3897) #t (if ((vector-ref f3879 0) f3894 f3895 f3896) ((vector-ref f3878 0) f3894 f3895 (fx+ f3896 1) f3897) #f))))) (vector-set! f3877 0 (closure (f3892 f3893) (f3880 f3878) (let ((f3892 f3892) (f3893 f3893)) (if ((vector-ref f3880 0) f3892 f3893) ((vector-ref f3878 0) f3892 f3893 0 (string-length f3892)) #f))))) (vector-ref f3877 0)))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f3880 (make-vector 1)) (f3879 (make-vector 1)) (f3878 (make-vector 1)) (f3877 (make-vector 1)))
#  body = (begin (begin (vector-set! f3880 0 (closure (f3901 f3902) () (let ((f3901 f3901) (f3902 f3902)) (fx= (string-length f3901) (string-length f3902))))) (vector-set! f3879 0 (closure (f3898 f3899 f3900) () (let ((f3898 f3898) (f3899 f3899) (f3900 f3900)) (char=? (string-ref f3898 f3900) (string-ref f3899 f3900))))) (vector-set! f3878 0 (closure (f3894 f3895 f3896 f3897) (f3879 f3878) (let ((f3894 f3894) (f3895 f3895) (f3896 f3896) (f3897 f3897)) (if (fx= f3896 f3897) #t (if ((vector-ref f3879 0) f3894 f3895 f3896) ((vector-ref f3878 0) f3894 f3895 (fx+ f3896 1) f3897) #f))))) (vector-set! f3877 0 (closure (f3892 f3893) (f3880 f3878) (let ((f3892 f3892) (f3893 f3893)) (if ((vector-ref f3880 0) f3892 f3893) ((vector-ref f3878 0) f3892 f3893 0 (string-length f3892)) #f))))) (vector-ref f3877 0))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32422"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32422:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_32423
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32423:
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
    je "_L_32424"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32424:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_32425
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32425:
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
    je "_L_32426"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32426:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_32427
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32427:
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
    je "_L_32428"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32428:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_32429
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32429:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, -12(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f3880 0 (closure (f3901 f3902) () (let ((f3901 f3901) (f3902 f3902)) (fx= (string-length f3901) (string-length f3902))))) (vector-set! f3879 0 (closure (f3898 f3899 f3900) () (let ((f3898 f3898) (f3899 f3899) (f3900 f3900)) (char=? (string-ref f3898 f3900) (string-ref f3899 f3900))))) (vector-set! f3878 0 (closure (f3894 f3895 f3896 f3897) (f3879 f3878) (let ((f3894 f3894) (f3895 f3895) (f3896 f3896) (f3897 f3897)) (if (fx= f3896 f3897) #t (if ((vector-ref f3879 0) f3894 f3895 f3896) ((vector-ref f3878 0) f3894 f3895 (fx+ f3896 1) f3897) #f))))) (vector-set! f3877 0 (closure (f3892 f3893) (f3880 f3878) (let ((f3892 f3892) (f3893 f3893)) (if ((vector-ref f3880 0) f3892 f3893) ((vector-ref f3878 0) f3892 f3893 0 (string-length f3892)) #f))))) (vector-ref f3877 0))
# emit-begin
#   expr=(begin (begin (vector-set! f3880 0 (closure (f3901 f3902) () (let ((f3901 f3901) (f3902 f3902)) (fx= (string-length f3901) (string-length f3902))))) (vector-set! f3879 0 (closure (f3898 f3899 f3900) () (let ((f3898 f3898) (f3899 f3899) (f3900 f3900)) (char=? (string-ref f3898 f3900) (string-ref f3899 f3900))))) (vector-set! f3878 0 (closure (f3894 f3895 f3896 f3897) (f3879 f3878) (let ((f3894 f3894) (f3895 f3895) (f3896 f3896) (f3897 f3897)) (if (fx= f3896 f3897) #t (if ((vector-ref f3879 0) f3894 f3895 f3896) ((vector-ref f3878 0) f3894 f3895 (fx+ f3896 1) f3897) #f))))) (vector-set! f3877 0 (closure (f3892 f3893) (f3880 f3878) (let ((f3892 f3892) (f3893 f3893)) (if ((vector-ref f3880 0) f3892 f3893) ((vector-ref f3878 0) f3892 f3893 0 (string-length f3892)) #f))))) (vector-ref f3877 0))
#   env=((f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# emit-expr (begin (vector-set! f3880 0 (closure (f3901 f3902) () (let ((f3901 f3901) (f3902 f3902)) (fx= (string-length f3901) (string-length f3902))))) (vector-set! f3879 0 (closure (f3898 f3899 f3900) () (let ((f3898 f3898) (f3899 f3899) (f3900 f3900)) (char=? (string-ref f3898 f3900) (string-ref f3899 f3900))))) (vector-set! f3878 0 (closure (f3894 f3895 f3896 f3897) (f3879 f3878) (let ((f3894 f3894) (f3895 f3895) (f3896 f3896) (f3897 f3897)) (if (fx= f3896 f3897) #t (if ((vector-ref f3879 0) f3894 f3895 f3896) ((vector-ref f3878 0) f3894 f3895 (fx+ f3896 1) f3897) #f))))) (vector-set! f3877 0 (closure (f3892 f3893) (f3880 f3878) (let ((f3892 f3892) (f3893 f3893)) (if ((vector-ref f3880 0) f3892 f3893) ((vector-ref f3878 0) f3892 f3893 0 (string-length f3892)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f3880 0 (closure (f3901 f3902) () (let ((f3901 f3901) (f3902 f3902)) (fx= (string-length f3901) (string-length f3902))))) (vector-set! f3879 0 (closure (f3898 f3899 f3900) () (let ((f3898 f3898) (f3899 f3899) (f3900 f3900)) (char=? (string-ref f3898 f3900) (string-ref f3899 f3900))))) (vector-set! f3878 0 (closure (f3894 f3895 f3896 f3897) (f3879 f3878) (let ((f3894 f3894) (f3895 f3895) (f3896 f3896) (f3897 f3897)) (if (fx= f3896 f3897) #t (if ((vector-ref f3879 0) f3894 f3895 f3896) ((vector-ref f3878 0) f3894 f3895 (fx+ f3896 1) f3897) #f))))) (vector-set! f3877 0 (closure (f3892 f3893) (f3880 f3878) (let ((f3892 f3892) (f3893 f3893)) (if ((vector-ref f3880 0) f3892 f3893) ((vector-ref f3878 0) f3892 f3893 0 (string-length f3892)) #f)))))
#   env=((f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# emit-expr (vector-set! f3880 0 (closure (f3901 f3902) () (let ((f3901 f3901) (f3902 f3902)) (fx= (string-length f3901) (string-length f3902)))))
# emit-expr f3880
# emit-variable-ref
# env=((f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3880
    movl 0(%esp), %eax  # stack load f3880
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32430
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32430:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32431"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32431:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32433
    cmp  $0,%eax
    jge _L_32432
_L_32433:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32432:
    movl %eax, -20(%esp)
# emit-expr (closure (f3901 f3902) () (let ((f3901 f3901) (f3902 f3902)) (fx= (string-length f3901) (string-length f3902))))
# emit-closure
# si = -24
# env = ((f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# expr = (closure (f3901 f3902) () (let ((f3901 f3901) (f3902 f3902)) (fx= (string-length f3901) (string-length f3902))))
    movl $_L_32434, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_32435            # jump around closure body
_L_32434:
# check argument count
    cmp $8,%eax
    je _L_32436
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_32436:
# emit-tail-expr
# si=-16
# env=((f3902 . -12) (f3901 . -8) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# expr=(let ((f3901 f3901) (f3902 f3902)) (fx= (string-length f3901) (string-length f3902)))
# emit-tail-let
#  si   = -16
#  env  = ((f3902 . -12) (f3901 . -8) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
#  bindings = ((f3901 f3901) (f3902 f3902))
#  body = (fx= (string-length f3901) (string-length f3902))
# emit-expr f3901
# emit-variable-ref
# env=((f3902 . -12) (f3901 . -8) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3901
    movl -8(%esp), %eax  # stack load f3901
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f3902
# emit-variable-ref
# env=((f3902 . -12) (f3901 . -8) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3902
    movl -12(%esp), %eax  # stack load f3902
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f3902 . -20) (f3901 . -16) (f3902 . -12) (f3901 . -8) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# expr=(fx= (string-length f3901) (string-length f3902))
# tail primcall
# emit-expr (string-length f3902)
# emit-expr f3902
# emit-variable-ref
# env=((f3902 . -20) (f3901 . -16) (f3902 . -12) (f3901 . -8) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3902
    movl -20(%esp), %eax  # stack load f3902
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_32437
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32437:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32438"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32438:
    movl %eax, -24(%esp)
# emit-expr (string-length f3901)
# emit-expr f3901
# emit-variable-ref
# env=((f3902 . -20) (f3901 . -16) (f3902 . -12) (f3901 . -8) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3901
    movl -16(%esp), %eax  # stack load f3901
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_32439
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32439:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32440"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32440:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (fx= (string-length f3901) (string-length f3902))
    ret
    .align 4,0x90
_L_32435:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3879 0 (closure (f3898 f3899 f3900) () (let ((f3898 f3898) (f3899 f3899) (f3900 f3900)) (char=? (string-ref f3898 f3900) (string-ref f3899 f3900))))) (vector-set! f3878 0 (closure (f3894 f3895 f3896 f3897) (f3879 f3878) (let ((f3894 f3894) (f3895 f3895) (f3896 f3896) (f3897 f3897)) (if (fx= f3896 f3897) #t (if ((vector-ref f3879 0) f3894 f3895 f3896) ((vector-ref f3878 0) f3894 f3895 (fx+ f3896 1) f3897) #f))))) (vector-set! f3877 0 (closure (f3892 f3893) (f3880 f3878) (let ((f3892 f3892) (f3893 f3893)) (if ((vector-ref f3880 0) f3892 f3893) ((vector-ref f3878 0) f3892 f3893 0 (string-length f3892)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f3879 0 (closure (f3898 f3899 f3900) () (let ((f3898 f3898) (f3899 f3899) (f3900 f3900)) (char=? (string-ref f3898 f3900) (string-ref f3899 f3900))))) (vector-set! f3878 0 (closure (f3894 f3895 f3896 f3897) (f3879 f3878) (let ((f3894 f3894) (f3895 f3895) (f3896 f3896) (f3897 f3897)) (if (fx= f3896 f3897) #t (if ((vector-ref f3879 0) f3894 f3895 f3896) ((vector-ref f3878 0) f3894 f3895 (fx+ f3896 1) f3897) #f))))) (vector-set! f3877 0 (closure (f3892 f3893) (f3880 f3878) (let ((f3892 f3892) (f3893 f3893)) (if ((vector-ref f3880 0) f3892 f3893) ((vector-ref f3878 0) f3892 f3893 0 (string-length f3892)) #f)))))
#   env=((f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# emit-expr (vector-set! f3879 0 (closure (f3898 f3899 f3900) () (let ((f3898 f3898) (f3899 f3899) (f3900 f3900)) (char=? (string-ref f3898 f3900) (string-ref f3899 f3900)))))
# emit-expr f3879
# emit-variable-ref
# env=((f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3879
    movl -4(%esp), %eax  # stack load f3879
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32441
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32441:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32442"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32442:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32444
    cmp  $0,%eax
    jge _L_32443
_L_32444:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32443:
    movl %eax, -20(%esp)
# emit-expr (closure (f3898 f3899 f3900) () (let ((f3898 f3898) (f3899 f3899) (f3900 f3900)) (char=? (string-ref f3898 f3900) (string-ref f3899 f3900))))
# emit-closure
# si = -24
# env = ((f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# expr = (closure (f3898 f3899 f3900) () (let ((f3898 f3898) (f3899 f3899) (f3900 f3900)) (char=? (string-ref f3898 f3900) (string-ref f3899 f3900))))
    movl $_L_32445, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_32446            # jump around closure body
_L_32445:
# check argument count
    cmp $12,%eax
    je _L_32447
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_32447:
# emit-tail-expr
# si=-20
# env=((f3900 . -16) (f3899 . -12) (f3898 . -8) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# expr=(let ((f3898 f3898) (f3899 f3899) (f3900 f3900)) (char=? (string-ref f3898 f3900) (string-ref f3899 f3900)))
# emit-tail-let
#  si   = -20
#  env  = ((f3900 . -16) (f3899 . -12) (f3898 . -8) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
#  bindings = ((f3898 f3898) (f3899 f3899) (f3900 f3900))
#  body = (char=? (string-ref f3898 f3900) (string-ref f3899 f3900))
# emit-expr f3898
# emit-variable-ref
# env=((f3900 . -16) (f3899 . -12) (f3898 . -8) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3898
    movl -8(%esp), %eax  # stack load f3898
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr f3899
# emit-variable-ref
# env=((f3900 . -16) (f3899 . -12) (f3898 . -8) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3899
    movl -12(%esp), %eax  # stack load f3899
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f3900
# emit-variable-ref
# env=((f3900 . -16) (f3899 . -12) (f3898 . -8) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3900
    movl -16(%esp), %eax  # stack load f3900
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((f3900 . -28) (f3899 . -24) (f3898 . -20) (f3900 . -16) (f3899 . -12) (f3898 . -8) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# expr=(char=? (string-ref f3898 f3900) (string-ref f3899 f3900))
# tail primcall
# char= c1=(string-ref f3898 f3900) c2=(string-ref f3899 f3900)
# emit-expr (string-ref f3898 f3900)
# emit-expr f3898
# emit-variable-ref
# env=((f3900 . -28) (f3899 . -24) (f3898 . -20) (f3900 . -16) (f3899 . -12) (f3898 . -8) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3898
    movl -20(%esp), %eax  # stack load f3898
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_32448
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $156,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32448:
    movl %eax, -32(%esp)
# emit-expr f3900
# emit-variable-ref
# env=((f3900 . -28) (f3899 . -24) (f3898 . -20) (f3900 . -16) (f3899 . -12) (f3898 . -8) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3900
    movl -28(%esp), %eax  # stack load f3900
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32449"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $156,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32449:
# check bounds on string index
    movl -32(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_32451
    cmp  $0,%eax
    jge _L_32450
_L_32451:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $156,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32450:
    sar $2, %eax
    movl -32(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_32452"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32452:
    movb %ah, -32(%esp)
# emit-expr (string-ref f3899 f3900)
# emit-expr f3899
# emit-variable-ref
# env=((f3900 . -28) (f3899 . -24) (f3898 . -20) (f3900 . -16) (f3899 . -12) (f3898 . -8) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3899
    movl -24(%esp), %eax  # stack load f3899
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_32453
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $156,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32453:
    movl %eax, -36(%esp)
# emit-expr f3900
# emit-variable-ref
# env=((f3900 . -28) (f3899 . -24) (f3898 . -20) (f3900 . -16) (f3899 . -12) (f3898 . -8) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3900
    movl -28(%esp), %eax  # stack load f3900
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32454"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $156,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32454:
# check bounds on string index
    movl -36(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_32456
    cmp  $0,%eax
    jge _L_32455
_L_32456:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $156,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32455:
    sar $2, %eax
    movl -36(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_32457"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32457:
    cmp %ah, -32(%esp)
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (char=? (string-ref f3898 f3900) (string-ref f3899 f3900))
    ret
    .align 4,0x90
_L_32446:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3878 0 (closure (f3894 f3895 f3896 f3897) (f3879 f3878) (let ((f3894 f3894) (f3895 f3895) (f3896 f3896) (f3897 f3897)) (if (fx= f3896 f3897) #t (if ((vector-ref f3879 0) f3894 f3895 f3896) ((vector-ref f3878 0) f3894 f3895 (fx+ f3896 1) f3897) #f))))) (vector-set! f3877 0 (closure (f3892 f3893) (f3880 f3878) (let ((f3892 f3892) (f3893 f3893)) (if ((vector-ref f3880 0) f3892 f3893) ((vector-ref f3878 0) f3892 f3893 0 (string-length f3892)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f3878 0 (closure (f3894 f3895 f3896 f3897) (f3879 f3878) (let ((f3894 f3894) (f3895 f3895) (f3896 f3896) (f3897 f3897)) (if (fx= f3896 f3897) #t (if ((vector-ref f3879 0) f3894 f3895 f3896) ((vector-ref f3878 0) f3894 f3895 (fx+ f3896 1) f3897) #f))))) (vector-set! f3877 0 (closure (f3892 f3893) (f3880 f3878) (let ((f3892 f3892) (f3893 f3893)) (if ((vector-ref f3880 0) f3892 f3893) ((vector-ref f3878 0) f3892 f3893 0 (string-length f3892)) #f)))))
#   env=((f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# emit-expr (vector-set! f3878 0 (closure (f3894 f3895 f3896 f3897) (f3879 f3878) (let ((f3894 f3894) (f3895 f3895) (f3896 f3896) (f3897 f3897)) (if (fx= f3896 f3897) #t (if ((vector-ref f3879 0) f3894 f3895 f3896) ((vector-ref f3878 0) f3894 f3895 (fx+ f3896 1) f3897) #f)))))
# emit-expr f3878
# emit-variable-ref
# env=((f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3878
    movl -8(%esp), %eax  # stack load f3878
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32458
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32458:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32459"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32459:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32461
    cmp  $0,%eax
    jge _L_32460
_L_32461:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32460:
    movl %eax, -20(%esp)
# emit-expr (closure (f3894 f3895 f3896 f3897) (f3879 f3878) (let ((f3894 f3894) (f3895 f3895) (f3896 f3896) (f3897 f3897)) (if (fx= f3896 f3897) #t (if ((vector-ref f3879 0) f3894 f3895 f3896) ((vector-ref f3878 0) f3894 f3895 (fx+ f3896 1) f3897) #f))))
# emit-closure
# si = -24
# env = ((f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# expr = (closure (f3894 f3895 f3896 f3897) (f3879 f3878) (let ((f3894 f3894) (f3895 f3895) (f3896 f3896) (f3897 f3897)) (if (fx= f3896 f3897) #t (if ((vector-ref f3879 0) f3894 f3895 f3896) ((vector-ref f3878 0) f3894 f3895 (fx+ f3896 1) f3897) #f))))
    movl $_L_32462, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3879
    movl -4(%esp), %eax  # stack load f3879
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f3879
# emit-variable-ref
# env=((f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3878
    movl -8(%esp), %eax  # stack load f3878
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f3878
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_32463            # jump around closure body
_L_32462:
# check argument count
    cmp $16,%eax
    je _L_32464
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_32464:
# emit-tail-expr
# si=-24
# env=((f3897 . -20) (f3896 . -16) (f3895 . -12) (f3894 . -8) (f3878 . 8) (f3879 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# expr=(let ((f3894 f3894) (f3895 f3895) (f3896 f3896) (f3897 f3897)) (if (fx= f3896 f3897) #t (if ((vector-ref f3879 0) f3894 f3895 f3896) ((vector-ref f3878 0) f3894 f3895 (fx+ f3896 1) f3897) #f)))
# emit-tail-let
#  si   = -24
#  env  = ((f3897 . -20) (f3896 . -16) (f3895 . -12) (f3894 . -8) (f3878 . 8) (f3879 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
#  bindings = ((f3894 f3894) (f3895 f3895) (f3896 f3896) (f3897 f3897))
#  body = (if (fx= f3896 f3897) #t (if ((vector-ref f3879 0) f3894 f3895 f3896) ((vector-ref f3878 0) f3894 f3895 (fx+ f3896 1) f3897) #f))
# emit-expr f3894
# emit-variable-ref
# env=((f3897 . -20) (f3896 . -16) (f3895 . -12) (f3894 . -8) (f3878 . 8) (f3879 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3894
    movl -8(%esp), %eax  # stack load f3894
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f3895
# emit-variable-ref
# env=((f3897 . -20) (f3896 . -16) (f3895 . -12) (f3894 . -8) (f3878 . 8) (f3879 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3895
    movl -12(%esp), %eax  # stack load f3895
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-expr f3896
# emit-variable-ref
# env=((f3897 . -20) (f3896 . -16) (f3895 . -12) (f3894 . -8) (f3878 . 8) (f3879 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3896
    movl -16(%esp), %eax  # stack load f3896
# end emit-variable-ref
    movl %eax, -32(%esp)  # stack save
# emit-expr f3897
# emit-variable-ref
# env=((f3897 . -20) (f3896 . -16) (f3895 . -12) (f3894 . -8) (f3878 . 8) (f3879 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3897
    movl -20(%esp), %eax  # stack load f3897
# end emit-variable-ref
    movl %eax, -36(%esp)  # stack save
# emit-tail-expr
# si=-40
# env=((f3897 . -36) (f3896 . -32) (f3895 . -28) (f3894 . -24) (f3897 . -20) (f3896 . -16) (f3895 . -12) (f3894 . -8) (f3878 . 8) (f3879 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# expr=(if (fx= f3896 f3897) #t (if ((vector-ref f3879 0) f3894 f3895 f3896) ((vector-ref f3878 0) f3894 f3895 (fx+ f3896 1) f3897) #f))
# emit-expr (fx= f3896 f3897)
# emit-expr f3897
# emit-variable-ref
# env=((f3897 . -36) (f3896 . -32) (f3895 . -28) (f3894 . -24) (f3897 . -20) (f3896 . -16) (f3895 . -12) (f3894 . -8) (f3878 . 8) (f3879 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3897
    movl -36(%esp), %eax  # stack load f3897
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32467"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32467:
    movl %eax, -40(%esp)
# emit-expr f3896
# emit-variable-ref
# env=((f3897 . -36) (f3896 . -32) (f3895 . -28) (f3894 . -24) (f3897 . -20) (f3896 . -16) (f3895 . -12) (f3894 . -8) (f3878 . 8) (f3879 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3896
    movl -32(%esp), %eax  # stack load f3896
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32468"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32468:
    cmp -40(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_32465
# emit-tail-expr
# si=-40
# env=((f3897 . -36) (f3896 . -32) (f3895 . -28) (f3894 . -24) (f3897 . -20) (f3896 . -16) (f3895 . -12) (f3894 . -8) (f3878 . 8) (f3879 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# expr=#t
    movl $111, %eax     # immed #t
    ret                  # immediate tail return
    jmp _L_32466
_L_32465:
# emit-tail-expr
# si=-40
# env=((f3897 . -36) (f3896 . -32) (f3895 . -28) (f3894 . -24) (f3897 . -20) (f3896 . -16) (f3895 . -12) (f3894 . -8) (f3878 . 8) (f3879 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# expr=(if ((vector-ref f3879 0) f3894 f3895 f3896) ((vector-ref f3878 0) f3894 f3895 (fx+ f3896 1) f3897) #f)
# emit-expr ((vector-ref f3879 0) f3894 f3895 f3896)
# funcall
#    si   =-40
#    env  = ((f3897 . -36) (f3896 . -32) (f3895 . -28) (f3894 . -24) (f3897 . -20) (f3896 . -16) (f3895 . -12) (f3894 . -8) (f3878 . 8) (f3879 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
#    expr = (funcall (vector-ref f3879 0) f3894 f3895 f3896)
# emit-expr (vector-ref f3879 0)
# emit-expr f3879
# emit-variable-ref
# env=((f3897 . -36) (f3896 . -32) (f3895 . -28) (f3894 . -24) (f3897 . -20) (f3896 . -16) (f3895 . -12) (f3894 . -8) (f3878 . 8) (f3879 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3879
    movl 2(%edi), %eax  # frame load f3879
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32471
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32471:
    movl %eax, -48(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32472"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32472:
# check bounds on vector index
    movl -48(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32474
    cmp  $0,%eax
    jge _L_32473
_L_32474:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32473:
    movl -48(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32475"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32475":
   movl %eax,  -48(%esp)  # stash funcall-oper in closure slot
# emit-expr f3894
# emit-variable-ref
# env=((f3897 . -36) (f3896 . -32) (f3895 . -28) (f3894 . -24) (f3897 . -20) (f3896 . -16) (f3895 . -12) (f3894 . -8) (f3878 . 8) (f3879 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3894
    movl -24(%esp), %eax  # stack load f3894
# end emit-variable-ref
    mov %eax, -52(%esp)  # arg f3894
# emit-expr f3895
# emit-variable-ref
# env=((f3897 . -36) (f3896 . -32) (f3895 . -28) (f3894 . -24) (f3897 . -20) (f3896 . -16) (f3895 . -12) (f3894 . -8) (f3878 . 8) (f3879 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3895
    movl -28(%esp), %eax  # stack load f3895
# end emit-variable-ref
    mov %eax, -56(%esp)  # arg f3895
# emit-expr f3896
# emit-variable-ref
# env=((f3897 . -36) (f3896 . -32) (f3895 . -28) (f3894 . -24) (f3897 . -20) (f3896 . -16) (f3895 . -12) (f3894 . -8) (f3878 . 8) (f3879 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3896
    movl -32(%esp), %eax  # stack load f3896
# end emit-variable-ref
    mov %eax, -60(%esp)  # arg f3896
    movl -48(%esp), %edi   # load new closure to %edi
    add $-40, %esp   # adjust base
    movl $12,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $40, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_32469
# emit-tail-expr
# si=-40
# env=((f3897 . -36) (f3896 . -32) (f3895 . -28) (f3894 . -24) (f3897 . -20) (f3896 . -16) (f3895 . -12) (f3894 . -8) (f3878 . 8) (f3879 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# expr=((vector-ref f3878 0) f3894 f3895 (fx+ f3896 1) f3897)
# emit-tail-funcall
#    si   =-40
#    env  = ((f3897 . -36) (f3896 . -32) (f3895 . -28) (f3894 . -24) (f3897 . -20) (f3896 . -16) (f3895 . -12) (f3894 . -8) (f3878 . 8) (f3879 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
#    expr = (funcall (vector-ref f3878 0) f3894 f3895 (fx+ f3896 1) f3897)
# emit-expr (vector-ref f3878 0)
# emit-expr f3878
# emit-variable-ref
# env=((f3897 . -36) (f3896 . -32) (f3895 . -28) (f3894 . -24) (f3897 . -20) (f3896 . -16) (f3895 . -12) (f3894 . -8) (f3878 . 8) (f3879 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3878
    movl 6(%edi), %eax  # frame load f3878
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32476
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32476:
    movl %eax, -40(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32477"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32477:
# check bounds on vector index
    movl -40(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32479
    cmp  $0,%eax
    jge _L_32478
_L_32479:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32478:
    movl -40(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -40(%esp)  # stash funcall-oper in next closure slot
# emit-expr f3894
# emit-variable-ref
# env=((f3897 . -36) (f3896 . -32) (f3895 . -28) (f3894 . -24) (f3897 . -20) (f3896 . -16) (f3895 . -12) (f3894 . -8) (f3878 . 8) (f3879 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3894
    movl -24(%esp), %eax  # stack load f3894
# end emit-variable-ref
    mov %eax, -44(%esp)    # arg f3894
# emit-expr f3895
# emit-variable-ref
# env=((f3897 . -36) (f3896 . -32) (f3895 . -28) (f3894 . -24) (f3897 . -20) (f3896 . -16) (f3895 . -12) (f3894 . -8) (f3878 . 8) (f3879 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3895
    movl -28(%esp), %eax  # stack load f3895
# end emit-variable-ref
    mov %eax, -48(%esp)    # arg f3895
# emit-expr (fx+ f3896 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32480"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32480:
    movl %eax, -52(%esp)  # fx+ push arg1
# emit-expr f3896
# emit-variable-ref
# env=((f3897 . -36) (f3896 . -32) (f3895 . -28) (f3894 . -24) (f3897 . -20) (f3896 . -16) (f3895 . -12) (f3894 . -8) (f3878 . 8) (f3879 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3896
    movl -32(%esp), %eax  # stack load f3896
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32481"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32481:
    addl -52(%esp), %eax  # fx+ arg1 arg2
    mov %eax, -52(%esp)    # arg (fx+ f3896 1)
# emit-expr f3897
# emit-variable-ref
# env=((f3897 . -36) (f3896 . -32) (f3895 . -28) (f3894 . -24) (f3897 . -20) (f3896 . -16) (f3895 . -12) (f3894 . -8) (f3878 . 8) (f3879 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3897
    movl -36(%esp), %eax  # stack load f3897
# end emit-variable-ref
    mov %eax, -56(%esp)    # arg f3897
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
    jmp _L_32470
_L_32469:
# emit-tail-expr
# si=-40
# env=((f3897 . -36) (f3896 . -32) (f3895 . -28) (f3894 . -24) (f3897 . -20) (f3896 . -16) (f3895 . -12) (f3894 . -8) (f3878 . 8) (f3879 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_32470:
_L_32466:
    .align 4,0x90
_L_32463:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3877 0 (closure (f3892 f3893) (f3880 f3878) (let ((f3892 f3892) (f3893 f3893)) (if ((vector-ref f3880 0) f3892 f3893) ((vector-ref f3878 0) f3892 f3893 0 (string-length f3892)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f3877 0 (closure (f3892 f3893) (f3880 f3878) (let ((f3892 f3892) (f3893 f3893)) (if ((vector-ref f3880 0) f3892 f3893) ((vector-ref f3878 0) f3892 f3893 0 (string-length f3892)) #f)))))
#   env=((f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# emit-expr (vector-set! f3877 0 (closure (f3892 f3893) (f3880 f3878) (let ((f3892 f3892) (f3893 f3893)) (if ((vector-ref f3880 0) f3892 f3893) ((vector-ref f3878 0) f3892 f3893 0 (string-length f3892)) #f))))
# emit-expr f3877
# emit-variable-ref
# env=((f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3877
    movl -12(%esp), %eax  # stack load f3877
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32482
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32482:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32483"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32483:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32485
    cmp  $0,%eax
    jge _L_32484
_L_32485:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32484:
    movl %eax, -20(%esp)
# emit-expr (closure (f3892 f3893) (f3880 f3878) (let ((f3892 f3892) (f3893 f3893)) (if ((vector-ref f3880 0) f3892 f3893) ((vector-ref f3878 0) f3892 f3893 0 (string-length f3892)) #f)))
# emit-closure
# si = -24
# env = ((f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# expr = (closure (f3892 f3893) (f3880 f3878) (let ((f3892 f3892) (f3893 f3893)) (if ((vector-ref f3880 0) f3892 f3893) ((vector-ref f3878 0) f3892 f3893 0 (string-length f3892)) #f)))
    movl $_L_32486, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3880
    movl 0(%esp), %eax  # stack load f3880
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f3880
# emit-variable-ref
# env=((f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3878
    movl -8(%esp), %eax  # stack load f3878
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f3878
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_32487            # jump around closure body
_L_32486:
# check argument count
    cmp $8,%eax
    je _L_32488
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_32488:
# emit-tail-expr
# si=-16
# env=((f3893 . -12) (f3892 . -8) (f3878 . 8) (f3880 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# expr=(let ((f3892 f3892) (f3893 f3893)) (if ((vector-ref f3880 0) f3892 f3893) ((vector-ref f3878 0) f3892 f3893 0 (string-length f3892)) #f))
# emit-tail-let
#  si   = -16
#  env  = ((f3893 . -12) (f3892 . -8) (f3878 . 8) (f3880 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
#  bindings = ((f3892 f3892) (f3893 f3893))
#  body = (if ((vector-ref f3880 0) f3892 f3893) ((vector-ref f3878 0) f3892 f3893 0 (string-length f3892)) #f)
# emit-expr f3892
# emit-variable-ref
# env=((f3893 . -12) (f3892 . -8) (f3878 . 8) (f3880 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3892
    movl -8(%esp), %eax  # stack load f3892
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f3893
# emit-variable-ref
# env=((f3893 . -12) (f3892 . -8) (f3878 . 8) (f3880 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3893
    movl -12(%esp), %eax  # stack load f3893
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f3893 . -20) (f3892 . -16) (f3893 . -12) (f3892 . -8) (f3878 . 8) (f3880 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# expr=(if ((vector-ref f3880 0) f3892 f3893) ((vector-ref f3878 0) f3892 f3893 0 (string-length f3892)) #f)
# emit-expr ((vector-ref f3880 0) f3892 f3893)
# funcall
#    si   =-24
#    env  = ((f3893 . -20) (f3892 . -16) (f3893 . -12) (f3892 . -8) (f3878 . 8) (f3880 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
#    expr = (funcall (vector-ref f3880 0) f3892 f3893)
# emit-expr (vector-ref f3880 0)
# emit-expr f3880
# emit-variable-ref
# env=((f3893 . -20) (f3892 . -16) (f3893 . -12) (f3892 . -8) (f3878 . 8) (f3880 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3880
    movl 2(%edi), %eax  # frame load f3880
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32491
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32491:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32492"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32492:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32494
    cmp  $0,%eax
    jge _L_32493
_L_32494:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32493:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32495"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32495":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f3892
# emit-variable-ref
# env=((f3893 . -20) (f3892 . -16) (f3893 . -12) (f3892 . -8) (f3878 . 8) (f3880 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3892
    movl -16(%esp), %eax  # stack load f3892
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f3892
# emit-expr f3893
# emit-variable-ref
# env=((f3893 . -20) (f3892 . -16) (f3893 . -12) (f3892 . -8) (f3878 . 8) (f3880 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3893
    movl -20(%esp), %eax  # stack load f3893
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg f3893
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_32489
# emit-tail-expr
# si=-24
# env=((f3893 . -20) (f3892 . -16) (f3893 . -12) (f3892 . -8) (f3878 . 8) (f3880 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# expr=((vector-ref f3878 0) f3892 f3893 0 (string-length f3892))
# emit-tail-funcall
#    si   =-24
#    env  = ((f3893 . -20) (f3892 . -16) (f3893 . -12) (f3892 . -8) (f3878 . 8) (f3880 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
#    expr = (funcall (vector-ref f3878 0) f3892 f3893 0 (string-length f3892))
# emit-expr (vector-ref f3878 0)
# emit-expr f3878
# emit-variable-ref
# env=((f3893 . -20) (f3892 . -16) (f3893 . -12) (f3892 . -8) (f3878 . 8) (f3880 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3878
    movl 6(%edi), %eax  # frame load f3878
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32496
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32496:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32497"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32497:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32499
    cmp  $0,%eax
    jge _L_32498
_L_32499:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32498:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr f3892
# emit-variable-ref
# env=((f3893 . -20) (f3892 . -16) (f3893 . -12) (f3892 . -8) (f3878 . 8) (f3880 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3892
    movl -16(%esp), %eax  # stack load f3892
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f3892
# emit-expr f3893
# emit-variable-ref
# env=((f3893 . -20) (f3892 . -16) (f3893 . -12) (f3892 . -8) (f3878 . 8) (f3880 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3893
    movl -20(%esp), %eax  # stack load f3893
# end emit-variable-ref
    mov %eax, -32(%esp)    # arg f3893
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -36(%esp)    # arg 0
# emit-expr (string-length f3892)
# emit-expr f3892
# emit-variable-ref
# env=((f3893 . -20) (f3892 . -16) (f3893 . -12) (f3892 . -8) (f3878 . 8) (f3880 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3892
    movl -16(%esp), %eax  # stack load f3892
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_32500
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32500:
    movl -6(%eax), %eax
    mov %eax, -40(%esp)    # arg (string-length f3892)
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
    jmp _L_32490
_L_32489:
# emit-tail-expr
# si=-24
# env=((f3893 . -20) (f3892 . -16) (f3893 . -12) (f3892 . -8) (f3878 . 8) (f3880 . 4) (f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_32490:
    .align 4,0x90
_L_32487:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# emit-expr (begin (vector-ref f3877 0))
# emit-begin
#   expr=(begin (vector-ref f3877 0))
#   env=((f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# emit-expr (vector-ref f3877 0)
# emit-expr f3877
# emit-variable-ref
# env=((f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
# var=f3877
    movl -12(%esp), %eax  # stack load f3877
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32501
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32501:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32502"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32502:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32504
    cmp  $0,%eax
    jge _L_32503
_L_32504:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32503:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f3877 . -12) (f3878 . -8) (f3879 . -4) (f3880 . 0))
     movl %eax, string$e$q
# == explicit-begins  ==>
# (letrec ((str->sym (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let* ((new-sym (make-symbol str #f)) (new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym)) (str->sym str (cdr symlist))))))) (lambda (str) (str->sym str (symbols))))
# == eliminate-let*  ==>
# (letrec ((str->sym (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) (str->sym str (cdr symlist))))))) (lambda (str) (str->sym str (symbols))))
# == uniquify-variables  ==>
# (letrec ((f3903 (lambda (f3912 f3913) (if (string=? f3912 (symbol->string (car f3913))) (car f3913) (if (null? (cdr f3913)) (let ((f3917 (make-symbol f3912 #f))) (let ((f3919 (cons f3917 ()))) (begin (set-cdr! f3913 f3919) f3917))) (f3903 f3912 (cdr f3913))))))) (lambda (f3921) (f3903 f3921 (symbols))))
# == vectorize-letrec  ==>
# (let ((f3903 (make-vector 1))) (begin (begin (vector-set! f3903 0 (lambda (f3912 f3913) (if (string=? f3912 (symbol->string (car f3913))) (car f3913) (if (null? (cdr f3913)) (let ((f3917 (make-symbol f3912 #f))) (let ((f3919 (cons f3917 ()))) (begin (set-cdr! f3913 f3919) f3917))) ((vector-ref f3903 0) f3912 (cdr f3913))))))) (lambda (f3921) ((vector-ref f3903 0) f3921 (symbols)))))
# == eliminate-set!  ==>
# (let ((f3903 (make-vector 1))) (begin (begin (vector-set! f3903 0 (lambda (f3912 f3913) (let ((f3912 f3912) (f3913 f3913)) (if (string=? f3912 (symbol->string (car f3913))) (car f3913) (if (null? (cdr f3913)) (let ((f3917 (make-symbol f3912 #f))) (let ((f3919 (cons f3917 ()))) (begin (set-cdr! f3913 f3919) f3917))) ((vector-ref f3903 0) f3912 (cdr f3913)))))))) (lambda (f3921) (let ((f3921 f3921)) ((vector-ref f3903 0) f3921 (symbols))))))
# == close-free-variables  ==>
# (let ((f3903 (make-vector 1))) (begin (begin (vector-set! f3903 0 (closure (f3912 f3913) (string=? f3903) (let ((f3912 f3912) (f3913 f3913)) (if (string=? f3912 (symbol->string (car f3913))) (car f3913) (if (null? (cdr f3913)) (let ((f3917 (make-symbol f3912 #f))) (let ((f3919 (cons f3917 ()))) (begin (set-cdr! f3913 f3919) f3917))) ((vector-ref f3903 0) f3912 (cdr f3913)))))))) (closure (f3921) (f3903 symbols) (let ((f3921 f3921)) ((vector-ref f3903 0) f3921 (symbols))))))
# == eliminate-quote  ==>
# (let ((f3903 (make-vector 1))) (begin (begin (vector-set! f3903 0 (closure (f3912 f3913) (string=? f3903) (let ((f3912 f3912) (f3913 f3913)) (if (string=? f3912 (symbol->string (car f3913))) (car f3913) (if (null? (cdr f3913)) (let ((f3917 (make-symbol f3912 #f))) (let ((f3919 (cons f3917 ()))) (begin (set-cdr! f3913 f3919) f3917))) ((vector-ref f3903 0) f3912 (cdr f3913)))))))) (closure (f3921) (f3903 symbols) (let ((f3921 f3921)) ((vector-ref f3903 0) f3921 (symbols))))))
# == eliminate-when/unless  ==>
# (let ((f3903 (make-vector 1))) (begin (begin (vector-set! f3903 0 (closure (f3912 f3913) (string=? f3903) (let ((f3912 f3912) (f3913 f3913)) (if (string=? f3912 (symbol->string (car f3913))) (car f3913) (if (null? (cdr f3913)) (let ((f3917 (make-symbol f3912 #f))) (let ((f3919 (cons f3917 ()))) (begin (set-cdr! f3913 f3919) f3917))) ((vector-ref f3903 0) f3912 (cdr f3913)))))))) (closure (f3921) (f3903 symbols) (let ((f3921 f3921)) ((vector-ref f3903 0) f3921 (symbols))))))
# == eliminate-cond  ==>
# (let ((f3903 (make-vector 1))) (begin (begin (vector-set! f3903 0 (closure (f3912 f3913) (string=? f3903) (let ((f3912 f3912) (f3913 f3913)) (if (string=? f3912 (symbol->string (car f3913))) (car f3913) (if (null? (cdr f3913)) (let ((f3917 (make-symbol f3912 #f))) (let ((f3919 (cons f3917 ()))) (begin (set-cdr! f3913 f3919) f3917))) ((vector-ref f3903 0) f3912 (cdr f3913)))))))) (closure (f3921) (f3903 symbols) (let ((f3921 f3921)) ((vector-ref f3903 0) f3921 (symbols))))))
# == external-symbols  ==>
# (let ((f3903 (make-vector 1))) (begin (begin (vector-set! f3903 0 (closure (f3912 f3913) ((primitive-ref string=?) f3903) (let ((f3912 f3912) (f3913 f3913)) (if ((primitive-ref string=?) f3912 (symbol->string (car f3913))) (car f3913) (if (null? (cdr f3913)) (let ((f3917 (make-symbol f3912 #f))) (let ((f3919 (cons f3917 ()))) (begin (set-cdr! f3913 f3919) f3917))) ((vector-ref f3903 0) f3912 (cdr f3913)))))))) (closure (f3921) (f3903 (primitive-ref symbols)) (let ((f3921 f3921)) ((vector-ref f3903 0) f3921 ((primitive-ref symbols)))))))
# emit-expr (let ((f3903 (make-vector 1))) (begin (begin (vector-set! f3903 0 (closure (f3912 f3913) ((primitive-ref string=?) f3903) (let ((f3912 f3912) (f3913 f3913)) (if ((primitive-ref string=?) f3912 (symbol->string (car f3913))) (car f3913) (if (null? (cdr f3913)) (let ((f3917 (make-symbol f3912 #f))) (let ((f3919 (cons f3917 ()))) (begin (set-cdr! f3913 f3919) f3917))) ((vector-ref f3903 0) f3912 (cdr f3913)))))))) (closure (f3921) (f3903 (primitive-ref symbols)) (let ((f3921 f3921)) ((vector-ref f3903 0) f3921 ((primitive-ref symbols)))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f3903 (make-vector 1)))
#  body = (begin (begin (vector-set! f3903 0 (closure (f3912 f3913) ((primitive-ref string=?) f3903) (let ((f3912 f3912) (f3913 f3913)) (if ((primitive-ref string=?) f3912 (symbol->string (car f3913))) (car f3913) (if (null? (cdr f3913)) (let ((f3917 (make-symbol f3912 #f))) (let ((f3919 (cons f3917 ()))) (begin (set-cdr! f3913 f3919) f3917))) ((vector-ref f3903 0) f3912 (cdr f3913)))))))) (closure (f3921) (f3903 (primitive-ref symbols)) (let ((f3921 f3921)) ((vector-ref f3903 0) f3921 ((primitive-ref symbols))))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32505"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32505:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_32506
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32506:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f3903 0 (closure (f3912 f3913) ((primitive-ref string=?) f3903) (let ((f3912 f3912) (f3913 f3913)) (if ((primitive-ref string=?) f3912 (symbol->string (car f3913))) (car f3913) (if (null? (cdr f3913)) (let ((f3917 (make-symbol f3912 #f))) (let ((f3919 (cons f3917 ()))) (begin (set-cdr! f3913 f3919) f3917))) ((vector-ref f3903 0) f3912 (cdr f3913)))))))) (closure (f3921) (f3903 (primitive-ref symbols)) (let ((f3921 f3921)) ((vector-ref f3903 0) f3921 ((primitive-ref symbols))))))
# emit-begin
#   expr=(begin (begin (vector-set! f3903 0 (closure (f3912 f3913) ((primitive-ref string=?) f3903) (let ((f3912 f3912) (f3913 f3913)) (if ((primitive-ref string=?) f3912 (symbol->string (car f3913))) (car f3913) (if (null? (cdr f3913)) (let ((f3917 (make-symbol f3912 #f))) (let ((f3919 (cons f3917 ()))) (begin (set-cdr! f3913 f3919) f3917))) ((vector-ref f3903 0) f3912 (cdr f3913)))))))) (closure (f3921) (f3903 (primitive-ref symbols)) (let ((f3921 f3921)) ((vector-ref f3903 0) f3921 ((primitive-ref symbols))))))
#   env=((f3903 . 0))
# emit-expr (begin (vector-set! f3903 0 (closure (f3912 f3913) ((primitive-ref string=?) f3903) (let ((f3912 f3912) (f3913 f3913)) (if ((primitive-ref string=?) f3912 (symbol->string (car f3913))) (car f3913) (if (null? (cdr f3913)) (let ((f3917 (make-symbol f3912 #f))) (let ((f3919 (cons f3917 ()))) (begin (set-cdr! f3913 f3919) f3917))) ((vector-ref f3903 0) f3912 (cdr f3913))))))))
# emit-begin
#   expr=(begin (vector-set! f3903 0 (closure (f3912 f3913) ((primitive-ref string=?) f3903) (let ((f3912 f3912) (f3913 f3913)) (if ((primitive-ref string=?) f3912 (symbol->string (car f3913))) (car f3913) (if (null? (cdr f3913)) (let ((f3917 (make-symbol f3912 #f))) (let ((f3919 (cons f3917 ()))) (begin (set-cdr! f3913 f3919) f3917))) ((vector-ref f3903 0) f3912 (cdr f3913))))))))
#   env=((f3903 . 0))
# emit-expr (vector-set! f3903 0 (closure (f3912 f3913) ((primitive-ref string=?) f3903) (let ((f3912 f3912) (f3913 f3913)) (if ((primitive-ref string=?) f3912 (symbol->string (car f3913))) (car f3913) (if (null? (cdr f3913)) (let ((f3917 (make-symbol f3912 #f))) (let ((f3919 (cons f3917 ()))) (begin (set-cdr! f3913 f3919) f3917))) ((vector-ref f3903 0) f3912 (cdr f3913)))))))
# emit-expr f3903
# emit-variable-ref
# env=((f3903 . 0))
# var=f3903
    movl 0(%esp), %eax  # stack load f3903
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32507
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32507:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32508"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32508:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32510
    cmp  $0,%eax
    jge _L_32509
_L_32510:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32509:
    movl %eax, -8(%esp)
# emit-expr (closure (f3912 f3913) ((primitive-ref string=?) f3903) (let ((f3912 f3912) (f3913 f3913)) (if ((primitive-ref string=?) f3912 (symbol->string (car f3913))) (car f3913) (if (null? (cdr f3913)) (let ((f3917 (make-symbol f3912 #f))) (let ((f3919 (cons f3917 ()))) (begin (set-cdr! f3913 f3919) f3917))) ((vector-ref f3903 0) f3912 (cdr f3913))))))
# emit-closure
# si = -12
# env = ((f3903 . 0))
# expr = (closure (f3912 f3913) ((primitive-ref string=?) f3903) (let ((f3912 f3912) (f3913 f3913)) (if ((primitive-ref string=?) f3912 (symbol->string (car f3913))) (car f3913) (if (null? (cdr f3913)) (let ((f3917 (make-symbol f3912 #f))) (let ((f3919 (cons f3917 ()))) (begin (set-cdr! f3913 f3919) f3917))) ((vector-ref f3903 0) f3912 (cdr f3913))))))
    movl $_L_32511, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref string=?) not defined in the environmnet
# emit-variable-ref
# env=((f3903 . 0))
# var=f3903
    movl 0(%esp), %eax  # stack load f3903
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f3903
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_32512            # jump around closure body
_L_32511:
# check argument count
    cmp $8,%eax
    je _L_32513
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_32513:
# emit-tail-expr
# si=-16
# env=((f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
# expr=(let ((f3912 f3912) (f3913 f3913)) (if ((primitive-ref string=?) f3912 (symbol->string (car f3913))) (car f3913) (if (null? (cdr f3913)) (let ((f3917 (make-symbol f3912 #f))) (let ((f3919 (cons f3917 ()))) (begin (set-cdr! f3913 f3919) f3917))) ((vector-ref f3903 0) f3912 (cdr f3913)))))
# emit-tail-let
#  si   = -16
#  env  = ((f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
#  bindings = ((f3912 f3912) (f3913 f3913))
#  body = (if ((primitive-ref string=?) f3912 (symbol->string (car f3913))) (car f3913) (if (null? (cdr f3913)) (let ((f3917 (make-symbol f3912 #f))) (let ((f3919 (cons f3917 ()))) (begin (set-cdr! f3913 f3919) f3917))) ((vector-ref f3903 0) f3912 (cdr f3913))))
# emit-expr f3912
# emit-variable-ref
# env=((f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
# var=f3912
    movl -8(%esp), %eax  # stack load f3912
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f3913
# emit-variable-ref
# env=((f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
# var=f3913
    movl -12(%esp), %eax  # stack load f3913
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f3913 . -20) (f3912 . -16) (f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
# expr=(if ((primitive-ref string=?) f3912 (symbol->string (car f3913))) (car f3913) (if (null? (cdr f3913)) (let ((f3917 (make-symbol f3912 #f))) (let ((f3919 (cons f3917 ()))) (begin (set-cdr! f3913 f3919) f3917))) ((vector-ref f3903 0) f3912 (cdr f3913))))
# emit-expr ((primitive-ref string=?) f3912 (symbol->string (car f3913)))
# funcall
#    si   =-24
#    env  = ((f3913 . -20) (f3912 . -16) (f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
#    expr = (funcall (primitive-ref string=?) f3912 (symbol->string (car f3913)))
# emit-expr (primitive-ref string=?)
    .extern string$e$q
    movl string$e$q,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32516"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32516":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f3912
# emit-variable-ref
# env=((f3913 . -20) (f3912 . -16) (f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
# var=f3912
    movl -16(%esp), %eax  # stack load f3912
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f3912
# emit-expr (symbol->string (car f3913))
# symbol->string (car f3913)
# emit-expr (car f3913)
# emit-expr f3913
# emit-variable-ref
# env=((f3913 . -20) (f3912 . -16) (f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
# var=f3913
    movl -20(%esp), %eax  # stack load f3913
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_32517
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $108,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32517:
    movl -1(%eax), %eax
    movl -3(%eax), %eax
    mov %eax, -40(%esp)  # arg (symbol->string (car f3913))
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_32514
# emit-tail-expr
# si=-24
# env=((f3913 . -20) (f3912 . -16) (f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
# expr=(car f3913)
# tail primcall
# emit-expr f3913
# emit-variable-ref
# env=((f3913 . -20) (f3912 . -16) (f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
# var=f3913
    movl -20(%esp), %eax  # stack load f3913
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_32518
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $108,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32518:
    movl -1(%eax), %eax
#return from tail (car f3913)
    ret
    jmp _L_32515
_L_32514:
# emit-tail-expr
# si=-24
# env=((f3913 . -20) (f3912 . -16) (f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
# expr=(if (null? (cdr f3913)) (let ((f3917 (make-symbol f3912 #f))) (let ((f3919 (cons f3917 ()))) (begin (set-cdr! f3913 f3919) f3917))) ((vector-ref f3903 0) f3912 (cdr f3913)))
# emit-expr (null? (cdr f3913))
# emit-expr (cdr f3913)
# emit-expr f3913
# emit-variable-ref
# env=((f3913 . -20) (f3912 . -16) (f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
# var=f3913
    movl -20(%esp), %eax  # stack load f3913
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_32521
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32521:
    movl 3(%eax), %eax
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_32519
# emit-tail-expr
# si=-24
# env=((f3913 . -20) (f3912 . -16) (f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
# expr=(let ((f3917 (make-symbol f3912 #f))) (let ((f3919 (cons f3917 ()))) (begin (set-cdr! f3913 f3919) f3917)))
# emit-tail-let
#  si   = -24
#  env  = ((f3913 . -20) (f3912 . -16) (f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
#  bindings = ((f3917 (make-symbol f3912 #f)))
#  body = (let ((f3919 (cons f3917 ()))) (begin (set-cdr! f3913 f3919) f3917))
# emit-expr (make-symbol f3912 #f)
# make-symbol arg1=f3912 arg2=#f
# emit-expr f3912
# emit-variable-ref
# env=((f3913 . -20) (f3912 . -16) (f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
# var=f3912
    movl -16(%esp), %eax  # stack load f3912
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
# env=((f3917 . -24) (f3913 . -20) (f3912 . -16) (f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
# expr=(let ((f3919 (cons f3917 ()))) (begin (set-cdr! f3913 f3919) f3917))
# emit-tail-let
#  si   = -28
#  env  = ((f3917 . -24) (f3913 . -20) (f3912 . -16) (f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
#  bindings = ((f3919 (cons f3917 ())))
#  body = (begin (set-cdr! f3913 f3919) f3917)
# emit-expr (cons f3917 ())
# cons arg1=f3917 arg2=()
# emit-expr f3917
# emit-variable-ref
# env=((f3917 . -24) (f3913 . -20) (f3912 . -16) (f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
# var=f3917
    movl -24(%esp), %eax  # stack load f3917
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
# env=((f3919 . -28) (f3917 . -24) (f3913 . -20) (f3912 . -16) (f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
# expr=(begin (set-cdr! f3913 f3919) f3917)
# tail-begin (begin (set-cdr! f3913 f3919) f3917)
#   env=((f3919 . -28) (f3917 . -24) (f3913 . -20) (f3912 . -16) (f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
# emit-expr (set-cdr! f3913 f3919)
# emit-expr f3913
# emit-variable-ref
# env=((f3919 . -28) (f3917 . -24) (f3913 . -20) (f3912 . -16) (f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
# var=f3913
    movl -20(%esp), %eax  # stack load f3913
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_32522
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32522:
    movl %eax, -32(%esp)
# emit-expr f3919
# emit-variable-ref
# env=((f3919 . -28) (f3917 . -24) (f3913 . -20) (f3912 . -16) (f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
# var=f3919
    movl -28(%esp), %eax  # stack load f3919
# end emit-variable-ref
    movl -32(%esp), %ebx
    movl %eax, 3(%ebx)
# emit-tail-expr
# si=-32
# env=((f3919 . -28) (f3917 . -24) (f3913 . -20) (f3912 . -16) (f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
# expr=(begin f3917)
# tail-begin (begin f3917)
#   env=((f3919 . -28) (f3917 . -24) (f3913 . -20) (f3912 . -16) (f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
# emit-tail-expr
# si=-32
# env=((f3919 . -28) (f3917 . -24) (f3913 . -20) (f3912 . -16) (f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
# expr=f3917
# emit-tail-variable-ref
# emit-variable-ref
# env=((f3919 . -28) (f3917 . -24) (f3913 . -20) (f3912 . -16) (f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
# var=f3917
    movl -24(%esp), %eax  # stack load f3917
# end emit-variable-ref
    ret
# end emit-tail-variable ref
     ret   # return thru stack
    jmp _L_32520
_L_32519:
# emit-tail-expr
# si=-24
# env=((f3913 . -20) (f3912 . -16) (f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
# expr=((vector-ref f3903 0) f3912 (cdr f3913))
# emit-tail-funcall
#    si   =-24
#    env  = ((f3913 . -20) (f3912 . -16) (f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
#    expr = (funcall (vector-ref f3903 0) f3912 (cdr f3913))
# emit-expr (vector-ref f3903 0)
# emit-expr f3903
# emit-variable-ref
# env=((f3913 . -20) (f3912 . -16) (f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
# var=f3903
    movl 6(%edi), %eax  # frame load f3903
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32523
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32523:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32524"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32524:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32526
    cmp  $0,%eax
    jge _L_32525
_L_32526:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32525:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr f3912
# emit-variable-ref
# env=((f3913 . -20) (f3912 . -16) (f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
# var=f3912
    movl -16(%esp), %eax  # stack load f3912
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f3912
# emit-expr (cdr f3913)
# emit-expr f3913
# emit-variable-ref
# env=((f3913 . -20) (f3912 . -16) (f3913 . -12) (f3912 . -8) (f3903 . 8) ((primitive-ref string=?) . 4) (f3903 . 0))
# var=f3913
    movl -20(%esp), %eax  # stack load f3913
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_32527
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32527:
    movl 3(%eax), %eax
    mov %eax, -32(%esp)    # arg (cdr f3913)
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
_L_32520:
_L_32515:
    .align 4,0x90
_L_32512:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f3903 . 0))
# emit-expr (begin (closure (f3921) (f3903 (primitive-ref symbols)) (let ((f3921 f3921)) ((vector-ref f3903 0) f3921 ((primitive-ref symbols))))))
# emit-begin
#   expr=(begin (closure (f3921) (f3903 (primitive-ref symbols)) (let ((f3921 f3921)) ((vector-ref f3903 0) f3921 ((primitive-ref symbols))))))
#   env=((f3903 . 0))
# emit-expr (closure (f3921) (f3903 (primitive-ref symbols)) (let ((f3921 f3921)) ((vector-ref f3903 0) f3921 ((primitive-ref symbols)))))
# emit-closure
# si = -4
# env = ((f3903 . 0))
# expr = (closure (f3921) (f3903 (primitive-ref symbols)) (let ((f3921 f3921)) ((vector-ref f3903 0) f3921 ((primitive-ref symbols)))))
    movl $_L_32528, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f3903 . 0))
# var=f3903
    movl 0(%esp), %eax  # stack load f3903
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f3903
# WARNING: free var (primitive-ref symbols) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_32529            # jump around closure body
_L_32528:
# check argument count
    cmp $4,%eax
    je _L_32530
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_32530:
# emit-tail-expr
# si=-12
# env=((f3921 . -8) ((primitive-ref symbols) . 8) (f3903 . 4) (f3903 . 0))
# expr=(let ((f3921 f3921)) ((vector-ref f3903 0) f3921 ((primitive-ref symbols))))
# emit-tail-let
#  si   = -12
#  env  = ((f3921 . -8) ((primitive-ref symbols) . 8) (f3903 . 4) (f3903 . 0))
#  bindings = ((f3921 f3921))
#  body = ((vector-ref f3903 0) f3921 ((primitive-ref symbols)))
# emit-expr f3921
# emit-variable-ref
# env=((f3921 . -8) ((primitive-ref symbols) . 8) (f3903 . 4) (f3903 . 0))
# var=f3921
    movl -8(%esp), %eax  # stack load f3921
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f3921 . -12) (f3921 . -8) ((primitive-ref symbols) . 8) (f3903 . 4) (f3903 . 0))
# expr=((vector-ref f3903 0) f3921 ((primitive-ref symbols)))
# emit-tail-funcall
#    si   =-16
#    env  = ((f3921 . -12) (f3921 . -8) ((primitive-ref symbols) . 8) (f3903 . 4) (f3903 . 0))
#    expr = (funcall (vector-ref f3903 0) f3921 ((primitive-ref symbols)))
# emit-expr (vector-ref f3903 0)
# emit-expr f3903
# emit-variable-ref
# env=((f3921 . -12) (f3921 . -8) ((primitive-ref symbols) . 8) (f3903 . 4) (f3903 . 0))
# var=f3903
    movl 2(%edi), %eax  # frame load f3903
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32531
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32531:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32532"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32532:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32534
    cmp  $0,%eax
    jge _L_32533
_L_32534:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32533:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f3921
# emit-variable-ref
# env=((f3921 . -12) (f3921 . -8) ((primitive-ref symbols) . 8) (f3903 . 4) (f3903 . 0))
# var=f3921
    movl -12(%esp), %eax  # stack load f3921
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f3921
# emit-expr ((primitive-ref symbols))
# funcall
#    si   =-24
#    env  = ((f3921 . -12) (f3921 . -8) ((primitive-ref symbols) . 8) (f3903 . 4) (f3903 . 0))
#    expr = (funcall (primitive-ref symbols))
# emit-expr (primitive-ref symbols)
    .extern symbols
    movl symbols,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32535"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32535":
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
_L_32529:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f3903 . 0))
     movl %eax, string$m$gsymbol
# == explicit-begins  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == eliminate-let*  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == uniquify-variables  ==>
# (lambda (f3922 f3923) (if (null? f3922) (cons e nil) (cons (car f3922) (append1 (cdr f3922) f3923))))
# == vectorize-letrec  ==>
# (lambda (f3922 f3923) (if (null? f3922) (cons e nil) (cons (car f3922) (append1 (cdr f3922) f3923))))
# == eliminate-set!  ==>
# (lambda (f3922 f3923) (let ((f3922 f3922) (f3923 f3923)) (if (null? f3922) (cons e nil) (cons (car f3922) (append1 (cdr f3922) f3923)))))
# == close-free-variables  ==>
# (closure (f3922 f3923) (e nil append1) (let ((f3922 f3922) (f3923 f3923)) (if (null? f3922) (cons e nil) (cons (car f3922) (append1 (cdr f3922) f3923)))))
# == eliminate-quote  ==>
# (closure (f3922 f3923) (e nil append1) (let ((f3922 f3922) (f3923 f3923)) (if (null? f3922) (cons e nil) (cons (car f3922) (append1 (cdr f3922) f3923)))))
# == eliminate-when/unless  ==>
# (closure (f3922 f3923) (e nil append1) (let ((f3922 f3922) (f3923 f3923)) (if (null? f3922) (cons e nil) (cons (car f3922) (append1 (cdr f3922) f3923)))))
# == eliminate-cond  ==>
# (closure (f3922 f3923) (e nil append1) (let ((f3922 f3922) (f3923 f3923)) (if (null? f3922) (cons e nil) (cons (car f3922) (append1 (cdr f3922) f3923)))))
# == external-symbols  ==>
# (closure (f3922 f3923) (e nil (primitive-ref append1)) (let ((f3922 f3922) (f3923 f3923)) (if (null? f3922) (cons e nil) (cons (car f3922) ((primitive-ref append1) (cdr f3922) f3923)))))
# emit-expr (closure (f3922 f3923) (e nil (primitive-ref append1)) (let ((f3922 f3922) (f3923 f3923)) (if (null? f3922) (cons e nil) (cons (car f3922) ((primitive-ref append1) (cdr f3922) f3923)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f3922 f3923) (e nil (primitive-ref append1)) (let ((f3922 f3922) (f3923 f3923)) (if (null? f3922) (cons e nil) (cons (car f3922) ((primitive-ref append1) (cdr f3922) f3923)))))
    movl $_L_32536, 0(%ebp)  # closure label
# WARNING: free var e not defined in the environmnet
# WARNING: free var nil not defined in the environmnet
# WARNING: free var (primitive-ref append1) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_32537            # jump around closure body
_L_32536:
# check argument count
    cmp $8,%eax
    je _L_32538
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_32538:
# emit-tail-expr
# si=-16
# env=((f3923 . -12) (f3922 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(let ((f3922 f3922) (f3923 f3923)) (if (null? f3922) (cons e nil) (cons (car f3922) ((primitive-ref append1) (cdr f3922) f3923))))
# emit-tail-let
#  si   = -16
#  env  = ((f3923 . -12) (f3922 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
#  bindings = ((f3922 f3922) (f3923 f3923))
#  body = (if (null? f3922) (cons e nil) (cons (car f3922) ((primitive-ref append1) (cdr f3922) f3923)))
# emit-expr f3922
# emit-variable-ref
# env=((f3923 . -12) (f3922 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f3922
    movl -8(%esp), %eax  # stack load f3922
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f3923
# emit-variable-ref
# env=((f3923 . -12) (f3922 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f3923
    movl -12(%esp), %eax  # stack load f3923
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f3923 . -20) (f3922 . -16) (f3923 . -12) (f3922 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(if (null? f3922) (cons e nil) (cons (car f3922) ((primitive-ref append1) (cdr f3922) f3923)))
# emit-expr (null? f3922)
# emit-expr f3922
# emit-variable-ref
# env=((f3923 . -20) (f3922 . -16) (f3923 . -12) (f3922 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f3922
    movl -16(%esp), %eax  # stack load f3922
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_32539
# emit-tail-expr
# si=-24
# env=((f3923 . -20) (f3922 . -16) (f3923 . -12) (f3922 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(cons e nil)
# tail primcall
# cons arg1=e arg2=nil
# emit-expr e
# emit-variable-ref
# env=((f3923 . -20) (f3922 . -16) (f3923 . -12) (f3922 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=e
    movl 2(%edi), %eax  # frame load e
# end emit-variable-ref
    movl %eax, -24(%esp)
# emit-expr nil
# emit-variable-ref
# env=((f3923 . -20) (f3922 . -16) (f3923 . -12) (f3922 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
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
    jmp _L_32540
_L_32539:
# emit-tail-expr
# si=-24
# env=((f3923 . -20) (f3922 . -16) (f3923 . -12) (f3922 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(cons (car f3922) ((primitive-ref append1) (cdr f3922) f3923))
# tail primcall
# cons arg1=(car f3922) arg2=((primitive-ref append1) (cdr f3922) f3923)
# emit-expr (car f3922)
# emit-expr f3922
# emit-variable-ref
# env=((f3923 . -20) (f3922 . -16) (f3923 . -12) (f3922 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f3922
    movl -16(%esp), %eax  # stack load f3922
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_32541
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $108,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32541:
    movl -1(%eax), %eax
    movl %eax, -24(%esp)
# emit-expr ((primitive-ref append1) (cdr f3922) f3923)
# funcall
#    si   =-28
#    env  = ((f3923 . -20) (f3922 . -16) (f3923 . -12) (f3922 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
#    expr = (funcall (primitive-ref append1) (cdr f3922) f3923)
# emit-expr (primitive-ref append1)
    .extern append1
    movl append1,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32542"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32542":
   movl %eax,  -36(%esp)  # stash funcall-oper in closure slot
# emit-expr (cdr f3922)
# emit-expr f3922
# emit-variable-ref
# env=((f3923 . -20) (f3922 . -16) (f3923 . -12) (f3922 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f3922
    movl -16(%esp), %eax  # stack load f3922
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_32543
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32543:
    movl 3(%eax), %eax
    mov %eax, -40(%esp)  # arg (cdr f3922)
# emit-expr f3923
# emit-variable-ref
# env=((f3923 . -20) (f3922 . -16) (f3923 . -12) (f3922 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f3923
    movl -20(%esp), %eax  # stack load f3923
# end emit-variable-ref
    mov %eax, -44(%esp)  # arg f3923
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
#return from tail (cons (car f3922) ((primitive-ref append1) (cdr f3922) f3923))
    ret
_L_32540:
    .align 4,0x90
_L_32537:
     movl %eax, append1
# == explicit-begins  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == eliminate-let*  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == uniquify-variables  ==>
# (lambda (f3924 f3925) (if (fx= f3925 0) (car f3924) (list-ref (cdr f3924) (fx- f3925 1))))
# == vectorize-letrec  ==>
# (lambda (f3924 f3925) (if (fx= f3925 0) (car f3924) (list-ref (cdr f3924) (fx- f3925 1))))
# == eliminate-set!  ==>
# (lambda (f3924 f3925) (let ((f3924 f3924) (f3925 f3925)) (if (fx= f3925 0) (car f3924) (list-ref (cdr f3924) (fx- f3925 1)))))
# == close-free-variables  ==>
# (closure (f3924 f3925) (list-ref) (let ((f3924 f3924) (f3925 f3925)) (if (fx= f3925 0) (car f3924) (list-ref (cdr f3924) (fx- f3925 1)))))
# == eliminate-quote  ==>
# (closure (f3924 f3925) (list-ref) (let ((f3924 f3924) (f3925 f3925)) (if (fx= f3925 0) (car f3924) (list-ref (cdr f3924) (fx- f3925 1)))))
# == eliminate-when/unless  ==>
# (closure (f3924 f3925) (list-ref) (let ((f3924 f3924) (f3925 f3925)) (if (fx= f3925 0) (car f3924) (list-ref (cdr f3924) (fx- f3925 1)))))
# == eliminate-cond  ==>
# (closure (f3924 f3925) (list-ref) (let ((f3924 f3924) (f3925 f3925)) (if (fx= f3925 0) (car f3924) (list-ref (cdr f3924) (fx- f3925 1)))))
# == external-symbols  ==>
# (closure (f3924 f3925) ((primitive-ref list-ref)) (let ((f3924 f3924) (f3925 f3925)) (if (fx= f3925 0) (car f3924) ((primitive-ref list-ref) (cdr f3924) (fx- f3925 1)))))
# emit-expr (closure (f3924 f3925) ((primitive-ref list-ref)) (let ((f3924 f3924) (f3925 f3925)) (if (fx= f3925 0) (car f3924) ((primitive-ref list-ref) (cdr f3924) (fx- f3925 1)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f3924 f3925) ((primitive-ref list-ref)) (let ((f3924 f3924) (f3925 f3925)) (if (fx= f3925 0) (car f3924) ((primitive-ref list-ref) (cdr f3924) (fx- f3925 1)))))
    movl $_L_32544, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_32545            # jump around closure body
_L_32544:
# check argument count
    cmp $8,%eax
    je _L_32546
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_32546:
# emit-tail-expr
# si=-16
# env=((f3925 . -12) (f3924 . -8) ((primitive-ref list-ref) . 4))
# expr=(let ((f3924 f3924) (f3925 f3925)) (if (fx= f3925 0) (car f3924) ((primitive-ref list-ref) (cdr f3924) (fx- f3925 1))))
# emit-tail-let
#  si   = -16
#  env  = ((f3925 . -12) (f3924 . -8) ((primitive-ref list-ref) . 4))
#  bindings = ((f3924 f3924) (f3925 f3925))
#  body = (if (fx= f3925 0) (car f3924) ((primitive-ref list-ref) (cdr f3924) (fx- f3925 1)))
# emit-expr f3924
# emit-variable-ref
# env=((f3925 . -12) (f3924 . -8) ((primitive-ref list-ref) . 4))
# var=f3924
    movl -8(%esp), %eax  # stack load f3924
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f3925
# emit-variable-ref
# env=((f3925 . -12) (f3924 . -8) ((primitive-ref list-ref) . 4))
# var=f3925
    movl -12(%esp), %eax  # stack load f3925
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f3925 . -20) (f3924 . -16) (f3925 . -12) (f3924 . -8) ((primitive-ref list-ref) . 4))
# expr=(if (fx= f3925 0) (car f3924) ((primitive-ref list-ref) (cdr f3924) (fx- f3925 1)))
# emit-expr (fx= f3925 0)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32549"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32549:
    movl %eax, -24(%esp)
# emit-expr f3925
# emit-variable-ref
# env=((f3925 . -20) (f3924 . -16) (f3925 . -12) (f3924 . -8) ((primitive-ref list-ref) . 4))
# var=f3925
    movl -20(%esp), %eax  # stack load f3925
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32550"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32550:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_32547
# emit-tail-expr
# si=-24
# env=((f3925 . -20) (f3924 . -16) (f3925 . -12) (f3924 . -8) ((primitive-ref list-ref) . 4))
# expr=(car f3924)
# tail primcall
# emit-expr f3924
# emit-variable-ref
# env=((f3925 . -20) (f3924 . -16) (f3925 . -12) (f3924 . -8) ((primitive-ref list-ref) . 4))
# var=f3924
    movl -16(%esp), %eax  # stack load f3924
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_32551
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $108,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32551:
    movl -1(%eax), %eax
#return from tail (car f3924)
    ret
    jmp _L_32548
_L_32547:
# emit-tail-expr
# si=-24
# env=((f3925 . -20) (f3924 . -16) (f3925 . -12) (f3924 . -8) ((primitive-ref list-ref) . 4))
# expr=((primitive-ref list-ref) (cdr f3924) (fx- f3925 1))
# emit-tail-funcall
#    si   =-24
#    env  = ((f3925 . -20) (f3924 . -16) (f3925 . -12) (f3924 . -8) ((primitive-ref list-ref) . 4))
#    expr = (funcall (primitive-ref list-ref) (cdr f3924) (fx- f3925 1))
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr (cdr f3924)
# emit-expr f3924
# emit-variable-ref
# env=((f3925 . -20) (f3924 . -16) (f3925 . -12) (f3924 . -8) ((primitive-ref list-ref) . 4))
# var=f3924
    movl -16(%esp), %eax  # stack load f3924
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_32552
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32552:
    movl 3(%eax), %eax
    mov %eax, -28(%esp)    # arg (cdr f3924)
# emit-expr (fx- f3925 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32553"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32553:
    movl %eax, -32(%esp)
# emit-expr f3925
# emit-variable-ref
# env=((f3925 . -20) (f3924 . -16) (f3925 . -12) (f3924 . -8) ((primitive-ref list-ref) . 4))
# var=f3925
    movl -20(%esp), %eax  # stack load f3925
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32554"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32554:
    subl -32(%esp), %eax
    mov %eax, -32(%esp)    # arg (fx- f3925 1)
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
_L_32548:
    .align 4,0x90
_L_32545:
     movl %eax, list$mref
# == explicit-begins  ==>
# (lambda (l) (if (null? l) 0 (fxadd1 (list-length (cdr l)))))
# == eliminate-let*  ==>
# (lambda (l) (if (null? l) 0 (fxadd1 (list-length (cdr l)))))
# == uniquify-variables  ==>
# (lambda (f3926) (if (null? f3926) 0 (fxadd1 (list-length (cdr f3926)))))
# == vectorize-letrec  ==>
# (lambda (f3926) (if (null? f3926) 0 (fxadd1 (list-length (cdr f3926)))))
# == eliminate-set!  ==>
# (lambda (f3926) (let ((f3926 f3926)) (if (null? f3926) 0 (fxadd1 (list-length (cdr f3926))))))
# == close-free-variables  ==>
# (closure (f3926) (list-length) (let ((f3926 f3926)) (if (null? f3926) 0 (fxadd1 (list-length (cdr f3926))))))
# == eliminate-quote  ==>
# (closure (f3926) (list-length) (let ((f3926 f3926)) (if (null? f3926) 0 (fxadd1 (list-length (cdr f3926))))))
# == eliminate-when/unless  ==>
# (closure (f3926) (list-length) (let ((f3926 f3926)) (if (null? f3926) 0 (fxadd1 (list-length (cdr f3926))))))
# == eliminate-cond  ==>
# (closure (f3926) (list-length) (let ((f3926 f3926)) (if (null? f3926) 0 (fxadd1 (list-length (cdr f3926))))))
# == external-symbols  ==>
# (closure (f3926) ((primitive-ref list-length)) (let ((f3926 f3926)) (if (null? f3926) 0 (fxadd1 ((primitive-ref list-length) (cdr f3926))))))
# emit-expr (closure (f3926) ((primitive-ref list-length)) (let ((f3926 f3926)) (if (null? f3926) 0 (fxadd1 ((primitive-ref list-length) (cdr f3926))))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f3926) ((primitive-ref list-length)) (let ((f3926 f3926)) (if (null? f3926) 0 (fxadd1 ((primitive-ref list-length) (cdr f3926))))))
    movl $_L_32555, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref list-length) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_32556            # jump around closure body
_L_32555:
# check argument count
    cmp $4,%eax
    je _L_32557
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_32557:
# emit-tail-expr
# si=-12
# env=((f3926 . -8) ((primitive-ref list-length) . 4))
# expr=(let ((f3926 f3926)) (if (null? f3926) 0 (fxadd1 ((primitive-ref list-length) (cdr f3926)))))
# emit-tail-let
#  si   = -12
#  env  = ((f3926 . -8) ((primitive-ref list-length) . 4))
#  bindings = ((f3926 f3926))
#  body = (if (null? f3926) 0 (fxadd1 ((primitive-ref list-length) (cdr f3926))))
# emit-expr f3926
# emit-variable-ref
# env=((f3926 . -8) ((primitive-ref list-length) . 4))
# var=f3926
    movl -8(%esp), %eax  # stack load f3926
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f3926 . -12) (f3926 . -8) ((primitive-ref list-length) . 4))
# expr=(if (null? f3926) 0 (fxadd1 ((primitive-ref list-length) (cdr f3926))))
# emit-expr (null? f3926)
# emit-expr f3926
# emit-variable-ref
# env=((f3926 . -12) (f3926 . -8) ((primitive-ref list-length) . 4))
# var=f3926
    movl -12(%esp), %eax  # stack load f3926
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_32558
# emit-tail-expr
# si=-16
# env=((f3926 . -12) (f3926 . -8) ((primitive-ref list-length) . 4))
# expr=0
    movl $0, %eax     # immed 0
    ret                  # immediate tail return
    jmp _L_32559
_L_32558:
# emit-tail-expr
# si=-16
# env=((f3926 . -12) (f3926 . -8) ((primitive-ref list-length) . 4))
# expr=(fxadd1 ((primitive-ref list-length) (cdr f3926)))
# tail primcall
# emit-expr ((primitive-ref list-length) (cdr f3926))
# funcall
#    si   =-16
#    env  = ((f3926 . -12) (f3926 . -8) ((primitive-ref list-length) . 4))
#    expr = (funcall (primitive-ref list-length) (cdr f3926))
# emit-expr (primitive-ref list-length)
    .extern list$mlength
    movl list$mlength,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32560"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32560":
   movl %eax,  -24(%esp)  # stash funcall-oper in closure slot
# emit-expr (cdr f3926)
# emit-expr f3926
# emit-variable-ref
# env=((f3926 . -12) (f3926 . -8) ((primitive-ref list-length) . 4))
# var=f3926
    movl -12(%esp), %eax  # stack load f3926
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_32561
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32561:
    movl 3(%eax), %eax
    mov %eax, -28(%esp)  # arg (cdr f3926)
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
    je "_L_32562"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32562:
     addl $4, %eax
#return from tail (fxadd1 ((primitive-ref list-length) (cdr f3926)))
    ret
_L_32559:
    .align 4,0x90
_L_32556:
     movl %eax, list$mlength
# == explicit-begins  ==>
# (letrec ((fill-vector (lambda (v k args) (if (null? args) v (begin (vector-set! v k (car args)) (fill-vector v (fxadd1 k) (cdr args))))))) (lambda args (let ((v (make-vector (list-length args)))) (fill-vector v 0 args))))
# == eliminate-let*  ==>
# (letrec ((fill-vector (lambda (v k args) (if (null? args) v (begin (vector-set! v k (car args)) (fill-vector v (fxadd1 k) (cdr args))))))) (lambda args (let ((v (make-vector (list-length args)))) (fill-vector v 0 args))))
# == uniquify-variables  ==>
# (letrec ((f3927 (lambda (f3931 f3932 f3933) (if (null? f3933) f3931 (begin (vector-set! f3931 f3932 (car f3933)) (f3927 f3931 (fxadd1 f3932) (cdr f3933))))))) (lambda f3937 (let ((f3939 (make-vector (list-length f3937)))) (f3927 f3939 0 f3937))))
# == vectorize-letrec  ==>
# (let ((f3927 (make-vector 1))) (begin (begin (vector-set! f3927 0 (lambda (f3931 f3932 f3933) (if (null? f3933) f3931 (begin (vector-set! f3931 f3932 (car f3933)) ((vector-ref f3927 0) f3931 (fxadd1 f3932) (cdr f3933))))))) (lambda f3937 (let ((f3939 (make-vector (list-length f3937)))) ((vector-ref f3927 0) f3939 0 f3937)))))
# == eliminate-set!  ==>
# (let ((f3927 (make-vector 1))) (begin (begin (vector-set! f3927 0 (lambda (f3931 f3932 f3933) (let ((f3931 f3931) (f3932 f3932) (f3933 f3933)) (if (null? f3933) f3931 (begin (vector-set! f3931 f3932 (car f3933)) ((vector-ref f3927 0) f3931 (fxadd1 f3932) (cdr f3933)))))))) (lambda f3937 (let () (let ((f3939 (make-vector (list-length f3937)))) ((vector-ref f3927 0) f3939 0 f3937))))))
# == close-free-variables  ==>
# (let ((f3927 (make-vector 1))) (begin (begin (vector-set! f3927 0 (closure (f3931 f3932 f3933) (f3927) (let ((f3931 f3931) (f3932 f3932) (f3933 f3933)) (if (null? f3933) f3931 (begin (vector-set! f3931 f3932 (car f3933)) ((vector-ref f3927 0) f3931 (fxadd1 f3932) (cdr f3933)))))))) (closure f3937 (f3927) (let () (let ((f3939 (make-vector (list-length f3937)))) ((vector-ref f3927 0) f3939 0 f3937))))))
# == eliminate-quote  ==>
# (let ((f3927 (make-vector 1))) (begin (begin (vector-set! f3927 0 (closure (f3931 f3932 f3933) (f3927) (let ((f3931 f3931) (f3932 f3932) (f3933 f3933)) (if (null? f3933) f3931 (begin (vector-set! f3931 f3932 (car f3933)) ((vector-ref f3927 0) f3931 (fxadd1 f3932) (cdr f3933)))))))) (closure f3937 (f3927) (let () (let ((f3939 (make-vector (list-length f3937)))) ((vector-ref f3927 0) f3939 0 f3937))))))
# == eliminate-when/unless  ==>
# (let ((f3927 (make-vector 1))) (begin (begin (vector-set! f3927 0 (closure (f3931 f3932 f3933) (f3927) (let ((f3931 f3931) (f3932 f3932) (f3933 f3933)) (if (null? f3933) f3931 (begin (vector-set! f3931 f3932 (car f3933)) ((vector-ref f3927 0) f3931 (fxadd1 f3932) (cdr f3933)))))))) (closure f3937 (f3927) (let () (let ((f3939 (make-vector (list-length f3937)))) ((vector-ref f3927 0) f3939 0 f3937))))))
# == eliminate-cond  ==>
# (let ((f3927 (make-vector 1))) (begin (begin (vector-set! f3927 0 (closure (f3931 f3932 f3933) (f3927) (let ((f3931 f3931) (f3932 f3932) (f3933 f3933)) (if (null? f3933) f3931 (begin (vector-set! f3931 f3932 (car f3933)) ((vector-ref f3927 0) f3931 (fxadd1 f3932) (cdr f3933)))))))) (closure f3937 (f3927) (let () (let ((f3939 (make-vector (list-length f3937)))) ((vector-ref f3927 0) f3939 0 f3937))))))
# == external-symbols  ==>
# (let ((f3927 (make-vector 1))) (begin (begin (vector-set! f3927 0 (closure (f3931 f3932 f3933) (f3927) (let ((f3931 f3931) (f3932 f3932) (f3933 f3933)) (if (null? f3933) f3931 (begin (vector-set! f3931 f3932 (car f3933)) ((vector-ref f3927 0) f3931 (fxadd1 f3932) (cdr f3933)))))))) (closure f3937 (f3927) (let () (let ((f3939 (make-vector ((primitive-ref list-length) f3937)))) ((vector-ref f3927 0) f3939 0 f3937))))))
# emit-expr (let ((f3927 (make-vector 1))) (begin (begin (vector-set! f3927 0 (closure (f3931 f3932 f3933) (f3927) (let ((f3931 f3931) (f3932 f3932) (f3933 f3933)) (if (null? f3933) f3931 (begin (vector-set! f3931 f3932 (car f3933)) ((vector-ref f3927 0) f3931 (fxadd1 f3932) (cdr f3933)))))))) (closure f3937 (f3927) (let () (let ((f3939 (make-vector ((primitive-ref list-length) f3937)))) ((vector-ref f3927 0) f3939 0 f3937))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f3927 (make-vector 1)))
#  body = (begin (begin (vector-set! f3927 0 (closure (f3931 f3932 f3933) (f3927) (let ((f3931 f3931) (f3932 f3932) (f3933 f3933)) (if (null? f3933) f3931 (begin (vector-set! f3931 f3932 (car f3933)) ((vector-ref f3927 0) f3931 (fxadd1 f3932) (cdr f3933)))))))) (closure f3937 (f3927) (let () (let ((f3939 (make-vector ((primitive-ref list-length) f3937)))) ((vector-ref f3927 0) f3939 0 f3937)))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32563"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32563:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_32564
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32564:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f3927 0 (closure (f3931 f3932 f3933) (f3927) (let ((f3931 f3931) (f3932 f3932) (f3933 f3933)) (if (null? f3933) f3931 (begin (vector-set! f3931 f3932 (car f3933)) ((vector-ref f3927 0) f3931 (fxadd1 f3932) (cdr f3933)))))))) (closure f3937 (f3927) (let () (let ((f3939 (make-vector ((primitive-ref list-length) f3937)))) ((vector-ref f3927 0) f3939 0 f3937)))))
# emit-begin
#   expr=(begin (begin (vector-set! f3927 0 (closure (f3931 f3932 f3933) (f3927) (let ((f3931 f3931) (f3932 f3932) (f3933 f3933)) (if (null? f3933) f3931 (begin (vector-set! f3931 f3932 (car f3933)) ((vector-ref f3927 0) f3931 (fxadd1 f3932) (cdr f3933)))))))) (closure f3937 (f3927) (let () (let ((f3939 (make-vector ((primitive-ref list-length) f3937)))) ((vector-ref f3927 0) f3939 0 f3937)))))
#   env=((f3927 . 0))
# emit-expr (begin (vector-set! f3927 0 (closure (f3931 f3932 f3933) (f3927) (let ((f3931 f3931) (f3932 f3932) (f3933 f3933)) (if (null? f3933) f3931 (begin (vector-set! f3931 f3932 (car f3933)) ((vector-ref f3927 0) f3931 (fxadd1 f3932) (cdr f3933))))))))
# emit-begin
#   expr=(begin (vector-set! f3927 0 (closure (f3931 f3932 f3933) (f3927) (let ((f3931 f3931) (f3932 f3932) (f3933 f3933)) (if (null? f3933) f3931 (begin (vector-set! f3931 f3932 (car f3933)) ((vector-ref f3927 0) f3931 (fxadd1 f3932) (cdr f3933))))))))
#   env=((f3927 . 0))
# emit-expr (vector-set! f3927 0 (closure (f3931 f3932 f3933) (f3927) (let ((f3931 f3931) (f3932 f3932) (f3933 f3933)) (if (null? f3933) f3931 (begin (vector-set! f3931 f3932 (car f3933)) ((vector-ref f3927 0) f3931 (fxadd1 f3932) (cdr f3933)))))))
# emit-expr f3927
# emit-variable-ref
# env=((f3927 . 0))
# var=f3927
    movl 0(%esp), %eax  # stack load f3927
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32565
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32565:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32566"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32566:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32568
    cmp  $0,%eax
    jge _L_32567
_L_32568:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32567:
    movl %eax, -8(%esp)
# emit-expr (closure (f3931 f3932 f3933) (f3927) (let ((f3931 f3931) (f3932 f3932) (f3933 f3933)) (if (null? f3933) f3931 (begin (vector-set! f3931 f3932 (car f3933)) ((vector-ref f3927 0) f3931 (fxadd1 f3932) (cdr f3933))))))
# emit-closure
# si = -12
# env = ((f3927 . 0))
# expr = (closure (f3931 f3932 f3933) (f3927) (let ((f3931 f3931) (f3932 f3932) (f3933 f3933)) (if (null? f3933) f3931 (begin (vector-set! f3931 f3932 (car f3933)) ((vector-ref f3927 0) f3931 (fxadd1 f3932) (cdr f3933))))))
    movl $_L_32569, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f3927 . 0))
# var=f3927
    movl 0(%esp), %eax  # stack load f3927
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f3927
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_32570            # jump around closure body
_L_32569:
# check argument count
    cmp $12,%eax
    je _L_32571
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_32571:
# emit-tail-expr
# si=-20
# env=((f3933 . -16) (f3932 . -12) (f3931 . -8) (f3927 . 4) (f3927 . 0))
# expr=(let ((f3931 f3931) (f3932 f3932) (f3933 f3933)) (if (null? f3933) f3931 (begin (vector-set! f3931 f3932 (car f3933)) ((vector-ref f3927 0) f3931 (fxadd1 f3932) (cdr f3933)))))
# emit-tail-let
#  si   = -20
#  env  = ((f3933 . -16) (f3932 . -12) (f3931 . -8) (f3927 . 4) (f3927 . 0))
#  bindings = ((f3931 f3931) (f3932 f3932) (f3933 f3933))
#  body = (if (null? f3933) f3931 (begin (vector-set! f3931 f3932 (car f3933)) ((vector-ref f3927 0) f3931 (fxadd1 f3932) (cdr f3933))))
# emit-expr f3931
# emit-variable-ref
# env=((f3933 . -16) (f3932 . -12) (f3931 . -8) (f3927 . 4) (f3927 . 0))
# var=f3931
    movl -8(%esp), %eax  # stack load f3931
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr f3932
# emit-variable-ref
# env=((f3933 . -16) (f3932 . -12) (f3931 . -8) (f3927 . 4) (f3927 . 0))
# var=f3932
    movl -12(%esp), %eax  # stack load f3932
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f3933
# emit-variable-ref
# env=((f3933 . -16) (f3932 . -12) (f3931 . -8) (f3927 . 4) (f3927 . 0))
# var=f3933
    movl -16(%esp), %eax  # stack load f3933
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((f3933 . -28) (f3932 . -24) (f3931 . -20) (f3933 . -16) (f3932 . -12) (f3931 . -8) (f3927 . 4) (f3927 . 0))
# expr=(if (null? f3933) f3931 (begin (vector-set! f3931 f3932 (car f3933)) ((vector-ref f3927 0) f3931 (fxadd1 f3932) (cdr f3933))))
# emit-expr (null? f3933)
# emit-expr f3933
# emit-variable-ref
# env=((f3933 . -28) (f3932 . -24) (f3931 . -20) (f3933 . -16) (f3932 . -12) (f3931 . -8) (f3927 . 4) (f3927 . 0))
# var=f3933
    movl -28(%esp), %eax  # stack load f3933
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_32572
# emit-tail-expr
# si=-32
# env=((f3933 . -28) (f3932 . -24) (f3931 . -20) (f3933 . -16) (f3932 . -12) (f3931 . -8) (f3927 . 4) (f3927 . 0))
# expr=f3931
# emit-tail-variable-ref
# emit-variable-ref
# env=((f3933 . -28) (f3932 . -24) (f3931 . -20) (f3933 . -16) (f3932 . -12) (f3931 . -8) (f3927 . 4) (f3927 . 0))
# var=f3931
    movl -20(%esp), %eax  # stack load f3931
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    jmp _L_32573
_L_32572:
# emit-tail-expr
# si=-32
# env=((f3933 . -28) (f3932 . -24) (f3931 . -20) (f3933 . -16) (f3932 . -12) (f3931 . -8) (f3927 . 4) (f3927 . 0))
# expr=(begin (vector-set! f3931 f3932 (car f3933)) ((vector-ref f3927 0) f3931 (fxadd1 f3932) (cdr f3933)))
# tail-begin (begin (vector-set! f3931 f3932 (car f3933)) ((vector-ref f3927 0) f3931 (fxadd1 f3932) (cdr f3933)))
#   env=((f3933 . -28) (f3932 . -24) (f3931 . -20) (f3933 . -16) (f3932 . -12) (f3931 . -8) (f3927 . 4) (f3927 . 0))
# emit-expr (vector-set! f3931 f3932 (car f3933))
# emit-expr f3931
# emit-variable-ref
# env=((f3933 . -28) (f3932 . -24) (f3931 . -20) (f3933 . -16) (f3932 . -12) (f3931 . -8) (f3927 . 4) (f3927 . 0))
# var=f3931
    movl -20(%esp), %eax  # stack load f3931
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32574
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32574:
    movl %eax, -32(%esp)
# emit-expr f3932
# emit-variable-ref
# env=((f3933 . -28) (f3932 . -24) (f3931 . -20) (f3933 . -16) (f3932 . -12) (f3931 . -8) (f3927 . 4) (f3927 . 0))
# var=f3932
    movl -24(%esp), %eax  # stack load f3932
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32575"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32575:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32577
    cmp  $0,%eax
    jge _L_32576
_L_32577:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32576:
    movl %eax, -36(%esp)
# emit-expr (car f3933)
# emit-expr f3933
# emit-variable-ref
# env=((f3933 . -28) (f3932 . -24) (f3931 . -20) (f3933 . -16) (f3932 . -12) (f3931 . -8) (f3927 . 4) (f3927 . 0))
# var=f3933
    movl -28(%esp), %eax  # stack load f3933
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_32578
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $108,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32578:
    movl -1(%eax), %eax
    movl -32(%esp), %ebx
    movl -36(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-tail-expr
# si=-32
# env=((f3933 . -28) (f3932 . -24) (f3931 . -20) (f3933 . -16) (f3932 . -12) (f3931 . -8) (f3927 . 4) (f3927 . 0))
# expr=(begin ((vector-ref f3927 0) f3931 (fxadd1 f3932) (cdr f3933)))
# tail-begin (begin ((vector-ref f3927 0) f3931 (fxadd1 f3932) (cdr f3933)))
#   env=((f3933 . -28) (f3932 . -24) (f3931 . -20) (f3933 . -16) (f3932 . -12) (f3931 . -8) (f3927 . 4) (f3927 . 0))
# emit-tail-expr
# si=-32
# env=((f3933 . -28) (f3932 . -24) (f3931 . -20) (f3933 . -16) (f3932 . -12) (f3931 . -8) (f3927 . 4) (f3927 . 0))
# expr=((vector-ref f3927 0) f3931 (fxadd1 f3932) (cdr f3933))
# emit-tail-funcall
#    si   =-32
#    env  = ((f3933 . -28) (f3932 . -24) (f3931 . -20) (f3933 . -16) (f3932 . -12) (f3931 . -8) (f3927 . 4) (f3927 . 0))
#    expr = (funcall (vector-ref f3927 0) f3931 (fxadd1 f3932) (cdr f3933))
# emit-expr (vector-ref f3927 0)
# emit-expr f3927
# emit-variable-ref
# env=((f3933 . -28) (f3932 . -24) (f3931 . -20) (f3933 . -16) (f3932 . -12) (f3931 . -8) (f3927 . 4) (f3927 . 0))
# var=f3927
    movl 2(%edi), %eax  # frame load f3927
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32579
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32579:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32580"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32580:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32582
    cmp  $0,%eax
    jge _L_32581
_L_32582:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32581:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -32(%esp)  # stash funcall-oper in next closure slot
# emit-expr f3931
# emit-variable-ref
# env=((f3933 . -28) (f3932 . -24) (f3931 . -20) (f3933 . -16) (f3932 . -12) (f3931 . -8) (f3927 . 4) (f3927 . 0))
# var=f3931
    movl -20(%esp), %eax  # stack load f3931
# end emit-variable-ref
    mov %eax, -36(%esp)    # arg f3931
# emit-expr (fxadd1 f3932)
# emit-expr f3932
# emit-variable-ref
# env=((f3933 . -28) (f3932 . -24) (f3931 . -20) (f3933 . -16) (f3932 . -12) (f3931 . -8) (f3927 . 4) (f3927 . 0))
# var=f3932
    movl -24(%esp), %eax  # stack load f3932
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32583"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32583:
     addl $4, %eax
    mov %eax, -40(%esp)    # arg (fxadd1 f3932)
# emit-expr (cdr f3933)
# emit-expr f3933
# emit-variable-ref
# env=((f3933 . -28) (f3932 . -24) (f3931 . -20) (f3933 . -16) (f3932 . -12) (f3931 . -8) (f3927 . 4) (f3927 . 0))
# var=f3933
    movl -28(%esp), %eax  # stack load f3933
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_32584
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32584:
    movl 3(%eax), %eax
    mov %eax, -44(%esp)    # arg (cdr f3933)
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
_L_32573:
    .align 4,0x90
_L_32570:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f3927 . 0))
# emit-expr (begin (closure f3937 (f3927) (let () (let ((f3939 (make-vector ((primitive-ref list-length) f3937)))) ((vector-ref f3927 0) f3939 0 f3937)))))
# emit-begin
#   expr=(begin (closure f3937 (f3927) (let () (let ((f3939 (make-vector ((primitive-ref list-length) f3937)))) ((vector-ref f3927 0) f3939 0 f3937)))))
#   env=((f3927 . 0))
# emit-expr (closure f3937 (f3927) (let () (let ((f3939 (make-vector ((primitive-ref list-length) f3937)))) ((vector-ref f3927 0) f3939 0 f3937))))
# emit-closure
# si = -4
# env = ((f3927 . 0))
# expr = (closure f3937 (f3927) (let () (let ((f3939 (make-vector ((primitive-ref list-length) f3937)))) ((vector-ref f3927 0) f3939 0 f3937))))
    movl $_L_32585, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f3927 . 0))
# var=f3927
    movl 0(%esp), %eax  # stack load f3927
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f3927
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_32586            # jump around closure body
_L_32585:
# check argument count
    cmp $0,%eax
    jge _L_32587
# invoke error handler eh_argcount_min
    .extern eh$uargcount$umin
    movl eh$uargcount$umin, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_32587:
# emit-build-varargs-list
    movl $63, %esi       # args <- () 
    lea -4(%esp),%edi    # edi <- esp-4
    subl %eax, %edi      # edi <- esp-4-eax    addr of arg[K+N] on stack
_L_32589:
    lea -4(%esp),%ebx    # addr of arg[K] on stack
    cmp %edi, %ebx       # while edi <> esp+(si+4)
    je _L_32588
    movl (%edi),%ebx     # arg i -> car
    movl %ebx, 0(%ebp)
    movl %esi, 4(%ebp)  # esi -> cdr
    movl %ebp, %esi
    addl $1, %esi       # tag as pair
    addl $8,%ebp         # bump heap ptr
    addl $4,%edi         # move to next previous arg from the end
    jmp _L_32589
_L_32588:
    movl %esi, -8(%esp)  # set args
# emit-tail-expr
# si=-12
# env=((f3937 . -8) (f3927 . 4) (f3927 . 0))
# expr=(let () (let ((f3939 (make-vector ((primitive-ref list-length) f3937)))) ((vector-ref f3927 0) f3939 0 f3937)))
# emit-tail-let
#  si   = -12
#  env  = ((f3937 . -8) (f3927 . 4) (f3927 . 0))
#  bindings = ()
#  body = (let ((f3939 (make-vector ((primitive-ref list-length) f3937)))) ((vector-ref f3927 0) f3939 0 f3937))
# emit-tail-expr
# si=-12
# env=((f3937 . -8) (f3927 . 4) (f3927 . 0))
# expr=(let ((f3939 (make-vector ((primitive-ref list-length) f3937)))) ((vector-ref f3927 0) f3939 0 f3937))
# emit-tail-let
#  si   = -12
#  env  = ((f3937 . -8) (f3927 . 4) (f3927 . 0))
#  bindings = ((f3939 (make-vector ((primitive-ref list-length) f3937))))
#  body = ((vector-ref f3927 0) f3939 0 f3937)
# emit-expr (make-vector ((primitive-ref list-length) f3937))
# make-vector ((primitive-ref list-length) f3937)
# emit-expr ((primitive-ref list-length) f3937)
# funcall
#    si   =-12
#    env  = ((f3937 . -8) (f3927 . 4) (f3927 . 0))
#    expr = (funcall (primitive-ref list-length) f3937)
# emit-expr (primitive-ref list-length)
    .extern list$mlength
    movl list$mlength,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32590"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32590":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr f3937
# emit-variable-ref
# env=((f3937 . -8) (f3927 . 4) (f3927 . 0))
# var=f3937
    movl -8(%esp), %eax  # stack load f3937
# end emit-variable-ref
    mov %eax, -24(%esp)  # arg f3937
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
    je "_L_32591"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32591:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_32592
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32592:
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
# env=((f3939 . -12) (f3937 . -8) (f3927 . 4) (f3927 . 0))
# expr=((vector-ref f3927 0) f3939 0 f3937)
# emit-tail-funcall
#    si   =-16
#    env  = ((f3939 . -12) (f3937 . -8) (f3927 . 4) (f3927 . 0))
#    expr = (funcall (vector-ref f3927 0) f3939 0 f3937)
# emit-expr (vector-ref f3927 0)
# emit-expr f3927
# emit-variable-ref
# env=((f3939 . -12) (f3937 . -8) (f3927 . 4) (f3927 . 0))
# var=f3927
    movl 2(%edi), %eax  # frame load f3927
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32593
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32593:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32594"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32594:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32596
    cmp  $0,%eax
    jge _L_32595
_L_32596:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32595:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f3939
# emit-variable-ref
# env=((f3939 . -12) (f3937 . -8) (f3927 . 4) (f3927 . 0))
# var=f3939
    movl -12(%esp), %eax  # stack load f3939
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f3939
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -24(%esp)    # arg 0
# emit-expr f3937
# emit-variable-ref
# env=((f3939 . -12) (f3937 . -8) (f3927 . 4) (f3927 . 0))
# var=f3937
    movl -8(%esp), %eax  # stack load f3937
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f3937
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
_L_32586:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f3927 . 0))
     movl %eax, vector
# == explicit-begins  ==>
# (letrec ((fill-string (lambda (s k args) (if (null? args) s (begin (string-set! s k (car args)) (fill-string s (fxadd1 k) (cdr args))))))) (lambda args (let ((s (make-string (list-length args)))) (fill-string s 0 args))))
# == eliminate-let*  ==>
# (letrec ((fill-string (lambda (s k args) (if (null? args) s (begin (string-set! s k (car args)) (fill-string s (fxadd1 k) (cdr args))))))) (lambda args (let ((s (make-string (list-length args)))) (fill-string s 0 args))))
# == uniquify-variables  ==>
# (letrec ((f3940 (lambda (f3944 f3945 f3946) (if (null? f3946) f3944 (begin (string-set! f3944 f3945 (car f3946)) (f3940 f3944 (fxadd1 f3945) (cdr f3946))))))) (lambda f3950 (let ((f3952 (make-string (list-length f3950)))) (f3940 f3952 0 f3950))))
# == vectorize-letrec  ==>
# (let ((f3940 (make-vector 1))) (begin (begin (vector-set! f3940 0 (lambda (f3944 f3945 f3946) (if (null? f3946) f3944 (begin (string-set! f3944 f3945 (car f3946)) ((vector-ref f3940 0) f3944 (fxadd1 f3945) (cdr f3946))))))) (lambda f3950 (let ((f3952 (make-string (list-length f3950)))) ((vector-ref f3940 0) f3952 0 f3950)))))
# == eliminate-set!  ==>
# (let ((f3940 (make-vector 1))) (begin (begin (vector-set! f3940 0 (lambda (f3944 f3945 f3946) (let ((f3944 f3944) (f3945 f3945) (f3946 f3946)) (if (null? f3946) f3944 (begin (string-set! f3944 f3945 (car f3946)) ((vector-ref f3940 0) f3944 (fxadd1 f3945) (cdr f3946)))))))) (lambda f3950 (let () (let ((f3952 (make-string (list-length f3950)))) ((vector-ref f3940 0) f3952 0 f3950))))))
# == close-free-variables  ==>
# (let ((f3940 (make-vector 1))) (begin (begin (vector-set! f3940 0 (closure (f3944 f3945 f3946) (f3940) (let ((f3944 f3944) (f3945 f3945) (f3946 f3946)) (if (null? f3946) f3944 (begin (string-set! f3944 f3945 (car f3946)) ((vector-ref f3940 0) f3944 (fxadd1 f3945) (cdr f3946)))))))) (closure f3950 (f3940) (let () (let ((f3952 (make-string (list-length f3950)))) ((vector-ref f3940 0) f3952 0 f3950))))))
# == eliminate-quote  ==>
# (let ((f3940 (make-vector 1))) (begin (begin (vector-set! f3940 0 (closure (f3944 f3945 f3946) (f3940) (let ((f3944 f3944) (f3945 f3945) (f3946 f3946)) (if (null? f3946) f3944 (begin (string-set! f3944 f3945 (car f3946)) ((vector-ref f3940 0) f3944 (fxadd1 f3945) (cdr f3946)))))))) (closure f3950 (f3940) (let () (let ((f3952 (make-string (list-length f3950)))) ((vector-ref f3940 0) f3952 0 f3950))))))
# == eliminate-when/unless  ==>
# (let ((f3940 (make-vector 1))) (begin (begin (vector-set! f3940 0 (closure (f3944 f3945 f3946) (f3940) (let ((f3944 f3944) (f3945 f3945) (f3946 f3946)) (if (null? f3946) f3944 (begin (string-set! f3944 f3945 (car f3946)) ((vector-ref f3940 0) f3944 (fxadd1 f3945) (cdr f3946)))))))) (closure f3950 (f3940) (let () (let ((f3952 (make-string (list-length f3950)))) ((vector-ref f3940 0) f3952 0 f3950))))))
# == eliminate-cond  ==>
# (let ((f3940 (make-vector 1))) (begin (begin (vector-set! f3940 0 (closure (f3944 f3945 f3946) (f3940) (let ((f3944 f3944) (f3945 f3945) (f3946 f3946)) (if (null? f3946) f3944 (begin (string-set! f3944 f3945 (car f3946)) ((vector-ref f3940 0) f3944 (fxadd1 f3945) (cdr f3946)))))))) (closure f3950 (f3940) (let () (let ((f3952 (make-string (list-length f3950)))) ((vector-ref f3940 0) f3952 0 f3950))))))
# == external-symbols  ==>
# (let ((f3940 (make-vector 1))) (begin (begin (vector-set! f3940 0 (closure (f3944 f3945 f3946) (f3940) (let ((f3944 f3944) (f3945 f3945) (f3946 f3946)) (if (null? f3946) f3944 (begin (string-set! f3944 f3945 (car f3946)) ((vector-ref f3940 0) f3944 (fxadd1 f3945) (cdr f3946)))))))) (closure f3950 (f3940) (let () (let ((f3952 (make-string ((primitive-ref list-length) f3950)))) ((vector-ref f3940 0) f3952 0 f3950))))))
# emit-expr (let ((f3940 (make-vector 1))) (begin (begin (vector-set! f3940 0 (closure (f3944 f3945 f3946) (f3940) (let ((f3944 f3944) (f3945 f3945) (f3946 f3946)) (if (null? f3946) f3944 (begin (string-set! f3944 f3945 (car f3946)) ((vector-ref f3940 0) f3944 (fxadd1 f3945) (cdr f3946)))))))) (closure f3950 (f3940) (let () (let ((f3952 (make-string ((primitive-ref list-length) f3950)))) ((vector-ref f3940 0) f3952 0 f3950))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f3940 (make-vector 1)))
#  body = (begin (begin (vector-set! f3940 0 (closure (f3944 f3945 f3946) (f3940) (let ((f3944 f3944) (f3945 f3945) (f3946 f3946)) (if (null? f3946) f3944 (begin (string-set! f3944 f3945 (car f3946)) ((vector-ref f3940 0) f3944 (fxadd1 f3945) (cdr f3946)))))))) (closure f3950 (f3940) (let () (let ((f3952 (make-string ((primitive-ref list-length) f3950)))) ((vector-ref f3940 0) f3952 0 f3950)))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32597"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32597:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_32598
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32598:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f3940 0 (closure (f3944 f3945 f3946) (f3940) (let ((f3944 f3944) (f3945 f3945) (f3946 f3946)) (if (null? f3946) f3944 (begin (string-set! f3944 f3945 (car f3946)) ((vector-ref f3940 0) f3944 (fxadd1 f3945) (cdr f3946)))))))) (closure f3950 (f3940) (let () (let ((f3952 (make-string ((primitive-ref list-length) f3950)))) ((vector-ref f3940 0) f3952 0 f3950)))))
# emit-begin
#   expr=(begin (begin (vector-set! f3940 0 (closure (f3944 f3945 f3946) (f3940) (let ((f3944 f3944) (f3945 f3945) (f3946 f3946)) (if (null? f3946) f3944 (begin (string-set! f3944 f3945 (car f3946)) ((vector-ref f3940 0) f3944 (fxadd1 f3945) (cdr f3946)))))))) (closure f3950 (f3940) (let () (let ((f3952 (make-string ((primitive-ref list-length) f3950)))) ((vector-ref f3940 0) f3952 0 f3950)))))
#   env=((f3940 . 0))
# emit-expr (begin (vector-set! f3940 0 (closure (f3944 f3945 f3946) (f3940) (let ((f3944 f3944) (f3945 f3945) (f3946 f3946)) (if (null? f3946) f3944 (begin (string-set! f3944 f3945 (car f3946)) ((vector-ref f3940 0) f3944 (fxadd1 f3945) (cdr f3946))))))))
# emit-begin
#   expr=(begin (vector-set! f3940 0 (closure (f3944 f3945 f3946) (f3940) (let ((f3944 f3944) (f3945 f3945) (f3946 f3946)) (if (null? f3946) f3944 (begin (string-set! f3944 f3945 (car f3946)) ((vector-ref f3940 0) f3944 (fxadd1 f3945) (cdr f3946))))))))
#   env=((f3940 . 0))
# emit-expr (vector-set! f3940 0 (closure (f3944 f3945 f3946) (f3940) (let ((f3944 f3944) (f3945 f3945) (f3946 f3946)) (if (null? f3946) f3944 (begin (string-set! f3944 f3945 (car f3946)) ((vector-ref f3940 0) f3944 (fxadd1 f3945) (cdr f3946)))))))
# emit-expr f3940
# emit-variable-ref
# env=((f3940 . 0))
# var=f3940
    movl 0(%esp), %eax  # stack load f3940
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32599
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32599:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32600"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32600:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32602
    cmp  $0,%eax
    jge _L_32601
_L_32602:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32601:
    movl %eax, -8(%esp)
# emit-expr (closure (f3944 f3945 f3946) (f3940) (let ((f3944 f3944) (f3945 f3945) (f3946 f3946)) (if (null? f3946) f3944 (begin (string-set! f3944 f3945 (car f3946)) ((vector-ref f3940 0) f3944 (fxadd1 f3945) (cdr f3946))))))
# emit-closure
# si = -12
# env = ((f3940 . 0))
# expr = (closure (f3944 f3945 f3946) (f3940) (let ((f3944 f3944) (f3945 f3945) (f3946 f3946)) (if (null? f3946) f3944 (begin (string-set! f3944 f3945 (car f3946)) ((vector-ref f3940 0) f3944 (fxadd1 f3945) (cdr f3946))))))
    movl $_L_32603, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f3940 . 0))
# var=f3940
    movl 0(%esp), %eax  # stack load f3940
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f3940
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_32604            # jump around closure body
_L_32603:
# check argument count
    cmp $12,%eax
    je _L_32605
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_32605:
# emit-tail-expr
# si=-20
# env=((f3946 . -16) (f3945 . -12) (f3944 . -8) (f3940 . 4) (f3940 . 0))
# expr=(let ((f3944 f3944) (f3945 f3945) (f3946 f3946)) (if (null? f3946) f3944 (begin (string-set! f3944 f3945 (car f3946)) ((vector-ref f3940 0) f3944 (fxadd1 f3945) (cdr f3946)))))
# emit-tail-let
#  si   = -20
#  env  = ((f3946 . -16) (f3945 . -12) (f3944 . -8) (f3940 . 4) (f3940 . 0))
#  bindings = ((f3944 f3944) (f3945 f3945) (f3946 f3946))
#  body = (if (null? f3946) f3944 (begin (string-set! f3944 f3945 (car f3946)) ((vector-ref f3940 0) f3944 (fxadd1 f3945) (cdr f3946))))
# emit-expr f3944
# emit-variable-ref
# env=((f3946 . -16) (f3945 . -12) (f3944 . -8) (f3940 . 4) (f3940 . 0))
# var=f3944
    movl -8(%esp), %eax  # stack load f3944
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr f3945
# emit-variable-ref
# env=((f3946 . -16) (f3945 . -12) (f3944 . -8) (f3940 . 4) (f3940 . 0))
# var=f3945
    movl -12(%esp), %eax  # stack load f3945
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f3946
# emit-variable-ref
# env=((f3946 . -16) (f3945 . -12) (f3944 . -8) (f3940 . 4) (f3940 . 0))
# var=f3946
    movl -16(%esp), %eax  # stack load f3946
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((f3946 . -28) (f3945 . -24) (f3944 . -20) (f3946 . -16) (f3945 . -12) (f3944 . -8) (f3940 . 4) (f3940 . 0))
# expr=(if (null? f3946) f3944 (begin (string-set! f3944 f3945 (car f3946)) ((vector-ref f3940 0) f3944 (fxadd1 f3945) (cdr f3946))))
# emit-expr (null? f3946)
# emit-expr f3946
# emit-variable-ref
# env=((f3946 . -28) (f3945 . -24) (f3944 . -20) (f3946 . -16) (f3945 . -12) (f3944 . -8) (f3940 . 4) (f3940 . 0))
# var=f3946
    movl -28(%esp), %eax  # stack load f3946
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_32606
# emit-tail-expr
# si=-32
# env=((f3946 . -28) (f3945 . -24) (f3944 . -20) (f3946 . -16) (f3945 . -12) (f3944 . -8) (f3940 . 4) (f3940 . 0))
# expr=f3944
# emit-tail-variable-ref
# emit-variable-ref
# env=((f3946 . -28) (f3945 . -24) (f3944 . -20) (f3946 . -16) (f3945 . -12) (f3944 . -8) (f3940 . 4) (f3940 . 0))
# var=f3944
    movl -20(%esp), %eax  # stack load f3944
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    jmp _L_32607
_L_32606:
# emit-tail-expr
# si=-32
# env=((f3946 . -28) (f3945 . -24) (f3944 . -20) (f3946 . -16) (f3945 . -12) (f3944 . -8) (f3940 . 4) (f3940 . 0))
# expr=(begin (string-set! f3944 f3945 (car f3946)) ((vector-ref f3940 0) f3944 (fxadd1 f3945) (cdr f3946)))
# tail-begin (begin (string-set! f3944 f3945 (car f3946)) ((vector-ref f3940 0) f3944 (fxadd1 f3945) (cdr f3946)))
#   env=((f3946 . -28) (f3945 . -24) (f3944 . -20) (f3946 . -16) (f3945 . -12) (f3944 . -8) (f3940 . 4) (f3940 . 0))
# emit-expr (string-set! f3944 f3945 (car f3946))
# emit-expr f3944
# emit-variable-ref
# env=((f3946 . -28) (f3945 . -24) (f3944 . -20) (f3946 . -16) (f3945 . -12) (f3944 . -8) (f3940 . 4) (f3940 . 0))
# var=f3944
    movl -20(%esp), %eax  # stack load f3944
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_32608
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $160,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32608:
    movl %eax, -32(%esp)
# emit-expr f3945
# emit-variable-ref
# env=((f3946 . -28) (f3945 . -24) (f3944 . -20) (f3946 . -16) (f3945 . -12) (f3944 . -8) (f3940 . 4) (f3940 . 0))
# var=f3945
    movl -24(%esp), %eax  # stack load f3945
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32609"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $160,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32609:
# check bounds on string index
    movl -32(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_32611
    cmp  $0,%eax
    jge _L_32610
_L_32611:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $160,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32610:
    movl %eax, -36(%esp)
# emit-expr (car f3946)
# emit-expr f3946
# emit-variable-ref
# env=((f3946 . -28) (f3945 . -24) (f3944 . -20) (f3946 . -16) (f3945 . -12) (f3944 . -8) (f3940 . 4) (f3940 . 0))
# var=f3946
    movl -28(%esp), %eax  # stack load f3946
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_32612
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $108,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32612:
    movl -1(%eax), %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_32613"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $160,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32613:
    movl -32(%esp), %ebx
    movl -36(%esp), %esi
    sar $2, %esi
    movb  %ah, -2(%ebx,%esi)
# emit-tail-expr
# si=-32
# env=((f3946 . -28) (f3945 . -24) (f3944 . -20) (f3946 . -16) (f3945 . -12) (f3944 . -8) (f3940 . 4) (f3940 . 0))
# expr=(begin ((vector-ref f3940 0) f3944 (fxadd1 f3945) (cdr f3946)))
# tail-begin (begin ((vector-ref f3940 0) f3944 (fxadd1 f3945) (cdr f3946)))
#   env=((f3946 . -28) (f3945 . -24) (f3944 . -20) (f3946 . -16) (f3945 . -12) (f3944 . -8) (f3940 . 4) (f3940 . 0))
# emit-tail-expr
# si=-32
# env=((f3946 . -28) (f3945 . -24) (f3944 . -20) (f3946 . -16) (f3945 . -12) (f3944 . -8) (f3940 . 4) (f3940 . 0))
# expr=((vector-ref f3940 0) f3944 (fxadd1 f3945) (cdr f3946))
# emit-tail-funcall
#    si   =-32
#    env  = ((f3946 . -28) (f3945 . -24) (f3944 . -20) (f3946 . -16) (f3945 . -12) (f3944 . -8) (f3940 . 4) (f3940 . 0))
#    expr = (funcall (vector-ref f3940 0) f3944 (fxadd1 f3945) (cdr f3946))
# emit-expr (vector-ref f3940 0)
# emit-expr f3940
# emit-variable-ref
# env=((f3946 . -28) (f3945 . -24) (f3944 . -20) (f3946 . -16) (f3945 . -12) (f3944 . -8) (f3940 . 4) (f3940 . 0))
# var=f3940
    movl 2(%edi), %eax  # frame load f3940
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32614
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32614:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32615"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32615:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32617
    cmp  $0,%eax
    jge _L_32616
_L_32617:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32616:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -32(%esp)  # stash funcall-oper in next closure slot
# emit-expr f3944
# emit-variable-ref
# env=((f3946 . -28) (f3945 . -24) (f3944 . -20) (f3946 . -16) (f3945 . -12) (f3944 . -8) (f3940 . 4) (f3940 . 0))
# var=f3944
    movl -20(%esp), %eax  # stack load f3944
# end emit-variable-ref
    mov %eax, -36(%esp)    # arg f3944
# emit-expr (fxadd1 f3945)
# emit-expr f3945
# emit-variable-ref
# env=((f3946 . -28) (f3945 . -24) (f3944 . -20) (f3946 . -16) (f3945 . -12) (f3944 . -8) (f3940 . 4) (f3940 . 0))
# var=f3945
    movl -24(%esp), %eax  # stack load f3945
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32618"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32618:
     addl $4, %eax
    mov %eax, -40(%esp)    # arg (fxadd1 f3945)
# emit-expr (cdr f3946)
# emit-expr f3946
# emit-variable-ref
# env=((f3946 . -28) (f3945 . -24) (f3944 . -20) (f3946 . -16) (f3945 . -12) (f3944 . -8) (f3940 . 4) (f3940 . 0))
# var=f3946
    movl -28(%esp), %eax  # stack load f3946
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_32619
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32619:
    movl 3(%eax), %eax
    mov %eax, -44(%esp)    # arg (cdr f3946)
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
_L_32607:
    .align 4,0x90
_L_32604:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f3940 . 0))
# emit-expr (begin (closure f3950 (f3940) (let () (let ((f3952 (make-string ((primitive-ref list-length) f3950)))) ((vector-ref f3940 0) f3952 0 f3950)))))
# emit-begin
#   expr=(begin (closure f3950 (f3940) (let () (let ((f3952 (make-string ((primitive-ref list-length) f3950)))) ((vector-ref f3940 0) f3952 0 f3950)))))
#   env=((f3940 . 0))
# emit-expr (closure f3950 (f3940) (let () (let ((f3952 (make-string ((primitive-ref list-length) f3950)))) ((vector-ref f3940 0) f3952 0 f3950))))
# emit-closure
# si = -4
# env = ((f3940 . 0))
# expr = (closure f3950 (f3940) (let () (let ((f3952 (make-string ((primitive-ref list-length) f3950)))) ((vector-ref f3940 0) f3952 0 f3950))))
    movl $_L_32620, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f3940 . 0))
# var=f3940
    movl 0(%esp), %eax  # stack load f3940
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f3940
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_32621            # jump around closure body
_L_32620:
# check argument count
    cmp $0,%eax
    jge _L_32622
# invoke error handler eh_argcount_min
    .extern eh$uargcount$umin
    movl eh$uargcount$umin, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_32622:
# emit-build-varargs-list
    movl $63, %esi       # args <- () 
    lea -4(%esp),%edi    # edi <- esp-4
    subl %eax, %edi      # edi <- esp-4-eax    addr of arg[K+N] on stack
_L_32624:
    lea -4(%esp),%ebx    # addr of arg[K] on stack
    cmp %edi, %ebx       # while edi <> esp+(si+4)
    je _L_32623
    movl (%edi),%ebx     # arg i -> car
    movl %ebx, 0(%ebp)
    movl %esi, 4(%ebp)  # esi -> cdr
    movl %ebp, %esi
    addl $1, %esi       # tag as pair
    addl $8,%ebp         # bump heap ptr
    addl $4,%edi         # move to next previous arg from the end
    jmp _L_32624
_L_32623:
    movl %esi, -8(%esp)  # set args
# emit-tail-expr
# si=-12
# env=((f3950 . -8) (f3940 . 4) (f3940 . 0))
# expr=(let () (let ((f3952 (make-string ((primitive-ref list-length) f3950)))) ((vector-ref f3940 0) f3952 0 f3950)))
# emit-tail-let
#  si   = -12
#  env  = ((f3950 . -8) (f3940 . 4) (f3940 . 0))
#  bindings = ()
#  body = (let ((f3952 (make-string ((primitive-ref list-length) f3950)))) ((vector-ref f3940 0) f3952 0 f3950))
# emit-tail-expr
# si=-12
# env=((f3950 . -8) (f3940 . 4) (f3940 . 0))
# expr=(let ((f3952 (make-string ((primitive-ref list-length) f3950)))) ((vector-ref f3940 0) f3952 0 f3950))
# emit-tail-let
#  si   = -12
#  env  = ((f3950 . -8) (f3940 . 4) (f3940 . 0))
#  bindings = ((f3952 (make-string ((primitive-ref list-length) f3950))))
#  body = ((vector-ref f3940 0) f3952 0 f3950)
# emit-expr (make-string ((primitive-ref list-length) f3950))
# make-string len=((primitive-ref list-length) f3950)
# emit-expr ((primitive-ref list-length) f3950)
# funcall
#    si   =-12
#    env  = ((f3950 . -8) (f3940 . 4) (f3940 . 0))
#    expr = (funcall (primitive-ref list-length) f3950)
# emit-expr (primitive-ref list-length)
    .extern list$mlength
    movl list$mlength,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32625"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32625":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr f3950
# emit-variable-ref
# env=((f3950 . -8) (f3940 . 4) (f3940 . 0))
# var=f3950
    movl -8(%esp), %eax  # stack load f3950
# end emit-variable-ref
    mov %eax, -24(%esp)  # arg f3950
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
    je "_L_32626"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32626:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_32627
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32627:
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
# env=((f3952 . -12) (f3950 . -8) (f3940 . 4) (f3940 . 0))
# expr=((vector-ref f3940 0) f3952 0 f3950)
# emit-tail-funcall
#    si   =-16
#    env  = ((f3952 . -12) (f3950 . -8) (f3940 . 4) (f3940 . 0))
#    expr = (funcall (vector-ref f3940 0) f3952 0 f3950)
# emit-expr (vector-ref f3940 0)
# emit-expr f3940
# emit-variable-ref
# env=((f3952 . -12) (f3950 . -8) (f3940 . 4) (f3940 . 0))
# var=f3940
    movl 2(%edi), %eax  # frame load f3940
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32628
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32628:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32629"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32629:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32631
    cmp  $0,%eax
    jge _L_32630
_L_32631:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32630:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f3952
# emit-variable-ref
# env=((f3952 . -12) (f3950 . -8) (f3940 . 4) (f3940 . 0))
# var=f3952
    movl -12(%esp), %eax  # stack load f3952
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f3952
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -24(%esp)    # arg 0
# emit-expr f3950
# emit-variable-ref
# env=((f3952 . -12) (f3950 . -8) (f3940 . 4) (f3940 . 0))
# var=f3950
    movl -8(%esp), %eax  # stack load f3950
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f3950
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
_L_32621:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f3940 . 0))
     movl %eax, string
# == explicit-begins  ==>
# (let* ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s)))) (write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))
# == eliminate-let*  ==>
# (let ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s))))) (let ((write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1)))))
# == uniquify-variables  ==>
# (let ((f3953 (lambda (f3954) (foreign-call "s_write" 2 f3954 (string-length f3954))))) (let ((f3962 (lambda (f3963 f3964) (begin (f3953 "error:") (f3953 (symbol->string f3963)) (f3953 ": ") (f3953 f3964) (f3953 "\n"))))) (lambda (f3967 f3968) (begin (f3962 f3967 f3968) (foreign-call "s_exit" 1)))))
# == vectorize-letrec  ==>
# (let ((f3953 (lambda (f3954) (foreign-call "s_write" 2 f3954 (string-length f3954))))) (let ((f3962 (lambda (f3963 f3964) (begin (f3953 "error:") (f3953 (symbol->string f3963)) (f3953 ": ") (f3953 f3964) (f3953 "\n"))))) (lambda (f3967 f3968) (begin (f3962 f3967 f3968) (foreign-call "s_exit" 1)))))
# == eliminate-set!  ==>
# (let ((f3953 (lambda (f3954) (let ((f3954 f3954)) (foreign-call "s_write" 2 f3954 (string-length f3954)))))) (let ((f3962 (lambda (f3963 f3964) (let ((f3963 f3963) (f3964 f3964)) (begin (f3953 "error:") (f3953 (symbol->string f3963)) (f3953 ": ") (f3953 f3964) (f3953 "\n")))))) (lambda (f3967 f3968) (let ((f3967 f3967) (f3968 f3968)) (begin (f3962 f3967 f3968) (foreign-call "s_exit" 1))))))
# == close-free-variables  ==>
# (let ((f3953 (closure (f3954) () (let ((f3954 f3954)) (foreign-call "s_write" 2 f3954 (string-length f3954)))))) (let ((f3962 (closure (f3963 f3964) (f3953 f3953 f3953 f3953 f3953) (let ((f3963 f3963) (f3964 f3964)) (begin (f3953 "error:") (f3953 (symbol->string f3963)) (f3953 ": ") (f3953 f3964) (f3953 "\n")))))) (closure (f3967 f3968) (f3962) (let ((f3967 f3967) (f3968 f3968)) (begin (f3962 f3967 f3968) (foreign-call "s_exit" 1))))))
# == eliminate-quote  ==>
# (let ((f3953 (closure (f3954) () (let ((f3954 f3954)) (foreign-call "s_write" 2 f3954 (string-length f3954)))))) (let ((f3962 (closure (f3963 f3964) (f3953 f3953 f3953 f3953 f3953) (let ((f3963 f3963) (f3964 f3964)) (begin (f3953 "error:") (f3953 (symbol->string f3963)) (f3953 ": ") (f3953 f3964) (f3953 "\n")))))) (closure (f3967 f3968) (f3962) (let ((f3967 f3967) (f3968 f3968)) (begin (f3962 f3967 f3968) (foreign-call "s_exit" 1))))))
# == eliminate-when/unless  ==>
# (let ((f3953 (closure (f3954) () (let ((f3954 f3954)) (foreign-call "s_write" 2 f3954 (string-length f3954)))))) (let ((f3962 (closure (f3963 f3964) (f3953 f3953 f3953 f3953 f3953) (let ((f3963 f3963) (f3964 f3964)) (begin (f3953 "error:") (f3953 (symbol->string f3963)) (f3953 ": ") (f3953 f3964) (f3953 "\n")))))) (closure (f3967 f3968) (f3962) (let ((f3967 f3967) (f3968 f3968)) (begin (f3962 f3967 f3968) (foreign-call "s_exit" 1))))))
# == eliminate-cond  ==>
# (let ((f3953 (closure (f3954) () (let ((f3954 f3954)) (foreign-call "s_write" 2 f3954 (string-length f3954)))))) (let ((f3962 (closure (f3963 f3964) (f3953 f3953 f3953 f3953 f3953) (let ((f3963 f3963) (f3964 f3964)) (begin (f3953 "error:") (f3953 (symbol->string f3963)) (f3953 ": ") (f3953 f3964) (f3953 "\n")))))) (closure (f3967 f3968) (f3962) (let ((f3967 f3967) (f3968 f3968)) (begin (f3962 f3967 f3968) (foreign-call "s_exit" 1))))))
# == external-symbols  ==>
# (let ((f3953 (closure (f3954) () (let ((f3954 f3954)) (foreign-call "s_write" 2 f3954 (string-length f3954)))))) (let ((f3962 (closure (f3963 f3964) (f3953 f3953 f3953 f3953 f3953) (let ((f3963 f3963) (f3964 f3964)) (begin (f3953 "error:") (f3953 (symbol->string f3963)) (f3953 ": ") (f3953 f3964) (f3953 "\n")))))) (closure (f3967 f3968) (f3962) (let ((f3967 f3967) (f3968 f3968)) (begin (f3962 f3967 f3968) (foreign-call "s_exit" 1))))))
# emit-expr (let ((f3953 (closure (f3954) () (let ((f3954 f3954)) (foreign-call "s_write" 2 f3954 (string-length f3954)))))) (let ((f3962 (closure (f3963 f3964) (f3953 f3953 f3953 f3953 f3953) (let ((f3963 f3963) (f3964 f3964)) (begin (f3953 "error:") (f3953 (symbol->string f3963)) (f3953 ": ") (f3953 f3964) (f3953 "\n")))))) (closure (f3967 f3968) (f3962) (let ((f3967 f3967) (f3968 f3968)) (begin (f3962 f3967 f3968) (foreign-call "s_exit" 1))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f3953 (closure (f3954) () (let ((f3954 f3954)) (foreign-call "s_write" 2 f3954 (string-length f3954))))))
#  body = (let ((f3962 (closure (f3963 f3964) (f3953 f3953 f3953 f3953 f3953) (let ((f3963 f3963) (f3964 f3964)) (begin (f3953 "error:") (f3953 (symbol->string f3963)) (f3953 ": ") (f3953 f3964) (f3953 "\n")))))) (closure (f3967 f3968) (f3962) (let ((f3967 f3967) (f3968 f3968)) (begin (f3962 f3967 f3968) (foreign-call "s_exit" 1)))))
# emit-expr (closure (f3954) () (let ((f3954 f3954)) (foreign-call "s_write" 2 f3954 (string-length f3954))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f3954) () (let ((f3954 f3954)) (foreign-call "s_write" 2 f3954 (string-length f3954))))
    movl $_L_32632, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_32633            # jump around closure body
_L_32632:
# check argument count
    cmp $4,%eax
    je _L_32634
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_32634:
# emit-tail-expr
# si=-12
# env=((f3954 . -8))
# expr=(let ((f3954 f3954)) (foreign-call "s_write" 2 f3954 (string-length f3954)))
# emit-tail-let
#  si   = -12
#  env  = ((f3954 . -8))
#  bindings = ((f3954 f3954))
#  body = (foreign-call "s_write" 2 f3954 (string-length f3954))
# emit-expr f3954
# emit-variable-ref
# env=((f3954 . -8))
# var=f3954
    movl -8(%esp), %eax  # stack load f3954
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f3954 . -12) (f3954 . -8))
# expr=(foreign-call "s_write" 2 f3954 (string-length f3954))
    movl %ecx,-16(%esp)
    movl %esp,-20(%esp)
# emit-expr (string-length f3954)
# emit-expr f3954
# emit-variable-ref
# env=((f3954 . -12) (f3954 . -8))
# var=f3954
    movl -12(%esp), %eax  # stack load f3954
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_32635
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32635:
    movl -6(%eax), %eax
    movl %eax, -24(%esp)
# emit-expr f3954
# emit-variable-ref
# env=((f3954 . -12) (f3954 . -8))
# var=f3954
    movl -12(%esp), %eax  # stack load f3954
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
_L_32633:
    movl %eax, 0(%esp)  # stack save
# emit-expr (let ((f3962 (closure (f3963 f3964) (f3953 f3953 f3953 f3953 f3953) (let ((f3963 f3963) (f3964 f3964)) (begin (f3953 "error:") (f3953 (symbol->string f3963)) (f3953 ": ") (f3953 f3964) (f3953 "\n")))))) (closure (f3967 f3968) (f3962) (let ((f3967 f3967) (f3968 f3968)) (begin (f3962 f3967 f3968) (foreign-call "s_exit" 1)))))
# emit-let
#  si   = -4
#  env  = ((f3953 . 0))
#  bindings = ((f3962 (closure (f3963 f3964) (f3953 f3953 f3953 f3953 f3953) (let ((f3963 f3963) (f3964 f3964)) (begin (f3953 "error:") (f3953 (symbol->string f3963)) (f3953 ": ") (f3953 f3964) (f3953 "\n"))))))
#  body = (closure (f3967 f3968) (f3962) (let ((f3967 f3967) (f3968 f3968)) (begin (f3962 f3967 f3968) (foreign-call "s_exit" 1))))
# emit-expr (closure (f3963 f3964) (f3953 f3953 f3953 f3953 f3953) (let ((f3963 f3963) (f3964 f3964)) (begin (f3953 "error:") (f3953 (symbol->string f3963)) (f3953 ": ") (f3953 f3964) (f3953 "\n"))))
# emit-closure
# si = -4
# env = ((f3953 . 0))
# expr = (closure (f3963 f3964) (f3953 f3953 f3953 f3953 f3953) (let ((f3963 f3963) (f3964 f3964)) (begin (f3953 "error:") (f3953 (symbol->string f3963)) (f3953 ": ") (f3953 f3964) (f3953 "\n"))))
    movl $_L_32636, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f3953 . 0))
# var=f3953
    movl 0(%esp), %eax  # stack load f3953
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f3953
# emit-variable-ref
# env=((f3953 . 0))
# var=f3953
    movl 0(%esp), %eax  # stack load f3953
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f3953
# emit-variable-ref
# env=((f3953 . 0))
# var=f3953
    movl 0(%esp), %eax  # stack load f3953
# end emit-variable-ref
   movl  %eax, 12(%ebp)  # f3953
# emit-variable-ref
# env=((f3953 . 0))
# var=f3953
    movl 0(%esp), %eax  # stack load f3953
# end emit-variable-ref
   movl  %eax, 16(%ebp)  # f3953
# emit-variable-ref
# env=((f3953 . 0))
# var=f3953
    movl 0(%esp), %eax  # stack load f3953
# end emit-variable-ref
   movl  %eax, 20(%ebp)  # f3953
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $24, %ebp     # bump ebp
    jmp _L_32637            # jump around closure body
_L_32636:
# check argument count
    cmp $8,%eax
    je _L_32638
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_32638:
# emit-tail-expr
# si=-16
# env=((f3964 . -12) (f3963 . -8) (f3953 . 20) (f3953 . 16) (f3953 . 12) (f3953 . 8) (f3953 . 4) (f3953 . 0))
# expr=(let ((f3963 f3963) (f3964 f3964)) (begin (f3953 "error:") (f3953 (symbol->string f3963)) (f3953 ": ") (f3953 f3964) (f3953 "\n")))
# emit-tail-let
#  si   = -16
#  env  = ((f3964 . -12) (f3963 . -8) (f3953 . 20) (f3953 . 16) (f3953 . 12) (f3953 . 8) (f3953 . 4) (f3953 . 0))
#  bindings = ((f3963 f3963) (f3964 f3964))
#  body = (begin (f3953 "error:") (f3953 (symbol->string f3963)) (f3953 ": ") (f3953 f3964) (f3953 "\n"))
# emit-expr f3963
# emit-variable-ref
# env=((f3964 . -12) (f3963 . -8) (f3953 . 20) (f3953 . 16) (f3953 . 12) (f3953 . 8) (f3953 . 4) (f3953 . 0))
# var=f3963
    movl -8(%esp), %eax  # stack load f3963
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f3964
# emit-variable-ref
# env=((f3964 . -12) (f3963 . -8) (f3953 . 20) (f3953 . 16) (f3953 . 12) (f3953 . 8) (f3953 . 4) (f3953 . 0))
# var=f3964
    movl -12(%esp), %eax  # stack load f3964
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f3964 . -20) (f3963 . -16) (f3964 . -12) (f3963 . -8) (f3953 . 20) (f3953 . 16) (f3953 . 12) (f3953 . 8) (f3953 . 4) (f3953 . 0))
# expr=(begin (f3953 "error:") (f3953 (symbol->string f3963)) (f3953 ": ") (f3953 f3964) (f3953 "\n"))
# tail-begin (begin (f3953 "error:") (f3953 (symbol->string f3963)) (f3953 ": ") (f3953 f3964) (f3953 "\n"))
#   env=((f3964 . -20) (f3963 . -16) (f3964 . -12) (f3963 . -8) (f3953 . 20) (f3953 . 16) (f3953 . 12) (f3953 . 8) (f3953 . 4) (f3953 . 0))
# emit-expr (f3953 "error:")
# funcall
#    si   =-24
#    env  = ((f3964 . -20) (f3963 . -16) (f3964 . -12) (f3963 . -8) (f3953 . 20) (f3953 . 16) (f3953 . 12) (f3953 . 8) (f3953 . 4) (f3953 . 0))
#    expr = (funcall f3953 "error:")
# emit-expr f3953
# emit-variable-ref
# env=((f3964 . -20) (f3963 . -16) (f3964 . -12) (f3963 . -8) (f3953 . 20) (f3953 . 16) (f3953 . 12) (f3953 . 8) (f3953 . 4) (f3953 . 0))
# var=f3953
    movl 18(%edi), %eax  # frame load f3953
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32639"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32639":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr "error:"
# string literal
    jmp _L_32641
    .align 8,0x90
_L_32640 :
    .int 24
    .ascii "error:"
_L_32641:
    movl $_L_32640, %eax
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
# env=((f3964 . -20) (f3963 . -16) (f3964 . -12) (f3963 . -8) (f3953 . 20) (f3953 . 16) (f3953 . 12) (f3953 . 8) (f3953 . 4) (f3953 . 0))
# expr=(begin (f3953 (symbol->string f3963)) (f3953 ": ") (f3953 f3964) (f3953 "\n"))
# tail-begin (begin (f3953 (symbol->string f3963)) (f3953 ": ") (f3953 f3964) (f3953 "\n"))
#   env=((f3964 . -20) (f3963 . -16) (f3964 . -12) (f3963 . -8) (f3953 . 20) (f3953 . 16) (f3953 . 12) (f3953 . 8) (f3953 . 4) (f3953 . 0))
# emit-expr (f3953 (symbol->string f3963))
# funcall
#    si   =-24
#    env  = ((f3964 . -20) (f3963 . -16) (f3964 . -12) (f3963 . -8) (f3953 . 20) (f3953 . 16) (f3953 . 12) (f3953 . 8) (f3953 . 4) (f3953 . 0))
#    expr = (funcall f3953 (symbol->string f3963))
# emit-expr f3953
# emit-variable-ref
# env=((f3964 . -20) (f3963 . -16) (f3964 . -12) (f3963 . -8) (f3953 . 20) (f3953 . 16) (f3953 . 12) (f3953 . 8) (f3953 . 4) (f3953 . 0))
# var=f3953
    movl 18(%edi), %eax  # frame load f3953
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32642"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32642":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr (symbol->string f3963)
# symbol->string f3963
# emit-expr f3963
# emit-variable-ref
# env=((f3964 . -20) (f3963 . -16) (f3964 . -12) (f3963 . -8) (f3953 . 20) (f3953 . 16) (f3953 . 12) (f3953 . 8) (f3953 . 4) (f3953 . 0))
# var=f3963
    movl -16(%esp), %eax  # stack load f3963
# end emit-variable-ref
    movl -3(%eax), %eax
    mov %eax, -36(%esp)  # arg (symbol->string f3963)
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f3964 . -20) (f3963 . -16) (f3964 . -12) (f3963 . -8) (f3953 . 20) (f3953 . 16) (f3953 . 12) (f3953 . 8) (f3953 . 4) (f3953 . 0))
# expr=(begin (f3953 ": ") (f3953 f3964) (f3953 "\n"))
# tail-begin (begin (f3953 ": ") (f3953 f3964) (f3953 "\n"))
#   env=((f3964 . -20) (f3963 . -16) (f3964 . -12) (f3963 . -8) (f3953 . 20) (f3953 . 16) (f3953 . 12) (f3953 . 8) (f3953 . 4) (f3953 . 0))
# emit-expr (f3953 ": ")
# funcall
#    si   =-24
#    env  = ((f3964 . -20) (f3963 . -16) (f3964 . -12) (f3963 . -8) (f3953 . 20) (f3953 . 16) (f3953 . 12) (f3953 . 8) (f3953 . 4) (f3953 . 0))
#    expr = (funcall f3953 ": ")
# emit-expr f3953
# emit-variable-ref
# env=((f3964 . -20) (f3963 . -16) (f3964 . -12) (f3963 . -8) (f3953 . 20) (f3953 . 16) (f3953 . 12) (f3953 . 8) (f3953 . 4) (f3953 . 0))
# var=f3953
    movl 18(%edi), %eax  # frame load f3953
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32643"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32643":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr ": "
# string literal
    jmp _L_32645
    .align 8,0x90
_L_32644 :
    .int 8
    .ascii ": "
_L_32645:
    movl $_L_32644, %eax
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
# env=((f3964 . -20) (f3963 . -16) (f3964 . -12) (f3963 . -8) (f3953 . 20) (f3953 . 16) (f3953 . 12) (f3953 . 8) (f3953 . 4) (f3953 . 0))
# expr=(begin (f3953 f3964) (f3953 "\n"))
# tail-begin (begin (f3953 f3964) (f3953 "\n"))
#   env=((f3964 . -20) (f3963 . -16) (f3964 . -12) (f3963 . -8) (f3953 . 20) (f3953 . 16) (f3953 . 12) (f3953 . 8) (f3953 . 4) (f3953 . 0))
# emit-expr (f3953 f3964)
# funcall
#    si   =-24
#    env  = ((f3964 . -20) (f3963 . -16) (f3964 . -12) (f3963 . -8) (f3953 . 20) (f3953 . 16) (f3953 . 12) (f3953 . 8) (f3953 . 4) (f3953 . 0))
#    expr = (funcall f3953 f3964)
# emit-expr f3953
# emit-variable-ref
# env=((f3964 . -20) (f3963 . -16) (f3964 . -12) (f3963 . -8) (f3953 . 20) (f3953 . 16) (f3953 . 12) (f3953 . 8) (f3953 . 4) (f3953 . 0))
# var=f3953
    movl 18(%edi), %eax  # frame load f3953
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32646"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32646":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f3964
# emit-variable-ref
# env=((f3964 . -20) (f3963 . -16) (f3964 . -12) (f3963 . -8) (f3953 . 20) (f3953 . 16) (f3953 . 12) (f3953 . 8) (f3953 . 4) (f3953 . 0))
# var=f3964
    movl -20(%esp), %eax  # stack load f3964
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f3964
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f3964 . -20) (f3963 . -16) (f3964 . -12) (f3963 . -8) (f3953 . 20) (f3953 . 16) (f3953 . 12) (f3953 . 8) (f3953 . 4) (f3953 . 0))
# expr=(begin (f3953 "\n"))
# tail-begin (begin (f3953 "\n"))
#   env=((f3964 . -20) (f3963 . -16) (f3964 . -12) (f3963 . -8) (f3953 . 20) (f3953 . 16) (f3953 . 12) (f3953 . 8) (f3953 . 4) (f3953 . 0))
# emit-tail-expr
# si=-24
# env=((f3964 . -20) (f3963 . -16) (f3964 . -12) (f3963 . -8) (f3953 . 20) (f3953 . 16) (f3953 . 12) (f3953 . 8) (f3953 . 4) (f3953 . 0))
# expr=(f3953 "\n")
# emit-tail-funcall
#    si   =-24
#    env  = ((f3964 . -20) (f3963 . -16) (f3964 . -12) (f3963 . -8) (f3953 . 20) (f3953 . 16) (f3953 . 12) (f3953 . 8) (f3953 . 4) (f3953 . 0))
#    expr = (funcall f3953 "\n")
# emit-expr f3953
# emit-variable-ref
# env=((f3964 . -20) (f3963 . -16) (f3964 . -12) (f3963 . -8) (f3953 . 20) (f3953 . 16) (f3953 . 12) (f3953 . 8) (f3953 . 4) (f3953 . 0))
# var=f3953
    movl 18(%edi), %eax  # frame load f3953
# end emit-variable-ref
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr "\n"
# string literal
    jmp _L_32648
    .align 8,0x90
_L_32647 :
    .int 4
    .ascii "\n"
_L_32648:
    movl $_L_32647, %eax
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
_L_32637:
    movl %eax, -4(%esp)  # stack save
# emit-expr (closure (f3967 f3968) (f3962) (let ((f3967 f3967) (f3968 f3968)) (begin (f3962 f3967 f3968) (foreign-call "s_exit" 1))))
# emit-closure
# si = -8
# env = ((f3962 . -4) (f3953 . 0))
# expr = (closure (f3967 f3968) (f3962) (let ((f3967 f3967) (f3968 f3968)) (begin (f3962 f3967 f3968) (foreign-call "s_exit" 1))))
    movl $_L_32649, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f3962 . -4) (f3953 . 0))
# var=f3962
    movl -4(%esp), %eax  # stack load f3962
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f3962
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_32650            # jump around closure body
_L_32649:
# check argument count
    cmp $8,%eax
    je _L_32651
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_32651:
# emit-tail-expr
# si=-16
# env=((f3968 . -12) (f3967 . -8) (f3962 . 4) (f3962 . -4) (f3953 . 0))
# expr=(let ((f3967 f3967) (f3968 f3968)) (begin (f3962 f3967 f3968) (foreign-call "s_exit" 1)))
# emit-tail-let
#  si   = -16
#  env  = ((f3968 . -12) (f3967 . -8) (f3962 . 4) (f3962 . -4) (f3953 . 0))
#  bindings = ((f3967 f3967) (f3968 f3968))
#  body = (begin (f3962 f3967 f3968) (foreign-call "s_exit" 1))
# emit-expr f3967
# emit-variable-ref
# env=((f3968 . -12) (f3967 . -8) (f3962 . 4) (f3962 . -4) (f3953 . 0))
# var=f3967
    movl -8(%esp), %eax  # stack load f3967
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f3968
# emit-variable-ref
# env=((f3968 . -12) (f3967 . -8) (f3962 . 4) (f3962 . -4) (f3953 . 0))
# var=f3968
    movl -12(%esp), %eax  # stack load f3968
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f3968 . -20) (f3967 . -16) (f3968 . -12) (f3967 . -8) (f3962 . 4) (f3962 . -4) (f3953 . 0))
# expr=(begin (f3962 f3967 f3968) (foreign-call "s_exit" 1))
# tail-begin (begin (f3962 f3967 f3968) (foreign-call "s_exit" 1))
#   env=((f3968 . -20) (f3967 . -16) (f3968 . -12) (f3967 . -8) (f3962 . 4) (f3962 . -4) (f3953 . 0))
# emit-expr (f3962 f3967 f3968)
# funcall
#    si   =-24
#    env  = ((f3968 . -20) (f3967 . -16) (f3968 . -12) (f3967 . -8) (f3962 . 4) (f3962 . -4) (f3953 . 0))
#    expr = (funcall f3962 f3967 f3968)
# emit-expr f3962
# emit-variable-ref
# env=((f3968 . -20) (f3967 . -16) (f3968 . -12) (f3967 . -8) (f3962 . 4) (f3962 . -4) (f3953 . 0))
# var=f3962
    movl 2(%edi), %eax  # frame load f3962
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32652"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32652":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f3967
# emit-variable-ref
# env=((f3968 . -20) (f3967 . -16) (f3968 . -12) (f3967 . -8) (f3962 . 4) (f3962 . -4) (f3953 . 0))
# var=f3967
    movl -16(%esp), %eax  # stack load f3967
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f3967
# emit-expr f3968
# emit-variable-ref
# env=((f3968 . -20) (f3967 . -16) (f3968 . -12) (f3967 . -8) (f3962 . 4) (f3962 . -4) (f3953 . 0))
# var=f3968
    movl -20(%esp), %eax  # stack load f3968
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg f3968
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f3968 . -20) (f3967 . -16) (f3968 . -12) (f3967 . -8) (f3962 . 4) (f3962 . -4) (f3953 . 0))
# expr=(begin (foreign-call "s_exit" 1))
# tail-begin (begin (foreign-call "s_exit" 1))
#   env=((f3968 . -20) (f3967 . -16) (f3968 . -12) (f3967 . -8) (f3962 . 4) (f3962 . -4) (f3953 . 0))
# emit-tail-expr
# si=-24
# env=((f3968 . -20) (f3967 . -16) (f3968 . -12) (f3967 . -8) (f3962 . 4) (f3962 . -4) (f3953 . 0))
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
_L_32650:
     movl %eax, error
# == explicit-begins  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fxremainder) p)) (set! p (cons (quote fxquotient) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == eliminate-let*  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fxremainder) p)) (set! p (cons (quote fxquotient) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == uniquify-variables  ==>
# (let ((f3969 (quote ()))) (begin (set! f3969 (cons (quote procedure?) f3969)) (set! f3969 (cons (quote cdr) f3969)) (set! f3969 (cons (quote car) f3969)) (set! f3969 (cons (quote symbol-value) f3969)) (set! f3969 (cons (quote symbol->string) f3969)) (set! f3969 (cons (quote make-symbol) f3969)) (set! f3969 (cons (quote symbol?) f3969)) (set! f3969 (cons (quote string-set!) f3969)) (set! f3969 (cons (quote string-ref) f3969)) (set! f3969 (cons (quote string-length) f3969)) (set! f3969 (cons (quote string?) f3969)) (set! f3969 (cons (quote make-string) f3969)) (set! f3969 (cons (quote vector-ref) f3969)) (set! f3969 (cons (quote vector-set!) f3969)) (set! f3969 (cons (quote vector-length) f3969)) (set! f3969 (cons (quote make-vector) f3969)) (set! f3969 (cons (quote vector?) f3969)) (set! f3969 (cons (quote set-cdr!) f3969)) (set! f3969 (cons (quote set-car!) f3969)) (set! f3969 (cons (quote cdr) f3969)) (set! f3969 (cons (quote car) f3969)) (set! f3969 (cons (quote cons) f3969)) (set! f3969 (cons (quote pair?) f3969)) (set! f3969 (cons (quote fxremainder) f3969)) (set! f3969 (cons (quote fxquotient) f3969)) (set! f3969 (cons (quote fx*) f3969)) (set! f3969 (cons (quote fx-) f3969)) (set! f3969 (cons (quote fx+) f3969)) (set! f3969 (cons (quote fx>=) f3969)) (set! f3969 (cons (quote fx>) f3969)) (set! f3969 (cons (quote fx<=) f3969)) (set! f3969 (cons (quote fx<) f3969)) (set! f3969 (cons (quote fx=) f3969)) (set! f3969 (cons (quote fxzero?) f3969)) (set! f3969 (cons (quote fxsub1) f3969)) (set! f3969 (cons (quote fxadd1) f3969)) (set! f3969 (cons (quote fxlogor) f3969)) (set! f3969 (cons (quote fxlogand) f3969)) (set! f3969 (cons (quote fxlognot) f3969)) (set! f3969 (cons (quote char=?) f3969)) (set! f3969 (cons (quote eq?) f3969)) (set! f3969 (cons (quote not) f3969)) (set! f3969 (cons (quote boolean?) f3969)) (set! f3969 (cons (quote fixnum?) f3969)) (set! f3969 (cons (quote char?) f3969)) (set! f3969 (cons (quote null?) f3969)) (set! f3969 (cons (quote char->fixnum) f3969)) (set! f3969 (cons (quote fixnum->char) f3969)) (lambda () f3969)))
# == vectorize-letrec  ==>
# (let ((f3969 (quote ()))) (begin (set! f3969 (cons (quote procedure?) f3969)) (set! f3969 (cons (quote cdr) f3969)) (set! f3969 (cons (quote car) f3969)) (set! f3969 (cons (quote symbol-value) f3969)) (set! f3969 (cons (quote symbol->string) f3969)) (set! f3969 (cons (quote make-symbol) f3969)) (set! f3969 (cons (quote symbol?) f3969)) (set! f3969 (cons (quote string-set!) f3969)) (set! f3969 (cons (quote string-ref) f3969)) (set! f3969 (cons (quote string-length) f3969)) (set! f3969 (cons (quote string?) f3969)) (set! f3969 (cons (quote make-string) f3969)) (set! f3969 (cons (quote vector-ref) f3969)) (set! f3969 (cons (quote vector-set!) f3969)) (set! f3969 (cons (quote vector-length) f3969)) (set! f3969 (cons (quote make-vector) f3969)) (set! f3969 (cons (quote vector?) f3969)) (set! f3969 (cons (quote set-cdr!) f3969)) (set! f3969 (cons (quote set-car!) f3969)) (set! f3969 (cons (quote cdr) f3969)) (set! f3969 (cons (quote car) f3969)) (set! f3969 (cons (quote cons) f3969)) (set! f3969 (cons (quote pair?) f3969)) (set! f3969 (cons (quote fxremainder) f3969)) (set! f3969 (cons (quote fxquotient) f3969)) (set! f3969 (cons (quote fx*) f3969)) (set! f3969 (cons (quote fx-) f3969)) (set! f3969 (cons (quote fx+) f3969)) (set! f3969 (cons (quote fx>=) f3969)) (set! f3969 (cons (quote fx>) f3969)) (set! f3969 (cons (quote fx<=) f3969)) (set! f3969 (cons (quote fx<) f3969)) (set! f3969 (cons (quote fx=) f3969)) (set! f3969 (cons (quote fxzero?) f3969)) (set! f3969 (cons (quote fxsub1) f3969)) (set! f3969 (cons (quote fxadd1) f3969)) (set! f3969 (cons (quote fxlogor) f3969)) (set! f3969 (cons (quote fxlogand) f3969)) (set! f3969 (cons (quote fxlognot) f3969)) (set! f3969 (cons (quote char=?) f3969)) (set! f3969 (cons (quote eq?) f3969)) (set! f3969 (cons (quote not) f3969)) (set! f3969 (cons (quote boolean?) f3969)) (set! f3969 (cons (quote fixnum?) f3969)) (set! f3969 (cons (quote char?) f3969)) (set! f3969 (cons (quote null?) f3969)) (set! f3969 (cons (quote char->fixnum) f3969)) (set! f3969 (cons (quote fixnum->char) f3969)) (lambda () f3969)))
# == eliminate-set!  ==>
# (let ((f3969 (vector (quote ())))) (begin (vector-set! f3969 0 (cons (quote procedure?) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote cdr) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote car) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote symbol-value) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote symbol->string) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote make-symbol) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote symbol?) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote string-set!) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote string-ref) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote string-length) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote string?) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote make-string) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote vector-ref) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote vector-set!) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote vector-length) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote make-vector) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote vector?) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote set-cdr!) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote set-car!) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote cdr) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote car) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote cons) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote pair?) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fxremainder) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fxquotient) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fx*) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fx-) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fx+) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fx>=) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fx>) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fx<=) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fx<) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fx=) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fxzero?) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fxsub1) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fxadd1) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fxlogor) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fxlogand) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fxlognot) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote char=?) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote eq?) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote not) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote boolean?) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fixnum?) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote char?) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote null?) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote char->fixnum) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fixnum->char) (vector-ref f3969 0))) (lambda () (let () (vector-ref f3969 0)))))
# == close-free-variables  ==>
# (let ((f3969 (vector (quote ())))) (begin (vector-set! f3969 0 (cons (quote procedure?) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote cdr) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote car) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote symbol-value) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote symbol->string) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote make-symbol) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote symbol?) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote string-set!) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote string-ref) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote string-length) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote string?) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote make-string) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote vector-ref) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote vector-set!) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote vector-length) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote make-vector) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote vector?) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote set-cdr!) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote set-car!) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote cdr) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote car) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote cons) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote pair?) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fxremainder) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fxquotient) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fx*) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fx-) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fx+) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fx>=) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fx>) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fx<=) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fx<) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fx=) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fxzero?) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fxsub1) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fxadd1) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fxlogor) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fxlogand) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fxlognot) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote char=?) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote eq?) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote not) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote boolean?) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fixnum?) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote char?) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote null?) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote char->fixnum) (vector-ref f3969 0))) (vector-set! f3969 0 (cons (quote fixnum->char) (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0)))))
# == eliminate-quote  ==>
# (let ((f3969 (vector ()))) (begin (vector-set! f3969 0 (cons (string->symbol "procedure?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "symbol-value") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "symbol->string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "make-symbol") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "symbol?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "string-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "string-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "string-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "string?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0)))))
# == eliminate-when/unless  ==>
# (let ((f3969 (vector ()))) (begin (vector-set! f3969 0 (cons (string->symbol "procedure?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "symbol-value") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "symbol->string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "make-symbol") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "symbol?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "string-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "string-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "string-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "string?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0)))))
# == eliminate-cond  ==>
# (let ((f3969 (vector ()))) (begin (vector-set! f3969 0 (cons (string->symbol "procedure?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "symbol-value") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "symbol->string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "make-symbol") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "symbol?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "string-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "string-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "string-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "string?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons (string->symbol "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0)))))
# == external-symbols  ==>
# (let ((f3969 ((primitive-ref vector) ()))) (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0)))))
# emit-expr (let ((f3969 ((primitive-ref vector) ()))) (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0)))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f3969 ((primitive-ref vector) ())))
#  body = (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
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
    je "_L_32653"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32653":
   movl %eax,  -8(%esp)  # stash funcall-oper in closure slot
# emit-expr ()
    movl $63, %eax     # immed ()
    mov %eax, -12(%esp)  # arg ()
    movl -8(%esp), %edi   # load new closure to %edi
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32654
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32654:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32655"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32655:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32657
    cmp  $0,%eax
    jge _L_32656
_L_32657:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32656:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "procedure?") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "procedure?")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "procedure?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32658"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32658":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "procedure?"
# string literal
    jmp _L_32660
    .align 8,0x90
_L_32659 :
    .int 40
    .ascii "procedure?"
_L_32660:
    movl $_L_32659, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg procedure?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32661
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32661:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32662"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32662:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32664
    cmp  $0,%eax
    jge _L_32663
_L_32664:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32663:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32665
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32665:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32666"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32666:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32668
    cmp  $0,%eax
    jge _L_32667
_L_32668:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32667:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "cdr") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "cdr")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cdr")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32669"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32669":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_32671
    .align 8,0x90
_L_32670 :
    .int 12
    .ascii "cdr"
_L_32671:
    movl $_L_32670, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cdr
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32672
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32672:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32673"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32673:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32675
    cmp  $0,%eax
    jge _L_32674
_L_32675:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32674:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32676
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32676:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32677"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32677:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32679
    cmp  $0,%eax
    jge _L_32678
_L_32679:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32678:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "car") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "car")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "car")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32680"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32680":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_32682
    .align 8,0x90
_L_32681 :
    .int 12
    .ascii "car"
_L_32682:
    movl $_L_32681, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg car
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32683
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32683:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32684"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32684:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32686
    cmp  $0,%eax
    jge _L_32685
_L_32686:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32685:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32687
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32687:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32688"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32688:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32690
    cmp  $0,%eax
    jge _L_32689
_L_32690:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32689:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "symbol-value") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "symbol-value")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol-value")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32691"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32691":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol-value"
# string literal
    jmp _L_32693
    .align 8,0x90
_L_32692 :
    .int 48
    .ascii "symbol-value"
_L_32693:
    movl $_L_32692, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol-value
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32694
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32694:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32695"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32695:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32697
    cmp  $0,%eax
    jge _L_32696
_L_32697:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32696:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32698
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32698:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32699"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32699:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32701
    cmp  $0,%eax
    jge _L_32700
_L_32701:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32700:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "symbol->string") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "symbol->string")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol->string")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32702"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32702":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol->string"
# string literal
    jmp _L_32704
    .align 8,0x90
_L_32703 :
    .int 56
    .ascii "symbol->string"
_L_32704:
    movl $_L_32703, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol->string
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32705
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32705:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32706"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32706:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32708
    cmp  $0,%eax
    jge _L_32707
_L_32708:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32707:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32709
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32709:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32710"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32710:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32712
    cmp  $0,%eax
    jge _L_32711
_L_32712:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32711:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "make-symbol") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "make-symbol")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-symbol")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32713"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32713":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-symbol"
# string literal
    jmp _L_32715
    .align 8,0x90
_L_32714 :
    .int 44
    .ascii "make-symbol"
_L_32715:
    movl $_L_32714, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-symbol
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32716
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32716:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32717"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32717:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32719
    cmp  $0,%eax
    jge _L_32718
_L_32719:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32718:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32720
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32720:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32721"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32721:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32723
    cmp  $0,%eax
    jge _L_32722
_L_32723:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32722:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "symbol?") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "symbol?")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32724"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32724":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol?"
# string literal
    jmp _L_32726
    .align 8,0x90
_L_32725 :
    .int 28
    .ascii "symbol?"
_L_32726:
    movl $_L_32725, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32727
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32727:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32728"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32728:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32730
    cmp  $0,%eax
    jge _L_32729
_L_32730:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32729:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32731
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32731:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32732"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32732:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32734
    cmp  $0,%eax
    jge _L_32733
_L_32734:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32733:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "string-set!") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "string-set!")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-set!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32735"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32735":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-set!"
# string literal
    jmp _L_32737
    .align 8,0x90
_L_32736 :
    .int 44
    .ascii "string-set!"
_L_32737:
    movl $_L_32736, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-set!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32738
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32738:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32739"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32739:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32741
    cmp  $0,%eax
    jge _L_32740
_L_32741:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32740:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32742
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32742:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32743"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32743:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32745
    cmp  $0,%eax
    jge _L_32744
_L_32745:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32744:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "string-ref") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "string-ref")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-ref")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32746"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32746":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-ref"
# string literal
    jmp _L_32748
    .align 8,0x90
_L_32747 :
    .int 40
    .ascii "string-ref"
_L_32748:
    movl $_L_32747, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-ref
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32749
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32749:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32750"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32750:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32752
    cmp  $0,%eax
    jge _L_32751
_L_32752:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32751:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32753
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32753:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32754"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32754:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32756
    cmp  $0,%eax
    jge _L_32755
_L_32756:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32755:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-length") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "string-length") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "string-length")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-length")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32757"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32757":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-length"
# string literal
    jmp _L_32759
    .align 8,0x90
_L_32758 :
    .int 52
    .ascii "string-length"
_L_32759:
    movl $_L_32758, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-length
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32760
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32760:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32761"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32761:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32763
    cmp  $0,%eax
    jge _L_32762
_L_32763:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32762:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32764
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32764:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32765"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32765:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32767
    cmp  $0,%eax
    jge _L_32766
_L_32767:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32766:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string?") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "string?") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "string?")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32768"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32768":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string?"
# string literal
    jmp _L_32770
    .align 8,0x90
_L_32769 :
    .int 28
    .ascii "string?"
_L_32770:
    movl $_L_32769, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32771
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32771:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32772"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32772:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32774
    cmp  $0,%eax
    jge _L_32773
_L_32774:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32773:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32775
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32775:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32776"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32776:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32778
    cmp  $0,%eax
    jge _L_32777
_L_32778:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32777:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-string") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "make-string") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "make-string")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-string")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32779"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32779":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-string"
# string literal
    jmp _L_32781
    .align 8,0x90
_L_32780 :
    .int 44
    .ascii "make-string"
_L_32781:
    movl $_L_32780, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-string
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32782
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32782:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32783"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32783:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32785
    cmp  $0,%eax
    jge _L_32784
_L_32785:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32784:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32786
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32786:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32787"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32787:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32789
    cmp  $0,%eax
    jge _L_32788
_L_32789:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32788:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "vector-ref") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "vector-ref")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-ref")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32790"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32790":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-ref"
# string literal
    jmp _L_32792
    .align 8,0x90
_L_32791 :
    .int 40
    .ascii "vector-ref"
_L_32792:
    movl $_L_32791, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-ref
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32793
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32793:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32794"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32794:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32796
    cmp  $0,%eax
    jge _L_32795
_L_32796:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32795:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32797
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32797:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32798"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32798:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32800
    cmp  $0,%eax
    jge _L_32799
_L_32800:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32799:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "vector-set!") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "vector-set!")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-set!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32801"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32801":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-set!"
# string literal
    jmp _L_32803
    .align 8,0x90
_L_32802 :
    .int 44
    .ascii "vector-set!"
_L_32803:
    movl $_L_32802, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-set!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32804
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32804:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32805"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32805:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32807
    cmp  $0,%eax
    jge _L_32806
_L_32807:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32806:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32808
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32808:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32809"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32809:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32811
    cmp  $0,%eax
    jge _L_32810
_L_32811:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32810:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "vector-length") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "vector-length")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-length")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32812"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32812":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-length"
# string literal
    jmp _L_32814
    .align 8,0x90
_L_32813 :
    .int 52
    .ascii "vector-length"
_L_32814:
    movl $_L_32813, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-length
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32815
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32815:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32816"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32816:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32818
    cmp  $0,%eax
    jge _L_32817
_L_32818:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32817:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32819
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32819:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32820"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32820:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32822
    cmp  $0,%eax
    jge _L_32821
_L_32822:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32821:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "make-vector") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "make-vector")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-vector")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32823"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32823":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-vector"
# string literal
    jmp _L_32825
    .align 8,0x90
_L_32824 :
    .int 44
    .ascii "make-vector"
_L_32825:
    movl $_L_32824, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-vector
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32826
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32826:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32827"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32827:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32829
    cmp  $0,%eax
    jge _L_32828
_L_32829:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32828:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32830
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32830:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32831"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32831:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32833
    cmp  $0,%eax
    jge _L_32832
_L_32833:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32832:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector?") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "vector?") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "vector?")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32834"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32834":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector?"
# string literal
    jmp _L_32836
    .align 8,0x90
_L_32835 :
    .int 28
    .ascii "vector?"
_L_32836:
    movl $_L_32835, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32837
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32837:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32838"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32838:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32840
    cmp  $0,%eax
    jge _L_32839
_L_32840:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32839:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32841
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32841:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32842"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32842:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32844
    cmp  $0,%eax
    jge _L_32843
_L_32844:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32843:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "set-cdr!") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "set-cdr!")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "set-cdr!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32845"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32845":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-cdr!"
# string literal
    jmp _L_32847
    .align 8,0x90
_L_32846 :
    .int 32
    .ascii "set-cdr!"
_L_32847:
    movl $_L_32846, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg set-cdr!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32848
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32848:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32849"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32849:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32851
    cmp  $0,%eax
    jge _L_32850
_L_32851:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32850:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32852
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32852:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32853"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32853:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32855
    cmp  $0,%eax
    jge _L_32854
_L_32855:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32854:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "set-car!") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "set-car!")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "set-car!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32856"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32856":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-car!"
# string literal
    jmp _L_32858
    .align 8,0x90
_L_32857 :
    .int 32
    .ascii "set-car!"
_L_32858:
    movl $_L_32857, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg set-car!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32859
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32859:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32860"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32860:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32862
    cmp  $0,%eax
    jge _L_32861
_L_32862:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32861:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32863
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32863:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32864"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32864:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32866
    cmp  $0,%eax
    jge _L_32865
_L_32866:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32865:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cdr") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "cdr") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "cdr")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cdr")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32867"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32867":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_32869
    .align 8,0x90
_L_32868 :
    .int 12
    .ascii "cdr"
_L_32869:
    movl $_L_32868, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cdr
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32870
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32870:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32871"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32871:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32873
    cmp  $0,%eax
    jge _L_32872
_L_32873:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32872:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32874
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32874:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32875"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32875:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32877
    cmp  $0,%eax
    jge _L_32876
_L_32877:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32876:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "car") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "car") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "car")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "car")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32878"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32878":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_32880
    .align 8,0x90
_L_32879 :
    .int 12
    .ascii "car"
_L_32880:
    movl $_L_32879, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg car
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32881
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32881:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32882"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32882:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32884
    cmp  $0,%eax
    jge _L_32883
_L_32884:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32883:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32885
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32885:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32886"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32886:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32888
    cmp  $0,%eax
    jge _L_32887
_L_32888:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32887:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cons") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "cons") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "cons")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cons")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32889"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32889":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cons"
# string literal
    jmp _L_32891
    .align 8,0x90
_L_32890 :
    .int 16
    .ascii "cons"
_L_32891:
    movl $_L_32890, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cons
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32892
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32892:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32893"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32893:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32895
    cmp  $0,%eax
    jge _L_32894
_L_32895:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32894:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32896
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32896:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32897"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32897:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32899
    cmp  $0,%eax
    jge _L_32898
_L_32899:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32898:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "pair?") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "pair?") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "pair?")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "pair?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32900"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32900":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "pair?"
# string literal
    jmp _L_32902
    .align 8,0x90
_L_32901 :
    .int 20
    .ascii "pair?"
_L_32902:
    movl $_L_32901, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg pair?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32903
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32903:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32904"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32904:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32906
    cmp  $0,%eax
    jge _L_32905
_L_32906:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32905:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32907
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32907:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32908"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32908:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32910
    cmp  $0,%eax
    jge _L_32909
_L_32910:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32909:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "fxremainder") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "fxremainder")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxremainder")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32911"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32911":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxremainder"
# string literal
    jmp _L_32913
    .align 8,0x90
_L_32912 :
    .int 44
    .ascii "fxremainder"
_L_32913:
    movl $_L_32912, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxremainder
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32914
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32914:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32915"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32915:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32917
    cmp  $0,%eax
    jge _L_32916
_L_32917:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32916:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32918
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32918:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32919"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32919:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32921
    cmp  $0,%eax
    jge _L_32920
_L_32921:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32920:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "fxquotient") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "fxquotient")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxquotient")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32922"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32922":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxquotient"
# string literal
    jmp _L_32924
    .align 8,0x90
_L_32923 :
    .int 40
    .ascii "fxquotient"
_L_32924:
    movl $_L_32923, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxquotient
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32925
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32925:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32926"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32926:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32928
    cmp  $0,%eax
    jge _L_32927
_L_32928:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32927:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32929
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32929:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32930"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32930:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32932
    cmp  $0,%eax
    jge _L_32931
_L_32932:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32931:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx*") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "fx*") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "fx*")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx*")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32933"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32933":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx*"
# string literal
    jmp _L_32935
    .align 8,0x90
_L_32934 :
    .int 12
    .ascii "fx*"
_L_32935:
    movl $_L_32934, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx*
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32936
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32936:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32937"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32937:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32939
    cmp  $0,%eax
    jge _L_32938
_L_32939:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32938:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32940
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32940:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32941"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32941:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32943
    cmp  $0,%eax
    jge _L_32942
_L_32943:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32942:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx-") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "fx-") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "fx-")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx-")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32944"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32944":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx-"
# string literal
    jmp _L_32946
    .align 8,0x90
_L_32945 :
    .int 12
    .ascii "fx-"
_L_32946:
    movl $_L_32945, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx-
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32947
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32947:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32948"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32948:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32950
    cmp  $0,%eax
    jge _L_32949
_L_32950:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32949:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32951
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32951:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32952"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32952:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32954
    cmp  $0,%eax
    jge _L_32953
_L_32954:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32953:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx+") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "fx+") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "fx+")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx+")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32955"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32955":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx+"
# string literal
    jmp _L_32957
    .align 8,0x90
_L_32956 :
    .int 12
    .ascii "fx+"
_L_32957:
    movl $_L_32956, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx+
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32958
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32958:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32959"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32959:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32961
    cmp  $0,%eax
    jge _L_32960
_L_32961:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32960:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32962
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32962:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32963"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32963:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32965
    cmp  $0,%eax
    jge _L_32964
_L_32965:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32964:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "fx>=") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "fx>=")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx>=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32966"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32966":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>="
# string literal
    jmp _L_32968
    .align 8,0x90
_L_32967 :
    .int 16
    .ascii "fx>="
_L_32968:
    movl $_L_32967, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx>=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32969
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32969:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32970"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32970:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32972
    cmp  $0,%eax
    jge _L_32971
_L_32972:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32971:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32973
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32973:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32974"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32974:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32976
    cmp  $0,%eax
    jge _L_32975
_L_32976:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32975:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx>") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "fx>") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "fx>")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx>")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32977"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32977":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>"
# string literal
    jmp _L_32979
    .align 8,0x90
_L_32978 :
    .int 12
    .ascii "fx>"
_L_32979:
    movl $_L_32978, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx>
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32980
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32980:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32981"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32981:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32983
    cmp  $0,%eax
    jge _L_32982
_L_32983:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32982:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32984
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32984:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32985"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32985:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32987
    cmp  $0,%eax
    jge _L_32986
_L_32987:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32986:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "fx<=") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "fx<=")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx<=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32988"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32988":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<="
# string literal
    jmp _L_32990
    .align 8,0x90
_L_32989 :
    .int 16
    .ascii "fx<="
_L_32990:
    movl $_L_32989, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx<=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32991
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32991:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32992"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32992:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32994
    cmp  $0,%eax
    jge _L_32993
_L_32994:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32993:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_32995
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32995:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_32996"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_32996:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_32998
    cmp  $0,%eax
    jge _L_32997
_L_32998:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_32997:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx<") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "fx<") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "fx<")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx<")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_32999"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_32999":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<"
# string literal
    jmp _L_33001
    .align 8,0x90
_L_33000 :
    .int 12
    .ascii "fx<"
_L_33001:
    movl $_L_33000, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx<
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33002
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33002:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33003"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33003:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33005
    cmp  $0,%eax
    jge _L_33004
_L_33005:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33004:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33006
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33006:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33007"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33007:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33009
    cmp  $0,%eax
    jge _L_33008
_L_33009:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33008:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx=") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "fx=") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "fx=")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33010"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33010":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx="
# string literal
    jmp _L_33012
    .align 8,0x90
_L_33011 :
    .int 12
    .ascii "fx="
_L_33012:
    movl $_L_33011, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33013
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33013:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33014"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33014:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33016
    cmp  $0,%eax
    jge _L_33015
_L_33016:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33015:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33017
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33017:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33018"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33018:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33020
    cmp  $0,%eax
    jge _L_33019
_L_33020:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33019:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "fxzero?") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "fxzero?")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxzero?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33021"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33021":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxzero?"
# string literal
    jmp _L_33023
    .align 8,0x90
_L_33022 :
    .int 28
    .ascii "fxzero?"
_L_33023:
    movl $_L_33022, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxzero?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33024
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33024:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33025"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33025:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33027
    cmp  $0,%eax
    jge _L_33026
_L_33027:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33026:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33028
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33028:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33029"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33029:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33031
    cmp  $0,%eax
    jge _L_33030
_L_33031:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33030:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "fxsub1") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "fxsub1")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxsub1")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33032"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33032":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxsub1"
# string literal
    jmp _L_33034
    .align 8,0x90
_L_33033 :
    .int 24
    .ascii "fxsub1"
_L_33034:
    movl $_L_33033, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxsub1
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33035
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33035:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33036"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33036:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33038
    cmp  $0,%eax
    jge _L_33037
_L_33038:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33037:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33039
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33039:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33040"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33040:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33042
    cmp  $0,%eax
    jge _L_33041
_L_33042:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33041:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "fxadd1") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "fxadd1")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxadd1")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33043"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33043":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxadd1"
# string literal
    jmp _L_33045
    .align 8,0x90
_L_33044 :
    .int 24
    .ascii "fxadd1"
_L_33045:
    movl $_L_33044, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxadd1
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33046
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33046:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33047"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33047:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33049
    cmp  $0,%eax
    jge _L_33048
_L_33049:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33048:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33050
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33050:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33051"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33051:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33053
    cmp  $0,%eax
    jge _L_33052
_L_33053:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33052:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "fxlogor") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "fxlogor")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlogor")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33054"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33054":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogor"
# string literal
    jmp _L_33056
    .align 8,0x90
_L_33055 :
    .int 28
    .ascii "fxlogor"
_L_33056:
    movl $_L_33055, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlogor
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33057
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33057:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33058"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33058:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33060
    cmp  $0,%eax
    jge _L_33059
_L_33060:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33059:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33061
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33061:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33062"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33062:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33064
    cmp  $0,%eax
    jge _L_33063
_L_33064:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33063:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "fxlogand") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "fxlogand")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlogand")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33065"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33065":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogand"
# string literal
    jmp _L_33067
    .align 8,0x90
_L_33066 :
    .int 32
    .ascii "fxlogand"
_L_33067:
    movl $_L_33066, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlogand
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33068
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33068:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33069"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33069:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33071
    cmp  $0,%eax
    jge _L_33070
_L_33071:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33070:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33072
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33072:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33073"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33073:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33075
    cmp  $0,%eax
    jge _L_33074
_L_33075:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33074:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "fxlognot") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "fxlognot")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlognot")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33076"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33076":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlognot"
# string literal
    jmp _L_33078
    .align 8,0x90
_L_33077 :
    .int 32
    .ascii "fxlognot"
_L_33078:
    movl $_L_33077, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlognot
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33079
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33079:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33080"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33080:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33082
    cmp  $0,%eax
    jge _L_33081
_L_33082:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33081:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33083
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33083:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33084"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33084:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33086
    cmp  $0,%eax
    jge _L_33085
_L_33086:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33085:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char=?") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "char=?") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "char=?")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char=?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33087"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33087":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char=?"
# string literal
    jmp _L_33089
    .align 8,0x90
_L_33088 :
    .int 24
    .ascii "char=?"
_L_33089:
    movl $_L_33088, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char=?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33090
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33090:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33091"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33091:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33093
    cmp  $0,%eax
    jge _L_33092
_L_33093:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33092:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33094
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33094:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33095"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33095:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33097
    cmp  $0,%eax
    jge _L_33096
_L_33097:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33096:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "eq?") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "eq?") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "eq?")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "eq?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33098"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33098":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "eq?"
# string literal
    jmp _L_33100
    .align 8,0x90
_L_33099 :
    .int 12
    .ascii "eq?"
_L_33100:
    movl $_L_33099, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg eq?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33101
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33101:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33102"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33102:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33104
    cmp  $0,%eax
    jge _L_33103
_L_33104:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33103:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33105
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33105:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33106"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33106:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33108
    cmp  $0,%eax
    jge _L_33107
_L_33108:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33107:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "not") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "not") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "not")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "not")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33109"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33109":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "not"
# string literal
    jmp _L_33111
    .align 8,0x90
_L_33110 :
    .int 12
    .ascii "not"
_L_33111:
    movl $_L_33110, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg not
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33112
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33112:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33113"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33113:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33115
    cmp  $0,%eax
    jge _L_33114
_L_33115:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33114:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33116
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33116:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33117"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33117:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33119
    cmp  $0,%eax
    jge _L_33118
_L_33119:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33118:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "boolean?") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "boolean?")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "boolean?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33120"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33120":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "boolean?"
# string literal
    jmp _L_33122
    .align 8,0x90
_L_33121 :
    .int 32
    .ascii "boolean?"
_L_33122:
    movl $_L_33121, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg boolean?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33123
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33123:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33124"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33124:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33126
    cmp  $0,%eax
    jge _L_33125
_L_33126:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33125:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33127
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33127:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33128"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33128:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33130
    cmp  $0,%eax
    jge _L_33129
_L_33130:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33129:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "fixnum?") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "fixnum?")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fixnum?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33131"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33131":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum?"
# string literal
    jmp _L_33133
    .align 8,0x90
_L_33132 :
    .int 28
    .ascii "fixnum?"
_L_33133:
    movl $_L_33132, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fixnum?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33134
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33134:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33135"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33135:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33137
    cmp  $0,%eax
    jge _L_33136
_L_33137:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33136:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33138
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33138:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33139"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33139:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33141
    cmp  $0,%eax
    jge _L_33140
_L_33141:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33140:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char?") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "char?") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "char?")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33142"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33142":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char?"
# string literal
    jmp _L_33144
    .align 8,0x90
_L_33143 :
    .int 20
    .ascii "char?"
_L_33144:
    movl $_L_33143, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33145
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33145:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33146"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33146:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33148
    cmp  $0,%eax
    jge _L_33147
_L_33148:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33147:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33149
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33149:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33150"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33150:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33152
    cmp  $0,%eax
    jge _L_33151
_L_33152:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33151:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "null?") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "null?") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "null?")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "null?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33153"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33153":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "null?"
# string literal
    jmp _L_33155
    .align 8,0x90
_L_33154 :
    .int 20
    .ascii "null?"
_L_33155:
    movl $_L_33154, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg null?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33156
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33156:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33157"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33157:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33159
    cmp  $0,%eax
    jge _L_33158
_L_33159:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33158:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))) (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33160
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33160:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33161"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33161:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33163
    cmp  $0,%eax
    jge _L_33162
_L_33163:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33162:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "char->fixnum") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "char->fixnum")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char->fixnum")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33164"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33164":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char->fixnum"
# string literal
    jmp _L_33166
    .align 8,0x90
_L_33165 :
    .int 48
    .ascii "char->fixnum"
_L_33166:
    movl $_L_33165, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char->fixnum
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33167
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33167:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33168"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33168:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33170
    cmp  $0,%eax
    jge _L_33169
_L_33170:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33169:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))) (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (vector-set! f3969 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0)))
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33171
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33171:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33172"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33172:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33174
    cmp  $0,%eax
    jge _L_33173
_L_33174:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33173:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f3969 0))
# cons arg1=((primitive-ref string->symbol) "fixnum->char") arg2=(vector-ref f3969 0)
# emit-expr ((primitive-ref string->symbol) "fixnum->char")
# funcall
#    si   =-12
#    env  = ((f3969 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fixnum->char")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33175"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33175":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum->char"
# string literal
    jmp _L_33177
    .align 8,0x90
_L_33176 :
    .int 48
    .ascii "fixnum->char"
_L_33177:
    movl $_L_33176, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fixnum->char
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f3969 0)
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33178
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33178:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33179"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33179:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33181
    cmp  $0,%eax
    jge _L_33180
_L_33181:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33180:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (closure () (f3969) (let () (vector-ref f3969 0))))
# emit-begin
#   expr=(begin (closure () (f3969) (let () (vector-ref f3969 0))))
#   env=((f3969 . 0))
# emit-expr (closure () (f3969) (let () (vector-ref f3969 0)))
# emit-closure
# si = -4
# env = ((f3969 . 0))
# expr = (closure () (f3969) (let () (vector-ref f3969 0)))
    movl $_L_33182, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f3969 . 0))
# var=f3969
    movl 0(%esp), %eax  # stack load f3969
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f3969
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_33183            # jump around closure body
_L_33182:
# check argument count
    cmp $0,%eax
    je _L_33184
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_33184:
# emit-tail-expr
# si=-8
# env=((f3969 . 4) (f3969 . 0))
# expr=(let () (vector-ref f3969 0))
# emit-tail-let
#  si   = -8
#  env  = ((f3969 . 4) (f3969 . 0))
#  bindings = ()
#  body = (vector-ref f3969 0)
# emit-tail-expr
# si=-8
# env=((f3969 . 4) (f3969 . 0))
# expr=(vector-ref f3969 0)
# tail primcall
# emit-expr f3969
# emit-variable-ref
# env=((f3969 . 4) (f3969 . 0))
# var=f3969
    movl 2(%edi), %eax  # frame load f3969
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33185
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33185:
    movl %eax, -8(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33186"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33186:
# check bounds on vector index
    movl -8(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33188
    cmp  $0,%eax
    jge _L_33187
_L_33188:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33187:
    movl -8(%esp), %esi
    movl -1(%eax,%esi), %eax
#return from tail (vector-ref f3969 0)
    ret
    .align 4,0x90
_L_33183:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f3969 . 0))
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
    movl $_L_33189, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_33190            # jump around closure body
_L_33189:
# check argument count
    cmp $0,%eax
    je _L_33191
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_33191:
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
    je "_L_33192"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33192":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_33194
    .align 8,0x90
_L_33193 :
    .int 28
    .ascii "funcall"
_L_33194:
    movl $_L_33193, %eax
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
    jmp _L_33196
    .align 8,0x90
_L_33195 :
    .int 100
    .ascii "arg 1 must be a procedure"
_L_33196:
    movl $_L_33195, %eax
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
_L_33190:
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
    movl $_L_33197, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_33198            # jump around closure body
_L_33197:
# check argument count
    cmp $0,%eax
    je _L_33199
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_33199:
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
    je "_L_33200"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33200":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_33202
    .align 8,0x90
_L_33201 :
    .int 28
    .ascii "funcall"
_L_33202:
    movl $_L_33201, %eax
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
    jmp _L_33204
    .align 8,0x90
_L_33203 :
    .int 80
    .ascii "wrong number of args"
_L_33204:
    movl $_L_33203, %eax
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
_L_33198:
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
    movl $_L_33205, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_33206            # jump around closure body
_L_33205:
# check argument count
    cmp $0,%eax
    je _L_33207
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_33207:
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
    je "_L_33208"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33208":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_33210
    .align 8,0x90
_L_33209 :
    .int 28
    .ascii "funcall"
_L_33210:
    movl $_L_33209, %eax
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
    jmp _L_33212
    .align 8,0x90
_L_33211 :
    .int 48
    .ascii "too few args"
_L_33212:
    movl $_L_33211, %eax
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
_L_33206:
     movl %eax, eh$uargcount$umin
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == uniquify-variables  ==>
# (lambda (f3970) (error (list-ref (primitives) f3970) "arg must be a fixnum"))
# == vectorize-letrec  ==>
# (lambda (f3970) (error (list-ref (primitives) f3970) "arg must be a fixnum"))
# == eliminate-set!  ==>
# (lambda (f3970) (let ((f3970 f3970)) (error (list-ref (primitives) f3970) "arg must be a fixnum")))
# == close-free-variables  ==>
# (closure (f3970) (error list-ref primitives) (let ((f3970 f3970)) (error (list-ref (primitives) f3970) "arg must be a fixnum")))
# == eliminate-quote  ==>
# (closure (f3970) (error list-ref primitives) (let ((f3970 f3970)) (error (list-ref (primitives) f3970) "arg must be a fixnum")))
# == eliminate-when/unless  ==>
# (closure (f3970) (error list-ref primitives) (let ((f3970 f3970)) (error (list-ref (primitives) f3970) "arg must be a fixnum")))
# == eliminate-cond  ==>
# (closure (f3970) (error list-ref primitives) (let ((f3970 f3970)) (error (list-ref (primitives) f3970) "arg must be a fixnum")))
# == external-symbols  ==>
# (closure (f3970) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f3970 f3970)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3970) "arg must be a fixnum")))
# emit-expr (closure (f3970) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f3970 f3970)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3970) "arg must be a fixnum")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f3970) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f3970 f3970)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3970) "arg must be a fixnum")))
    movl $_L_33213, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_33214            # jump around closure body
_L_33213:
# check argument count
    cmp $4,%eax
    je _L_33215
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_33215:
# emit-tail-expr
# si=-12
# env=((f3970 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f3970 f3970)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3970) "arg must be a fixnum"))
# emit-tail-let
#  si   = -12
#  env  = ((f3970 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f3970 f3970))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3970) "arg must be a fixnum")
# emit-expr f3970
# emit-variable-ref
# env=((f3970 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f3970
    movl -8(%esp), %eax  # stack load f3970
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f3970 . -12) (f3970 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3970) "arg must be a fixnum")
# emit-tail-funcall
#    si   =-16
#    env  = ((f3970 . -12) (f3970 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3970) "arg must be a fixnum")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f3970)
# funcall
#    si   =-20
#    env  = ((f3970 . -12) (f3970 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f3970)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33216"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33216":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f3970 . -12) (f3970 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33217"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33217":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f3970
# emit-variable-ref
# env=((f3970 . -12) (f3970 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f3970
    movl -12(%esp), %eax  # stack load f3970
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f3970
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f3970)
# emit-expr "arg must be a fixnum"
# string literal
    jmp _L_33219
    .align 8,0x90
_L_33218 :
    .int 80
    .ascii "arg must be a fixnum"
_L_33219:
    movl $_L_33218, %eax
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
_L_33214:
     movl %eax, eh$ufixnum
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == uniquify-variables  ==>
# (lambda (f3971) (error (list-ref (primitives) f3971) "arg must be a string"))
# == vectorize-letrec  ==>
# (lambda (f3971) (error (list-ref (primitives) f3971) "arg must be a string"))
# == eliminate-set!  ==>
# (lambda (f3971) (let ((f3971 f3971)) (error (list-ref (primitives) f3971) "arg must be a string")))
# == close-free-variables  ==>
# (closure (f3971) (error list-ref primitives) (let ((f3971 f3971)) (error (list-ref (primitives) f3971) "arg must be a string")))
# == eliminate-quote  ==>
# (closure (f3971) (error list-ref primitives) (let ((f3971 f3971)) (error (list-ref (primitives) f3971) "arg must be a string")))
# == eliminate-when/unless  ==>
# (closure (f3971) (error list-ref primitives) (let ((f3971 f3971)) (error (list-ref (primitives) f3971) "arg must be a string")))
# == eliminate-cond  ==>
# (closure (f3971) (error list-ref primitives) (let ((f3971 f3971)) (error (list-ref (primitives) f3971) "arg must be a string")))
# == external-symbols  ==>
# (closure (f3971) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f3971 f3971)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3971) "arg must be a string")))
# emit-expr (closure (f3971) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f3971 f3971)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3971) "arg must be a string")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f3971) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f3971 f3971)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3971) "arg must be a string")))
    movl $_L_33220, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_33221            # jump around closure body
_L_33220:
# check argument count
    cmp $4,%eax
    je _L_33222
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_33222:
# emit-tail-expr
# si=-12
# env=((f3971 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f3971 f3971)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3971) "arg must be a string"))
# emit-tail-let
#  si   = -12
#  env  = ((f3971 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f3971 f3971))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3971) "arg must be a string")
# emit-expr f3971
# emit-variable-ref
# env=((f3971 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f3971
    movl -8(%esp), %eax  # stack load f3971
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f3971 . -12) (f3971 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3971) "arg must be a string")
# emit-tail-funcall
#    si   =-16
#    env  = ((f3971 . -12) (f3971 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3971) "arg must be a string")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f3971)
# funcall
#    si   =-20
#    env  = ((f3971 . -12) (f3971 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f3971)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33223"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33223":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f3971 . -12) (f3971 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33224"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33224":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f3971
# emit-variable-ref
# env=((f3971 . -12) (f3971 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f3971
    movl -12(%esp), %eax  # stack load f3971
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f3971
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f3971)
# emit-expr "arg must be a string"
# string literal
    jmp _L_33226
    .align 8,0x90
_L_33225 :
    .int 80
    .ascii "arg must be a string"
_L_33226:
    movl $_L_33225, %eax
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
_L_33221:
     movl %eax, eh$ustring
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == uniquify-variables  ==>
# (lambda (f3972) (error (list-ref (primitives) f3972) "arg must be a character"))
# == vectorize-letrec  ==>
# (lambda (f3972) (error (list-ref (primitives) f3972) "arg must be a character"))
# == eliminate-set!  ==>
# (lambda (f3972) (let ((f3972 f3972)) (error (list-ref (primitives) f3972) "arg must be a character")))
# == close-free-variables  ==>
# (closure (f3972) (error list-ref primitives) (let ((f3972 f3972)) (error (list-ref (primitives) f3972) "arg must be a character")))
# == eliminate-quote  ==>
# (closure (f3972) (error list-ref primitives) (let ((f3972 f3972)) (error (list-ref (primitives) f3972) "arg must be a character")))
# == eliminate-when/unless  ==>
# (closure (f3972) (error list-ref primitives) (let ((f3972 f3972)) (error (list-ref (primitives) f3972) "arg must be a character")))
# == eliminate-cond  ==>
# (closure (f3972) (error list-ref primitives) (let ((f3972 f3972)) (error (list-ref (primitives) f3972) "arg must be a character")))
# == external-symbols  ==>
# (closure (f3972) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f3972 f3972)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3972) "arg must be a character")))
# emit-expr (closure (f3972) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f3972 f3972)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3972) "arg must be a character")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f3972) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f3972 f3972)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3972) "arg must be a character")))
    movl $_L_33227, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_33228            # jump around closure body
_L_33227:
# check argument count
    cmp $4,%eax
    je _L_33229
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_33229:
# emit-tail-expr
# si=-12
# env=((f3972 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f3972 f3972)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3972) "arg must be a character"))
# emit-tail-let
#  si   = -12
#  env  = ((f3972 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f3972 f3972))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3972) "arg must be a character")
# emit-expr f3972
# emit-variable-ref
# env=((f3972 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f3972
    movl -8(%esp), %eax  # stack load f3972
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f3972 . -12) (f3972 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3972) "arg must be a character")
# emit-tail-funcall
#    si   =-16
#    env  = ((f3972 . -12) (f3972 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3972) "arg must be a character")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f3972)
# funcall
#    si   =-20
#    env  = ((f3972 . -12) (f3972 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f3972)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33230"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33230":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f3972 . -12) (f3972 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33231"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33231":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f3972
# emit-variable-ref
# env=((f3972 . -12) (f3972 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f3972
    movl -12(%esp), %eax  # stack load f3972
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f3972
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f3972)
# emit-expr "arg must be a character"
# string literal
    jmp _L_33233
    .align 8,0x90
_L_33232 :
    .int 92
    .ascii "arg must be a character"
_L_33233:
    movl $_L_33232, %eax
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
_L_33228:
     movl %eax, eh$ucharacter
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == uniquify-variables  ==>
# (lambda (f3973) (error (list-ref (primitives) f3973) "arg must be a pair"))
# == vectorize-letrec  ==>
# (lambda (f3973) (error (list-ref (primitives) f3973) "arg must be a pair"))
# == eliminate-set!  ==>
# (lambda (f3973) (let ((f3973 f3973)) (error (list-ref (primitives) f3973) "arg must be a pair")))
# == close-free-variables  ==>
# (closure (f3973) (error list-ref primitives) (let ((f3973 f3973)) (error (list-ref (primitives) f3973) "arg must be a pair")))
# == eliminate-quote  ==>
# (closure (f3973) (error list-ref primitives) (let ((f3973 f3973)) (error (list-ref (primitives) f3973) "arg must be a pair")))
# == eliminate-when/unless  ==>
# (closure (f3973) (error list-ref primitives) (let ((f3973 f3973)) (error (list-ref (primitives) f3973) "arg must be a pair")))
# == eliminate-cond  ==>
# (closure (f3973) (error list-ref primitives) (let ((f3973 f3973)) (error (list-ref (primitives) f3973) "arg must be a pair")))
# == external-symbols  ==>
# (closure (f3973) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f3973 f3973)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3973) "arg must be a pair")))
# emit-expr (closure (f3973) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f3973 f3973)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3973) "arg must be a pair")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f3973) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f3973 f3973)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3973) "arg must be a pair")))
    movl $_L_33234, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_33235            # jump around closure body
_L_33234:
# check argument count
    cmp $4,%eax
    je _L_33236
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_33236:
# emit-tail-expr
# si=-12
# env=((f3973 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f3973 f3973)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3973) "arg must be a pair"))
# emit-tail-let
#  si   = -12
#  env  = ((f3973 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f3973 f3973))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3973) "arg must be a pair")
# emit-expr f3973
# emit-variable-ref
# env=((f3973 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f3973
    movl -8(%esp), %eax  # stack load f3973
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f3973 . -12) (f3973 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3973) "arg must be a pair")
# emit-tail-funcall
#    si   =-16
#    env  = ((f3973 . -12) (f3973 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3973) "arg must be a pair")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f3973)
# funcall
#    si   =-20
#    env  = ((f3973 . -12) (f3973 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f3973)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33237"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33237":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f3973 . -12) (f3973 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33238"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33238":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f3973
# emit-variable-ref
# env=((f3973 . -12) (f3973 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f3973
    movl -12(%esp), %eax  # stack load f3973
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f3973
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f3973)
# emit-expr "arg must be a pair"
# string literal
    jmp _L_33240
    .align 8,0x90
_L_33239 :
    .int 72
    .ascii "arg must be a pair"
_L_33240:
    movl $_L_33239, %eax
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
_L_33235:
     movl %eax, eh$upair
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == uniquify-variables  ==>
# (lambda (f3974) (error (list-ref (primitives) f3974) "arg must be a vector"))
# == vectorize-letrec  ==>
# (lambda (f3974) (error (list-ref (primitives) f3974) "arg must be a vector"))
# == eliminate-set!  ==>
# (lambda (f3974) (let ((f3974 f3974)) (error (list-ref (primitives) f3974) "arg must be a vector")))
# == close-free-variables  ==>
# (closure (f3974) (error list-ref primitives) (let ((f3974 f3974)) (error (list-ref (primitives) f3974) "arg must be a vector")))
# == eliminate-quote  ==>
# (closure (f3974) (error list-ref primitives) (let ((f3974 f3974)) (error (list-ref (primitives) f3974) "arg must be a vector")))
# == eliminate-when/unless  ==>
# (closure (f3974) (error list-ref primitives) (let ((f3974 f3974)) (error (list-ref (primitives) f3974) "arg must be a vector")))
# == eliminate-cond  ==>
# (closure (f3974) (error list-ref primitives) (let ((f3974 f3974)) (error (list-ref (primitives) f3974) "arg must be a vector")))
# == external-symbols  ==>
# (closure (f3974) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f3974 f3974)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3974) "arg must be a vector")))
# emit-expr (closure (f3974) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f3974 f3974)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3974) "arg must be a vector")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f3974) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f3974 f3974)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3974) "arg must be a vector")))
    movl $_L_33241, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_33242            # jump around closure body
_L_33241:
# check argument count
    cmp $4,%eax
    je _L_33243
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_33243:
# emit-tail-expr
# si=-12
# env=((f3974 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f3974 f3974)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3974) "arg must be a vector"))
# emit-tail-let
#  si   = -12
#  env  = ((f3974 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f3974 f3974))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3974) "arg must be a vector")
# emit-expr f3974
# emit-variable-ref
# env=((f3974 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f3974
    movl -8(%esp), %eax  # stack load f3974
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f3974 . -12) (f3974 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3974) "arg must be a vector")
# emit-tail-funcall
#    si   =-16
#    env  = ((f3974 . -12) (f3974 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3974) "arg must be a vector")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f3974)
# funcall
#    si   =-20
#    env  = ((f3974 . -12) (f3974 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f3974)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33244"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33244":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f3974 . -12) (f3974 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33245"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33245":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f3974
# emit-variable-ref
# env=((f3974 . -12) (f3974 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f3974
    movl -12(%esp), %eax  # stack load f3974
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f3974
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f3974)
# emit-expr "arg must be a vector"
# string literal
    jmp _L_33247
    .align 8,0x90
_L_33246 :
    .int 80
    .ascii "arg must be a vector"
_L_33247:
    movl $_L_33246, %eax
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
_L_33242:
     movl %eax, eh$uvector
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == uniquify-variables  ==>
# (lambda (f3975) (error (list-ref (primitives) f3975) "length must be a fixnum >= 0"))
# == vectorize-letrec  ==>
# (lambda (f3975) (error (list-ref (primitives) f3975) "length must be a fixnum >= 0"))
# == eliminate-set!  ==>
# (lambda (f3975) (let ((f3975 f3975)) (error (list-ref (primitives) f3975) "length must be a fixnum >= 0")))
# == close-free-variables  ==>
# (closure (f3975) (error list-ref primitives) (let ((f3975 f3975)) (error (list-ref (primitives) f3975) "length must be a fixnum >= 0")))
# == eliminate-quote  ==>
# (closure (f3975) (error list-ref primitives) (let ((f3975 f3975)) (error (list-ref (primitives) f3975) "length must be a fixnum >= 0")))
# == eliminate-when/unless  ==>
# (closure (f3975) (error list-ref primitives) (let ((f3975 f3975)) (error (list-ref (primitives) f3975) "length must be a fixnum >= 0")))
# == eliminate-cond  ==>
# (closure (f3975) (error list-ref primitives) (let ((f3975 f3975)) (error (list-ref (primitives) f3975) "length must be a fixnum >= 0")))
# == external-symbols  ==>
# (closure (f3975) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f3975 f3975)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3975) "length must be a fixnum >= 0")))
# emit-expr (closure (f3975) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f3975 f3975)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3975) "length must be a fixnum >= 0")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f3975) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f3975 f3975)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3975) "length must be a fixnum >= 0")))
    movl $_L_33248, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_33249            # jump around closure body
_L_33248:
# check argument count
    cmp $4,%eax
    je _L_33250
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_33250:
# emit-tail-expr
# si=-12
# env=((f3975 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f3975 f3975)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3975) "length must be a fixnum >= 0"))
# emit-tail-let
#  si   = -12
#  env  = ((f3975 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f3975 f3975))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3975) "length must be a fixnum >= 0")
# emit-expr f3975
# emit-variable-ref
# env=((f3975 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f3975
    movl -8(%esp), %eax  # stack load f3975
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f3975 . -12) (f3975 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3975) "length must be a fixnum >= 0")
# emit-tail-funcall
#    si   =-16
#    env  = ((f3975 . -12) (f3975 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3975) "length must be a fixnum >= 0")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f3975)
# funcall
#    si   =-20
#    env  = ((f3975 . -12) (f3975 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f3975)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33251"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33251":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f3975 . -12) (f3975 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33252"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33252":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f3975
# emit-variable-ref
# env=((f3975 . -12) (f3975 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f3975
    movl -12(%esp), %eax  # stack load f3975
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f3975
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f3975)
# emit-expr "length must be a fixnum >= 0"
# string literal
    jmp _L_33254
    .align 8,0x90
_L_33253 :
    .int 112
    .ascii "length must be a fixnum >= 0"
_L_33254:
    movl $_L_33253, %eax
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
_L_33249:
     movl %eax, eh$ulength
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == uniquify-variables  ==>
# (lambda (f3976) (error (list-ref (primitives) f3976) "index out of bounds"))
# == vectorize-letrec  ==>
# (lambda (f3976) (error (list-ref (primitives) f3976) "index out of bounds"))
# == eliminate-set!  ==>
# (lambda (f3976) (let ((f3976 f3976)) (error (list-ref (primitives) f3976) "index out of bounds")))
# == close-free-variables  ==>
# (closure (f3976) (error list-ref primitives) (let ((f3976 f3976)) (error (list-ref (primitives) f3976) "index out of bounds")))
# == eliminate-quote  ==>
# (closure (f3976) (error list-ref primitives) (let ((f3976 f3976)) (error (list-ref (primitives) f3976) "index out of bounds")))
# == eliminate-when/unless  ==>
# (closure (f3976) (error list-ref primitives) (let ((f3976 f3976)) (error (list-ref (primitives) f3976) "index out of bounds")))
# == eliminate-cond  ==>
# (closure (f3976) (error list-ref primitives) (let ((f3976 f3976)) (error (list-ref (primitives) f3976) "index out of bounds")))
# == external-symbols  ==>
# (closure (f3976) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f3976 f3976)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3976) "index out of bounds")))
# emit-expr (closure (f3976) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f3976 f3976)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3976) "index out of bounds")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f3976) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f3976 f3976)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3976) "index out of bounds")))
    movl $_L_33255, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_33256            # jump around closure body
_L_33255:
# check argument count
    cmp $4,%eax
    je _L_33257
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_33257:
# emit-tail-expr
# si=-12
# env=((f3976 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f3976 f3976)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3976) "index out of bounds"))
# emit-tail-let
#  si   = -12
#  env  = ((f3976 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f3976 f3976))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3976) "index out of bounds")
# emit-expr f3976
# emit-variable-ref
# env=((f3976 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f3976
    movl -8(%esp), %eax  # stack load f3976
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f3976 . -12) (f3976 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3976) "index out of bounds")
# emit-tail-funcall
#    si   =-16
#    env  = ((f3976 . -12) (f3976 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3976) "index out of bounds")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f3976)
# funcall
#    si   =-20
#    env  = ((f3976 . -12) (f3976 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f3976)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33258"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33258":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f3976 . -12) (f3976 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33259"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33259":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f3976
# emit-variable-ref
# env=((f3976 . -12) (f3976 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f3976
    movl -12(%esp), %eax  # stack load f3976
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f3976
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f3976)
# emit-expr "index out of bounds"
# string literal
    jmp _L_33261
    .align 8,0x90
_L_33260 :
    .int 76
    .ascii "index out of bounds"
_L_33261:
    movl $_L_33260, %eax
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
_L_33256:
     movl %eax, eh$uvector$uindex
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == uniquify-variables  ==>
# (lambda (f3977) (error (list-ref (primitives) f3977) "index out of bounds"))
# == vectorize-letrec  ==>
# (lambda (f3977) (error (list-ref (primitives) f3977) "index out of bounds"))
# == eliminate-set!  ==>
# (lambda (f3977) (let ((f3977 f3977)) (error (list-ref (primitives) f3977) "index out of bounds")))
# == close-free-variables  ==>
# (closure (f3977) (error list-ref primitives) (let ((f3977 f3977)) (error (list-ref (primitives) f3977) "index out of bounds")))
# == eliminate-quote  ==>
# (closure (f3977) (error list-ref primitives) (let ((f3977 f3977)) (error (list-ref (primitives) f3977) "index out of bounds")))
# == eliminate-when/unless  ==>
# (closure (f3977) (error list-ref primitives) (let ((f3977 f3977)) (error (list-ref (primitives) f3977) "index out of bounds")))
# == eliminate-cond  ==>
# (closure (f3977) (error list-ref primitives) (let ((f3977 f3977)) (error (list-ref (primitives) f3977) "index out of bounds")))
# == external-symbols  ==>
# (closure (f3977) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f3977 f3977)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3977) "index out of bounds")))
# emit-expr (closure (f3977) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f3977 f3977)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3977) "index out of bounds")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f3977) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f3977 f3977)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3977) "index out of bounds")))
    movl $_L_33262, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_33263            # jump around closure body
_L_33262:
# check argument count
    cmp $4,%eax
    je _L_33264
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_33264:
# emit-tail-expr
# si=-12
# env=((f3977 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f3977 f3977)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3977) "index out of bounds"))
# emit-tail-let
#  si   = -12
#  env  = ((f3977 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f3977 f3977))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3977) "index out of bounds")
# emit-expr f3977
# emit-variable-ref
# env=((f3977 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f3977
    movl -8(%esp), %eax  # stack load f3977
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f3977 . -12) (f3977 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3977) "index out of bounds")
# emit-tail-funcall
#    si   =-16
#    env  = ((f3977 . -12) (f3977 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f3977) "index out of bounds")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f3977)
# funcall
#    si   =-20
#    env  = ((f3977 . -12) (f3977 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f3977)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33265"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33265":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f3977 . -12) (f3977 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33266"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33266":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f3977
# emit-variable-ref
# env=((f3977 . -12) (f3977 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f3977
    movl -12(%esp), %eax  # stack load f3977
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f3977
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f3977)
# emit-expr "index out of bounds"
# string literal
    jmp _L_33268
    .align 8,0x90
_L_33267 :
    .int 76
    .ascii "index out of bounds"
_L_33268:
    movl $_L_33267, %eax
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
_L_33263:
     movl %eax, eh$ustring$uindex
# == explicit-begins  ==>
# (let ((p (make-vector 6)) (sz 1024)) (begin (vector-set! p 0 (quote output-port)) (vector-set! p 1 "/dev/stdout") (vector-set! p 2 1) (vector-set! p 3 (make-string sz)) (vector-set! p 4 0) (vector-set! p 5 sz) p))
# == eliminate-let*  ==>
# (let ((p (make-vector 6)) (sz 1024)) (begin (vector-set! p 0 (quote output-port)) (vector-set! p 1 "/dev/stdout") (vector-set! p 2 1) (vector-set! p 3 (make-string sz)) (vector-set! p 4 0) (vector-set! p 5 sz) p))
# == uniquify-variables  ==>
# (let ((f3979 (make-vector 6)) (f3978 1024)) (begin (vector-set! f3979 0 (quote output-port)) (vector-set! f3979 1 "/dev/stdout") (vector-set! f3979 2 1) (vector-set! f3979 3 (make-string f3978)) (vector-set! f3979 4 0) (vector-set! f3979 5 f3978) f3979))
# == vectorize-letrec  ==>
# (let ((f3979 (make-vector 6)) (f3978 1024)) (begin (vector-set! f3979 0 (quote output-port)) (vector-set! f3979 1 "/dev/stdout") (vector-set! f3979 2 1) (vector-set! f3979 3 (make-string f3978)) (vector-set! f3979 4 0) (vector-set! f3979 5 f3978) f3979))
# == eliminate-set!  ==>
# (let ((f3979 (make-vector 6)) (f3978 1024)) (begin (vector-set! f3979 0 (quote output-port)) (vector-set! f3979 1 "/dev/stdout") (vector-set! f3979 2 1) (vector-set! f3979 3 (make-string f3978)) (vector-set! f3979 4 0) (vector-set! f3979 5 f3978) f3979))
# == close-free-variables  ==>
# (let ((f3979 (make-vector 6)) (f3978 1024)) (begin (vector-set! f3979 0 (quote output-port)) (vector-set! f3979 1 "/dev/stdout") (vector-set! f3979 2 1) (vector-set! f3979 3 (make-string f3978)) (vector-set! f3979 4 0) (vector-set! f3979 5 f3978) f3979))
# == eliminate-quote  ==>
# (let ((f3979 (make-vector 6)) (f3978 1024)) (begin (vector-set! f3979 0 (string->symbol "output-port")) (vector-set! f3979 1 "/dev/stdout") (vector-set! f3979 2 1) (vector-set! f3979 3 (make-string f3978)) (vector-set! f3979 4 0) (vector-set! f3979 5 f3978) f3979))
# == eliminate-when/unless  ==>
# (let ((f3979 (make-vector 6)) (f3978 1024)) (begin (vector-set! f3979 0 (string->symbol "output-port")) (vector-set! f3979 1 "/dev/stdout") (vector-set! f3979 2 1) (vector-set! f3979 3 (make-string f3978)) (vector-set! f3979 4 0) (vector-set! f3979 5 f3978) f3979))
# == eliminate-cond  ==>
# (let ((f3979 (make-vector 6)) (f3978 1024)) (begin (vector-set! f3979 0 (string->symbol "output-port")) (vector-set! f3979 1 "/dev/stdout") (vector-set! f3979 2 1) (vector-set! f3979 3 (make-string f3978)) (vector-set! f3979 4 0) (vector-set! f3979 5 f3978) f3979))
# == external-symbols  ==>
# (let ((f3979 (make-vector 6)) (f3978 1024)) (begin (vector-set! f3979 0 ((primitive-ref string->symbol) "output-port")) (vector-set! f3979 1 "/dev/stdout") (vector-set! f3979 2 1) (vector-set! f3979 3 (make-string f3978)) (vector-set! f3979 4 0) (vector-set! f3979 5 f3978) f3979))
# emit-expr (let ((f3979 (make-vector 6)) (f3978 1024)) (begin (vector-set! f3979 0 ((primitive-ref string->symbol) "output-port")) (vector-set! f3979 1 "/dev/stdout") (vector-set! f3979 2 1) (vector-set! f3979 3 (make-string f3978)) (vector-set! f3979 4 0) (vector-set! f3979 5 f3978) f3979))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f3979 (make-vector 6)) (f3978 1024))
#  body = (begin (vector-set! f3979 0 ((primitive-ref string->symbol) "output-port")) (vector-set! f3979 1 "/dev/stdout") (vector-set! f3979 2 1) (vector-set! f3979 3 (make-string f3978)) (vector-set! f3979 4 0) (vector-set! f3979 5 f3978) f3979)
# emit-expr (make-vector 6)
# make-vector 6
# emit-expr 6
    movl $24, %eax     # immed 6
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33269"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33269:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_33270
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33270:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr 1024
    movl $4096, %eax     # immed 1024
    movl %eax, -4(%esp)  # stack save
# emit-expr (begin (vector-set! f3979 0 ((primitive-ref string->symbol) "output-port")) (vector-set! f3979 1 "/dev/stdout") (vector-set! f3979 2 1) (vector-set! f3979 3 (make-string f3978)) (vector-set! f3979 4 0) (vector-set! f3979 5 f3978) f3979)
# emit-begin
#   expr=(begin (vector-set! f3979 0 ((primitive-ref string->symbol) "output-port")) (vector-set! f3979 1 "/dev/stdout") (vector-set! f3979 2 1) (vector-set! f3979 3 (make-string f3978)) (vector-set! f3979 4 0) (vector-set! f3979 5 f3978) f3979)
#   env=((f3978 . -4) (f3979 . 0))
# emit-expr (vector-set! f3979 0 ((primitive-ref string->symbol) "output-port"))
# emit-expr f3979
# emit-variable-ref
# env=((f3978 . -4) (f3979 . 0))
# var=f3979
    movl 0(%esp), %eax  # stack load f3979
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33271
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33271:
    movl %eax, -8(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33272"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33272:
# check bounds on vector index
    movl -8(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33274
    cmp  $0,%eax
    jge _L_33273
_L_33274:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33273:
    movl %eax, -12(%esp)
# emit-expr ((primitive-ref string->symbol) "output-port")
# funcall
#    si   =-16
#    env  = ((f3978 . -4) (f3979 . 0))
#    expr = (funcall (primitive-ref string->symbol) "output-port")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33275"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33275":
   movl %eax,  -24(%esp)  # stash funcall-oper in closure slot
# emit-expr "output-port"
# string literal
    jmp _L_33277
    .align 8,0x90
_L_33276 :
    .int 44
    .ascii "output-port"
_L_33277:
    movl $_L_33276, %eax
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
# emit-expr (begin (vector-set! f3979 1 "/dev/stdout") (vector-set! f3979 2 1) (vector-set! f3979 3 (make-string f3978)) (vector-set! f3979 4 0) (vector-set! f3979 5 f3978) f3979)
# emit-begin
#   expr=(begin (vector-set! f3979 1 "/dev/stdout") (vector-set! f3979 2 1) (vector-set! f3979 3 (make-string f3978)) (vector-set! f3979 4 0) (vector-set! f3979 5 f3978) f3979)
#   env=((f3978 . -4) (f3979 . 0))
# emit-expr (vector-set! f3979 1 "/dev/stdout")
# emit-expr f3979
# emit-variable-ref
# env=((f3978 . -4) (f3979 . 0))
# var=f3979
    movl 0(%esp), %eax  # stack load f3979
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33278
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33278:
    movl %eax, -8(%esp)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33279"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33279:
# check bounds on vector index
    movl -8(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33281
    cmp  $0,%eax
    jge _L_33280
_L_33281:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33280:
    movl %eax, -12(%esp)
# emit-expr "/dev/stdout"
# string literal
    jmp _L_33283
    .align 8,0x90
_L_33282 :
    .int 44
    .ascii "/dev/stdout"
_L_33283:
    movl $_L_33282, %eax
    orl $6, %eax
    movl -8(%esp), %ebx
    movl -12(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3979 2 1) (vector-set! f3979 3 (make-string f3978)) (vector-set! f3979 4 0) (vector-set! f3979 5 f3978) f3979)
# emit-begin
#   expr=(begin (vector-set! f3979 2 1) (vector-set! f3979 3 (make-string f3978)) (vector-set! f3979 4 0) (vector-set! f3979 5 f3978) f3979)
#   env=((f3978 . -4) (f3979 . 0))
# emit-expr (vector-set! f3979 2 1)
# emit-expr f3979
# emit-variable-ref
# env=((f3978 . -4) (f3979 . 0))
# var=f3979
    movl 0(%esp), %eax  # stack load f3979
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33284
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33284:
    movl %eax, -8(%esp)
# emit-expr 2
    movl $8, %eax     # immed 2
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33285"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33285:
# check bounds on vector index
    movl -8(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33287
    cmp  $0,%eax
    jge _L_33286
_L_33287:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33286:
    movl %eax, -12(%esp)
# emit-expr 1
    movl $4, %eax     # immed 1
    movl -8(%esp), %ebx
    movl -12(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3979 3 (make-string f3978)) (vector-set! f3979 4 0) (vector-set! f3979 5 f3978) f3979)
# emit-begin
#   expr=(begin (vector-set! f3979 3 (make-string f3978)) (vector-set! f3979 4 0) (vector-set! f3979 5 f3978) f3979)
#   env=((f3978 . -4) (f3979 . 0))
# emit-expr (vector-set! f3979 3 (make-string f3978))
# emit-expr f3979
# emit-variable-ref
# env=((f3978 . -4) (f3979 . 0))
# var=f3979
    movl 0(%esp), %eax  # stack load f3979
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33288
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33288:
    movl %eax, -8(%esp)
# emit-expr 3
    movl $12, %eax     # immed 3
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33289"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33289:
# check bounds on vector index
    movl -8(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33291
    cmp  $0,%eax
    jge _L_33290
_L_33291:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33290:
    movl %eax, -12(%esp)
# emit-expr (make-string f3978)
# make-string len=f3978
# emit-expr f3978
# emit-variable-ref
# env=((f3978 . -4) (f3979 . 0))
# var=f3978
    movl -4(%esp), %eax  # stack load f3978
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33292"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33292:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_33293
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33293:
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
# emit-expr (begin (vector-set! f3979 4 0) (vector-set! f3979 5 f3978) f3979)
# emit-begin
#   expr=(begin (vector-set! f3979 4 0) (vector-set! f3979 5 f3978) f3979)
#   env=((f3978 . -4) (f3979 . 0))
# emit-expr (vector-set! f3979 4 0)
# emit-expr f3979
# emit-variable-ref
# env=((f3978 . -4) (f3979 . 0))
# var=f3979
    movl 0(%esp), %eax  # stack load f3979
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33294
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33294:
    movl %eax, -8(%esp)
# emit-expr 4
    movl $16, %eax     # immed 4
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33295"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33295:
# check bounds on vector index
    movl -8(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33297
    cmp  $0,%eax
    jge _L_33296
_L_33297:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33296:
    movl %eax, -12(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl -8(%esp), %ebx
    movl -12(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f3979 5 f3978) f3979)
# emit-begin
#   expr=(begin (vector-set! f3979 5 f3978) f3979)
#   env=((f3978 . -4) (f3979 . 0))
# emit-expr (vector-set! f3979 5 f3978)
# emit-expr f3979
# emit-variable-ref
# env=((f3978 . -4) (f3979 . 0))
# var=f3979
    movl 0(%esp), %eax  # stack load f3979
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33298
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33298:
    movl %eax, -8(%esp)
# emit-expr 5
    movl $20, %eax     # immed 5
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33299"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33299:
# check bounds on vector index
    movl -8(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33301
    cmp  $0,%eax
    jge _L_33300
_L_33301:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33300:
    movl %eax, -12(%esp)
# emit-expr f3978
# emit-variable-ref
# env=((f3978 . -4) (f3979 . 0))
# var=f3978
    movl -4(%esp), %eax  # stack load f3978
# end emit-variable-ref
    movl -8(%esp), %ebx
    movl -12(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin f3979)
# emit-begin
#   expr=(begin f3979)
#   env=((f3978 . -4) (f3979 . 0))
# emit-expr f3979
# emit-variable-ref
# env=((f3978 . -4) (f3979 . 0))
# var=f3979
    movl 0(%esp), %eax  # stack load f3979
# end emit-variable-ref
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f3978 . -4) (f3979 . 0))
     movl %eax, standard$mout
# == explicit-begins  ==>
# (let ((current-out standard-out)) (lambda () current-out))
# == eliminate-let*  ==>
# (let ((current-out standard-out)) (lambda () current-out))
# == uniquify-variables  ==>
# (let ((f3980 standard-out)) (lambda () f3980))
# == vectorize-letrec  ==>
# (let ((f3980 standard-out)) (lambda () f3980))
# == eliminate-set!  ==>
# (let ((f3980 standard-out)) (lambda () (let () f3980)))
# == close-free-variables  ==>
# (let ((f3980 standard-out)) (closure () (f3980) (let () f3980)))
# == eliminate-quote  ==>
# (let ((f3980 standard-out)) (closure () (f3980) (let () f3980)))
# == eliminate-when/unless  ==>
# (let ((f3980 standard-out)) (closure () (f3980) (let () f3980)))
# == eliminate-cond  ==>
# (let ((f3980 standard-out)) (closure () (f3980) (let () f3980)))
# == external-symbols  ==>
# (let ((f3980 (primitive-ref standard-out))) (closure () (f3980) (let () f3980)))
# emit-expr (let ((f3980 (primitive-ref standard-out))) (closure () (f3980) (let () f3980)))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f3980 (primitive-ref standard-out)))
#  body = (closure () (f3980) (let () f3980))
# emit-expr (primitive-ref standard-out)
    .extern standard$mout
    movl standard$mout,%eax
    movl %eax, 0(%esp)  # stack save
# emit-expr (closure () (f3980) (let () f3980))
# emit-closure
# si = -4
# env = ((f3980 . 0))
# expr = (closure () (f3980) (let () f3980))
    movl $_L_33302, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f3980 . 0))
# var=f3980
    movl 0(%esp), %eax  # stack load f3980
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f3980
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_33303            # jump around closure body
_L_33302:
# check argument count
    cmp $0,%eax
    je _L_33304
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_33304:
# emit-tail-expr
# si=-8
# env=((f3980 . 4) (f3980 . 0))
# expr=(let () f3980)
# emit-tail-let
#  si   = -8
#  env  = ((f3980 . 4) (f3980 . 0))
#  bindings = ()
#  body = f3980
# emit-tail-expr
# si=-8
# env=((f3980 . 4) (f3980 . 0))
# expr=f3980
# emit-tail-variable-ref
# emit-variable-ref
# env=((f3980 . 4) (f3980 . 0))
# var=f3980
    movl 2(%edi), %eax  # frame load f3980
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    .align 4,0x90
_L_33303:
     movl %eax, current$moutput$mport
# == explicit-begins  ==>
# (lambda (p) (vector-ref p 2))
# == eliminate-let*  ==>
# (lambda (p) (vector-ref p 2))
# == uniquify-variables  ==>
# (lambda (f3981) (vector-ref f3981 2))
# == vectorize-letrec  ==>
# (lambda (f3981) (vector-ref f3981 2))
# == eliminate-set!  ==>
# (lambda (f3981) (let ((f3981 f3981)) (vector-ref f3981 2)))
# == close-free-variables  ==>
# (closure (f3981) () (let ((f3981 f3981)) (vector-ref f3981 2)))
# == eliminate-quote  ==>
# (closure (f3981) () (let ((f3981 f3981)) (vector-ref f3981 2)))
# == eliminate-when/unless  ==>
# (closure (f3981) () (let ((f3981 f3981)) (vector-ref f3981 2)))
# == eliminate-cond  ==>
# (closure (f3981) () (let ((f3981 f3981)) (vector-ref f3981 2)))
# == external-symbols  ==>
# (closure (f3981) () (let ((f3981 f3981)) (vector-ref f3981 2)))
# emit-expr (closure (f3981) () (let ((f3981 f3981)) (vector-ref f3981 2)))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f3981) () (let ((f3981 f3981)) (vector-ref f3981 2)))
    movl $_L_33305, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_33306            # jump around closure body
_L_33305:
# check argument count
    cmp $4,%eax
    je _L_33307
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_33307:
# emit-tail-expr
# si=-12
# env=((f3981 . -8))
# expr=(let ((f3981 f3981)) (vector-ref f3981 2))
# emit-tail-let
#  si   = -12
#  env  = ((f3981 . -8))
#  bindings = ((f3981 f3981))
#  body = (vector-ref f3981 2)
# emit-expr f3981
# emit-variable-ref
# env=((f3981 . -8))
# var=f3981
    movl -8(%esp), %eax  # stack load f3981
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f3981 . -12) (f3981 . -8))
# expr=(vector-ref f3981 2)
# tail primcall
# emit-expr f3981
# emit-variable-ref
# env=((f3981 . -12) (f3981 . -8))
# var=f3981
    movl -12(%esp), %eax  # stack load f3981
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33308
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33308:
    movl %eax, -16(%esp)
# emit-expr 2
    movl $8, %eax     # immed 2
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33309"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33309:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33311
    cmp  $0,%eax
    jge _L_33310
_L_33311:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33310:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
#return from tail (vector-ref f3981 2)
    ret
    .align 4,0x90
_L_33306:
     movl %eax, port$mfd
# == explicit-begins  ==>
# (lambda (p) (vector-ref p 3))
# == eliminate-let*  ==>
# (lambda (p) (vector-ref p 3))
# == uniquify-variables  ==>
# (lambda (f3982) (vector-ref f3982 3))
# == vectorize-letrec  ==>
# (lambda (f3982) (vector-ref f3982 3))
# == eliminate-set!  ==>
# (lambda (f3982) (let ((f3982 f3982)) (vector-ref f3982 3)))
# == close-free-variables  ==>
# (closure (f3982) () (let ((f3982 f3982)) (vector-ref f3982 3)))
# == eliminate-quote  ==>
# (closure (f3982) () (let ((f3982 f3982)) (vector-ref f3982 3)))
# == eliminate-when/unless  ==>
# (closure (f3982) () (let ((f3982 f3982)) (vector-ref f3982 3)))
# == eliminate-cond  ==>
# (closure (f3982) () (let ((f3982 f3982)) (vector-ref f3982 3)))
# == external-symbols  ==>
# (closure (f3982) () (let ((f3982 f3982)) (vector-ref f3982 3)))
# emit-expr (closure (f3982) () (let ((f3982 f3982)) (vector-ref f3982 3)))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f3982) () (let ((f3982 f3982)) (vector-ref f3982 3)))
    movl $_L_33312, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_33313            # jump around closure body
_L_33312:
# check argument count
    cmp $4,%eax
    je _L_33314
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_33314:
# emit-tail-expr
# si=-12
# env=((f3982 . -8))
# expr=(let ((f3982 f3982)) (vector-ref f3982 3))
# emit-tail-let
#  si   = -12
#  env  = ((f3982 . -8))
#  bindings = ((f3982 f3982))
#  body = (vector-ref f3982 3)
# emit-expr f3982
# emit-variable-ref
# env=((f3982 . -8))
# var=f3982
    movl -8(%esp), %eax  # stack load f3982
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f3982 . -12) (f3982 . -8))
# expr=(vector-ref f3982 3)
# tail primcall
# emit-expr f3982
# emit-variable-ref
# env=((f3982 . -12) (f3982 . -8))
# var=f3982
    movl -12(%esp), %eax  # stack load f3982
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33315
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33315:
    movl %eax, -16(%esp)
# emit-expr 3
    movl $12, %eax     # immed 3
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33316"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33316:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33318
    cmp  $0,%eax
    jge _L_33317
_L_33318:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33317:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
#return from tail (vector-ref f3982 3)
    ret
    .align 4,0x90
_L_33313:
     movl %eax, port$mbuf
# == explicit-begins  ==>
# (lambda (p) (vector-ref p 4))
# == eliminate-let*  ==>
# (lambda (p) (vector-ref p 4))
# == uniquify-variables  ==>
# (lambda (f3983) (vector-ref f3983 4))
# == vectorize-letrec  ==>
# (lambda (f3983) (vector-ref f3983 4))
# == eliminate-set!  ==>
# (lambda (f3983) (let ((f3983 f3983)) (vector-ref f3983 4)))
# == close-free-variables  ==>
# (closure (f3983) () (let ((f3983 f3983)) (vector-ref f3983 4)))
# == eliminate-quote  ==>
# (closure (f3983) () (let ((f3983 f3983)) (vector-ref f3983 4)))
# == eliminate-when/unless  ==>
# (closure (f3983) () (let ((f3983 f3983)) (vector-ref f3983 4)))
# == eliminate-cond  ==>
# (closure (f3983) () (let ((f3983 f3983)) (vector-ref f3983 4)))
# == external-symbols  ==>
# (closure (f3983) () (let ((f3983 f3983)) (vector-ref f3983 4)))
# emit-expr (closure (f3983) () (let ((f3983 f3983)) (vector-ref f3983 4)))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f3983) () (let ((f3983 f3983)) (vector-ref f3983 4)))
    movl $_L_33319, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_33320            # jump around closure body
_L_33319:
# check argument count
    cmp $4,%eax
    je _L_33321
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_33321:
# emit-tail-expr
# si=-12
# env=((f3983 . -8))
# expr=(let ((f3983 f3983)) (vector-ref f3983 4))
# emit-tail-let
#  si   = -12
#  env  = ((f3983 . -8))
#  bindings = ((f3983 f3983))
#  body = (vector-ref f3983 4)
# emit-expr f3983
# emit-variable-ref
# env=((f3983 . -8))
# var=f3983
    movl -8(%esp), %eax  # stack load f3983
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f3983 . -12) (f3983 . -8))
# expr=(vector-ref f3983 4)
# tail primcall
# emit-expr f3983
# emit-variable-ref
# env=((f3983 . -12) (f3983 . -8))
# var=f3983
    movl -12(%esp), %eax  # stack load f3983
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33322
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33322:
    movl %eax, -16(%esp)
# emit-expr 4
    movl $16, %eax     # immed 4
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33323"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33323:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33325
    cmp  $0,%eax
    jge _L_33324
_L_33325:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33324:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
#return from tail (vector-ref f3983 4)
    ret
    .align 4,0x90
_L_33320:
     movl %eax, port$mndx
# == explicit-begins  ==>
# (lambda (p) (vector-set! p 4 (fxadd1 (vector-ref p 4))))
# == eliminate-let*  ==>
# (lambda (p) (vector-set! p 4 (fxadd1 (vector-ref p 4))))
# == uniquify-variables  ==>
# (lambda (f3984) (vector-set! f3984 4 (fxadd1 (vector-ref f3984 4))))
# == vectorize-letrec  ==>
# (lambda (f3984) (vector-set! f3984 4 (fxadd1 (vector-ref f3984 4))))
# == eliminate-set!  ==>
# (lambda (f3984) (let ((f3984 f3984)) (vector-set! f3984 4 (fxadd1 (vector-ref f3984 4)))))
# == close-free-variables  ==>
# (closure (f3984) () (let ((f3984 f3984)) (vector-set! f3984 4 (fxadd1 (vector-ref f3984 4)))))
# == eliminate-quote  ==>
# (closure (f3984) () (let ((f3984 f3984)) (vector-set! f3984 4 (fxadd1 (vector-ref f3984 4)))))
# == eliminate-when/unless  ==>
# (closure (f3984) () (let ((f3984 f3984)) (vector-set! f3984 4 (fxadd1 (vector-ref f3984 4)))))
# == eliminate-cond  ==>
# (closure (f3984) () (let ((f3984 f3984)) (vector-set! f3984 4 (fxadd1 (vector-ref f3984 4)))))
# == external-symbols  ==>
# (closure (f3984) () (let ((f3984 f3984)) (vector-set! f3984 4 (fxadd1 (vector-ref f3984 4)))))
# emit-expr (closure (f3984) () (let ((f3984 f3984)) (vector-set! f3984 4 (fxadd1 (vector-ref f3984 4)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f3984) () (let ((f3984 f3984)) (vector-set! f3984 4 (fxadd1 (vector-ref f3984 4)))))
    movl $_L_33326, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_33327            # jump around closure body
_L_33326:
# check argument count
    cmp $4,%eax
    je _L_33328
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_33328:
# emit-tail-expr
# si=-12
# env=((f3984 . -8))
# expr=(let ((f3984 f3984)) (vector-set! f3984 4 (fxadd1 (vector-ref f3984 4))))
# emit-tail-let
#  si   = -12
#  env  = ((f3984 . -8))
#  bindings = ((f3984 f3984))
#  body = (vector-set! f3984 4 (fxadd1 (vector-ref f3984 4)))
# emit-expr f3984
# emit-variable-ref
# env=((f3984 . -8))
# var=f3984
    movl -8(%esp), %eax  # stack load f3984
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f3984 . -12) (f3984 . -8))
# expr=(vector-set! f3984 4 (fxadd1 (vector-ref f3984 4)))
# tail primcall
# emit-expr f3984
# emit-variable-ref
# env=((f3984 . -12) (f3984 . -8))
# var=f3984
    movl -12(%esp), %eax  # stack load f3984
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33329
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33329:
    movl %eax, -16(%esp)
# emit-expr 4
    movl $16, %eax     # immed 4
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33330"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33330:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33332
    cmp  $0,%eax
    jge _L_33331
_L_33332:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33331:
    movl %eax, -20(%esp)
# emit-expr (fxadd1 (vector-ref f3984 4))
# emit-expr (vector-ref f3984 4)
# emit-expr f3984
# emit-variable-ref
# env=((f3984 . -12) (f3984 . -8))
# var=f3984
    movl -12(%esp), %eax  # stack load f3984
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33333
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33333:
    movl %eax, -24(%esp)
# emit-expr 4
    movl $16, %eax     # immed 4
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33334"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33334:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33336
    cmp  $0,%eax
    jge _L_33335
_L_33336:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33335:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33337"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33337:
     addl $4, %eax
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
#return from tail (vector-set! f3984 4 (fxadd1 (vector-ref f3984 4)))
    ret
    .align 4,0x90
_L_33327:
     movl %eax, port$mndx$madd1
# == explicit-begins  ==>
# (lambda (p) (vector-set! p 4 0))
# == eliminate-let*  ==>
# (lambda (p) (vector-set! p 4 0))
# == uniquify-variables  ==>
# (lambda (f3985) (vector-set! f3985 4 0))
# == vectorize-letrec  ==>
# (lambda (f3985) (vector-set! f3985 4 0))
# == eliminate-set!  ==>
# (lambda (f3985) (let ((f3985 f3985)) (vector-set! f3985 4 0)))
# == close-free-variables  ==>
# (closure (f3985) () (let ((f3985 f3985)) (vector-set! f3985 4 0)))
# == eliminate-quote  ==>
# (closure (f3985) () (let ((f3985 f3985)) (vector-set! f3985 4 0)))
# == eliminate-when/unless  ==>
# (closure (f3985) () (let ((f3985 f3985)) (vector-set! f3985 4 0)))
# == eliminate-cond  ==>
# (closure (f3985) () (let ((f3985 f3985)) (vector-set! f3985 4 0)))
# == external-symbols  ==>
# (closure (f3985) () (let ((f3985 f3985)) (vector-set! f3985 4 0)))
# emit-expr (closure (f3985) () (let ((f3985 f3985)) (vector-set! f3985 4 0)))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f3985) () (let ((f3985 f3985)) (vector-set! f3985 4 0)))
    movl $_L_33338, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_33339            # jump around closure body
_L_33338:
# check argument count
    cmp $4,%eax
    je _L_33340
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_33340:
# emit-tail-expr
# si=-12
# env=((f3985 . -8))
# expr=(let ((f3985 f3985)) (vector-set! f3985 4 0))
# emit-tail-let
#  si   = -12
#  env  = ((f3985 . -8))
#  bindings = ((f3985 f3985))
#  body = (vector-set! f3985 4 0)
# emit-expr f3985
# emit-variable-ref
# env=((f3985 . -8))
# var=f3985
    movl -8(%esp), %eax  # stack load f3985
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f3985 . -12) (f3985 . -8))
# expr=(vector-set! f3985 4 0)
# tail primcall
# emit-expr f3985
# emit-variable-ref
# env=((f3985 . -12) (f3985 . -8))
# var=f3985
    movl -12(%esp), %eax  # stack load f3985
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33341
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33341:
    movl %eax, -16(%esp)
# emit-expr 4
    movl $16, %eax     # immed 4
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33342"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33342:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33344
    cmp  $0,%eax
    jge _L_33343
_L_33344:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33343:
    movl %eax, -20(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
#return from tail (vector-set! f3985 4 0)
    ret
    .align 4,0x90
_L_33339:
     movl %eax, port$mndx$mreset
# == explicit-begins  ==>
# (lambda (p) (vector-ref p 5))
# == eliminate-let*  ==>
# (lambda (p) (vector-ref p 5))
# == uniquify-variables  ==>
# (lambda (f3986) (vector-ref f3986 5))
# == vectorize-letrec  ==>
# (lambda (f3986) (vector-ref f3986 5))
# == eliminate-set!  ==>
# (lambda (f3986) (let ((f3986 f3986)) (vector-ref f3986 5)))
# == close-free-variables  ==>
# (closure (f3986) () (let ((f3986 f3986)) (vector-ref f3986 5)))
# == eliminate-quote  ==>
# (closure (f3986) () (let ((f3986 f3986)) (vector-ref f3986 5)))
# == eliminate-when/unless  ==>
# (closure (f3986) () (let ((f3986 f3986)) (vector-ref f3986 5)))
# == eliminate-cond  ==>
# (closure (f3986) () (let ((f3986 f3986)) (vector-ref f3986 5)))
# == external-symbols  ==>
# (closure (f3986) () (let ((f3986 f3986)) (vector-ref f3986 5)))
# emit-expr (closure (f3986) () (let ((f3986 f3986)) (vector-ref f3986 5)))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f3986) () (let ((f3986 f3986)) (vector-ref f3986 5)))
    movl $_L_33345, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_33346            # jump around closure body
_L_33345:
# check argument count
    cmp $4,%eax
    je _L_33347
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_33347:
# emit-tail-expr
# si=-12
# env=((f3986 . -8))
# expr=(let ((f3986 f3986)) (vector-ref f3986 5))
# emit-tail-let
#  si   = -12
#  env  = ((f3986 . -8))
#  bindings = ((f3986 f3986))
#  body = (vector-ref f3986 5)
# emit-expr f3986
# emit-variable-ref
# env=((f3986 . -8))
# var=f3986
    movl -8(%esp), %eax  # stack load f3986
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f3986 . -12) (f3986 . -8))
# expr=(vector-ref f3986 5)
# tail primcall
# emit-expr f3986
# emit-variable-ref
# env=((f3986 . -12) (f3986 . -8))
# var=f3986
    movl -12(%esp), %eax  # stack load f3986
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33348
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33348:
    movl %eax, -16(%esp)
# emit-expr 5
    movl $20, %eax     # immed 5
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33349"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33349:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33351
    cmp  $0,%eax
    jge _L_33350
_L_33351:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33350:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
#return from tail (vector-ref f3986 5)
    ret
    .align 4,0x90
_L_33346:
     movl %eax, port$msize
# == explicit-begins  ==>
# (lambda (ch) (let ((p (current-output-port))) (begin (string-set! (port-buf p) (port-ndx p) ch) (port-ndx-add1 p))))
# == eliminate-let*  ==>
# (lambda (ch) (let ((p (current-output-port))) (begin (string-set! (port-buf p) (port-ndx p) ch) (port-ndx-add1 p))))
# == uniquify-variables  ==>
# (lambda (f3987) (let ((f3989 (current-output-port))) (begin (string-set! (port-buf f3989) (port-ndx f3989) f3987) (port-ndx-add1 f3989))))
# == vectorize-letrec  ==>
# (lambda (f3987) (let ((f3989 (current-output-port))) (begin (string-set! (port-buf f3989) (port-ndx f3989) f3987) (port-ndx-add1 f3989))))
# == eliminate-set!  ==>
# (lambda (f3987) (let ((f3987 f3987)) (let ((f3989 (current-output-port))) (begin (string-set! (port-buf f3989) (port-ndx f3989) f3987) (port-ndx-add1 f3989)))))
# == close-free-variables  ==>
# (closure (f3987) (port-buf port-ndx port-ndx-add1) (let ((f3987 f3987)) (let ((f3989 (current-output-port))) (begin (string-set! (port-buf f3989) (port-ndx f3989) f3987) (port-ndx-add1 f3989)))))
# == eliminate-quote  ==>
# (closure (f3987) (port-buf port-ndx port-ndx-add1) (let ((f3987 f3987)) (let ((f3989 (current-output-port))) (begin (string-set! (port-buf f3989) (port-ndx f3989) f3987) (port-ndx-add1 f3989)))))
# == eliminate-when/unless  ==>
# (closure (f3987) (port-buf port-ndx port-ndx-add1) (let ((f3987 f3987)) (let ((f3989 (current-output-port))) (begin (string-set! (port-buf f3989) (port-ndx f3989) f3987) (port-ndx-add1 f3989)))))
# == eliminate-cond  ==>
# (closure (f3987) (port-buf port-ndx port-ndx-add1) (let ((f3987 f3987)) (let ((f3989 (current-output-port))) (begin (string-set! (port-buf f3989) (port-ndx f3989) f3987) (port-ndx-add1 f3989)))))
# == external-symbols  ==>
# (closure (f3987) ((primitive-ref port-buf) (primitive-ref port-ndx) (primitive-ref port-ndx-add1)) (let ((f3987 f3987)) (let ((f3989 ((primitive-ref current-output-port)))) (begin (string-set! ((primitive-ref port-buf) f3989) ((primitive-ref port-ndx) f3989) f3987) ((primitive-ref port-ndx-add1) f3989)))))
# emit-expr (closure (f3987) ((primitive-ref port-buf) (primitive-ref port-ndx) (primitive-ref port-ndx-add1)) (let ((f3987 f3987)) (let ((f3989 ((primitive-ref current-output-port)))) (begin (string-set! ((primitive-ref port-buf) f3989) ((primitive-ref port-ndx) f3989) f3987) ((primitive-ref port-ndx-add1) f3989)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f3987) ((primitive-ref port-buf) (primitive-ref port-ndx) (primitive-ref port-ndx-add1)) (let ((f3987 f3987)) (let ((f3989 ((primitive-ref current-output-port)))) (begin (string-set! ((primitive-ref port-buf) f3989) ((primitive-ref port-ndx) f3989) f3987) ((primitive-ref port-ndx-add1) f3989)))))
    movl $_L_33352, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref port-buf) not defined in the environmnet
# WARNING: free var (primitive-ref port-ndx) not defined in the environmnet
# WARNING: free var (primitive-ref port-ndx-add1) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_33353            # jump around closure body
_L_33352:
# check argument count
    cmp $4,%eax
    je _L_33354
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_33354:
# emit-tail-expr
# si=-12
# env=((f3987 . -8) ((primitive-ref port-ndx-add1) . 12) ((primitive-ref port-ndx) . 8) ((primitive-ref port-buf) . 4))
# expr=(let ((f3987 f3987)) (let ((f3989 ((primitive-ref current-output-port)))) (begin (string-set! ((primitive-ref port-buf) f3989) ((primitive-ref port-ndx) f3989) f3987) ((primitive-ref port-ndx-add1) f3989))))
# emit-tail-let
#  si   = -12
#  env  = ((f3987 . -8) ((primitive-ref port-ndx-add1) . 12) ((primitive-ref port-ndx) . 8) ((primitive-ref port-buf) . 4))
#  bindings = ((f3987 f3987))
#  body = (let ((f3989 ((primitive-ref current-output-port)))) (begin (string-set! ((primitive-ref port-buf) f3989) ((primitive-ref port-ndx) f3989) f3987) ((primitive-ref port-ndx-add1) f3989)))
# emit-expr f3987
# emit-variable-ref
# env=((f3987 . -8) ((primitive-ref port-ndx-add1) . 12) ((primitive-ref port-ndx) . 8) ((primitive-ref port-buf) . 4))
# var=f3987
    movl -8(%esp), %eax  # stack load f3987
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f3987 . -12) (f3987 . -8) ((primitive-ref port-ndx-add1) . 12) ((primitive-ref port-ndx) . 8) ((primitive-ref port-buf) . 4))
# expr=(let ((f3989 ((primitive-ref current-output-port)))) (begin (string-set! ((primitive-ref port-buf) f3989) ((primitive-ref port-ndx) f3989) f3987) ((primitive-ref port-ndx-add1) f3989)))
# emit-tail-let
#  si   = -16
#  env  = ((f3987 . -12) (f3987 . -8) ((primitive-ref port-ndx-add1) . 12) ((primitive-ref port-ndx) . 8) ((primitive-ref port-buf) . 4))
#  bindings = ((f3989 ((primitive-ref current-output-port))))
#  body = (begin (string-set! ((primitive-ref port-buf) f3989) ((primitive-ref port-ndx) f3989) f3987) ((primitive-ref port-ndx-add1) f3989))
# emit-expr ((primitive-ref current-output-port))
# funcall
#    si   =-16
#    env  = ((f3987 . -12) (f3987 . -8) ((primitive-ref port-ndx-add1) . 12) ((primitive-ref port-ndx) . 8) ((primitive-ref port-buf) . 4))
#    expr = (funcall (primitive-ref current-output-port))
# emit-expr (primitive-ref current-output-port)
    .extern current$moutput$mport
    movl current$moutput$mport,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33355"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33355":
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
# env=((f3989 . -16) (f3987 . -12) (f3987 . -8) ((primitive-ref port-ndx-add1) . 12) ((primitive-ref port-ndx) . 8) ((primitive-ref port-buf) . 4))
# expr=(begin (string-set! ((primitive-ref port-buf) f3989) ((primitive-ref port-ndx) f3989) f3987) ((primitive-ref port-ndx-add1) f3989))
# tail-begin (begin (string-set! ((primitive-ref port-buf) f3989) ((primitive-ref port-ndx) f3989) f3987) ((primitive-ref port-ndx-add1) f3989))
#   env=((f3989 . -16) (f3987 . -12) (f3987 . -8) ((primitive-ref port-ndx-add1) . 12) ((primitive-ref port-ndx) . 8) ((primitive-ref port-buf) . 4))
# emit-expr (string-set! ((primitive-ref port-buf) f3989) ((primitive-ref port-ndx) f3989) f3987)
# emit-expr ((primitive-ref port-buf) f3989)
# funcall
#    si   =-20
#    env  = ((f3989 . -16) (f3987 . -12) (f3987 . -8) ((primitive-ref port-ndx-add1) . 12) ((primitive-ref port-ndx) . 8) ((primitive-ref port-buf) . 4))
#    expr = (funcall (primitive-ref port-buf) f3989)
# emit-expr (primitive-ref port-buf)
    .extern port$mbuf
    movl port$mbuf,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33356"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33356":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr f3989
# emit-variable-ref
# env=((f3989 . -16) (f3987 . -12) (f3987 . -8) ((primitive-ref port-ndx-add1) . 12) ((primitive-ref port-ndx) . 8) ((primitive-ref port-buf) . 4))
# var=f3989
    movl -16(%esp), %eax  # stack load f3989
# end emit-variable-ref
    mov %eax, -32(%esp)  # arg f3989
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_33357
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $160,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33357:
    movl %eax, -20(%esp)
# emit-expr ((primitive-ref port-ndx) f3989)
# funcall
#    si   =-20
#    env  = ((f3989 . -16) (f3987 . -12) (f3987 . -8) ((primitive-ref port-ndx-add1) . 12) ((primitive-ref port-ndx) . 8) ((primitive-ref port-buf) . 4))
#    expr = (funcall (primitive-ref port-ndx) f3989)
# emit-expr (primitive-ref port-ndx)
    .extern port$mndx
    movl port$mndx,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33358"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33358":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr f3989
# emit-variable-ref
# env=((f3989 . -16) (f3987 . -12) (f3987 . -8) ((primitive-ref port-ndx-add1) . 12) ((primitive-ref port-ndx) . 8) ((primitive-ref port-buf) . 4))
# var=f3989
    movl -16(%esp), %eax  # stack load f3989
# end emit-variable-ref
    mov %eax, -32(%esp)  # arg f3989
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
    je "_L_33359"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $160,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33359:
# check bounds on string index
    movl -20(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_33361
    cmp  $0,%eax
    jge _L_33360
_L_33361:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $160,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33360:
    movl %eax, -24(%esp)
# emit-expr f3987
# emit-variable-ref
# env=((f3989 . -16) (f3987 . -12) (f3987 . -8) ((primitive-ref port-ndx-add1) . 12) ((primitive-ref port-ndx) . 8) ((primitive-ref port-buf) . 4))
# var=f3987
    movl -12(%esp), %eax  # stack load f3987
# end emit-variable-ref
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_33362"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $160,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33362:
    movl -20(%esp), %ebx
    movl -24(%esp), %esi
    sar $2, %esi
    movb  %ah, -2(%ebx,%esi)
# emit-tail-expr
# si=-20
# env=((f3989 . -16) (f3987 . -12) (f3987 . -8) ((primitive-ref port-ndx-add1) . 12) ((primitive-ref port-ndx) . 8) ((primitive-ref port-buf) . 4))
# expr=(begin ((primitive-ref port-ndx-add1) f3989))
# tail-begin (begin ((primitive-ref port-ndx-add1) f3989))
#   env=((f3989 . -16) (f3987 . -12) (f3987 . -8) ((primitive-ref port-ndx-add1) . 12) ((primitive-ref port-ndx) . 8) ((primitive-ref port-buf) . 4))
# emit-tail-expr
# si=-20
# env=((f3989 . -16) (f3987 . -12) (f3987 . -8) ((primitive-ref port-ndx-add1) . 12) ((primitive-ref port-ndx) . 8) ((primitive-ref port-buf) . 4))
# expr=((primitive-ref port-ndx-add1) f3989)
# emit-tail-funcall
#    si   =-20
#    env  = ((f3989 . -16) (f3987 . -12) (f3987 . -8) ((primitive-ref port-ndx-add1) . 12) ((primitive-ref port-ndx) . 8) ((primitive-ref port-buf) . 4))
#    expr = (funcall (primitive-ref port-ndx-add1) f3989)
# emit-expr (primitive-ref port-ndx-add1)
    .extern port$mndx$madd1
    movl port$mndx$madd1,%eax
   movl %eax,  -20(%esp)  # stash funcall-oper in next closure slot
# emit-expr f3989
# emit-variable-ref
# env=((f3989 . -16) (f3987 . -12) (f3987 . -8) ((primitive-ref port-ndx-add1) . 12) ((primitive-ref port-ndx) . 8) ((primitive-ref port-buf) . 4))
# var=f3989
    movl -16(%esp), %eax  # stack load f3989
# end emit-variable-ref
    mov %eax, -24(%esp)    # arg f3989
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
    .align 4,0x90
_L_33353:
     movl %eax, write$mchar
# == explicit-begins  ==>
# (lambda args (let ((p (if (null? args) (current-output-port) (car args)))) (begin (foreign-call "s_write" (port-fd p) (port-buf p) (port-ndx p)) (port-ndx-reset p))))
# == eliminate-let*  ==>
# (lambda args (let ((p (if (null? args) (current-output-port) (car args)))) (begin (foreign-call "s_write" (port-fd p) (port-buf p) (port-ndx p)) (port-ndx-reset p))))
# == uniquify-variables  ==>
# (lambda f3990 (let ((f3992 (if (null? f3990) (current-output-port) (car f3990)))) (begin (foreign-call "s_write" (port-fd f3992) (port-buf f3992) (port-ndx f3992)) (port-ndx-reset f3992))))
# == vectorize-letrec  ==>
# (lambda f3990 (let ((f3992 (if (null? f3990) (current-output-port) (car f3990)))) (begin (foreign-call "s_write" (port-fd f3992) (port-buf f3992) (port-ndx f3992)) (port-ndx-reset f3992))))
# == eliminate-set!  ==>
# (lambda f3990 (let () (let ((f3992 (if (null? f3990) (current-output-port) (car f3990)))) (begin (foreign-call "s_write" (port-fd f3992) (port-buf f3992) (port-ndx f3992)) (port-ndx-reset f3992)))))
# == close-free-variables  ==>
# (closure f3990 (port-fd port-buf port-ndx port-ndx-reset) (let () (let ((f3992 (if (null? f3990) (current-output-port) (car f3990)))) (begin (foreign-call "s_write" (port-fd f3992) (port-buf f3992) (port-ndx f3992)) (port-ndx-reset f3992)))))
# == eliminate-quote  ==>
# (closure f3990 (port-fd port-buf port-ndx port-ndx-reset) (let () (let ((f3992 (if (null? f3990) (current-output-port) (car f3990)))) (begin (foreign-call "s_write" (port-fd f3992) (port-buf f3992) (port-ndx f3992)) (port-ndx-reset f3992)))))
# == eliminate-when/unless  ==>
# (closure f3990 (port-fd port-buf port-ndx port-ndx-reset) (let () (let ((f3992 (if (null? f3990) (current-output-port) (car f3990)))) (begin (foreign-call "s_write" (port-fd f3992) (port-buf f3992) (port-ndx f3992)) (port-ndx-reset f3992)))))
# == eliminate-cond  ==>
# (closure f3990 (port-fd port-buf port-ndx port-ndx-reset) (let () (let ((f3992 (if (null? f3990) (current-output-port) (car f3990)))) (begin (foreign-call "s_write" (port-fd f3992) (port-buf f3992) (port-ndx f3992)) (port-ndx-reset f3992)))))
# == external-symbols  ==>
# (closure f3990 ((primitive-ref port-fd) (primitive-ref port-buf) (primitive-ref port-ndx) (primitive-ref port-ndx-reset)) (let () (let ((f3992 (if (null? f3990) ((primitive-ref current-output-port)) (car f3990)))) (begin (foreign-call "s_write" ((primitive-ref port-fd) f3992) ((primitive-ref port-buf) f3992) ((primitive-ref port-ndx) f3992)) ((primitive-ref port-ndx-reset) f3992)))))
# emit-expr (closure f3990 ((primitive-ref port-fd) (primitive-ref port-buf) (primitive-ref port-ndx) (primitive-ref port-ndx-reset)) (let () (let ((f3992 (if (null? f3990) ((primitive-ref current-output-port)) (car f3990)))) (begin (foreign-call "s_write" ((primitive-ref port-fd) f3992) ((primitive-ref port-buf) f3992) ((primitive-ref port-ndx) f3992)) ((primitive-ref port-ndx-reset) f3992)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure f3990 ((primitive-ref port-fd) (primitive-ref port-buf) (primitive-ref port-ndx) (primitive-ref port-ndx-reset)) (let () (let ((f3992 (if (null? f3990) ((primitive-ref current-output-port)) (car f3990)))) (begin (foreign-call "s_write" ((primitive-ref port-fd) f3992) ((primitive-ref port-buf) f3992) ((primitive-ref port-ndx) f3992)) ((primitive-ref port-ndx-reset) f3992)))))
    movl $_L_33363, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref port-fd) not defined in the environmnet
# WARNING: free var (primitive-ref port-buf) not defined in the environmnet
# WARNING: free var (primitive-ref port-ndx) not defined in the environmnet
# WARNING: free var (primitive-ref port-ndx-reset) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $24, %ebp     # bump ebp
    jmp _L_33364            # jump around closure body
_L_33363:
# check argument count
    cmp $0,%eax
    jge _L_33365
# invoke error handler eh_argcount_min
    .extern eh$uargcount$umin
    movl eh$uargcount$umin, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_33365:
# emit-build-varargs-list
    movl $63, %esi       # args <- () 
    lea -4(%esp),%edi    # edi <- esp-4
    subl %eax, %edi      # edi <- esp-4-eax    addr of arg[K+N] on stack
_L_33367:
    lea -4(%esp),%ebx    # addr of arg[K] on stack
    cmp %edi, %ebx       # while edi <> esp+(si+4)
    je _L_33366
    movl (%edi),%ebx     # arg i -> car
    movl %ebx, 0(%ebp)
    movl %esi, 4(%ebp)  # esi -> cdr
    movl %ebp, %esi
    addl $1, %esi       # tag as pair
    addl $8,%ebp         # bump heap ptr
    addl $4,%edi         # move to next previous arg from the end
    jmp _L_33367
_L_33366:
    movl %esi, -8(%esp)  # set args
# emit-tail-expr
# si=-12
# env=((f3990 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
# expr=(let () (let ((f3992 (if (null? f3990) ((primitive-ref current-output-port)) (car f3990)))) (begin (foreign-call "s_write" ((primitive-ref port-fd) f3992) ((primitive-ref port-buf) f3992) ((primitive-ref port-ndx) f3992)) ((primitive-ref port-ndx-reset) f3992))))
# emit-tail-let
#  si   = -12
#  env  = ((f3990 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
#  bindings = ()
#  body = (let ((f3992 (if (null? f3990) ((primitive-ref current-output-port)) (car f3990)))) (begin (foreign-call "s_write" ((primitive-ref port-fd) f3992) ((primitive-ref port-buf) f3992) ((primitive-ref port-ndx) f3992)) ((primitive-ref port-ndx-reset) f3992)))
# emit-tail-expr
# si=-12
# env=((f3990 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
# expr=(let ((f3992 (if (null? f3990) ((primitive-ref current-output-port)) (car f3990)))) (begin (foreign-call "s_write" ((primitive-ref port-fd) f3992) ((primitive-ref port-buf) f3992) ((primitive-ref port-ndx) f3992)) ((primitive-ref port-ndx-reset) f3992)))
# emit-tail-let
#  si   = -12
#  env  = ((f3990 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
#  bindings = ((f3992 (if (null? f3990) ((primitive-ref current-output-port)) (car f3990))))
#  body = (begin (foreign-call "s_write" ((primitive-ref port-fd) f3992) ((primitive-ref port-buf) f3992) ((primitive-ref port-ndx) f3992)) ((primitive-ref port-ndx-reset) f3992))
# emit-expr (if (null? f3990) ((primitive-ref current-output-port)) (car f3990))
# emit-expr (null? f3990)
# emit-expr f3990
# emit-variable-ref
# env=((f3990 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
# var=f3990
    movl -8(%esp), %eax  # stack load f3990
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_33368
# emit-expr ((primitive-ref current-output-port))
# funcall
#    si   =-12
#    env  = ((f3990 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
#    expr = (funcall (primitive-ref current-output-port))
# emit-expr (primitive-ref current-output-port)
    .extern current$moutput$mport
    movl current$moutput$mport,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33370"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33370":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    jmp _L_33369
_L_33368:
# emit-expr (car f3990)
# emit-expr f3990
# emit-variable-ref
# env=((f3990 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
# var=f3990
    movl -8(%esp), %eax  # stack load f3990
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_33371
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $108,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33371:
    movl -1(%eax), %eax
_L_33369:
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f3992 . -12) (f3990 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
# expr=(begin (foreign-call "s_write" ((primitive-ref port-fd) f3992) ((primitive-ref port-buf) f3992) ((primitive-ref port-ndx) f3992)) ((primitive-ref port-ndx-reset) f3992))
# tail-begin (begin (foreign-call "s_write" ((primitive-ref port-fd) f3992) ((primitive-ref port-buf) f3992) ((primitive-ref port-ndx) f3992)) ((primitive-ref port-ndx-reset) f3992))
#   env=((f3992 . -12) (f3990 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
# emit-expr (foreign-call "s_write" ((primitive-ref port-fd) f3992) ((primitive-ref port-buf) f3992) ((primitive-ref port-ndx) f3992))
    movl %ecx,-16(%esp)
    movl %esp,-20(%esp)
# emit-expr ((primitive-ref port-ndx) f3992)
# funcall
#    si   =-24
#    env  = ((f3992 . -12) (f3990 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
#    expr = (funcall (primitive-ref port-ndx) f3992)
# emit-expr (primitive-ref port-ndx)
    .extern port$mndx
    movl port$mndx,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33372"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33372":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f3992
# emit-variable-ref
# env=((f3992 . -12) (f3990 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
# var=f3992
    movl -12(%esp), %eax  # stack load f3992
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f3992
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -24(%esp)
# emit-expr ((primitive-ref port-buf) f3992)
# funcall
#    si   =-28
#    env  = ((f3992 . -12) (f3990 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
#    expr = (funcall (primitive-ref port-buf) f3992)
# emit-expr (primitive-ref port-buf)
    .extern port$mbuf
    movl port$mbuf,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33373"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33373":
   movl %eax,  -36(%esp)  # stash funcall-oper in closure slot
# emit-expr f3992
# emit-variable-ref
# env=((f3992 . -12) (f3990 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
# var=f3992
    movl -12(%esp), %eax  # stack load f3992
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg f3992
    movl -36(%esp), %edi   # load new closure to %edi
    add $-28, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $28, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -28(%esp)
# emit-expr ((primitive-ref port-fd) f3992)
# funcall
#    si   =-32
#    env  = ((f3992 . -12) (f3990 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
#    expr = (funcall (primitive-ref port-fd) f3992)
# emit-expr (primitive-ref port-fd)
    .extern port$mfd
    movl port$mfd,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33374"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33374":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
# emit-expr f3992
# emit-variable-ref
# env=((f3992 . -12) (f3990 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
# var=f3992
    movl -12(%esp), %eax  # stack load f3992
# end emit-variable-ref
    mov %eax, -44(%esp)  # arg f3992
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
# env=((f3992 . -12) (f3990 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
# expr=(begin ((primitive-ref port-ndx-reset) f3992))
# tail-begin (begin ((primitive-ref port-ndx-reset) f3992))
#   env=((f3992 . -12) (f3990 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
# emit-tail-expr
# si=-16
# env=((f3992 . -12) (f3990 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
# expr=((primitive-ref port-ndx-reset) f3992)
# emit-tail-funcall
#    si   =-16
#    env  = ((f3992 . -12) (f3990 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
#    expr = (funcall (primitive-ref port-ndx-reset) f3992)
# emit-expr (primitive-ref port-ndx-reset)
    .extern port$mndx$mreset
    movl port$mndx$mreset,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f3992
# emit-variable-ref
# env=((f3992 . -12) (f3990 . -8) ((primitive-ref port-ndx-reset) . 16) ((primitive-ref port-ndx) . 12) ((primitive-ref port-buf) . 8) ((primitive-ref port-fd) . 4))
# var=f3992
    movl -12(%esp), %eax  # stack load f3992
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f3992
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
_L_33364:
     movl %eax, flush$moutput$mport
# == explicit-begins  ==>
# (lambda () (begin (flush-output-port) (foreign-call "s_exit")))
# == eliminate-let*  ==>
# (lambda () (begin (flush-output-port) (foreign-call "s_exit")))
# == uniquify-variables  ==>
# (lambda () (begin (flush-output-port) (foreign-call "s_exit")))
# == vectorize-letrec  ==>
# (lambda () (begin (flush-output-port) (foreign-call "s_exit")))
# == eliminate-set!  ==>
# (lambda () (let () (begin (flush-output-port) (foreign-call "s_exit"))))
# == close-free-variables  ==>
# (closure () (flush-output-port) (let () (begin (flush-output-port) (foreign-call "s_exit"))))
# == eliminate-quote  ==>
# (closure () (flush-output-port) (let () (begin (flush-output-port) (foreign-call "s_exit"))))
# == eliminate-when/unless  ==>
# (closure () (flush-output-port) (let () (begin (flush-output-port) (foreign-call "s_exit"))))
# == eliminate-cond  ==>
# (closure () (flush-output-port) (let () (begin (flush-output-port) (foreign-call "s_exit"))))
# == external-symbols  ==>
# (closure () ((primitive-ref flush-output-port)) (let () (begin ((primitive-ref flush-output-port)) (foreign-call "s_exit"))))
# emit-expr (closure () ((primitive-ref flush-output-port)) (let () (begin ((primitive-ref flush-output-port)) (foreign-call "s_exit"))))
# emit-closure
# si = 0
# env = ()
# expr = (closure () ((primitive-ref flush-output-port)) (let () (begin ((primitive-ref flush-output-port)) (foreign-call "s_exit"))))
    movl $_L_33375, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref flush-output-port) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_33376            # jump around closure body
_L_33375:
# check argument count
    cmp $0,%eax
    je _L_33377
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_33377:
# emit-tail-expr
# si=-8
# env=(((primitive-ref flush-output-port) . 4))
# expr=(let () (begin ((primitive-ref flush-output-port)) (foreign-call "s_exit")))
# emit-tail-let
#  si   = -8
#  env  = (((primitive-ref flush-output-port) . 4))
#  bindings = ()
#  body = (begin ((primitive-ref flush-output-port)) (foreign-call "s_exit"))
# emit-tail-expr
# si=-8
# env=(((primitive-ref flush-output-port) . 4))
# expr=(begin ((primitive-ref flush-output-port)) (foreign-call "s_exit"))
# tail-begin (begin ((primitive-ref flush-output-port)) (foreign-call "s_exit"))
#   env=(((primitive-ref flush-output-port) . 4))
# emit-expr ((primitive-ref flush-output-port))
# funcall
#    si   =-8
#    env  = (((primitive-ref flush-output-port) . 4))
#    expr = (funcall (primitive-ref flush-output-port))
# emit-expr (primitive-ref flush-output-port)
    .extern flush$moutput$mport
    movl flush$moutput$mport,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33378"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33378":
   movl %eax,  -16(%esp)  # stash funcall-oper in closure slot
    movl -16(%esp), %edi   # load new closure to %edi
    add $-8, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $8, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-8
# env=(((primitive-ref flush-output-port) . 4))
# expr=(begin (foreign-call "s_exit"))
# tail-begin (begin (foreign-call "s_exit"))
#   env=(((primitive-ref flush-output-port) . 4))
# emit-tail-expr
# si=-8
# env=(((primitive-ref flush-output-port) . 4))
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
     ret   # return thru stack
    .align 4,0x90
_L_33376:
     movl %eax, exit
# == explicit-begins  ==>
# (lambda (x) (if (vector? x) (if (fx= 6 (vector-length? x)) (symbol=? (vector-ref x 0) (quote output-port)) #f) #f))
# == eliminate-let*  ==>
# (lambda (x) (if (vector? x) (if (fx= 6 (vector-length? x)) (symbol=? (vector-ref x 0) (quote output-port)) #f) #f))
# == uniquify-variables  ==>
# (lambda (f3993) (if (vector? f3993) (if (fx= 6 (vector-length? f3993)) (symbol=? (vector-ref f3993 0) (quote output-port)) #f) #f))
# == vectorize-letrec  ==>
# (lambda (f3993) (if (vector? f3993) (if (fx= 6 (vector-length? f3993)) (symbol=? (vector-ref f3993 0) (quote output-port)) #f) #f))
# == eliminate-set!  ==>
# (lambda (f3993) (let ((f3993 f3993)) (if (vector? f3993) (if (fx= 6 (vector-length? f3993)) (symbol=? (vector-ref f3993 0) (quote output-port)) #f) #f)))
# == close-free-variables  ==>
# (closure (f3993) (vector-length? symbol=? output-port) (let ((f3993 f3993)) (if (vector? f3993) (if (fx= 6 (vector-length? f3993)) (symbol=? (vector-ref f3993 0) (quote output-port)) #f) #f)))
# == eliminate-quote  ==>
# (closure (f3993) (vector-length? symbol=? output-port) (let ((f3993 f3993)) (if (vector? f3993) (if (fx= 6 (vector-length? f3993)) (symbol=? (vector-ref f3993 0) (string->symbol "output-port")) #f) #f)))
# == eliminate-when/unless  ==>
# (closure (f3993) (vector-length? symbol=? output-port) (let ((f3993 f3993)) (if (vector? f3993) (if (fx= 6 (vector-length? f3993)) (symbol=? (vector-ref f3993 0) (string->symbol "output-port")) #f) #f)))
# == eliminate-cond  ==>
# (closure (f3993) (vector-length? symbol=? output-port) (let ((f3993 f3993)) (if (vector? f3993) (if (fx= 6 (vector-length? f3993)) (symbol=? (vector-ref f3993 0) (string->symbol "output-port")) #f) #f)))
# == external-symbols  ==>
# (closure (f3993) (vector-length? symbol=? output-port) (let ((f3993 f3993)) (if (vector? f3993) (if (fx= 6 (vector-length? f3993)) (symbol=? (vector-ref f3993 0) ((primitive-ref string->symbol) "output-port")) #f) #f)))
# emit-expr (closure (f3993) (vector-length? symbol=? output-port) (let ((f3993 f3993)) (if (vector? f3993) (if (fx= 6 (vector-length? f3993)) (symbol=? (vector-ref f3993 0) ((primitive-ref string->symbol) "output-port")) #f) #f)))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f3993) (vector-length? symbol=? output-port) (let ((f3993 f3993)) (if (vector? f3993) (if (fx= 6 (vector-length? f3993)) (symbol=? (vector-ref f3993 0) ((primitive-ref string->symbol) "output-port")) #f) #f)))
    movl $_L_33379, 0(%ebp)  # closure label
# WARNING: free var vector-length? not defined in the environmnet
# WARNING: free var symbol=? not defined in the environmnet
# WARNING: free var output-port not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_33380            # jump around closure body
_L_33379:
# check argument count
    cmp $4,%eax
    je _L_33381
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_33381:
# emit-tail-expr
# si=-12
# env=((f3993 . -8) (output-port . 12) (symbol=? . 8) (vector-length? . 4))
# expr=(let ((f3993 f3993)) (if (vector? f3993) (if (fx= 6 (vector-length? f3993)) (symbol=? (vector-ref f3993 0) ((primitive-ref string->symbol) "output-port")) #f) #f))
# emit-tail-let
#  si   = -12
#  env  = ((f3993 . -8) (output-port . 12) (symbol=? . 8) (vector-length? . 4))
#  bindings = ((f3993 f3993))
#  body = (if (vector? f3993) (if (fx= 6 (vector-length? f3993)) (symbol=? (vector-ref f3993 0) ((primitive-ref string->symbol) "output-port")) #f) #f)
# emit-expr f3993
# emit-variable-ref
# env=((f3993 . -8) (output-port . 12) (symbol=? . 8) (vector-length? . 4))
# var=f3993
    movl -8(%esp), %eax  # stack load f3993
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f3993 . -12) (f3993 . -8) (output-port . 12) (symbol=? . 8) (vector-length? . 4))
# expr=(if (vector? f3993) (if (fx= 6 (vector-length? f3993)) (symbol=? (vector-ref f3993 0) ((primitive-ref string->symbol) "output-port")) #f) #f)
# emit-expr (vector? f3993)
# emit-expr f3993
# emit-variable-ref
# env=((f3993 . -12) (f3993 . -8) (output-port . 12) (symbol=? . 8) (vector-length? . 4))
# var=f3993
    movl -12(%esp), %eax  # stack load f3993
# end emit-variable-ref
    and $7, %al
    cmp $5, %al
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_33382
# emit-tail-expr
# si=-16
# env=((f3993 . -12) (f3993 . -8) (output-port . 12) (symbol=? . 8) (vector-length? . 4))
# expr=(if (fx= 6 (vector-length? f3993)) (symbol=? (vector-ref f3993 0) ((primitive-ref string->symbol) "output-port")) #f)
# emit-expr (fx= 6 (vector-length? f3993))
# emit-expr (vector-length? f3993)
# funcall
#    si   =-16
#    env  = ((f3993 . -12) (f3993 . -8) (output-port . 12) (symbol=? . 8) (vector-length? . 4))
#    expr = (funcall vector-length? f3993)
# emit-expr vector-length?
# emit-variable-ref
# env=((f3993 . -12) (f3993 . -8) (output-port . 12) (symbol=? . 8) (vector-length? . 4))
# var=vector-length?
    movl 2(%edi), %eax  # frame load vector-length?
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33386"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33386":
   movl %eax,  -24(%esp)  # stash funcall-oper in closure slot
# emit-expr f3993
# emit-variable-ref
# env=((f3993 . -12) (f3993 . -8) (output-port . 12) (symbol=? . 8) (vector-length? . 4))
# var=f3993
    movl -12(%esp), %eax  # stack load f3993
# end emit-variable-ref
    mov %eax, -28(%esp)  # arg f3993
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
    je "_L_33387"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33387:
    movl %eax, -16(%esp)
# emit-expr 6
    movl $24, %eax     # immed 6
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33388"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33388:
    cmp -16(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_33384
# emit-tail-expr
# si=-16
# env=((f3993 . -12) (f3993 . -8) (output-port . 12) (symbol=? . 8) (vector-length? . 4))
# expr=(symbol=? (vector-ref f3993 0) ((primitive-ref string->symbol) "output-port"))
# emit-tail-funcall
#    si   =-16
#    env  = ((f3993 . -12) (f3993 . -8) (output-port . 12) (symbol=? . 8) (vector-length? . 4))
#    expr = (funcall symbol=? (vector-ref f3993 0) ((primitive-ref string->symbol) "output-port"))
# emit-expr symbol=?
# emit-variable-ref
# env=((f3993 . -12) (f3993 . -8) (output-port . 12) (symbol=? . 8) (vector-length? . 4))
# var=symbol=?
    movl 6(%edi), %eax  # frame load symbol=?
# end emit-variable-ref
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr (vector-ref f3993 0)
# emit-expr f3993
# emit-variable-ref
# env=((f3993 . -12) (f3993 . -8) (output-port . 12) (symbol=? . 8) (vector-length? . 4))
# var=f3993
    movl -12(%esp), %eax  # stack load f3993
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_33389
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33389:
    movl %eax, -20(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_33390"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_33390:
# check bounds on vector index
    movl -20(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_33392
    cmp  $0,%eax
    jge _L_33391
_L_33392:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_33391:
    movl -20(%esp), %esi
    movl -1(%eax,%esi), %eax
    mov %eax, -20(%esp)    # arg (vector-ref f3993 0)
# emit-expr ((primitive-ref string->symbol) "output-port")
# funcall
#    si   =-24
#    env  = ((f3993 . -12) (f3993 . -8) (output-port . 12) (symbol=? . 8) (vector-length? . 4))
#    expr = (funcall (primitive-ref string->symbol) "output-port")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33393"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33393":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr "output-port"
# string literal
    jmp _L_33395
    .align 8,0x90
_L_33394 :
    .int 44
    .ascii "output-port"
_L_33395:
    movl $_L_33394, %eax
    orl $6, %eax
    mov %eax, -36(%esp)  # arg output-port
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -24(%esp)    # arg ((primitive-ref string->symbol) output-port)
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
    jmp _L_33385
_L_33384:
# emit-tail-expr
# si=-16
# env=((f3993 . -12) (f3993 . -8) (output-port . 12) (symbol=? . 8) (vector-length? . 4))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_33385:
    jmp _L_33383
_L_33382:
# emit-tail-expr
# si=-16
# env=((f3993 . -12) (f3993 . -8) (output-port . 12) (symbol=? . 8) (vector-length? . 4))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_33383:
    .align 4,0x90
_L_33380:
     movl %eax, output$mport$q
# == explicit-begins  ==>
# (lambda (x) (error (quote open-output) "not yet implemented"))
# == eliminate-let*  ==>
# (lambda (x) (error (quote open-output) "not yet implemented"))
# == uniquify-variables  ==>
# (lambda (f3994) (error (quote open-output) "not yet implemented"))
# == vectorize-letrec  ==>
# (lambda (f3994) (error (quote open-output) "not yet implemented"))
# == eliminate-set!  ==>
# (lambda (f3994) (let ((f3994 f3994)) (error (quote open-output) "not yet implemented")))
# == close-free-variables  ==>
# (closure (f3994) (error open-output) (let ((f3994 f3994)) (error (quote open-output) "not yet implemented")))
# == eliminate-quote  ==>
# (closure (f3994) (error open-output) (let ((f3994 f3994)) (error (string->symbol "open-output") "not yet implemented")))
# == eliminate-when/unless  ==>
# (closure (f3994) (error open-output) (let ((f3994 f3994)) (error (string->symbol "open-output") "not yet implemented")))
# == eliminate-cond  ==>
# (closure (f3994) (error open-output) (let ((f3994 f3994)) (error (string->symbol "open-output") "not yet implemented")))
# == external-symbols  ==>
# (closure (f3994) ((primitive-ref error) open-output) (let ((f3994 f3994)) ((primitive-ref error) ((primitive-ref string->symbol) "open-output") "not yet implemented")))
# emit-expr (closure (f3994) ((primitive-ref error) open-output) (let ((f3994 f3994)) ((primitive-ref error) ((primitive-ref string->symbol) "open-output") "not yet implemented")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f3994) ((primitive-ref error) open-output) (let ((f3994 f3994)) ((primitive-ref error) ((primitive-ref string->symbol) "open-output") "not yet implemented")))
    movl $_L_33396, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var open-output not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_33397            # jump around closure body
_L_33396:
# check argument count
    cmp $4,%eax
    je _L_33398
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_33398:
# emit-tail-expr
# si=-12
# env=((f3994 . -8) (open-output . 8) ((primitive-ref error) . 4))
# expr=(let ((f3994 f3994)) ((primitive-ref error) ((primitive-ref string->symbol) "open-output") "not yet implemented"))
# emit-tail-let
#  si   = -12
#  env  = ((f3994 . -8) (open-output . 8) ((primitive-ref error) . 4))
#  bindings = ((f3994 f3994))
#  body = ((primitive-ref error) ((primitive-ref string->symbol) "open-output") "not yet implemented")
# emit-expr f3994
# emit-variable-ref
# env=((f3994 . -8) (open-output . 8) ((primitive-ref error) . 4))
# var=f3994
    movl -8(%esp), %eax  # stack load f3994
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f3994 . -12) (f3994 . -8) (open-output . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref string->symbol) "open-output") "not yet implemented")
# emit-tail-funcall
#    si   =-16
#    env  = ((f3994 . -12) (f3994 . -8) (open-output . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref string->symbol) "open-output") "not yet implemented")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref string->symbol) "open-output")
# funcall
#    si   =-20
#    env  = ((f3994 . -12) (f3994 . -8) (open-output . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref string->symbol) "open-output")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33399"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33399":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr "open-output"
# string literal
    jmp _L_33401
    .align 8,0x90
_L_33400 :
    .int 44
    .ascii "open-output"
_L_33401:
    movl $_L_33400, %eax
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
    jmp _L_33403
    .align 8,0x90
_L_33402 :
    .int 76
    .ascii "not yet implemented"
_L_33403:
    movl $_L_33402, %eax
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
_L_33397:
     movl %eax, open$moutput$mfile
# == explicit-begins  ==>
# (lambda (p) (flush-output-port p))
# == eliminate-let*  ==>
# (lambda (p) (flush-output-port p))
# == uniquify-variables  ==>
# (lambda (f3995) (flush-output-port f3995))
# == vectorize-letrec  ==>
# (lambda (f3995) (flush-output-port f3995))
# == eliminate-set!  ==>
# (lambda (f3995) (let ((f3995 f3995)) (flush-output-port f3995)))
# == close-free-variables  ==>
# (closure (f3995) (flush-output-port) (let ((f3995 f3995)) (flush-output-port f3995)))
# == eliminate-quote  ==>
# (closure (f3995) (flush-output-port) (let ((f3995 f3995)) (flush-output-port f3995)))
# == eliminate-when/unless  ==>
# (closure (f3995) (flush-output-port) (let ((f3995 f3995)) (flush-output-port f3995)))
# == eliminate-cond  ==>
# (closure (f3995) (flush-output-port) (let ((f3995 f3995)) (flush-output-port f3995)))
# == external-symbols  ==>
# (closure (f3995) ((primitive-ref flush-output-port)) (let ((f3995 f3995)) ((primitive-ref flush-output-port) f3995)))
# emit-expr (closure (f3995) ((primitive-ref flush-output-port)) (let ((f3995 f3995)) ((primitive-ref flush-output-port) f3995)))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f3995) ((primitive-ref flush-output-port)) (let ((f3995 f3995)) ((primitive-ref flush-output-port) f3995)))
    movl $_L_33404, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref flush-output-port) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_33405            # jump around closure body
_L_33404:
# check argument count
    cmp $4,%eax
    je _L_33406
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_33406:
# emit-tail-expr
# si=-12
# env=((f3995 . -8) ((primitive-ref flush-output-port) . 4))
# expr=(let ((f3995 f3995)) ((primitive-ref flush-output-port) f3995))
# emit-tail-let
#  si   = -12
#  env  = ((f3995 . -8) ((primitive-ref flush-output-port) . 4))
#  bindings = ((f3995 f3995))
#  body = ((primitive-ref flush-output-port) f3995)
# emit-expr f3995
# emit-variable-ref
# env=((f3995 . -8) ((primitive-ref flush-output-port) . 4))
# var=f3995
    movl -8(%esp), %eax  # stack load f3995
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f3995 . -12) (f3995 . -8) ((primitive-ref flush-output-port) . 4))
# expr=((primitive-ref flush-output-port) f3995)
# emit-tail-funcall
#    si   =-16
#    env  = ((f3995 . -12) (f3995 . -8) ((primitive-ref flush-output-port) . 4))
#    expr = (funcall (primitive-ref flush-output-port) f3995)
# emit-expr (primitive-ref flush-output-port)
    .extern flush$moutput$mport
    movl flush$moutput$mport,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f3995
# emit-variable-ref
# env=((f3995 . -12) (f3995 . -8) ((primitive-ref flush-output-port) . 4))
# var=f3995
    movl -12(%esp), %eax  # stack load f3995
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f3995
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
    .align 4,0x90
_L_33405:
     movl %eax, close$moutput$mport
# == explicit-begins  ==>
# (lambda (expr) (cond ((boolean? expr) (begin (write-char #\#) (if expr (write-char #\t) (write-char #\f)))) ((null? expr) (begin (write-char #\() (write-char #\)))) ((char? expr) (begin (write-char #\#) (write-char #\\) (write-char expr))) (else (error (quote write) "unrecognized expression"))))
# == eliminate-let*  ==>
# (lambda (expr) (cond ((boolean? expr) (begin (write-char #\#) (if expr (write-char #\t) (write-char #\f)))) ((null? expr) (begin (write-char #\() (write-char #\)))) ((char? expr) (begin (write-char #\#) (write-char #\\) (write-char expr))) (else (error (quote write) "unrecognized expression"))))
# == uniquify-variables  ==>
# (lambda (f3996) (cond ((boolean? f3996) (begin (write-char #\#) (if f3996 (write-char #\t) (write-char #\f)))) ((null? f3996) (begin (write-char #\() (write-char #\)))) ((char? f3996) (begin (write-char #\#) (write-char #\\) (write-char f3996))) (else (error (quote write) "unrecognized expression"))))
# == vectorize-letrec  ==>
# (lambda (f3996) (cond ((boolean? f3996) (begin (write-char #\#) (if f3996 (write-char #\t) (write-char #\f)))) ((null? f3996) (begin (write-char #\() (write-char #\)))) ((char? f3996) (begin (write-char #\#) (write-char #\\) (write-char f3996))) (else (error (quote write) "unrecognized expression"))))
# == eliminate-set!  ==>
# (lambda (f3996) (let ((f3996 f3996)) (cond ((boolean? f3996) (begin (write-char #\#) (if f3996 (write-char #\t) (write-char #\f)))) ((null? f3996) (begin (write-char #\() (write-char #\)))) ((char? f3996) (begin (write-char #\#) (write-char #\\) (write-char f3996))) (else (error (quote write) "unrecognized expression")))))
# == close-free-variables  ==>
# (closure (f3996) (write-char write-char write-char write-char write-char write-char write-char write-char else error write) (let ((f3996 f3996)) (cond ((boolean? f3996) (begin (write-char #\#) (if f3996 (write-char #\t) (write-char #\f)))) ((null? f3996) (begin (write-char #\() (write-char #\)))) ((char? f3996) (begin (write-char #\#) (write-char #\\) (write-char f3996))) (else (error (quote write) "unrecognized expression")))))
# == eliminate-quote  ==>
# (closure (f3996) (write-char write-char write-char write-char write-char write-char write-char write-char else error write) (let ((f3996 f3996)) (cond ((boolean? f3996) (begin (write-char #\#) (if f3996 (write-char #\t) (write-char #\f)))) ((null? f3996) (begin (write-char #\() (write-char #\)))) ((char? f3996) (begin (write-char #\#) (write-char #\\) (write-char f3996))) (else (error (string->symbol "write") "unrecognized expression")))))
# == eliminate-when/unless  ==>
# (closure (f3996) (write-char write-char write-char write-char write-char write-char write-char write-char else error write) (let ((f3996 f3996)) (cond ((boolean? f3996) (begin (write-char #\#) (if f3996 (write-char #\t) (write-char #\f)))) ((null? f3996) (begin (write-char #\() (write-char #\)))) ((char? f3996) (begin (write-char #\#) (write-char #\\) (write-char f3996))) (else (error (string->symbol "write") "unrecognized expression")))))
# == eliminate-cond  ==>
# (closure (f3996) (write-char write-char write-char write-char write-char write-char write-char write-char else error write) (let ((f3996 f3996)) (if (boolean? f3996) (begin (write-char #\#) (if f3996 (write-char #\t) (write-char #\f))) (if (null? f3996) (begin (write-char #\() (write-char #\))) (if (char? f3996) (begin (write-char #\#) (write-char #\\) (write-char f3996)) (error (string->symbol "write") "unrecognized expression"))))))
# == external-symbols  ==>
# (closure (f3996) ((primitive-ref write-char) (primitive-ref write-char) (primitive-ref write-char) (primitive-ref write-char) (primitive-ref write-char) (primitive-ref write-char) (primitive-ref write-char) (primitive-ref write-char) else (primitive-ref error) (primitive-ref write)) (let ((f3996 f3996)) (if (boolean? f3996) (begin ((primitive-ref write-char) #\#) (if f3996 ((primitive-ref write-char) #\t) ((primitive-ref write-char) #\f))) (if (null? f3996) (begin ((primitive-ref write-char) #\() ((primitive-ref write-char) #\))) (if (char? f3996) (begin ((primitive-ref write-char) #\#) ((primitive-ref write-char) #\\) ((primitive-ref write-char) f3996)) ((primitive-ref error) ((primitive-ref string->symbol) "write") "unrecognized expression"))))))
# emit-expr (closure (f3996) ((primitive-ref write-char) (primitive-ref write-char) (primitive-ref write-char) (primitive-ref write-char) (primitive-ref write-char) (primitive-ref write-char) (primitive-ref write-char) (primitive-ref write-char) else (primitive-ref error) (primitive-ref write)) (let ((f3996 f3996)) (if (boolean? f3996) (begin ((primitive-ref write-char) #\#) (if f3996 ((primitive-ref write-char) #\t) ((primitive-ref write-char) #\f))) (if (null? f3996) (begin ((primitive-ref write-char) #\() ((primitive-ref write-char) #\))) (if (char? f3996) (begin ((primitive-ref write-char) #\#) ((primitive-ref write-char) #\\) ((primitive-ref write-char) f3996)) ((primitive-ref error) ((primitive-ref string->symbol) "write") "unrecognized expression"))))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f3996) ((primitive-ref write-char) (primitive-ref write-char) (primitive-ref write-char) (primitive-ref write-char) (primitive-ref write-char) (primitive-ref write-char) (primitive-ref write-char) (primitive-ref write-char) else (primitive-ref error) (primitive-ref write)) (let ((f3996 f3996)) (if (boolean? f3996) (begin ((primitive-ref write-char) #\#) (if f3996 ((primitive-ref write-char) #\t) ((primitive-ref write-char) #\f))) (if (null? f3996) (begin ((primitive-ref write-char) #\() ((primitive-ref write-char) #\))) (if (char? f3996) (begin ((primitive-ref write-char) #\#) ((primitive-ref write-char) #\\) ((primitive-ref write-char) f3996)) ((primitive-ref error) ((primitive-ref string->symbol) "write") "unrecognized expression"))))))
    movl $_L_33407, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref write-char) not defined in the environmnet
# WARNING: free var (primitive-ref write-char) not defined in the environmnet
# WARNING: free var (primitive-ref write-char) not defined in the environmnet
# WARNING: free var (primitive-ref write-char) not defined in the environmnet
# WARNING: free var (primitive-ref write-char) not defined in the environmnet
# WARNING: free var (primitive-ref write-char) not defined in the environmnet
# WARNING: free var (primitive-ref write-char) not defined in the environmnet
# WARNING: free var (primitive-ref write-char) not defined in the environmnet
# WARNING: free var else not defined in the environmnet
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref write) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $48, %ebp     # bump ebp
    jmp _L_33408            # jump around closure body
_L_33407:
# check argument count
    cmp $4,%eax
    je _L_33409
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_33409:
# emit-tail-expr
# si=-12
# env=((f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# expr=(let ((f3996 f3996)) (if (boolean? f3996) (begin ((primitive-ref write-char) #\#) (if f3996 ((primitive-ref write-char) #\t) ((primitive-ref write-char) #\f))) (if (null? f3996) (begin ((primitive-ref write-char) #\() ((primitive-ref write-char) #\))) (if (char? f3996) (begin ((primitive-ref write-char) #\#) ((primitive-ref write-char) #\\) ((primitive-ref write-char) f3996)) ((primitive-ref error) ((primitive-ref string->symbol) "write") "unrecognized expression")))))
# emit-tail-let
#  si   = -12
#  env  = ((f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
#  bindings = ((f3996 f3996))
#  body = (if (boolean? f3996) (begin ((primitive-ref write-char) #\#) (if f3996 ((primitive-ref write-char) #\t) ((primitive-ref write-char) #\f))) (if (null? f3996) (begin ((primitive-ref write-char) #\() ((primitive-ref write-char) #\))) (if (char? f3996) (begin ((primitive-ref write-char) #\#) ((primitive-ref write-char) #\\) ((primitive-ref write-char) f3996)) ((primitive-ref error) ((primitive-ref string->symbol) "write") "unrecognized expression"))))
# emit-expr f3996
# emit-variable-ref
# env=((f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# var=f3996
    movl -8(%esp), %eax  # stack load f3996
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# expr=(if (boolean? f3996) (begin ((primitive-ref write-char) #\#) (if f3996 ((primitive-ref write-char) #\t) ((primitive-ref write-char) #\f))) (if (null? f3996) (begin ((primitive-ref write-char) #\() ((primitive-ref write-char) #\))) (if (char? f3996) (begin ((primitive-ref write-char) #\#) ((primitive-ref write-char) #\\) ((primitive-ref write-char) f3996)) ((primitive-ref error) ((primitive-ref string->symbol) "write") "unrecognized expression"))))
# emit-expr (boolean? f3996)
# emit-expr f3996
# emit-variable-ref
# env=((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# var=f3996
    movl -12(%esp), %eax  # stack load f3996
# end emit-variable-ref
    and $191, %eax
    cmp $47, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_33410
# emit-tail-expr
# si=-16
# env=((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# expr=(begin ((primitive-ref write-char) #\#) (if f3996 ((primitive-ref write-char) #\t) ((primitive-ref write-char) #\f)))
# tail-begin (begin ((primitive-ref write-char) #\#) (if f3996 ((primitive-ref write-char) #\t) ((primitive-ref write-char) #\f)))
#   env=((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# emit-expr ((primitive-ref write-char) #\#)
# funcall
#    si   =-16
#    env  = ((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
#    expr = (funcall (primitive-ref write-char) #\#)
# emit-expr (primitive-ref write-char)
    .extern write$mchar
    movl write$mchar,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33412"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33412":
   movl %eax,  -24(%esp)  # stash funcall-oper in closure slot
# emit-expr #\#
    movl $8975, %eax     # immed #\#
    mov %eax, -28(%esp)  # arg #
    movl -24(%esp), %edi   # load new closure to %edi
    add $-16, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $16, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-16
# env=((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# expr=(begin (if f3996 ((primitive-ref write-char) #\t) ((primitive-ref write-char) #\f)))
# tail-begin (begin (if f3996 ((primitive-ref write-char) #\t) ((primitive-ref write-char) #\f)))
#   env=((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# emit-tail-expr
# si=-16
# env=((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# expr=(if f3996 ((primitive-ref write-char) #\t) ((primitive-ref write-char) #\f))
# emit-expr f3996
# emit-variable-ref
# env=((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# var=f3996
    movl -12(%esp), %eax  # stack load f3996
# end emit-variable-ref
    cmp $47, %al
    je _L_33413
# emit-tail-expr
# si=-16
# env=((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# expr=((primitive-ref write-char) #\t)
# emit-tail-funcall
#    si   =-16
#    env  = ((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
#    expr = (funcall (primitive-ref write-char) #\t)
# emit-expr (primitive-ref write-char)
    .extern write$mchar
    movl write$mchar,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr #\t
    movl $29711, %eax     # immed #\t
    mov %eax, -20(%esp)    # arg t
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
    jmp _L_33414
_L_33413:
# emit-tail-expr
# si=-16
# env=((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# expr=((primitive-ref write-char) #\f)
# emit-tail-funcall
#    si   =-16
#    env  = ((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
#    expr = (funcall (primitive-ref write-char) #\f)
# emit-expr (primitive-ref write-char)
    .extern write$mchar
    movl write$mchar,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr #\f
    movl $26127, %eax     # immed #\f
    mov %eax, -20(%esp)    # arg f
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
_L_33414:
     ret   # return thru stack
    jmp _L_33411
_L_33410:
# emit-tail-expr
# si=-16
# env=((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# expr=(if (null? f3996) (begin ((primitive-ref write-char) #\() ((primitive-ref write-char) #\))) (if (char? f3996) (begin ((primitive-ref write-char) #\#) ((primitive-ref write-char) #\\) ((primitive-ref write-char) f3996)) ((primitive-ref error) ((primitive-ref string->symbol) "write") "unrecognized expression")))
# emit-expr (null? f3996)
# emit-expr f3996
# emit-variable-ref
# env=((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# var=f3996
    movl -12(%esp), %eax  # stack load f3996
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_33415
# emit-tail-expr
# si=-16
# env=((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# expr=(begin ((primitive-ref write-char) #\() ((primitive-ref write-char) #\)))
# tail-begin (begin ((primitive-ref write-char) #\() ((primitive-ref write-char) #\)))
#   env=((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# emit-expr ((primitive-ref write-char) #\()
# funcall
#    si   =-16
#    env  = ((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
#    expr = (funcall (primitive-ref write-char) #\()
# emit-expr (primitive-ref write-char)
    .extern write$mchar
    movl write$mchar,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33417"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33417":
   movl %eax,  -24(%esp)  # stash funcall-oper in closure slot
# emit-expr #\(
    movl $10255, %eax     # immed #\(
    mov %eax, -28(%esp)  # arg (
    movl -24(%esp), %edi   # load new closure to %edi
    add $-16, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $16, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-16
# env=((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# expr=(begin ((primitive-ref write-char) #\)))
# tail-begin (begin ((primitive-ref write-char) #\)))
#   env=((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# emit-tail-expr
# si=-16
# env=((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# expr=((primitive-ref write-char) #\))
# emit-tail-funcall
#    si   =-16
#    env  = ((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
#    expr = (funcall (primitive-ref write-char) #\))
# emit-expr (primitive-ref write-char)
    .extern write$mchar
    movl write$mchar,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr #\)
    movl $10511, %eax     # immed #\)
    mov %eax, -20(%esp)    # arg )
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
    jmp _L_33416
_L_33415:
# emit-tail-expr
# si=-16
# env=((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# expr=(if (char? f3996) (begin ((primitive-ref write-char) #\#) ((primitive-ref write-char) #\\) ((primitive-ref write-char) f3996)) ((primitive-ref error) ((primitive-ref string->symbol) "write") "unrecognized expression"))
# emit-expr (char? f3996)
# emit-expr f3996
# emit-variable-ref
# env=((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# var=f3996
    movl -12(%esp), %eax  # stack load f3996
# end emit-variable-ref
    and $255, %eax
    cmp $15, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_33418
# emit-tail-expr
# si=-16
# env=((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# expr=(begin ((primitive-ref write-char) #\#) ((primitive-ref write-char) #\\) ((primitive-ref write-char) f3996))
# tail-begin (begin ((primitive-ref write-char) #\#) ((primitive-ref write-char) #\\) ((primitive-ref write-char) f3996))
#   env=((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# emit-expr ((primitive-ref write-char) #\#)
# funcall
#    si   =-16
#    env  = ((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
#    expr = (funcall (primitive-ref write-char) #\#)
# emit-expr (primitive-ref write-char)
    .extern write$mchar
    movl write$mchar,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33420"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33420":
   movl %eax,  -24(%esp)  # stash funcall-oper in closure slot
# emit-expr #\#
    movl $8975, %eax     # immed #\#
    mov %eax, -28(%esp)  # arg #
    movl -24(%esp), %edi   # load new closure to %edi
    add $-16, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $16, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-16
# env=((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# expr=(begin ((primitive-ref write-char) #\\) ((primitive-ref write-char) f3996))
# tail-begin (begin ((primitive-ref write-char) #\\) ((primitive-ref write-char) f3996))
#   env=((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# emit-expr ((primitive-ref write-char) #\\)
# funcall
#    si   =-16
#    env  = ((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
#    expr = (funcall (primitive-ref write-char) #\\)
# emit-expr (primitive-ref write-char)
    .extern write$mchar
    movl write$mchar,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33421"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33421":
   movl %eax,  -24(%esp)  # stash funcall-oper in closure slot
# emit-expr #\\
    movl $23567, %eax     # immed #\\
    mov %eax, -28(%esp)  # arg \
    movl -24(%esp), %edi   # load new closure to %edi
    add $-16, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $16, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-16
# env=((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# expr=(begin ((primitive-ref write-char) f3996))
# tail-begin (begin ((primitive-ref write-char) f3996))
#   env=((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# emit-tail-expr
# si=-16
# env=((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# expr=((primitive-ref write-char) f3996)
# emit-tail-funcall
#    si   =-16
#    env  = ((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
#    expr = (funcall (primitive-ref write-char) f3996)
# emit-expr (primitive-ref write-char)
    .extern write$mchar
    movl write$mchar,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f3996
# emit-variable-ref
# env=((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# var=f3996
    movl -12(%esp), %eax  # stack load f3996
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f3996
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
    jmp _L_33419
_L_33418:
# emit-tail-expr
# si=-16
# env=((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
# expr=((primitive-ref error) ((primitive-ref string->symbol) "write") "unrecognized expression")
# emit-tail-funcall
#    si   =-16
#    env  = ((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref string->symbol) "write") "unrecognized expression")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref string->symbol) "write")
# funcall
#    si   =-20
#    env  = ((f3996 . -12) (f3996 . -8) ((primitive-ref write) . 44) ((primitive-ref error) . 40) (else . 36) ((primitive-ref write-char) . 32) ((primitive-ref write-char) . 28) ((primitive-ref write-char) . 24) ((primitive-ref write-char) . 20) ((primitive-ref write-char) . 16) ((primitive-ref write-char) . 12) ((primitive-ref write-char) . 8) ((primitive-ref write-char) . 4))
#    expr = (funcall (primitive-ref string->symbol) "write")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_33422"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_33422":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr "write"
# string literal
    jmp _L_33424
    .align 8,0x90
_L_33423 :
    .int 20
    .ascii "write"
_L_33424:
    movl $_L_33423, %eax
    orl $6, %eax
    mov %eax, -32(%esp)  # arg write
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref string->symbol) write)
# emit-expr "unrecognized expression"
# string literal
    jmp _L_33426
    .align 8,0x90
_L_33425 :
    .int 92
    .ascii "unrecognized expression"
_L_33426:
    movl $_L_33425, %eax
    orl $6, %eax
    mov %eax, -24(%esp)    # arg unrecognized expression
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
_L_33419:
_L_33416:
_L_33411:
    .align 4,0x90
_L_33408:
     movl %eax, write
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
