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
# (let ((f988 (cons (make-symbol "nil" ()) ()))) (lambda () f988))
# == vectorize-letrec  ==>
# (let ((f988 (cons (make-symbol "nil" ()) ()))) (lambda () f988))
# == eliminate-set!  ==>
# (let ((f988 (cons (make-symbol "nil" ()) ()))) (lambda () (let () f988)))
# == close-free-variables  ==>
# (let ((f988 (cons (make-symbol "nil" ()) ()))) (closure () (f988) (let () f988)))
# == eliminate-quote  ==>
# (let ((f988 (cons (make-symbol "nil" ()) ()))) (closure () (f988) (let () f988)))
# == eliminate-when/unless  ==>
# (let ((f988 (cons (make-symbol "nil" ()) ()))) (closure () (f988) (let () f988)))
# == eliminate-cond  ==>
# (let ((f988 (cons (make-symbol "nil" ()) ()))) (closure () (f988) (let () f988)))
# == external-symbols  ==>
# (let ((f988 (cons (make-symbol "nil" ()) ()))) (closure () (f988) (let () f988)))
# emit-expr (let ((f988 (cons (make-symbol "nil" ()) ()))) (closure () (f988) (let () f988)))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f988 (cons (make-symbol "nil" ()) ())))
#  body = (closure () (f988) (let () f988))
# emit-expr (cons (make-symbol "nil" ()) ())
# cons arg1=(make-symbol "nil" ()) arg2=()
# emit-expr (make-symbol "nil" ())
# make-symbol arg1="nil" arg2=()
# emit-expr "nil"
# string literal
    jmp _L_8805
    .align 8,0x90
_L_8804 :
    .int 12
    .ascii "nil"
_L_8805:
    movl $_L_8804, %eax
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
# emit-expr (closure () (f988) (let () f988))
# emit-closure
# si = -4
# env = ((f988 . 0))
# expr = (closure () (f988) (let () f988))
    movl $_L_8806, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f988 . 0))
# var=f988
    movl 0(%esp), %eax  # stack load f988
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f988
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_8807            # jump around closure body
_L_8806:
# check argument count
    cmp $0,%eax
    je _L_8808
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_8808:
# emit-tail-expr
# si=-8
# env=((f988 . 4) (f988 . 0))
# expr=(let () f988)
# emit-tail-let
#  si   = -8
#  env  = ((f988 . 4) (f988 . 0))
#  bindings = ()
#  body = f988
# emit-tail-expr
# si=-8
# env=((f988 . 4) (f988 . 0))
# expr=f988
# emit-tail-variable-ref
# emit-variable-ref
# env=((f988 . 4) (f988 . 0))
# var=f988
    movl 2(%edi), %eax  # frame load f988
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    .align 4,0x90
_L_8807:
     movl %eax, symbols
# == explicit-begins  ==>
# (letrec ((slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if (si= s1 s2 i) (si<n= s1 s2 (fx+ i 1) n) #f)))) (ss= (lambda (s1 s2) (if (slen= s1 s2) (si<n= s1 s2 0 (string-length s1)) #f)))) ss=)
# == eliminate-let*  ==>
# (letrec ((slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if (si= s1 s2 i) (si<n= s1 s2 (fx+ i 1) n) #f)))) (ss= (lambda (s1 s2) (if (slen= s1 s2) (si<n= s1 s2 0 (string-length s1)) #f)))) ss=)
# == uniquify-variables  ==>
# (letrec ((f992 (lambda (f1013 f1014) (fx= (string-length f1013) (string-length f1014)))) (f991 (lambda (f1010 f1011 f1012) (char=? (string-ref f1010 f1012) (string-ref f1011 f1012)))) (f990 (lambda (f1006 f1007 f1008 f1009) (if (fx= f1008 f1009) #t (if (f991 f1006 f1007 f1008) (f990 f1006 f1007 (fx+ f1008 1) f1009) #f)))) (f989 (lambda (f1004 f1005) (if (f992 f1004 f1005) (f990 f1004 f1005 0 (string-length f1004)) #f)))) f989)
# == vectorize-letrec  ==>
# (let ((f992 (make-vector 1)) (f991 (make-vector 1)) (f990 (make-vector 1)) (f989 (make-vector 1))) (begin (begin (vector-set! f992 0 (lambda (f1013 f1014) (fx= (string-length f1013) (string-length f1014)))) (vector-set! f991 0 (lambda (f1010 f1011 f1012) (char=? (string-ref f1010 f1012) (string-ref f1011 f1012)))) (vector-set! f990 0 (lambda (f1006 f1007 f1008 f1009) (if (fx= f1008 f1009) #t (if ((vector-ref f991 0) f1006 f1007 f1008) ((vector-ref f990 0) f1006 f1007 (fx+ f1008 1) f1009) #f)))) (vector-set! f989 0 (lambda (f1004 f1005) (if ((vector-ref f992 0) f1004 f1005) ((vector-ref f990 0) f1004 f1005 0 (string-length f1004)) #f)))) (vector-ref f989 0)))
# == eliminate-set!  ==>
# (let ((f992 (make-vector 1)) (f991 (make-vector 1)) (f990 (make-vector 1)) (f989 (make-vector 1))) (begin (begin (vector-set! f992 0 (lambda (f1013 f1014) (let ((f1013 f1013) (f1014 f1014)) (fx= (string-length f1013) (string-length f1014))))) (vector-set! f991 0 (lambda (f1010 f1011 f1012) (let ((f1010 f1010) (f1011 f1011) (f1012 f1012)) (char=? (string-ref f1010 f1012) (string-ref f1011 f1012))))) (vector-set! f990 0 (lambda (f1006 f1007 f1008 f1009) (let ((f1006 f1006) (f1007 f1007) (f1008 f1008) (f1009 f1009)) (if (fx= f1008 f1009) #t (if ((vector-ref f991 0) f1006 f1007 f1008) ((vector-ref f990 0) f1006 f1007 (fx+ f1008 1) f1009) #f))))) (vector-set! f989 0 (lambda (f1004 f1005) (let ((f1004 f1004) (f1005 f1005)) (if ((vector-ref f992 0) f1004 f1005) ((vector-ref f990 0) f1004 f1005 0 (string-length f1004)) #f))))) (vector-ref f989 0)))
# == close-free-variables  ==>
# (let ((f992 (make-vector 1)) (f991 (make-vector 1)) (f990 (make-vector 1)) (f989 (make-vector 1))) (begin (begin (vector-set! f992 0 (closure (f1013 f1014) () (let ((f1013 f1013) (f1014 f1014)) (fx= (string-length f1013) (string-length f1014))))) (vector-set! f991 0 (closure (f1010 f1011 f1012) () (let ((f1010 f1010) (f1011 f1011) (f1012 f1012)) (char=? (string-ref f1010 f1012) (string-ref f1011 f1012))))) (vector-set! f990 0 (closure (f1006 f1007 f1008 f1009) (f991 f990) (let ((f1006 f1006) (f1007 f1007) (f1008 f1008) (f1009 f1009)) (if (fx= f1008 f1009) #t (if ((vector-ref f991 0) f1006 f1007 f1008) ((vector-ref f990 0) f1006 f1007 (fx+ f1008 1) f1009) #f))))) (vector-set! f989 0 (closure (f1004 f1005) (f992 f990) (let ((f1004 f1004) (f1005 f1005)) (if ((vector-ref f992 0) f1004 f1005) ((vector-ref f990 0) f1004 f1005 0 (string-length f1004)) #f))))) (vector-ref f989 0)))
# == eliminate-quote  ==>
# (let ((f992 (make-vector 1)) (f991 (make-vector 1)) (f990 (make-vector 1)) (f989 (make-vector 1))) (begin (begin (vector-set! f992 0 (closure (f1013 f1014) () (let ((f1013 f1013) (f1014 f1014)) (fx= (string-length f1013) (string-length f1014))))) (vector-set! f991 0 (closure (f1010 f1011 f1012) () (let ((f1010 f1010) (f1011 f1011) (f1012 f1012)) (char=? (string-ref f1010 f1012) (string-ref f1011 f1012))))) (vector-set! f990 0 (closure (f1006 f1007 f1008 f1009) (f991 f990) (let ((f1006 f1006) (f1007 f1007) (f1008 f1008) (f1009 f1009)) (if (fx= f1008 f1009) #t (if ((vector-ref f991 0) f1006 f1007 f1008) ((vector-ref f990 0) f1006 f1007 (fx+ f1008 1) f1009) #f))))) (vector-set! f989 0 (closure (f1004 f1005) (f992 f990) (let ((f1004 f1004) (f1005 f1005)) (if ((vector-ref f992 0) f1004 f1005) ((vector-ref f990 0) f1004 f1005 0 (string-length f1004)) #f))))) (vector-ref f989 0)))
# == eliminate-when/unless  ==>
# (let ((f992 (make-vector 1)) (f991 (make-vector 1)) (f990 (make-vector 1)) (f989 (make-vector 1))) (begin (begin (vector-set! f992 0 (closure (f1013 f1014) () (let ((f1013 f1013) (f1014 f1014)) (fx= (string-length f1013) (string-length f1014))))) (vector-set! f991 0 (closure (f1010 f1011 f1012) () (let ((f1010 f1010) (f1011 f1011) (f1012 f1012)) (char=? (string-ref f1010 f1012) (string-ref f1011 f1012))))) (vector-set! f990 0 (closure (f1006 f1007 f1008 f1009) (f991 f990) (let ((f1006 f1006) (f1007 f1007) (f1008 f1008) (f1009 f1009)) (if (fx= f1008 f1009) #t (if ((vector-ref f991 0) f1006 f1007 f1008) ((vector-ref f990 0) f1006 f1007 (fx+ f1008 1) f1009) #f))))) (vector-set! f989 0 (closure (f1004 f1005) (f992 f990) (let ((f1004 f1004) (f1005 f1005)) (if ((vector-ref f992 0) f1004 f1005) ((vector-ref f990 0) f1004 f1005 0 (string-length f1004)) #f))))) (vector-ref f989 0)))
# == eliminate-cond  ==>
# (let ((f992 (make-vector 1)) (f991 (make-vector 1)) (f990 (make-vector 1)) (f989 (make-vector 1))) (begin (begin (vector-set! f992 0 (closure (f1013 f1014) () (let ((f1013 f1013) (f1014 f1014)) (fx= (string-length f1013) (string-length f1014))))) (vector-set! f991 0 (closure (f1010 f1011 f1012) () (let ((f1010 f1010) (f1011 f1011) (f1012 f1012)) (char=? (string-ref f1010 f1012) (string-ref f1011 f1012))))) (vector-set! f990 0 (closure (f1006 f1007 f1008 f1009) (f991 f990) (let ((f1006 f1006) (f1007 f1007) (f1008 f1008) (f1009 f1009)) (if (fx= f1008 f1009) #t (if ((vector-ref f991 0) f1006 f1007 f1008) ((vector-ref f990 0) f1006 f1007 (fx+ f1008 1) f1009) #f))))) (vector-set! f989 0 (closure (f1004 f1005) (f992 f990) (let ((f1004 f1004) (f1005 f1005)) (if ((vector-ref f992 0) f1004 f1005) ((vector-ref f990 0) f1004 f1005 0 (string-length f1004)) #f))))) (vector-ref f989 0)))
# == external-symbols  ==>
# (let ((f992 (make-vector 1)) (f991 (make-vector 1)) (f990 (make-vector 1)) (f989 (make-vector 1))) (begin (begin (vector-set! f992 0 (closure (f1013 f1014) () (let ((f1013 f1013) (f1014 f1014)) (fx= (string-length f1013) (string-length f1014))))) (vector-set! f991 0 (closure (f1010 f1011 f1012) () (let ((f1010 f1010) (f1011 f1011) (f1012 f1012)) (char=? (string-ref f1010 f1012) (string-ref f1011 f1012))))) (vector-set! f990 0 (closure (f1006 f1007 f1008 f1009) (f991 f990) (let ((f1006 f1006) (f1007 f1007) (f1008 f1008) (f1009 f1009)) (if (fx= f1008 f1009) #t (if ((vector-ref f991 0) f1006 f1007 f1008) ((vector-ref f990 0) f1006 f1007 (fx+ f1008 1) f1009) #f))))) (vector-set! f989 0 (closure (f1004 f1005) (f992 f990) (let ((f1004 f1004) (f1005 f1005)) (if ((vector-ref f992 0) f1004 f1005) ((vector-ref f990 0) f1004 f1005 0 (string-length f1004)) #f))))) (vector-ref f989 0)))
# emit-expr (let ((f992 (make-vector 1)) (f991 (make-vector 1)) (f990 (make-vector 1)) (f989 (make-vector 1))) (begin (begin (vector-set! f992 0 (closure (f1013 f1014) () (let ((f1013 f1013) (f1014 f1014)) (fx= (string-length f1013) (string-length f1014))))) (vector-set! f991 0 (closure (f1010 f1011 f1012) () (let ((f1010 f1010) (f1011 f1011) (f1012 f1012)) (char=? (string-ref f1010 f1012) (string-ref f1011 f1012))))) (vector-set! f990 0 (closure (f1006 f1007 f1008 f1009) (f991 f990) (let ((f1006 f1006) (f1007 f1007) (f1008 f1008) (f1009 f1009)) (if (fx= f1008 f1009) #t (if ((vector-ref f991 0) f1006 f1007 f1008) ((vector-ref f990 0) f1006 f1007 (fx+ f1008 1) f1009) #f))))) (vector-set! f989 0 (closure (f1004 f1005) (f992 f990) (let ((f1004 f1004) (f1005 f1005)) (if ((vector-ref f992 0) f1004 f1005) ((vector-ref f990 0) f1004 f1005 0 (string-length f1004)) #f))))) (vector-ref f989 0)))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f992 (make-vector 1)) (f991 (make-vector 1)) (f990 (make-vector 1)) (f989 (make-vector 1)))
#  body = (begin (begin (vector-set! f992 0 (closure (f1013 f1014) () (let ((f1013 f1013) (f1014 f1014)) (fx= (string-length f1013) (string-length f1014))))) (vector-set! f991 0 (closure (f1010 f1011 f1012) () (let ((f1010 f1010) (f1011 f1011) (f1012 f1012)) (char=? (string-ref f1010 f1012) (string-ref f1011 f1012))))) (vector-set! f990 0 (closure (f1006 f1007 f1008 f1009) (f991 f990) (let ((f1006 f1006) (f1007 f1007) (f1008 f1008) (f1009 f1009)) (if (fx= f1008 f1009) #t (if ((vector-ref f991 0) f1006 f1007 f1008) ((vector-ref f990 0) f1006 f1007 (fx+ f1008 1) f1009) #f))))) (vector-set! f989 0 (closure (f1004 f1005) (f992 f990) (let ((f1004 f1004) (f1005 f1005)) (if ((vector-ref f992 0) f1004 f1005) ((vector-ref f990 0) f1004 f1005 0 (string-length f1004)) #f))))) (vector-ref f989 0))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8809"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8809:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_8810
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8810:
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
    je "_L_8811"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8811:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_8812
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8812:
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
    je "_L_8813"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8813:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_8814
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8814:
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
    je "_L_8815"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8815:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_8816
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8816:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, -12(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f992 0 (closure (f1013 f1014) () (let ((f1013 f1013) (f1014 f1014)) (fx= (string-length f1013) (string-length f1014))))) (vector-set! f991 0 (closure (f1010 f1011 f1012) () (let ((f1010 f1010) (f1011 f1011) (f1012 f1012)) (char=? (string-ref f1010 f1012) (string-ref f1011 f1012))))) (vector-set! f990 0 (closure (f1006 f1007 f1008 f1009) (f991 f990) (let ((f1006 f1006) (f1007 f1007) (f1008 f1008) (f1009 f1009)) (if (fx= f1008 f1009) #t (if ((vector-ref f991 0) f1006 f1007 f1008) ((vector-ref f990 0) f1006 f1007 (fx+ f1008 1) f1009) #f))))) (vector-set! f989 0 (closure (f1004 f1005) (f992 f990) (let ((f1004 f1004) (f1005 f1005)) (if ((vector-ref f992 0) f1004 f1005) ((vector-ref f990 0) f1004 f1005 0 (string-length f1004)) #f))))) (vector-ref f989 0))
# emit-begin
#   expr=(begin (begin (vector-set! f992 0 (closure (f1013 f1014) () (let ((f1013 f1013) (f1014 f1014)) (fx= (string-length f1013) (string-length f1014))))) (vector-set! f991 0 (closure (f1010 f1011 f1012) () (let ((f1010 f1010) (f1011 f1011) (f1012 f1012)) (char=? (string-ref f1010 f1012) (string-ref f1011 f1012))))) (vector-set! f990 0 (closure (f1006 f1007 f1008 f1009) (f991 f990) (let ((f1006 f1006) (f1007 f1007) (f1008 f1008) (f1009 f1009)) (if (fx= f1008 f1009) #t (if ((vector-ref f991 0) f1006 f1007 f1008) ((vector-ref f990 0) f1006 f1007 (fx+ f1008 1) f1009) #f))))) (vector-set! f989 0 (closure (f1004 f1005) (f992 f990) (let ((f1004 f1004) (f1005 f1005)) (if ((vector-ref f992 0) f1004 f1005) ((vector-ref f990 0) f1004 f1005 0 (string-length f1004)) #f))))) (vector-ref f989 0))
#   env=((f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# emit-expr (begin (vector-set! f992 0 (closure (f1013 f1014) () (let ((f1013 f1013) (f1014 f1014)) (fx= (string-length f1013) (string-length f1014))))) (vector-set! f991 0 (closure (f1010 f1011 f1012) () (let ((f1010 f1010) (f1011 f1011) (f1012 f1012)) (char=? (string-ref f1010 f1012) (string-ref f1011 f1012))))) (vector-set! f990 0 (closure (f1006 f1007 f1008 f1009) (f991 f990) (let ((f1006 f1006) (f1007 f1007) (f1008 f1008) (f1009 f1009)) (if (fx= f1008 f1009) #t (if ((vector-ref f991 0) f1006 f1007 f1008) ((vector-ref f990 0) f1006 f1007 (fx+ f1008 1) f1009) #f))))) (vector-set! f989 0 (closure (f1004 f1005) (f992 f990) (let ((f1004 f1004) (f1005 f1005)) (if ((vector-ref f992 0) f1004 f1005) ((vector-ref f990 0) f1004 f1005 0 (string-length f1004)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f992 0 (closure (f1013 f1014) () (let ((f1013 f1013) (f1014 f1014)) (fx= (string-length f1013) (string-length f1014))))) (vector-set! f991 0 (closure (f1010 f1011 f1012) () (let ((f1010 f1010) (f1011 f1011) (f1012 f1012)) (char=? (string-ref f1010 f1012) (string-ref f1011 f1012))))) (vector-set! f990 0 (closure (f1006 f1007 f1008 f1009) (f991 f990) (let ((f1006 f1006) (f1007 f1007) (f1008 f1008) (f1009 f1009)) (if (fx= f1008 f1009) #t (if ((vector-ref f991 0) f1006 f1007 f1008) ((vector-ref f990 0) f1006 f1007 (fx+ f1008 1) f1009) #f))))) (vector-set! f989 0 (closure (f1004 f1005) (f992 f990) (let ((f1004 f1004) (f1005 f1005)) (if ((vector-ref f992 0) f1004 f1005) ((vector-ref f990 0) f1004 f1005 0 (string-length f1004)) #f)))))
#   env=((f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# emit-expr (vector-set! f992 0 (closure (f1013 f1014) () (let ((f1013 f1013) (f1014 f1014)) (fx= (string-length f1013) (string-length f1014)))))
# emit-expr f992
# emit-variable-ref
# env=((f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f992
    movl 0(%esp), %eax  # stack load f992
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_8817
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8817:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8818"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8818:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_8820
    cmp  $0,%eax
    jge _L_8819
_L_8820:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_8819:
    movl %eax, -20(%esp)
# emit-expr (closure (f1013 f1014) () (let ((f1013 f1013) (f1014 f1014)) (fx= (string-length f1013) (string-length f1014))))
# emit-closure
# si = -24
# env = ((f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# expr = (closure (f1013 f1014) () (let ((f1013 f1013) (f1014 f1014)) (fx= (string-length f1013) (string-length f1014))))
    movl $_L_8821, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_8822            # jump around closure body
_L_8821:
# check argument count
    cmp $8,%eax
    je _L_8823
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_8823:
# emit-tail-expr
# si=-16
# env=((f1014 . -12) (f1013 . -8) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# expr=(let ((f1013 f1013) (f1014 f1014)) (fx= (string-length f1013) (string-length f1014)))
# emit-tail-let
#  si   = -16
#  env  = ((f1014 . -12) (f1013 . -8) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
#  bindings = ((f1013 f1013) (f1014 f1014))
#  body = (fx= (string-length f1013) (string-length f1014))
# emit-expr f1013
# emit-variable-ref
# env=((f1014 . -12) (f1013 . -8) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1013
    movl -8(%esp), %eax  # stack load f1013
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f1014
# emit-variable-ref
# env=((f1014 . -12) (f1013 . -8) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1014
    movl -12(%esp), %eax  # stack load f1014
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f1014 . -20) (f1013 . -16) (f1014 . -12) (f1013 . -8) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# expr=(fx= (string-length f1013) (string-length f1014))
# tail primcall
# emit-expr (string-length f1014)
# emit-expr f1014
# emit-variable-ref
# env=((f1014 . -20) (f1013 . -16) (f1014 . -12) (f1013 . -8) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1014
    movl -20(%esp), %eax  # stack load f1014
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_8824
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8824:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8825"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8825:
    movl %eax, -24(%esp)
# emit-expr (string-length f1013)
# emit-expr f1013
# emit-variable-ref
# env=((f1014 . -20) (f1013 . -16) (f1014 . -12) (f1013 . -8) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1013
    movl -16(%esp), %eax  # stack load f1013
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_8826
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8826:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8827"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8827:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (fx= (string-length f1013) (string-length f1014))
    ret
    .align 4,0x90
_L_8822:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f991 0 (closure (f1010 f1011 f1012) () (let ((f1010 f1010) (f1011 f1011) (f1012 f1012)) (char=? (string-ref f1010 f1012) (string-ref f1011 f1012))))) (vector-set! f990 0 (closure (f1006 f1007 f1008 f1009) (f991 f990) (let ((f1006 f1006) (f1007 f1007) (f1008 f1008) (f1009 f1009)) (if (fx= f1008 f1009) #t (if ((vector-ref f991 0) f1006 f1007 f1008) ((vector-ref f990 0) f1006 f1007 (fx+ f1008 1) f1009) #f))))) (vector-set! f989 0 (closure (f1004 f1005) (f992 f990) (let ((f1004 f1004) (f1005 f1005)) (if ((vector-ref f992 0) f1004 f1005) ((vector-ref f990 0) f1004 f1005 0 (string-length f1004)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f991 0 (closure (f1010 f1011 f1012) () (let ((f1010 f1010) (f1011 f1011) (f1012 f1012)) (char=? (string-ref f1010 f1012) (string-ref f1011 f1012))))) (vector-set! f990 0 (closure (f1006 f1007 f1008 f1009) (f991 f990) (let ((f1006 f1006) (f1007 f1007) (f1008 f1008) (f1009 f1009)) (if (fx= f1008 f1009) #t (if ((vector-ref f991 0) f1006 f1007 f1008) ((vector-ref f990 0) f1006 f1007 (fx+ f1008 1) f1009) #f))))) (vector-set! f989 0 (closure (f1004 f1005) (f992 f990) (let ((f1004 f1004) (f1005 f1005)) (if ((vector-ref f992 0) f1004 f1005) ((vector-ref f990 0) f1004 f1005 0 (string-length f1004)) #f)))))
#   env=((f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# emit-expr (vector-set! f991 0 (closure (f1010 f1011 f1012) () (let ((f1010 f1010) (f1011 f1011) (f1012 f1012)) (char=? (string-ref f1010 f1012) (string-ref f1011 f1012)))))
# emit-expr f991
# emit-variable-ref
# env=((f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f991
    movl -4(%esp), %eax  # stack load f991
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_8828
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8828:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8829"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8829:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_8831
    cmp  $0,%eax
    jge _L_8830
_L_8831:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_8830:
    movl %eax, -20(%esp)
# emit-expr (closure (f1010 f1011 f1012) () (let ((f1010 f1010) (f1011 f1011) (f1012 f1012)) (char=? (string-ref f1010 f1012) (string-ref f1011 f1012))))
# emit-closure
# si = -24
# env = ((f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# expr = (closure (f1010 f1011 f1012) () (let ((f1010 f1010) (f1011 f1011) (f1012 f1012)) (char=? (string-ref f1010 f1012) (string-ref f1011 f1012))))
    movl $_L_8832, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_8833            # jump around closure body
_L_8832:
# check argument count
    cmp $12,%eax
    je _L_8834
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_8834:
# emit-tail-expr
# si=-20
# env=((f1012 . -16) (f1011 . -12) (f1010 . -8) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# expr=(let ((f1010 f1010) (f1011 f1011) (f1012 f1012)) (char=? (string-ref f1010 f1012) (string-ref f1011 f1012)))
# emit-tail-let
#  si   = -20
#  env  = ((f1012 . -16) (f1011 . -12) (f1010 . -8) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
#  bindings = ((f1010 f1010) (f1011 f1011) (f1012 f1012))
#  body = (char=? (string-ref f1010 f1012) (string-ref f1011 f1012))
# emit-expr f1010
# emit-variable-ref
# env=((f1012 . -16) (f1011 . -12) (f1010 . -8) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1010
    movl -8(%esp), %eax  # stack load f1010
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr f1011
# emit-variable-ref
# env=((f1012 . -16) (f1011 . -12) (f1010 . -8) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1011
    movl -12(%esp), %eax  # stack load f1011
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f1012
# emit-variable-ref
# env=((f1012 . -16) (f1011 . -12) (f1010 . -8) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1012
    movl -16(%esp), %eax  # stack load f1012
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((f1012 . -28) (f1011 . -24) (f1010 . -20) (f1012 . -16) (f1011 . -12) (f1010 . -8) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# expr=(char=? (string-ref f1010 f1012) (string-ref f1011 f1012))
# tail primcall
# char= c1=(string-ref f1010 f1012) c2=(string-ref f1011 f1012)
# emit-expr (string-ref f1010 f1012)
# emit-expr f1010
# emit-variable-ref
# env=((f1012 . -28) (f1011 . -24) (f1010 . -20) (f1012 . -16) (f1011 . -12) (f1010 . -8) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1010
    movl -20(%esp), %eax  # stack load f1010
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_8835
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8835:
    movl %eax, -32(%esp)
# emit-expr f1012
# emit-variable-ref
# env=((f1012 . -28) (f1011 . -24) (f1010 . -20) (f1012 . -16) (f1011 . -12) (f1010 . -8) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1012
    movl -28(%esp), %eax  # stack load f1012
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8836"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8836:
# check bounds on string index
    movl -32(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_8838
    cmp  $0,%eax
    jge _L_8837
_L_8838:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_8837:
    sar $2, %eax
    movl -32(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_8839"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8839:
    movb %ah, -32(%esp)
# emit-expr (string-ref f1011 f1012)
# emit-expr f1011
# emit-variable-ref
# env=((f1012 . -28) (f1011 . -24) (f1010 . -20) (f1012 . -16) (f1011 . -12) (f1010 . -8) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1011
    movl -24(%esp), %eax  # stack load f1011
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_8840
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8840:
    movl %eax, -36(%esp)
# emit-expr f1012
# emit-variable-ref
# env=((f1012 . -28) (f1011 . -24) (f1010 . -20) (f1012 . -16) (f1011 . -12) (f1010 . -8) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1012
    movl -28(%esp), %eax  # stack load f1012
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8841"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8841:
# check bounds on string index
    movl -36(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_8843
    cmp  $0,%eax
    jge _L_8842
_L_8843:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_8842:
    sar $2, %eax
    movl -36(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_8844"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8844:
    cmp %ah, -32(%esp)
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (char=? (string-ref f1010 f1012) (string-ref f1011 f1012))
    ret
    .align 4,0x90
_L_8833:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f990 0 (closure (f1006 f1007 f1008 f1009) (f991 f990) (let ((f1006 f1006) (f1007 f1007) (f1008 f1008) (f1009 f1009)) (if (fx= f1008 f1009) #t (if ((vector-ref f991 0) f1006 f1007 f1008) ((vector-ref f990 0) f1006 f1007 (fx+ f1008 1) f1009) #f))))) (vector-set! f989 0 (closure (f1004 f1005) (f992 f990) (let ((f1004 f1004) (f1005 f1005)) (if ((vector-ref f992 0) f1004 f1005) ((vector-ref f990 0) f1004 f1005 0 (string-length f1004)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f990 0 (closure (f1006 f1007 f1008 f1009) (f991 f990) (let ((f1006 f1006) (f1007 f1007) (f1008 f1008) (f1009 f1009)) (if (fx= f1008 f1009) #t (if ((vector-ref f991 0) f1006 f1007 f1008) ((vector-ref f990 0) f1006 f1007 (fx+ f1008 1) f1009) #f))))) (vector-set! f989 0 (closure (f1004 f1005) (f992 f990) (let ((f1004 f1004) (f1005 f1005)) (if ((vector-ref f992 0) f1004 f1005) ((vector-ref f990 0) f1004 f1005 0 (string-length f1004)) #f)))))
#   env=((f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# emit-expr (vector-set! f990 0 (closure (f1006 f1007 f1008 f1009) (f991 f990) (let ((f1006 f1006) (f1007 f1007) (f1008 f1008) (f1009 f1009)) (if (fx= f1008 f1009) #t (if ((vector-ref f991 0) f1006 f1007 f1008) ((vector-ref f990 0) f1006 f1007 (fx+ f1008 1) f1009) #f)))))
# emit-expr f990
# emit-variable-ref
# env=((f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f990
    movl -8(%esp), %eax  # stack load f990
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_8845
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8845:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8846"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8846:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_8848
    cmp  $0,%eax
    jge _L_8847
_L_8848:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_8847:
    movl %eax, -20(%esp)
# emit-expr (closure (f1006 f1007 f1008 f1009) (f991 f990) (let ((f1006 f1006) (f1007 f1007) (f1008 f1008) (f1009 f1009)) (if (fx= f1008 f1009) #t (if ((vector-ref f991 0) f1006 f1007 f1008) ((vector-ref f990 0) f1006 f1007 (fx+ f1008 1) f1009) #f))))
# emit-closure
# si = -24
# env = ((f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# expr = (closure (f1006 f1007 f1008 f1009) (f991 f990) (let ((f1006 f1006) (f1007 f1007) (f1008 f1008) (f1009 f1009)) (if (fx= f1008 f1009) #t (if ((vector-ref f991 0) f1006 f1007 f1008) ((vector-ref f990 0) f1006 f1007 (fx+ f1008 1) f1009) #f))))
    movl $_L_8849, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f991
    movl -4(%esp), %eax  # stack load f991
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f991
# emit-variable-ref
# env=((f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f990
    movl -8(%esp), %eax  # stack load f990
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f990
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_8850            # jump around closure body
_L_8849:
# check argument count
    cmp $16,%eax
    je _L_8851
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_8851:
# emit-tail-expr
# si=-24
# env=((f1009 . -20) (f1008 . -16) (f1007 . -12) (f1006 . -8) (f990 . 8) (f991 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# expr=(let ((f1006 f1006) (f1007 f1007) (f1008 f1008) (f1009 f1009)) (if (fx= f1008 f1009) #t (if ((vector-ref f991 0) f1006 f1007 f1008) ((vector-ref f990 0) f1006 f1007 (fx+ f1008 1) f1009) #f)))
# emit-tail-let
#  si   = -24
#  env  = ((f1009 . -20) (f1008 . -16) (f1007 . -12) (f1006 . -8) (f990 . 8) (f991 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
#  bindings = ((f1006 f1006) (f1007 f1007) (f1008 f1008) (f1009 f1009))
#  body = (if (fx= f1008 f1009) #t (if ((vector-ref f991 0) f1006 f1007 f1008) ((vector-ref f990 0) f1006 f1007 (fx+ f1008 1) f1009) #f))
# emit-expr f1006
# emit-variable-ref
# env=((f1009 . -20) (f1008 . -16) (f1007 . -12) (f1006 . -8) (f990 . 8) (f991 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1006
    movl -8(%esp), %eax  # stack load f1006
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f1007
# emit-variable-ref
# env=((f1009 . -20) (f1008 . -16) (f1007 . -12) (f1006 . -8) (f990 . 8) (f991 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1007
    movl -12(%esp), %eax  # stack load f1007
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-expr f1008
# emit-variable-ref
# env=((f1009 . -20) (f1008 . -16) (f1007 . -12) (f1006 . -8) (f990 . 8) (f991 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1008
    movl -16(%esp), %eax  # stack load f1008
# end emit-variable-ref
    movl %eax, -32(%esp)  # stack save
# emit-expr f1009
# emit-variable-ref
# env=((f1009 . -20) (f1008 . -16) (f1007 . -12) (f1006 . -8) (f990 . 8) (f991 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1009
    movl -20(%esp), %eax  # stack load f1009
# end emit-variable-ref
    movl %eax, -36(%esp)  # stack save
# emit-tail-expr
# si=-40
# env=((f1009 . -36) (f1008 . -32) (f1007 . -28) (f1006 . -24) (f1009 . -20) (f1008 . -16) (f1007 . -12) (f1006 . -8) (f990 . 8) (f991 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# expr=(if (fx= f1008 f1009) #t (if ((vector-ref f991 0) f1006 f1007 f1008) ((vector-ref f990 0) f1006 f1007 (fx+ f1008 1) f1009) #f))
# emit-expr (fx= f1008 f1009)
# emit-expr f1009
# emit-variable-ref
# env=((f1009 . -36) (f1008 . -32) (f1007 . -28) (f1006 . -24) (f1009 . -20) (f1008 . -16) (f1007 . -12) (f1006 . -8) (f990 . 8) (f991 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1009
    movl -36(%esp), %eax  # stack load f1009
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8854"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8854:
    movl %eax, -40(%esp)
# emit-expr f1008
# emit-variable-ref
# env=((f1009 . -36) (f1008 . -32) (f1007 . -28) (f1006 . -24) (f1009 . -20) (f1008 . -16) (f1007 . -12) (f1006 . -8) (f990 . 8) (f991 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1008
    movl -32(%esp), %eax  # stack load f1008
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8855"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8855:
    cmp -40(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_8852
# emit-tail-expr
# si=-40
# env=((f1009 . -36) (f1008 . -32) (f1007 . -28) (f1006 . -24) (f1009 . -20) (f1008 . -16) (f1007 . -12) (f1006 . -8) (f990 . 8) (f991 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# expr=#t
    movl $111, %eax     # immed #t
    ret                  # immediate tail return
    jmp _L_8853
_L_8852:
# emit-tail-expr
# si=-40
# env=((f1009 . -36) (f1008 . -32) (f1007 . -28) (f1006 . -24) (f1009 . -20) (f1008 . -16) (f1007 . -12) (f1006 . -8) (f990 . 8) (f991 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# expr=(if ((vector-ref f991 0) f1006 f1007 f1008) ((vector-ref f990 0) f1006 f1007 (fx+ f1008 1) f1009) #f)
# emit-expr ((vector-ref f991 0) f1006 f1007 f1008)
# funcall
#    si   =-40
#    env  = ((f1009 . -36) (f1008 . -32) (f1007 . -28) (f1006 . -24) (f1009 . -20) (f1008 . -16) (f1007 . -12) (f1006 . -8) (f990 . 8) (f991 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
#    expr = (funcall (vector-ref f991 0) f1006 f1007 f1008)
# emit-expr (vector-ref f991 0)
# emit-expr f991
# emit-variable-ref
# env=((f1009 . -36) (f1008 . -32) (f1007 . -28) (f1006 . -24) (f1009 . -20) (f1008 . -16) (f1007 . -12) (f1006 . -8) (f990 . 8) (f991 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f991
    movl 2(%edi), %eax  # frame load f991
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_8858
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8858:
    movl %eax, -48(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8859"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8859:
# check bounds on vector index
    movl -48(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_8861
    cmp  $0,%eax
    jge _L_8860
_L_8861:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_8860:
    movl -48(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_8862"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_8862":
   movl %eax,  -48(%esp)  # stash funcall-oper in closure slot
# emit-expr f1006
# emit-variable-ref
# env=((f1009 . -36) (f1008 . -32) (f1007 . -28) (f1006 . -24) (f1009 . -20) (f1008 . -16) (f1007 . -12) (f1006 . -8) (f990 . 8) (f991 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1006
    movl -24(%esp), %eax  # stack load f1006
# end emit-variable-ref
    mov %eax, -52(%esp)  # arg f1006
# emit-expr f1007
# emit-variable-ref
# env=((f1009 . -36) (f1008 . -32) (f1007 . -28) (f1006 . -24) (f1009 . -20) (f1008 . -16) (f1007 . -12) (f1006 . -8) (f990 . 8) (f991 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1007
    movl -28(%esp), %eax  # stack load f1007
# end emit-variable-ref
    mov %eax, -56(%esp)  # arg f1007
# emit-expr f1008
# emit-variable-ref
# env=((f1009 . -36) (f1008 . -32) (f1007 . -28) (f1006 . -24) (f1009 . -20) (f1008 . -16) (f1007 . -12) (f1006 . -8) (f990 . 8) (f991 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1008
    movl -32(%esp), %eax  # stack load f1008
# end emit-variable-ref
    mov %eax, -60(%esp)  # arg f1008
    movl -48(%esp), %edi   # load new closure to %edi
    add $-40, %esp   # adjust base
    movl $12,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $40, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_8856
# emit-tail-expr
# si=-40
# env=((f1009 . -36) (f1008 . -32) (f1007 . -28) (f1006 . -24) (f1009 . -20) (f1008 . -16) (f1007 . -12) (f1006 . -8) (f990 . 8) (f991 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# expr=((vector-ref f990 0) f1006 f1007 (fx+ f1008 1) f1009)
# emit-tail-funcall
#    si   =-40
#    env  = ((f1009 . -36) (f1008 . -32) (f1007 . -28) (f1006 . -24) (f1009 . -20) (f1008 . -16) (f1007 . -12) (f1006 . -8) (f990 . 8) (f991 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
#    expr = (funcall (vector-ref f990 0) f1006 f1007 (fx+ f1008 1) f1009)
# emit-expr (vector-ref f990 0)
# emit-expr f990
# emit-variable-ref
# env=((f1009 . -36) (f1008 . -32) (f1007 . -28) (f1006 . -24) (f1009 . -20) (f1008 . -16) (f1007 . -12) (f1006 . -8) (f990 . 8) (f991 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f990
    movl 6(%edi), %eax  # frame load f990
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_8863
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8863:
    movl %eax, -40(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8864"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8864:
# check bounds on vector index
    movl -40(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_8866
    cmp  $0,%eax
    jge _L_8865
_L_8866:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_8865:
    movl -40(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -40(%esp)  # stash funcall-oper in next closure slot
# emit-expr f1006
# emit-variable-ref
# env=((f1009 . -36) (f1008 . -32) (f1007 . -28) (f1006 . -24) (f1009 . -20) (f1008 . -16) (f1007 . -12) (f1006 . -8) (f990 . 8) (f991 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1006
    movl -24(%esp), %eax  # stack load f1006
# end emit-variable-ref
    mov %eax, -44(%esp)    # arg f1006
# emit-expr f1007
# emit-variable-ref
# env=((f1009 . -36) (f1008 . -32) (f1007 . -28) (f1006 . -24) (f1009 . -20) (f1008 . -16) (f1007 . -12) (f1006 . -8) (f990 . 8) (f991 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1007
    movl -28(%esp), %eax  # stack load f1007
# end emit-variable-ref
    mov %eax, -48(%esp)    # arg f1007
# emit-expr (fx+ f1008 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8867"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8867:
    movl %eax, -52(%esp)  # fx+ push arg1
# emit-expr f1008
# emit-variable-ref
# env=((f1009 . -36) (f1008 . -32) (f1007 . -28) (f1006 . -24) (f1009 . -20) (f1008 . -16) (f1007 . -12) (f1006 . -8) (f990 . 8) (f991 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1008
    movl -32(%esp), %eax  # stack load f1008
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8868"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8868:
    addl -52(%esp), %eax  # fx+ arg1 arg2
    mov %eax, -52(%esp)    # arg (fx+ f1008 1)
# emit-expr f1009
# emit-variable-ref
# env=((f1009 . -36) (f1008 . -32) (f1007 . -28) (f1006 . -24) (f1009 . -20) (f1008 . -16) (f1007 . -12) (f1006 . -8) (f990 . 8) (f991 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1009
    movl -36(%esp), %eax  # stack load f1009
# end emit-variable-ref
    mov %eax, -56(%esp)    # arg f1009
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
    jmp _L_8857
_L_8856:
# emit-tail-expr
# si=-40
# env=((f1009 . -36) (f1008 . -32) (f1007 . -28) (f1006 . -24) (f1009 . -20) (f1008 . -16) (f1007 . -12) (f1006 . -8) (f990 . 8) (f991 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_8857:
_L_8853:
    .align 4,0x90
_L_8850:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f989 0 (closure (f1004 f1005) (f992 f990) (let ((f1004 f1004) (f1005 f1005)) (if ((vector-ref f992 0) f1004 f1005) ((vector-ref f990 0) f1004 f1005 0 (string-length f1004)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f989 0 (closure (f1004 f1005) (f992 f990) (let ((f1004 f1004) (f1005 f1005)) (if ((vector-ref f992 0) f1004 f1005) ((vector-ref f990 0) f1004 f1005 0 (string-length f1004)) #f)))))
#   env=((f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# emit-expr (vector-set! f989 0 (closure (f1004 f1005) (f992 f990) (let ((f1004 f1004) (f1005 f1005)) (if ((vector-ref f992 0) f1004 f1005) ((vector-ref f990 0) f1004 f1005 0 (string-length f1004)) #f))))
# emit-expr f989
# emit-variable-ref
# env=((f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f989
    movl -12(%esp), %eax  # stack load f989
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_8869
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8869:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8870"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8870:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_8872
    cmp  $0,%eax
    jge _L_8871
_L_8872:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_8871:
    movl %eax, -20(%esp)
# emit-expr (closure (f1004 f1005) (f992 f990) (let ((f1004 f1004) (f1005 f1005)) (if ((vector-ref f992 0) f1004 f1005) ((vector-ref f990 0) f1004 f1005 0 (string-length f1004)) #f)))
# emit-closure
# si = -24
# env = ((f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# expr = (closure (f1004 f1005) (f992 f990) (let ((f1004 f1004) (f1005 f1005)) (if ((vector-ref f992 0) f1004 f1005) ((vector-ref f990 0) f1004 f1005 0 (string-length f1004)) #f)))
    movl $_L_8873, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f992
    movl 0(%esp), %eax  # stack load f992
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f992
# emit-variable-ref
# env=((f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f990
    movl -8(%esp), %eax  # stack load f990
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f990
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_8874            # jump around closure body
_L_8873:
# check argument count
    cmp $8,%eax
    je _L_8875
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_8875:
# emit-tail-expr
# si=-16
# env=((f1005 . -12) (f1004 . -8) (f990 . 8) (f992 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# expr=(let ((f1004 f1004) (f1005 f1005)) (if ((vector-ref f992 0) f1004 f1005) ((vector-ref f990 0) f1004 f1005 0 (string-length f1004)) #f))
# emit-tail-let
#  si   = -16
#  env  = ((f1005 . -12) (f1004 . -8) (f990 . 8) (f992 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
#  bindings = ((f1004 f1004) (f1005 f1005))
#  body = (if ((vector-ref f992 0) f1004 f1005) ((vector-ref f990 0) f1004 f1005 0 (string-length f1004)) #f)
# emit-expr f1004
# emit-variable-ref
# env=((f1005 . -12) (f1004 . -8) (f990 . 8) (f992 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1004
    movl -8(%esp), %eax  # stack load f1004
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f1005
# emit-variable-ref
# env=((f1005 . -12) (f1004 . -8) (f990 . 8) (f992 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1005
    movl -12(%esp), %eax  # stack load f1005
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f1005 . -20) (f1004 . -16) (f1005 . -12) (f1004 . -8) (f990 . 8) (f992 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# expr=(if ((vector-ref f992 0) f1004 f1005) ((vector-ref f990 0) f1004 f1005 0 (string-length f1004)) #f)
# emit-expr ((vector-ref f992 0) f1004 f1005)
# funcall
#    si   =-24
#    env  = ((f1005 . -20) (f1004 . -16) (f1005 . -12) (f1004 . -8) (f990 . 8) (f992 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
#    expr = (funcall (vector-ref f992 0) f1004 f1005)
# emit-expr (vector-ref f992 0)
# emit-expr f992
# emit-variable-ref
# env=((f1005 . -20) (f1004 . -16) (f1005 . -12) (f1004 . -8) (f990 . 8) (f992 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f992
    movl 2(%edi), %eax  # frame load f992
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_8878
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8878:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8879"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8879:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_8881
    cmp  $0,%eax
    jge _L_8880
_L_8881:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_8880:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_8882"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_8882":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f1004
# emit-variable-ref
# env=((f1005 . -20) (f1004 . -16) (f1005 . -12) (f1004 . -8) (f990 . 8) (f992 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1004
    movl -16(%esp), %eax  # stack load f1004
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f1004
# emit-expr f1005
# emit-variable-ref
# env=((f1005 . -20) (f1004 . -16) (f1005 . -12) (f1004 . -8) (f990 . 8) (f992 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1005
    movl -20(%esp), %eax  # stack load f1005
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg f1005
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_8876
# emit-tail-expr
# si=-24
# env=((f1005 . -20) (f1004 . -16) (f1005 . -12) (f1004 . -8) (f990 . 8) (f992 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# expr=((vector-ref f990 0) f1004 f1005 0 (string-length f1004))
# emit-tail-funcall
#    si   =-24
#    env  = ((f1005 . -20) (f1004 . -16) (f1005 . -12) (f1004 . -8) (f990 . 8) (f992 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
#    expr = (funcall (vector-ref f990 0) f1004 f1005 0 (string-length f1004))
# emit-expr (vector-ref f990 0)
# emit-expr f990
# emit-variable-ref
# env=((f1005 . -20) (f1004 . -16) (f1005 . -12) (f1004 . -8) (f990 . 8) (f992 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f990
    movl 6(%edi), %eax  # frame load f990
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_8883
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8883:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8884"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8884:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_8886
    cmp  $0,%eax
    jge _L_8885
_L_8886:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_8885:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr f1004
# emit-variable-ref
# env=((f1005 . -20) (f1004 . -16) (f1005 . -12) (f1004 . -8) (f990 . 8) (f992 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1004
    movl -16(%esp), %eax  # stack load f1004
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f1004
# emit-expr f1005
# emit-variable-ref
# env=((f1005 . -20) (f1004 . -16) (f1005 . -12) (f1004 . -8) (f990 . 8) (f992 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1005
    movl -20(%esp), %eax  # stack load f1005
# end emit-variable-ref
    mov %eax, -32(%esp)    # arg f1005
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -36(%esp)    # arg 0
# emit-expr (string-length f1004)
# emit-expr f1004
# emit-variable-ref
# env=((f1005 . -20) (f1004 . -16) (f1005 . -12) (f1004 . -8) (f990 . 8) (f992 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f1004
    movl -16(%esp), %eax  # stack load f1004
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_8887
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8887:
    movl -6(%eax), %eax
    mov %eax, -40(%esp)    # arg (string-length f1004)
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
    jmp _L_8877
_L_8876:
# emit-tail-expr
# si=-24
# env=((f1005 . -20) (f1004 . -16) (f1005 . -12) (f1004 . -8) (f990 . 8) (f992 . 4) (f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_8877:
    .align 4,0x90
_L_8874:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# emit-expr (begin (vector-ref f989 0))
# emit-begin
#   expr=(begin (vector-ref f989 0))
#   env=((f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# emit-expr (vector-ref f989 0)
# emit-expr f989
# emit-variable-ref
# env=((f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
# var=f989
    movl -12(%esp), %eax  # stack load f989
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_8888
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8888:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8889"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8889:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_8891
    cmp  $0,%eax
    jge _L_8890
_L_8891:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_8890:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f989 . -12) (f990 . -8) (f991 . -4) (f992 . 0))
     movl %eax, string$e$q
# == explicit-begins  ==>
# (letrec ((str->sym (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let* ((new-sym (make-symbol str #f)) (new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym)) (str->sym str (cdr symlist))))))) (lambda (str) (str->sym str (symbols))))
# == eliminate-let*  ==>
# (letrec ((str->sym (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) (str->sym str (cdr symlist))))))) (lambda (str) (str->sym str (symbols))))
# == uniquify-variables  ==>
# (letrec ((f1015 (lambda (f1024 f1025) (if (string=? f1024 (symbol->string (car f1025))) (car f1025) (if (null? (cdr f1025)) (let ((f1029 (make-symbol f1024 #f))) (let ((f1031 (cons f1029 ()))) (begin (set-cdr! f1025 f1031) f1029))) (f1015 f1024 (cdr f1025))))))) (lambda (f1033) (f1015 f1033 (symbols))))
# == vectorize-letrec  ==>
# (let ((f1015 (make-vector 1))) (begin (begin (vector-set! f1015 0 (lambda (f1024 f1025) (if (string=? f1024 (symbol->string (car f1025))) (car f1025) (if (null? (cdr f1025)) (let ((f1029 (make-symbol f1024 #f))) (let ((f1031 (cons f1029 ()))) (begin (set-cdr! f1025 f1031) f1029))) ((vector-ref f1015 0) f1024 (cdr f1025))))))) (lambda (f1033) ((vector-ref f1015 0) f1033 (symbols)))))
# == eliminate-set!  ==>
# (let ((f1015 (make-vector 1))) (begin (begin (vector-set! f1015 0 (lambda (f1024 f1025) (let ((f1024 f1024) (f1025 f1025)) (if (string=? f1024 (symbol->string (car f1025))) (car f1025) (if (null? (cdr f1025)) (let ((f1029 (make-symbol f1024 #f))) (let ((f1031 (cons f1029 ()))) (begin (set-cdr! f1025 f1031) f1029))) ((vector-ref f1015 0) f1024 (cdr f1025)))))))) (lambda (f1033) (let ((f1033 f1033)) ((vector-ref f1015 0) f1033 (symbols))))))
# == close-free-variables  ==>
# (let ((f1015 (make-vector 1))) (begin (begin (vector-set! f1015 0 (closure (f1024 f1025) (string=? f1015) (let ((f1024 f1024) (f1025 f1025)) (if (string=? f1024 (symbol->string (car f1025))) (car f1025) (if (null? (cdr f1025)) (let ((f1029 (make-symbol f1024 #f))) (let ((f1031 (cons f1029 ()))) (begin (set-cdr! f1025 f1031) f1029))) ((vector-ref f1015 0) f1024 (cdr f1025)))))))) (closure (f1033) (f1015 symbols) (let ((f1033 f1033)) ((vector-ref f1015 0) f1033 (symbols))))))
# == eliminate-quote  ==>
# (let ((f1015 (make-vector 1))) (begin (begin (vector-set! f1015 0 (closure (f1024 f1025) (string=? f1015) (let ((f1024 f1024) (f1025 f1025)) (if (string=? f1024 (symbol->string (car f1025))) (car f1025) (if (null? (cdr f1025)) (let ((f1029 (make-symbol f1024 #f))) (let ((f1031 (cons f1029 ()))) (begin (set-cdr! f1025 f1031) f1029))) ((vector-ref f1015 0) f1024 (cdr f1025)))))))) (closure (f1033) (f1015 symbols) (let ((f1033 f1033)) ((vector-ref f1015 0) f1033 (symbols))))))
# == eliminate-when/unless  ==>
# (let ((f1015 (make-vector 1))) (begin (begin (vector-set! f1015 0 (closure (f1024 f1025) (string=? f1015) (let ((f1024 f1024) (f1025 f1025)) (if (string=? f1024 (symbol->string (car f1025))) (car f1025) (if (null? (cdr f1025)) (let ((f1029 (make-symbol f1024 #f))) (let ((f1031 (cons f1029 ()))) (begin (set-cdr! f1025 f1031) f1029))) ((vector-ref f1015 0) f1024 (cdr f1025)))))))) (closure (f1033) (f1015 symbols) (let ((f1033 f1033)) ((vector-ref f1015 0) f1033 (symbols))))))
# == eliminate-cond  ==>
# (let ((f1015 (make-vector 1))) (begin (begin (vector-set! f1015 0 (closure (f1024 f1025) (string=? f1015) (let ((f1024 f1024) (f1025 f1025)) (if (string=? f1024 (symbol->string (car f1025))) (car f1025) (if (null? (cdr f1025)) (let ((f1029 (make-symbol f1024 #f))) (let ((f1031 (cons f1029 ()))) (begin (set-cdr! f1025 f1031) f1029))) ((vector-ref f1015 0) f1024 (cdr f1025)))))))) (closure (f1033) (f1015 symbols) (let ((f1033 f1033)) ((vector-ref f1015 0) f1033 (symbols))))))
# == external-symbols  ==>
# (let ((f1015 (make-vector 1))) (begin (begin (vector-set! f1015 0 (closure (f1024 f1025) ((primitive-ref string=?) f1015) (let ((f1024 f1024) (f1025 f1025)) (if ((primitive-ref string=?) f1024 (symbol->string (car f1025))) (car f1025) (if (null? (cdr f1025)) (let ((f1029 (make-symbol f1024 #f))) (let ((f1031 (cons f1029 ()))) (begin (set-cdr! f1025 f1031) f1029))) ((vector-ref f1015 0) f1024 (cdr f1025)))))))) (closure (f1033) (f1015 (primitive-ref symbols)) (let ((f1033 f1033)) ((vector-ref f1015 0) f1033 ((primitive-ref symbols)))))))
# emit-expr (let ((f1015 (make-vector 1))) (begin (begin (vector-set! f1015 0 (closure (f1024 f1025) ((primitive-ref string=?) f1015) (let ((f1024 f1024) (f1025 f1025)) (if ((primitive-ref string=?) f1024 (symbol->string (car f1025))) (car f1025) (if (null? (cdr f1025)) (let ((f1029 (make-symbol f1024 #f))) (let ((f1031 (cons f1029 ()))) (begin (set-cdr! f1025 f1031) f1029))) ((vector-ref f1015 0) f1024 (cdr f1025)))))))) (closure (f1033) (f1015 (primitive-ref symbols)) (let ((f1033 f1033)) ((vector-ref f1015 0) f1033 ((primitive-ref symbols)))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f1015 (make-vector 1)))
#  body = (begin (begin (vector-set! f1015 0 (closure (f1024 f1025) ((primitive-ref string=?) f1015) (let ((f1024 f1024) (f1025 f1025)) (if ((primitive-ref string=?) f1024 (symbol->string (car f1025))) (car f1025) (if (null? (cdr f1025)) (let ((f1029 (make-symbol f1024 #f))) (let ((f1031 (cons f1029 ()))) (begin (set-cdr! f1025 f1031) f1029))) ((vector-ref f1015 0) f1024 (cdr f1025)))))))) (closure (f1033) (f1015 (primitive-ref symbols)) (let ((f1033 f1033)) ((vector-ref f1015 0) f1033 ((primitive-ref symbols))))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8892"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8892:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_8893
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8893:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f1015 0 (closure (f1024 f1025) ((primitive-ref string=?) f1015) (let ((f1024 f1024) (f1025 f1025)) (if ((primitive-ref string=?) f1024 (symbol->string (car f1025))) (car f1025) (if (null? (cdr f1025)) (let ((f1029 (make-symbol f1024 #f))) (let ((f1031 (cons f1029 ()))) (begin (set-cdr! f1025 f1031) f1029))) ((vector-ref f1015 0) f1024 (cdr f1025)))))))) (closure (f1033) (f1015 (primitive-ref symbols)) (let ((f1033 f1033)) ((vector-ref f1015 0) f1033 ((primitive-ref symbols))))))
# emit-begin
#   expr=(begin (begin (vector-set! f1015 0 (closure (f1024 f1025) ((primitive-ref string=?) f1015) (let ((f1024 f1024) (f1025 f1025)) (if ((primitive-ref string=?) f1024 (symbol->string (car f1025))) (car f1025) (if (null? (cdr f1025)) (let ((f1029 (make-symbol f1024 #f))) (let ((f1031 (cons f1029 ()))) (begin (set-cdr! f1025 f1031) f1029))) ((vector-ref f1015 0) f1024 (cdr f1025)))))))) (closure (f1033) (f1015 (primitive-ref symbols)) (let ((f1033 f1033)) ((vector-ref f1015 0) f1033 ((primitive-ref symbols))))))
#   env=((f1015 . 0))
# emit-expr (begin (vector-set! f1015 0 (closure (f1024 f1025) ((primitive-ref string=?) f1015) (let ((f1024 f1024) (f1025 f1025)) (if ((primitive-ref string=?) f1024 (symbol->string (car f1025))) (car f1025) (if (null? (cdr f1025)) (let ((f1029 (make-symbol f1024 #f))) (let ((f1031 (cons f1029 ()))) (begin (set-cdr! f1025 f1031) f1029))) ((vector-ref f1015 0) f1024 (cdr f1025))))))))
# emit-begin
#   expr=(begin (vector-set! f1015 0 (closure (f1024 f1025) ((primitive-ref string=?) f1015) (let ((f1024 f1024) (f1025 f1025)) (if ((primitive-ref string=?) f1024 (symbol->string (car f1025))) (car f1025) (if (null? (cdr f1025)) (let ((f1029 (make-symbol f1024 #f))) (let ((f1031 (cons f1029 ()))) (begin (set-cdr! f1025 f1031) f1029))) ((vector-ref f1015 0) f1024 (cdr f1025))))))))
#   env=((f1015 . 0))
# emit-expr (vector-set! f1015 0 (closure (f1024 f1025) ((primitive-ref string=?) f1015) (let ((f1024 f1024) (f1025 f1025)) (if ((primitive-ref string=?) f1024 (symbol->string (car f1025))) (car f1025) (if (null? (cdr f1025)) (let ((f1029 (make-symbol f1024 #f))) (let ((f1031 (cons f1029 ()))) (begin (set-cdr! f1025 f1031) f1029))) ((vector-ref f1015 0) f1024 (cdr f1025)))))))
# emit-expr f1015
# emit-variable-ref
# env=((f1015 . 0))
# var=f1015
    movl 0(%esp), %eax  # stack load f1015
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_8894
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8894:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8895"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8895:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_8897
    cmp  $0,%eax
    jge _L_8896
_L_8897:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_8896:
    movl %eax, -8(%esp)
# emit-expr (closure (f1024 f1025) ((primitive-ref string=?) f1015) (let ((f1024 f1024) (f1025 f1025)) (if ((primitive-ref string=?) f1024 (symbol->string (car f1025))) (car f1025) (if (null? (cdr f1025)) (let ((f1029 (make-symbol f1024 #f))) (let ((f1031 (cons f1029 ()))) (begin (set-cdr! f1025 f1031) f1029))) ((vector-ref f1015 0) f1024 (cdr f1025))))))
# emit-closure
# si = -12
# env = ((f1015 . 0))
# expr = (closure (f1024 f1025) ((primitive-ref string=?) f1015) (let ((f1024 f1024) (f1025 f1025)) (if ((primitive-ref string=?) f1024 (symbol->string (car f1025))) (car f1025) (if (null? (cdr f1025)) (let ((f1029 (make-symbol f1024 #f))) (let ((f1031 (cons f1029 ()))) (begin (set-cdr! f1025 f1031) f1029))) ((vector-ref f1015 0) f1024 (cdr f1025))))))
    movl $_L_8898, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref string=?) not defined in the environmnet
# emit-variable-ref
# env=((f1015 . 0))
# var=f1015
    movl 0(%esp), %eax  # stack load f1015
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f1015
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_8899            # jump around closure body
_L_8898:
# check argument count
    cmp $8,%eax
    je _L_8900
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_8900:
# emit-tail-expr
# si=-16
# env=((f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
# expr=(let ((f1024 f1024) (f1025 f1025)) (if ((primitive-ref string=?) f1024 (symbol->string (car f1025))) (car f1025) (if (null? (cdr f1025)) (let ((f1029 (make-symbol f1024 #f))) (let ((f1031 (cons f1029 ()))) (begin (set-cdr! f1025 f1031) f1029))) ((vector-ref f1015 0) f1024 (cdr f1025)))))
# emit-tail-let
#  si   = -16
#  env  = ((f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
#  bindings = ((f1024 f1024) (f1025 f1025))
#  body = (if ((primitive-ref string=?) f1024 (symbol->string (car f1025))) (car f1025) (if (null? (cdr f1025)) (let ((f1029 (make-symbol f1024 #f))) (let ((f1031 (cons f1029 ()))) (begin (set-cdr! f1025 f1031) f1029))) ((vector-ref f1015 0) f1024 (cdr f1025))))
# emit-expr f1024
# emit-variable-ref
# env=((f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
# var=f1024
    movl -8(%esp), %eax  # stack load f1024
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f1025
# emit-variable-ref
# env=((f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
# var=f1025
    movl -12(%esp), %eax  # stack load f1025
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f1025 . -20) (f1024 . -16) (f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
# expr=(if ((primitive-ref string=?) f1024 (symbol->string (car f1025))) (car f1025) (if (null? (cdr f1025)) (let ((f1029 (make-symbol f1024 #f))) (let ((f1031 (cons f1029 ()))) (begin (set-cdr! f1025 f1031) f1029))) ((vector-ref f1015 0) f1024 (cdr f1025))))
# emit-expr ((primitive-ref string=?) f1024 (symbol->string (car f1025)))
# funcall
#    si   =-24
#    env  = ((f1025 . -20) (f1024 . -16) (f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
#    expr = (funcall (primitive-ref string=?) f1024 (symbol->string (car f1025)))
# emit-expr (primitive-ref string=?)
    .extern string$e$q
    movl string$e$q,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_8903"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_8903":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f1024
# emit-variable-ref
# env=((f1025 . -20) (f1024 . -16) (f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
# var=f1024
    movl -16(%esp), %eax  # stack load f1024
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f1024
# emit-expr (symbol->string (car f1025))
# symbol->string (car f1025)
# emit-expr (car f1025)
# emit-expr f1025
# emit-variable-ref
# env=((f1025 . -20) (f1024 . -16) (f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
# var=f1025
    movl -20(%esp), %eax  # stack load f1025
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_8904
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8904:
    movl -1(%eax), %eax
    movl -3(%eax), %eax
    mov %eax, -40(%esp)  # arg (symbol->string (car f1025))
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_8901
# emit-tail-expr
# si=-24
# env=((f1025 . -20) (f1024 . -16) (f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
# expr=(car f1025)
# tail primcall
# emit-expr f1025
# emit-variable-ref
# env=((f1025 . -20) (f1024 . -16) (f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
# var=f1025
    movl -20(%esp), %eax  # stack load f1025
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_8905
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8905:
    movl -1(%eax), %eax
#return from tail (car f1025)
    ret
    jmp _L_8902
_L_8901:
# emit-tail-expr
# si=-24
# env=((f1025 . -20) (f1024 . -16) (f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
# expr=(if (null? (cdr f1025)) (let ((f1029 (make-symbol f1024 #f))) (let ((f1031 (cons f1029 ()))) (begin (set-cdr! f1025 f1031) f1029))) ((vector-ref f1015 0) f1024 (cdr f1025)))
# emit-expr (null? (cdr f1025))
# emit-expr (cdr f1025)
# emit-expr f1025
# emit-variable-ref
# env=((f1025 . -20) (f1024 . -16) (f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
# var=f1025
    movl -20(%esp), %eax  # stack load f1025
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_8908
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8908:
    movl 3(%eax), %eax
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_8906
# emit-tail-expr
# si=-24
# env=((f1025 . -20) (f1024 . -16) (f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
# expr=(let ((f1029 (make-symbol f1024 #f))) (let ((f1031 (cons f1029 ()))) (begin (set-cdr! f1025 f1031) f1029)))
# emit-tail-let
#  si   = -24
#  env  = ((f1025 . -20) (f1024 . -16) (f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
#  bindings = ((f1029 (make-symbol f1024 #f)))
#  body = (let ((f1031 (cons f1029 ()))) (begin (set-cdr! f1025 f1031) f1029))
# emit-expr (make-symbol f1024 #f)
# make-symbol arg1=f1024 arg2=#f
# emit-expr f1024
# emit-variable-ref
# env=((f1025 . -20) (f1024 . -16) (f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
# var=f1024
    movl -16(%esp), %eax  # stack load f1024
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
# env=((f1029 . -24) (f1025 . -20) (f1024 . -16) (f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
# expr=(let ((f1031 (cons f1029 ()))) (begin (set-cdr! f1025 f1031) f1029))
# emit-tail-let
#  si   = -28
#  env  = ((f1029 . -24) (f1025 . -20) (f1024 . -16) (f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
#  bindings = ((f1031 (cons f1029 ())))
#  body = (begin (set-cdr! f1025 f1031) f1029)
# emit-expr (cons f1029 ())
# cons arg1=f1029 arg2=()
# emit-expr f1029
# emit-variable-ref
# env=((f1029 . -24) (f1025 . -20) (f1024 . -16) (f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
# var=f1029
    movl -24(%esp), %eax  # stack load f1029
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
# env=((f1031 . -28) (f1029 . -24) (f1025 . -20) (f1024 . -16) (f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
# expr=(begin (set-cdr! f1025 f1031) f1029)
# tail-begin (begin (set-cdr! f1025 f1031) f1029)
#   env=((f1031 . -28) (f1029 . -24) (f1025 . -20) (f1024 . -16) (f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
# emit-expr (set-cdr! f1025 f1031)
# emit-expr f1025
# emit-variable-ref
# env=((f1031 . -28) (f1029 . -24) (f1025 . -20) (f1024 . -16) (f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
# var=f1025
    movl -20(%esp), %eax  # stack load f1025
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_8909
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8909:
    movl %eax, -32(%esp)
# emit-expr f1031
# emit-variable-ref
# env=((f1031 . -28) (f1029 . -24) (f1025 . -20) (f1024 . -16) (f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
# var=f1031
    movl -28(%esp), %eax  # stack load f1031
# end emit-variable-ref
    movl -32(%esp), %ebx
    movl %eax, 3(%ebx)
# emit-tail-expr
# si=-32
# env=((f1031 . -28) (f1029 . -24) (f1025 . -20) (f1024 . -16) (f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
# expr=(begin f1029)
# tail-begin (begin f1029)
#   env=((f1031 . -28) (f1029 . -24) (f1025 . -20) (f1024 . -16) (f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
# emit-tail-expr
# si=-32
# env=((f1031 . -28) (f1029 . -24) (f1025 . -20) (f1024 . -16) (f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
# expr=f1029
# emit-tail-variable-ref
# emit-variable-ref
# env=((f1031 . -28) (f1029 . -24) (f1025 . -20) (f1024 . -16) (f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
# var=f1029
    movl -24(%esp), %eax  # stack load f1029
# end emit-variable-ref
    ret
# end emit-tail-variable ref
     ret   # return thru stack
    jmp _L_8907
_L_8906:
# emit-tail-expr
# si=-24
# env=((f1025 . -20) (f1024 . -16) (f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
# expr=((vector-ref f1015 0) f1024 (cdr f1025))
# emit-tail-funcall
#    si   =-24
#    env  = ((f1025 . -20) (f1024 . -16) (f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
#    expr = (funcall (vector-ref f1015 0) f1024 (cdr f1025))
# emit-expr (vector-ref f1015 0)
# emit-expr f1015
# emit-variable-ref
# env=((f1025 . -20) (f1024 . -16) (f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
# var=f1015
    movl 6(%edi), %eax  # frame load f1015
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_8910
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8910:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8911"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8911:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_8913
    cmp  $0,%eax
    jge _L_8912
_L_8913:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_8912:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr f1024
# emit-variable-ref
# env=((f1025 . -20) (f1024 . -16) (f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
# var=f1024
    movl -16(%esp), %eax  # stack load f1024
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f1024
# emit-expr (cdr f1025)
# emit-expr f1025
# emit-variable-ref
# env=((f1025 . -20) (f1024 . -16) (f1025 . -12) (f1024 . -8) (f1015 . 8) ((primitive-ref string=?) . 4) (f1015 . 0))
# var=f1025
    movl -20(%esp), %eax  # stack load f1025
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_8914
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8914:
    movl 3(%eax), %eax
    mov %eax, -32(%esp)    # arg (cdr f1025)
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
_L_8907:
_L_8902:
    .align 4,0x90
_L_8899:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f1015 . 0))
# emit-expr (begin (closure (f1033) (f1015 (primitive-ref symbols)) (let ((f1033 f1033)) ((vector-ref f1015 0) f1033 ((primitive-ref symbols))))))
# emit-begin
#   expr=(begin (closure (f1033) (f1015 (primitive-ref symbols)) (let ((f1033 f1033)) ((vector-ref f1015 0) f1033 ((primitive-ref symbols))))))
#   env=((f1015 . 0))
# emit-expr (closure (f1033) (f1015 (primitive-ref symbols)) (let ((f1033 f1033)) ((vector-ref f1015 0) f1033 ((primitive-ref symbols)))))
# emit-closure
# si = -4
# env = ((f1015 . 0))
# expr = (closure (f1033) (f1015 (primitive-ref symbols)) (let ((f1033 f1033)) ((vector-ref f1015 0) f1033 ((primitive-ref symbols)))))
    movl $_L_8915, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f1015 . 0))
# var=f1015
    movl 0(%esp), %eax  # stack load f1015
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f1015
# WARNING: free var (primitive-ref symbols) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_8916            # jump around closure body
_L_8915:
# check argument count
    cmp $4,%eax
    je _L_8917
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_8917:
# emit-tail-expr
# si=-12
# env=((f1033 . -8) ((primitive-ref symbols) . 8) (f1015 . 4) (f1015 . 0))
# expr=(let ((f1033 f1033)) ((vector-ref f1015 0) f1033 ((primitive-ref symbols))))
# emit-tail-let
#  si   = -12
#  env  = ((f1033 . -8) ((primitive-ref symbols) . 8) (f1015 . 4) (f1015 . 0))
#  bindings = ((f1033 f1033))
#  body = ((vector-ref f1015 0) f1033 ((primitive-ref symbols)))
# emit-expr f1033
# emit-variable-ref
# env=((f1033 . -8) ((primitive-ref symbols) . 8) (f1015 . 4) (f1015 . 0))
# var=f1033
    movl -8(%esp), %eax  # stack load f1033
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f1033 . -12) (f1033 . -8) ((primitive-ref symbols) . 8) (f1015 . 4) (f1015 . 0))
# expr=((vector-ref f1015 0) f1033 ((primitive-ref symbols)))
# emit-tail-funcall
#    si   =-16
#    env  = ((f1033 . -12) (f1033 . -8) ((primitive-ref symbols) . 8) (f1015 . 4) (f1015 . 0))
#    expr = (funcall (vector-ref f1015 0) f1033 ((primitive-ref symbols)))
# emit-expr (vector-ref f1015 0)
# emit-expr f1015
# emit-variable-ref
# env=((f1033 . -12) (f1033 . -8) ((primitive-ref symbols) . 8) (f1015 . 4) (f1015 . 0))
# var=f1015
    movl 2(%edi), %eax  # frame load f1015
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_8918
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8918:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8919"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8919:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_8921
    cmp  $0,%eax
    jge _L_8920
_L_8921:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_8920:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f1033
# emit-variable-ref
# env=((f1033 . -12) (f1033 . -8) ((primitive-ref symbols) . 8) (f1015 . 4) (f1015 . 0))
# var=f1033
    movl -12(%esp), %eax  # stack load f1033
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f1033
# emit-expr ((primitive-ref symbols))
# funcall
#    si   =-24
#    env  = ((f1033 . -12) (f1033 . -8) ((primitive-ref symbols) . 8) (f1015 . 4) (f1015 . 0))
#    expr = (funcall (primitive-ref symbols))
# emit-expr (primitive-ref symbols)
    .extern symbols
    movl symbols,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_8922"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_8922":
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
_L_8916:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f1015 . 0))
     movl %eax, string$m$gsymbol
# == explicit-begins  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == eliminate-let*  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == uniquify-variables  ==>
# (lambda (f1034 f1035) (if (null? f1034) (cons e nil) (cons (car f1034) (append1 (cdr f1034) f1035))))
# == vectorize-letrec  ==>
# (lambda (f1034 f1035) (if (null? f1034) (cons e nil) (cons (car f1034) (append1 (cdr f1034) f1035))))
# == eliminate-set!  ==>
# (lambda (f1034 f1035) (let ((f1034 f1034) (f1035 f1035)) (if (null? f1034) (cons e nil) (cons (car f1034) (append1 (cdr f1034) f1035)))))
# == close-free-variables  ==>
# (closure (f1034 f1035) (e nil append1) (let ((f1034 f1034) (f1035 f1035)) (if (null? f1034) (cons e nil) (cons (car f1034) (append1 (cdr f1034) f1035)))))
# == eliminate-quote  ==>
# (closure (f1034 f1035) (e nil append1) (let ((f1034 f1034) (f1035 f1035)) (if (null? f1034) (cons e nil) (cons (car f1034) (append1 (cdr f1034) f1035)))))
# == eliminate-when/unless  ==>
# (closure (f1034 f1035) (e nil append1) (let ((f1034 f1034) (f1035 f1035)) (if (null? f1034) (cons e nil) (cons (car f1034) (append1 (cdr f1034) f1035)))))
# == eliminate-cond  ==>
# (closure (f1034 f1035) (e nil append1) (let ((f1034 f1034) (f1035 f1035)) (if (null? f1034) (cons e nil) (cons (car f1034) (append1 (cdr f1034) f1035)))))
# == external-symbols  ==>
# (closure (f1034 f1035) (e nil (primitive-ref append1)) (let ((f1034 f1034) (f1035 f1035)) (if (null? f1034) (cons e nil) (cons (car f1034) ((primitive-ref append1) (cdr f1034) f1035)))))
# emit-expr (closure (f1034 f1035) (e nil (primitive-ref append1)) (let ((f1034 f1034) (f1035 f1035)) (if (null? f1034) (cons e nil) (cons (car f1034) ((primitive-ref append1) (cdr f1034) f1035)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f1034 f1035) (e nil (primitive-ref append1)) (let ((f1034 f1034) (f1035 f1035)) (if (null? f1034) (cons e nil) (cons (car f1034) ((primitive-ref append1) (cdr f1034) f1035)))))
    movl $_L_8923, 0(%ebp)  # closure label
# WARNING: free var e not defined in the environmnet
# WARNING: free var nil not defined in the environmnet
# WARNING: free var (primitive-ref append1) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_8924            # jump around closure body
_L_8923:
# check argument count
    cmp $8,%eax
    je _L_8925
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_8925:
# emit-tail-expr
# si=-16
# env=((f1035 . -12) (f1034 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(let ((f1034 f1034) (f1035 f1035)) (if (null? f1034) (cons e nil) (cons (car f1034) ((primitive-ref append1) (cdr f1034) f1035))))
# emit-tail-let
#  si   = -16
#  env  = ((f1035 . -12) (f1034 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
#  bindings = ((f1034 f1034) (f1035 f1035))
#  body = (if (null? f1034) (cons e nil) (cons (car f1034) ((primitive-ref append1) (cdr f1034) f1035)))
# emit-expr f1034
# emit-variable-ref
# env=((f1035 . -12) (f1034 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f1034
    movl -8(%esp), %eax  # stack load f1034
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f1035
# emit-variable-ref
# env=((f1035 . -12) (f1034 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f1035
    movl -12(%esp), %eax  # stack load f1035
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f1035 . -20) (f1034 . -16) (f1035 . -12) (f1034 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(if (null? f1034) (cons e nil) (cons (car f1034) ((primitive-ref append1) (cdr f1034) f1035)))
# emit-expr (null? f1034)
# emit-expr f1034
# emit-variable-ref
# env=((f1035 . -20) (f1034 . -16) (f1035 . -12) (f1034 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f1034
    movl -16(%esp), %eax  # stack load f1034
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_8926
# emit-tail-expr
# si=-24
# env=((f1035 . -20) (f1034 . -16) (f1035 . -12) (f1034 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(cons e nil)
# tail primcall
# cons arg1=e arg2=nil
# emit-expr e
# emit-variable-ref
# env=((f1035 . -20) (f1034 . -16) (f1035 . -12) (f1034 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=e
    movl 2(%edi), %eax  # frame load e
# end emit-variable-ref
    movl %eax, -24(%esp)
# emit-expr nil
# emit-variable-ref
# env=((f1035 . -20) (f1034 . -16) (f1035 . -12) (f1034 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
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
    jmp _L_8927
_L_8926:
# emit-tail-expr
# si=-24
# env=((f1035 . -20) (f1034 . -16) (f1035 . -12) (f1034 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(cons (car f1034) ((primitive-ref append1) (cdr f1034) f1035))
# tail primcall
# cons arg1=(car f1034) arg2=((primitive-ref append1) (cdr f1034) f1035)
# emit-expr (car f1034)
# emit-expr f1034
# emit-variable-ref
# env=((f1035 . -20) (f1034 . -16) (f1035 . -12) (f1034 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f1034
    movl -16(%esp), %eax  # stack load f1034
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_8928
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8928:
    movl -1(%eax), %eax
    movl %eax, -24(%esp)
# emit-expr ((primitive-ref append1) (cdr f1034) f1035)
# funcall
#    si   =-28
#    env  = ((f1035 . -20) (f1034 . -16) (f1035 . -12) (f1034 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
#    expr = (funcall (primitive-ref append1) (cdr f1034) f1035)
# emit-expr (primitive-ref append1)
    .extern append1
    movl append1,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_8929"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_8929":
   movl %eax,  -36(%esp)  # stash funcall-oper in closure slot
# emit-expr (cdr f1034)
# emit-expr f1034
# emit-variable-ref
# env=((f1035 . -20) (f1034 . -16) (f1035 . -12) (f1034 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f1034
    movl -16(%esp), %eax  # stack load f1034
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_8930
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8930:
    movl 3(%eax), %eax
    mov %eax, -40(%esp)  # arg (cdr f1034)
# emit-expr f1035
# emit-variable-ref
# env=((f1035 . -20) (f1034 . -16) (f1035 . -12) (f1034 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f1035
    movl -20(%esp), %eax  # stack load f1035
# end emit-variable-ref
    mov %eax, -44(%esp)  # arg f1035
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
#return from tail (cons (car f1034) ((primitive-ref append1) (cdr f1034) f1035))
    ret
_L_8927:
    .align 4,0x90
_L_8924:
     movl %eax, append1
# == explicit-begins  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == eliminate-let*  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == uniquify-variables  ==>
# (lambda (f1036 f1037) (if (fx= f1037 0) (car f1036) (list-ref (cdr f1036) (fx- f1037 1))))
# == vectorize-letrec  ==>
# (lambda (f1036 f1037) (if (fx= f1037 0) (car f1036) (list-ref (cdr f1036) (fx- f1037 1))))
# == eliminate-set!  ==>
# (lambda (f1036 f1037) (let ((f1036 f1036) (f1037 f1037)) (if (fx= f1037 0) (car f1036) (list-ref (cdr f1036) (fx- f1037 1)))))
# == close-free-variables  ==>
# (closure (f1036 f1037) (list-ref) (let ((f1036 f1036) (f1037 f1037)) (if (fx= f1037 0) (car f1036) (list-ref (cdr f1036) (fx- f1037 1)))))
# == eliminate-quote  ==>
# (closure (f1036 f1037) (list-ref) (let ((f1036 f1036) (f1037 f1037)) (if (fx= f1037 0) (car f1036) (list-ref (cdr f1036) (fx- f1037 1)))))
# == eliminate-when/unless  ==>
# (closure (f1036 f1037) (list-ref) (let ((f1036 f1036) (f1037 f1037)) (if (fx= f1037 0) (car f1036) (list-ref (cdr f1036) (fx- f1037 1)))))
# == eliminate-cond  ==>
# (closure (f1036 f1037) (list-ref) (let ((f1036 f1036) (f1037 f1037)) (if (fx= f1037 0) (car f1036) (list-ref (cdr f1036) (fx- f1037 1)))))
# == external-symbols  ==>
# (closure (f1036 f1037) ((primitive-ref list-ref)) (let ((f1036 f1036) (f1037 f1037)) (if (fx= f1037 0) (car f1036) ((primitive-ref list-ref) (cdr f1036) (fx- f1037 1)))))
# emit-expr (closure (f1036 f1037) ((primitive-ref list-ref)) (let ((f1036 f1036) (f1037 f1037)) (if (fx= f1037 0) (car f1036) ((primitive-ref list-ref) (cdr f1036) (fx- f1037 1)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f1036 f1037) ((primitive-ref list-ref)) (let ((f1036 f1036) (f1037 f1037)) (if (fx= f1037 0) (car f1036) ((primitive-ref list-ref) (cdr f1036) (fx- f1037 1)))))
    movl $_L_8931, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_8932            # jump around closure body
_L_8931:
# check argument count
    cmp $8,%eax
    je _L_8933
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_8933:
# emit-tail-expr
# si=-16
# env=((f1037 . -12) (f1036 . -8) ((primitive-ref list-ref) . 4))
# expr=(let ((f1036 f1036) (f1037 f1037)) (if (fx= f1037 0) (car f1036) ((primitive-ref list-ref) (cdr f1036) (fx- f1037 1))))
# emit-tail-let
#  si   = -16
#  env  = ((f1037 . -12) (f1036 . -8) ((primitive-ref list-ref) . 4))
#  bindings = ((f1036 f1036) (f1037 f1037))
#  body = (if (fx= f1037 0) (car f1036) ((primitive-ref list-ref) (cdr f1036) (fx- f1037 1)))
# emit-expr f1036
# emit-variable-ref
# env=((f1037 . -12) (f1036 . -8) ((primitive-ref list-ref) . 4))
# var=f1036
    movl -8(%esp), %eax  # stack load f1036
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f1037
# emit-variable-ref
# env=((f1037 . -12) (f1036 . -8) ((primitive-ref list-ref) . 4))
# var=f1037
    movl -12(%esp), %eax  # stack load f1037
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f1037 . -20) (f1036 . -16) (f1037 . -12) (f1036 . -8) ((primitive-ref list-ref) . 4))
# expr=(if (fx= f1037 0) (car f1036) ((primitive-ref list-ref) (cdr f1036) (fx- f1037 1)))
# emit-expr (fx= f1037 0)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8936"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8936:
    movl %eax, -24(%esp)
# emit-expr f1037
# emit-variable-ref
# env=((f1037 . -20) (f1036 . -16) (f1037 . -12) (f1036 . -8) ((primitive-ref list-ref) . 4))
# var=f1037
    movl -20(%esp), %eax  # stack load f1037
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8937"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8937:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_8934
# emit-tail-expr
# si=-24
# env=((f1037 . -20) (f1036 . -16) (f1037 . -12) (f1036 . -8) ((primitive-ref list-ref) . 4))
# expr=(car f1036)
# tail primcall
# emit-expr f1036
# emit-variable-ref
# env=((f1037 . -20) (f1036 . -16) (f1037 . -12) (f1036 . -8) ((primitive-ref list-ref) . 4))
# var=f1036
    movl -16(%esp), %eax  # stack load f1036
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_8938
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8938:
    movl -1(%eax), %eax
#return from tail (car f1036)
    ret
    jmp _L_8935
_L_8934:
# emit-tail-expr
# si=-24
# env=((f1037 . -20) (f1036 . -16) (f1037 . -12) (f1036 . -8) ((primitive-ref list-ref) . 4))
# expr=((primitive-ref list-ref) (cdr f1036) (fx- f1037 1))
# emit-tail-funcall
#    si   =-24
#    env  = ((f1037 . -20) (f1036 . -16) (f1037 . -12) (f1036 . -8) ((primitive-ref list-ref) . 4))
#    expr = (funcall (primitive-ref list-ref) (cdr f1036) (fx- f1037 1))
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr (cdr f1036)
# emit-expr f1036
# emit-variable-ref
# env=((f1037 . -20) (f1036 . -16) (f1037 . -12) (f1036 . -8) ((primitive-ref list-ref) . 4))
# var=f1036
    movl -16(%esp), %eax  # stack load f1036
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_8939
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8939:
    movl 3(%eax), %eax
    mov %eax, -28(%esp)    # arg (cdr f1036)
# emit-expr (fx- f1037 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8940"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8940:
    movl %eax, -32(%esp)
# emit-expr f1037
# emit-variable-ref
# env=((f1037 . -20) (f1036 . -16) (f1037 . -12) (f1036 . -8) ((primitive-ref list-ref) . 4))
# var=f1037
    movl -20(%esp), %eax  # stack load f1037
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8941"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8941:
    subl -32(%esp), %eax
    mov %eax, -32(%esp)    # arg (fx- f1037 1)
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
_L_8935:
    .align 4,0x90
_L_8932:
     movl %eax, list$mref
# == explicit-begins  ==>
# (lambda (l) (if (null? l) 0 (fxadd1 (list-length (cdr l)))))
# == eliminate-let*  ==>
# (lambda (l) (if (null? l) 0 (fxadd1 (list-length (cdr l)))))
# == uniquify-variables  ==>
# (lambda (f1038) (if (null? f1038) 0 (fxadd1 (list-length (cdr f1038)))))
# == vectorize-letrec  ==>
# (lambda (f1038) (if (null? f1038) 0 (fxadd1 (list-length (cdr f1038)))))
# == eliminate-set!  ==>
# (lambda (f1038) (let ((f1038 f1038)) (if (null? f1038) 0 (fxadd1 (list-length (cdr f1038))))))
# == close-free-variables  ==>
# (closure (f1038) (list-length) (let ((f1038 f1038)) (if (null? f1038) 0 (fxadd1 (list-length (cdr f1038))))))
# == eliminate-quote  ==>
# (closure (f1038) (list-length) (let ((f1038 f1038)) (if (null? f1038) 0 (fxadd1 (list-length (cdr f1038))))))
# == eliminate-when/unless  ==>
# (closure (f1038) (list-length) (let ((f1038 f1038)) (if (null? f1038) 0 (fxadd1 (list-length (cdr f1038))))))
# == eliminate-cond  ==>
# (closure (f1038) (list-length) (let ((f1038 f1038)) (if (null? f1038) 0 (fxadd1 (list-length (cdr f1038))))))
# == external-symbols  ==>
# (closure (f1038) ((primitive-ref list-length)) (let ((f1038 f1038)) (if (null? f1038) 0 (fxadd1 ((primitive-ref list-length) (cdr f1038))))))
# emit-expr (closure (f1038) ((primitive-ref list-length)) (let ((f1038 f1038)) (if (null? f1038) 0 (fxadd1 ((primitive-ref list-length) (cdr f1038))))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f1038) ((primitive-ref list-length)) (let ((f1038 f1038)) (if (null? f1038) 0 (fxadd1 ((primitive-ref list-length) (cdr f1038))))))
    movl $_L_8942, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref list-length) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_8943            # jump around closure body
_L_8942:
# check argument count
    cmp $4,%eax
    je _L_8944
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_8944:
# emit-tail-expr
# si=-12
# env=((f1038 . -8) ((primitive-ref list-length) . 4))
# expr=(let ((f1038 f1038)) (if (null? f1038) 0 (fxadd1 ((primitive-ref list-length) (cdr f1038)))))
# emit-tail-let
#  si   = -12
#  env  = ((f1038 . -8) ((primitive-ref list-length) . 4))
#  bindings = ((f1038 f1038))
#  body = (if (null? f1038) 0 (fxadd1 ((primitive-ref list-length) (cdr f1038))))
# emit-expr f1038
# emit-variable-ref
# env=((f1038 . -8) ((primitive-ref list-length) . 4))
# var=f1038
    movl -8(%esp), %eax  # stack load f1038
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f1038 . -12) (f1038 . -8) ((primitive-ref list-length) . 4))
# expr=(if (null? f1038) 0 (fxadd1 ((primitive-ref list-length) (cdr f1038))))
# emit-expr (null? f1038)
# emit-expr f1038
# emit-variable-ref
# env=((f1038 . -12) (f1038 . -8) ((primitive-ref list-length) . 4))
# var=f1038
    movl -12(%esp), %eax  # stack load f1038
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_8945
# emit-tail-expr
# si=-16
# env=((f1038 . -12) (f1038 . -8) ((primitive-ref list-length) . 4))
# expr=0
    movl $0, %eax     # immed 0
    ret                  # immediate tail return
    jmp _L_8946
_L_8945:
# emit-tail-expr
# si=-16
# env=((f1038 . -12) (f1038 . -8) ((primitive-ref list-length) . 4))
# expr=(fxadd1 ((primitive-ref list-length) (cdr f1038)))
# tail primcall
# emit-expr ((primitive-ref list-length) (cdr f1038))
# funcall
#    si   =-16
#    env  = ((f1038 . -12) (f1038 . -8) ((primitive-ref list-length) . 4))
#    expr = (funcall (primitive-ref list-length) (cdr f1038))
# emit-expr (primitive-ref list-length)
    .extern list$mlength
    movl list$mlength,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_8947"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_8947":
   movl %eax,  -24(%esp)  # stash funcall-oper in closure slot
# emit-expr (cdr f1038)
# emit-expr f1038
# emit-variable-ref
# env=((f1038 . -12) (f1038 . -8) ((primitive-ref list-length) . 4))
# var=f1038
    movl -12(%esp), %eax  # stack load f1038
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_8948
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8948:
    movl 3(%eax), %eax
    mov %eax, -28(%esp)  # arg (cdr f1038)
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
    je "_L_8949"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8949:
     addl $4, %eax
#return from tail (fxadd1 ((primitive-ref list-length) (cdr f1038)))
    ret
_L_8946:
    .align 4,0x90
_L_8943:
     movl %eax, list$mlength
# == explicit-begins  ==>
# (letrec ((fill-vector (lambda (v k args) (if (null? args) v (begin (vector-set! v k (car args)) (fill-vector v (fxadd1 k) (cdr args))))))) (lambda args (let ((v (make-vector (list-length args)))) (fill-vector v 0 args))))
# == eliminate-let*  ==>
# (letrec ((fill-vector (lambda (v k args) (if (null? args) v (begin (vector-set! v k (car args)) (fill-vector v (fxadd1 k) (cdr args))))))) (lambda args (let ((v (make-vector (list-length args)))) (fill-vector v 0 args))))
# == uniquify-variables  ==>
# (letrec ((f1039 (lambda (f1043 f1044 f1045) (if (null? f1045) f1043 (begin (vector-set! f1043 f1044 (car f1045)) (f1039 f1043 (fxadd1 f1044) (cdr f1045))))))) (lambda f1049 (let ((f1051 (make-vector (list-length f1049)))) (f1039 f1051 0 f1049))))
# == vectorize-letrec  ==>
# (let ((f1039 (make-vector 1))) (begin (begin (vector-set! f1039 0 (lambda (f1043 f1044 f1045) (if (null? f1045) f1043 (begin (vector-set! f1043 f1044 (car f1045)) ((vector-ref f1039 0) f1043 (fxadd1 f1044) (cdr f1045))))))) (lambda f1049 (let ((f1051 (make-vector (list-length f1049)))) ((vector-ref f1039 0) f1051 0 f1049)))))
# == eliminate-set!  ==>
# (let ((f1039 (make-vector 1))) (begin (begin (vector-set! f1039 0 (lambda (f1043 f1044 f1045) (let ((f1043 f1043) (f1044 f1044) (f1045 f1045)) (if (null? f1045) f1043 (begin (vector-set! f1043 f1044 (car f1045)) ((vector-ref f1039 0) f1043 (fxadd1 f1044) (cdr f1045)))))))) (lambda f1049 (let () (let ((f1051 (make-vector (list-length f1049)))) ((vector-ref f1039 0) f1051 0 f1049))))))
# == close-free-variables  ==>
# (let ((f1039 (make-vector 1))) (begin (begin (vector-set! f1039 0 (closure (f1043 f1044 f1045) (f1039) (let ((f1043 f1043) (f1044 f1044) (f1045 f1045)) (if (null? f1045) f1043 (begin (vector-set! f1043 f1044 (car f1045)) ((vector-ref f1039 0) f1043 (fxadd1 f1044) (cdr f1045)))))))) (closure f1049 (f1039) (let () (let ((f1051 (make-vector (list-length f1049)))) ((vector-ref f1039 0) f1051 0 f1049))))))
# == eliminate-quote  ==>
# (let ((f1039 (make-vector 1))) (begin (begin (vector-set! f1039 0 (closure (f1043 f1044 f1045) (f1039) (let ((f1043 f1043) (f1044 f1044) (f1045 f1045)) (if (null? f1045) f1043 (begin (vector-set! f1043 f1044 (car f1045)) ((vector-ref f1039 0) f1043 (fxadd1 f1044) (cdr f1045)))))))) (closure f1049 (f1039) (let () (let ((f1051 (make-vector (list-length f1049)))) ((vector-ref f1039 0) f1051 0 f1049))))))
# == eliminate-when/unless  ==>
# (let ((f1039 (make-vector 1))) (begin (begin (vector-set! f1039 0 (closure (f1043 f1044 f1045) (f1039) (let ((f1043 f1043) (f1044 f1044) (f1045 f1045)) (if (null? f1045) f1043 (begin (vector-set! f1043 f1044 (car f1045)) ((vector-ref f1039 0) f1043 (fxadd1 f1044) (cdr f1045)))))))) (closure f1049 (f1039) (let () (let ((f1051 (make-vector (list-length f1049)))) ((vector-ref f1039 0) f1051 0 f1049))))))
# == eliminate-cond  ==>
# (let ((f1039 (make-vector 1))) (begin (begin (vector-set! f1039 0 (closure (f1043 f1044 f1045) (f1039) (let ((f1043 f1043) (f1044 f1044) (f1045 f1045)) (if (null? f1045) f1043 (begin (vector-set! f1043 f1044 (car f1045)) ((vector-ref f1039 0) f1043 (fxadd1 f1044) (cdr f1045)))))))) (closure f1049 (f1039) (let () (let ((f1051 (make-vector (list-length f1049)))) ((vector-ref f1039 0) f1051 0 f1049))))))
# == external-symbols  ==>
# (let ((f1039 (make-vector 1))) (begin (begin (vector-set! f1039 0 (closure (f1043 f1044 f1045) (f1039) (let ((f1043 f1043) (f1044 f1044) (f1045 f1045)) (if (null? f1045) f1043 (begin (vector-set! f1043 f1044 (car f1045)) ((vector-ref f1039 0) f1043 (fxadd1 f1044) (cdr f1045)))))))) (closure f1049 (f1039) (let () (let ((f1051 (make-vector ((primitive-ref list-length) f1049)))) ((vector-ref f1039 0) f1051 0 f1049))))))
# emit-expr (let ((f1039 (make-vector 1))) (begin (begin (vector-set! f1039 0 (closure (f1043 f1044 f1045) (f1039) (let ((f1043 f1043) (f1044 f1044) (f1045 f1045)) (if (null? f1045) f1043 (begin (vector-set! f1043 f1044 (car f1045)) ((vector-ref f1039 0) f1043 (fxadd1 f1044) (cdr f1045)))))))) (closure f1049 (f1039) (let () (let ((f1051 (make-vector ((primitive-ref list-length) f1049)))) ((vector-ref f1039 0) f1051 0 f1049))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f1039 (make-vector 1)))
#  body = (begin (begin (vector-set! f1039 0 (closure (f1043 f1044 f1045) (f1039) (let ((f1043 f1043) (f1044 f1044) (f1045 f1045)) (if (null? f1045) f1043 (begin (vector-set! f1043 f1044 (car f1045)) ((vector-ref f1039 0) f1043 (fxadd1 f1044) (cdr f1045)))))))) (closure f1049 (f1039) (let () (let ((f1051 (make-vector ((primitive-ref list-length) f1049)))) ((vector-ref f1039 0) f1051 0 f1049)))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8950"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8950:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_8951
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8951:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f1039 0 (closure (f1043 f1044 f1045) (f1039) (let ((f1043 f1043) (f1044 f1044) (f1045 f1045)) (if (null? f1045) f1043 (begin (vector-set! f1043 f1044 (car f1045)) ((vector-ref f1039 0) f1043 (fxadd1 f1044) (cdr f1045)))))))) (closure f1049 (f1039) (let () (let ((f1051 (make-vector ((primitive-ref list-length) f1049)))) ((vector-ref f1039 0) f1051 0 f1049)))))
# emit-begin
#   expr=(begin (begin (vector-set! f1039 0 (closure (f1043 f1044 f1045) (f1039) (let ((f1043 f1043) (f1044 f1044) (f1045 f1045)) (if (null? f1045) f1043 (begin (vector-set! f1043 f1044 (car f1045)) ((vector-ref f1039 0) f1043 (fxadd1 f1044) (cdr f1045)))))))) (closure f1049 (f1039) (let () (let ((f1051 (make-vector ((primitive-ref list-length) f1049)))) ((vector-ref f1039 0) f1051 0 f1049)))))
#   env=((f1039 . 0))
# emit-expr (begin (vector-set! f1039 0 (closure (f1043 f1044 f1045) (f1039) (let ((f1043 f1043) (f1044 f1044) (f1045 f1045)) (if (null? f1045) f1043 (begin (vector-set! f1043 f1044 (car f1045)) ((vector-ref f1039 0) f1043 (fxadd1 f1044) (cdr f1045))))))))
# emit-begin
#   expr=(begin (vector-set! f1039 0 (closure (f1043 f1044 f1045) (f1039) (let ((f1043 f1043) (f1044 f1044) (f1045 f1045)) (if (null? f1045) f1043 (begin (vector-set! f1043 f1044 (car f1045)) ((vector-ref f1039 0) f1043 (fxadd1 f1044) (cdr f1045))))))))
#   env=((f1039 . 0))
# emit-expr (vector-set! f1039 0 (closure (f1043 f1044 f1045) (f1039) (let ((f1043 f1043) (f1044 f1044) (f1045 f1045)) (if (null? f1045) f1043 (begin (vector-set! f1043 f1044 (car f1045)) ((vector-ref f1039 0) f1043 (fxadd1 f1044) (cdr f1045)))))))
# emit-expr f1039
# emit-variable-ref
# env=((f1039 . 0))
# var=f1039
    movl 0(%esp), %eax  # stack load f1039
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_8952
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8952:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8953"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8953:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_8955
    cmp  $0,%eax
    jge _L_8954
_L_8955:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_8954:
    movl %eax, -8(%esp)
# emit-expr (closure (f1043 f1044 f1045) (f1039) (let ((f1043 f1043) (f1044 f1044) (f1045 f1045)) (if (null? f1045) f1043 (begin (vector-set! f1043 f1044 (car f1045)) ((vector-ref f1039 0) f1043 (fxadd1 f1044) (cdr f1045))))))
# emit-closure
# si = -12
# env = ((f1039 . 0))
# expr = (closure (f1043 f1044 f1045) (f1039) (let ((f1043 f1043) (f1044 f1044) (f1045 f1045)) (if (null? f1045) f1043 (begin (vector-set! f1043 f1044 (car f1045)) ((vector-ref f1039 0) f1043 (fxadd1 f1044) (cdr f1045))))))
    movl $_L_8956, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f1039 . 0))
# var=f1039
    movl 0(%esp), %eax  # stack load f1039
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f1039
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_8957            # jump around closure body
_L_8956:
# check argument count
    cmp $12,%eax
    je _L_8958
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_8958:
# emit-tail-expr
# si=-20
# env=((f1045 . -16) (f1044 . -12) (f1043 . -8) (f1039 . 4) (f1039 . 0))
# expr=(let ((f1043 f1043) (f1044 f1044) (f1045 f1045)) (if (null? f1045) f1043 (begin (vector-set! f1043 f1044 (car f1045)) ((vector-ref f1039 0) f1043 (fxadd1 f1044) (cdr f1045)))))
# emit-tail-let
#  si   = -20
#  env  = ((f1045 . -16) (f1044 . -12) (f1043 . -8) (f1039 . 4) (f1039 . 0))
#  bindings = ((f1043 f1043) (f1044 f1044) (f1045 f1045))
#  body = (if (null? f1045) f1043 (begin (vector-set! f1043 f1044 (car f1045)) ((vector-ref f1039 0) f1043 (fxadd1 f1044) (cdr f1045))))
# emit-expr f1043
# emit-variable-ref
# env=((f1045 . -16) (f1044 . -12) (f1043 . -8) (f1039 . 4) (f1039 . 0))
# var=f1043
    movl -8(%esp), %eax  # stack load f1043
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr f1044
# emit-variable-ref
# env=((f1045 . -16) (f1044 . -12) (f1043 . -8) (f1039 . 4) (f1039 . 0))
# var=f1044
    movl -12(%esp), %eax  # stack load f1044
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f1045
# emit-variable-ref
# env=((f1045 . -16) (f1044 . -12) (f1043 . -8) (f1039 . 4) (f1039 . 0))
# var=f1045
    movl -16(%esp), %eax  # stack load f1045
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((f1045 . -28) (f1044 . -24) (f1043 . -20) (f1045 . -16) (f1044 . -12) (f1043 . -8) (f1039 . 4) (f1039 . 0))
# expr=(if (null? f1045) f1043 (begin (vector-set! f1043 f1044 (car f1045)) ((vector-ref f1039 0) f1043 (fxadd1 f1044) (cdr f1045))))
# emit-expr (null? f1045)
# emit-expr f1045
# emit-variable-ref
# env=((f1045 . -28) (f1044 . -24) (f1043 . -20) (f1045 . -16) (f1044 . -12) (f1043 . -8) (f1039 . 4) (f1039 . 0))
# var=f1045
    movl -28(%esp), %eax  # stack load f1045
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_8959
# emit-tail-expr
# si=-32
# env=((f1045 . -28) (f1044 . -24) (f1043 . -20) (f1045 . -16) (f1044 . -12) (f1043 . -8) (f1039 . 4) (f1039 . 0))
# expr=f1043
# emit-tail-variable-ref
# emit-variable-ref
# env=((f1045 . -28) (f1044 . -24) (f1043 . -20) (f1045 . -16) (f1044 . -12) (f1043 . -8) (f1039 . 4) (f1039 . 0))
# var=f1043
    movl -20(%esp), %eax  # stack load f1043
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    jmp _L_8960
_L_8959:
# emit-tail-expr
# si=-32
# env=((f1045 . -28) (f1044 . -24) (f1043 . -20) (f1045 . -16) (f1044 . -12) (f1043 . -8) (f1039 . 4) (f1039 . 0))
# expr=(begin (vector-set! f1043 f1044 (car f1045)) ((vector-ref f1039 0) f1043 (fxadd1 f1044) (cdr f1045)))
# tail-begin (begin (vector-set! f1043 f1044 (car f1045)) ((vector-ref f1039 0) f1043 (fxadd1 f1044) (cdr f1045)))
#   env=((f1045 . -28) (f1044 . -24) (f1043 . -20) (f1045 . -16) (f1044 . -12) (f1043 . -8) (f1039 . 4) (f1039 . 0))
# emit-expr (vector-set! f1043 f1044 (car f1045))
# emit-expr f1043
# emit-variable-ref
# env=((f1045 . -28) (f1044 . -24) (f1043 . -20) (f1045 . -16) (f1044 . -12) (f1043 . -8) (f1039 . 4) (f1039 . 0))
# var=f1043
    movl -20(%esp), %eax  # stack load f1043
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_8961
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8961:
    movl %eax, -32(%esp)
# emit-expr f1044
# emit-variable-ref
# env=((f1045 . -28) (f1044 . -24) (f1043 . -20) (f1045 . -16) (f1044 . -12) (f1043 . -8) (f1039 . 4) (f1039 . 0))
# var=f1044
    movl -24(%esp), %eax  # stack load f1044
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8962"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8962:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_8964
    cmp  $0,%eax
    jge _L_8963
_L_8964:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_8963:
    movl %eax, -36(%esp)
# emit-expr (car f1045)
# emit-expr f1045
# emit-variable-ref
# env=((f1045 . -28) (f1044 . -24) (f1043 . -20) (f1045 . -16) (f1044 . -12) (f1043 . -8) (f1039 . 4) (f1039 . 0))
# var=f1045
    movl -28(%esp), %eax  # stack load f1045
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_8965
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8965:
    movl -1(%eax), %eax
    movl -32(%esp), %ebx
    movl -36(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-tail-expr
# si=-32
# env=((f1045 . -28) (f1044 . -24) (f1043 . -20) (f1045 . -16) (f1044 . -12) (f1043 . -8) (f1039 . 4) (f1039 . 0))
# expr=(begin ((vector-ref f1039 0) f1043 (fxadd1 f1044) (cdr f1045)))
# tail-begin (begin ((vector-ref f1039 0) f1043 (fxadd1 f1044) (cdr f1045)))
#   env=((f1045 . -28) (f1044 . -24) (f1043 . -20) (f1045 . -16) (f1044 . -12) (f1043 . -8) (f1039 . 4) (f1039 . 0))
# emit-tail-expr
# si=-32
# env=((f1045 . -28) (f1044 . -24) (f1043 . -20) (f1045 . -16) (f1044 . -12) (f1043 . -8) (f1039 . 4) (f1039 . 0))
# expr=((vector-ref f1039 0) f1043 (fxadd1 f1044) (cdr f1045))
# emit-tail-funcall
#    si   =-32
#    env  = ((f1045 . -28) (f1044 . -24) (f1043 . -20) (f1045 . -16) (f1044 . -12) (f1043 . -8) (f1039 . 4) (f1039 . 0))
#    expr = (funcall (vector-ref f1039 0) f1043 (fxadd1 f1044) (cdr f1045))
# emit-expr (vector-ref f1039 0)
# emit-expr f1039
# emit-variable-ref
# env=((f1045 . -28) (f1044 . -24) (f1043 . -20) (f1045 . -16) (f1044 . -12) (f1043 . -8) (f1039 . 4) (f1039 . 0))
# var=f1039
    movl 2(%edi), %eax  # frame load f1039
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_8966
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8966:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8967"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8967:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_8969
    cmp  $0,%eax
    jge _L_8968
_L_8969:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_8968:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -32(%esp)  # stash funcall-oper in next closure slot
# emit-expr f1043
# emit-variable-ref
# env=((f1045 . -28) (f1044 . -24) (f1043 . -20) (f1045 . -16) (f1044 . -12) (f1043 . -8) (f1039 . 4) (f1039 . 0))
# var=f1043
    movl -20(%esp), %eax  # stack load f1043
# end emit-variable-ref
    mov %eax, -36(%esp)    # arg f1043
# emit-expr (fxadd1 f1044)
# emit-expr f1044
# emit-variable-ref
# env=((f1045 . -28) (f1044 . -24) (f1043 . -20) (f1045 . -16) (f1044 . -12) (f1043 . -8) (f1039 . 4) (f1039 . 0))
# var=f1044
    movl -24(%esp), %eax  # stack load f1044
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8970"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8970:
     addl $4, %eax
    mov %eax, -40(%esp)    # arg (fxadd1 f1044)
# emit-expr (cdr f1045)
# emit-expr f1045
# emit-variable-ref
# env=((f1045 . -28) (f1044 . -24) (f1043 . -20) (f1045 . -16) (f1044 . -12) (f1043 . -8) (f1039 . 4) (f1039 . 0))
# var=f1045
    movl -28(%esp), %eax  # stack load f1045
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_8971
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8971:
    movl 3(%eax), %eax
    mov %eax, -44(%esp)    # arg (cdr f1045)
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
_L_8960:
    .align 4,0x90
_L_8957:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f1039 . 0))
# emit-expr (begin (closure f1049 (f1039) (let () (let ((f1051 (make-vector ((primitive-ref list-length) f1049)))) ((vector-ref f1039 0) f1051 0 f1049)))))
# emit-begin
#   expr=(begin (closure f1049 (f1039) (let () (let ((f1051 (make-vector ((primitive-ref list-length) f1049)))) ((vector-ref f1039 0) f1051 0 f1049)))))
#   env=((f1039 . 0))
# emit-expr (closure f1049 (f1039) (let () (let ((f1051 (make-vector ((primitive-ref list-length) f1049)))) ((vector-ref f1039 0) f1051 0 f1049))))
# emit-closure
# si = -4
# env = ((f1039 . 0))
# expr = (closure f1049 (f1039) (let () (let ((f1051 (make-vector ((primitive-ref list-length) f1049)))) ((vector-ref f1039 0) f1051 0 f1049))))
    movl $_L_8972, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f1039 . 0))
# var=f1039
    movl 0(%esp), %eax  # stack load f1039
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f1039
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_8973            # jump around closure body
_L_8972:
# check argument count
    cmp $0,%eax
    jge _L_8974
# invoke error handler eh_argcount_min
    .extern eh$uargcount$umin
    movl eh$uargcount$umin, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_8974:
# emit-build-varargs-list
    movl $63, %esi       # args <- () 
    lea -4(%esp),%edi    # edi <- esp-4
    subl %eax, %edi      # edi <- esp-4-eax    addr of arg[K+N] on stack
_L_8976:
    lea -4(%esp),%ebx    # addr of arg[K] on stack
    cmp %edi, %ebx       # while edi <> esp+(si+4)
    je _L_8975
    movl (%edi),%ebx     # arg i -> car
    movl %ebx, 0(%ebp)
    movl %esi, 4(%ebp)  # esi -> cdr
    movl %ebp, %esi
    addl $1, %esi       # tag as pair
    addl $8,%ebp         # bump heap ptr
    addl $4,%edi         # move to next previous arg from the end
    jmp _L_8976
_L_8975:
    movl %esi, -8(%esp)  # set args
# emit-tail-expr
# si=-12
# env=((f1049 . -8) (f1039 . 4) (f1039 . 0))
# expr=(let () (let ((f1051 (make-vector ((primitive-ref list-length) f1049)))) ((vector-ref f1039 0) f1051 0 f1049)))
# emit-tail-let
#  si   = -12
#  env  = ((f1049 . -8) (f1039 . 4) (f1039 . 0))
#  bindings = ()
#  body = (let ((f1051 (make-vector ((primitive-ref list-length) f1049)))) ((vector-ref f1039 0) f1051 0 f1049))
# emit-tail-expr
# si=-12
# env=((f1049 . -8) (f1039 . 4) (f1039 . 0))
# expr=(let ((f1051 (make-vector ((primitive-ref list-length) f1049)))) ((vector-ref f1039 0) f1051 0 f1049))
# emit-tail-let
#  si   = -12
#  env  = ((f1049 . -8) (f1039 . 4) (f1039 . 0))
#  bindings = ((f1051 (make-vector ((primitive-ref list-length) f1049))))
#  body = ((vector-ref f1039 0) f1051 0 f1049)
# emit-expr (make-vector ((primitive-ref list-length) f1049))
# make-vector ((primitive-ref list-length) f1049)
# emit-expr ((primitive-ref list-length) f1049)
# funcall
#    si   =-12
#    env  = ((f1049 . -8) (f1039 . 4) (f1039 . 0))
#    expr = (funcall (primitive-ref list-length) f1049)
# emit-expr (primitive-ref list-length)
    .extern list$mlength
    movl list$mlength,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_8977"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_8977":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr f1049
# emit-variable-ref
# env=((f1049 . -8) (f1039 . 4) (f1039 . 0))
# var=f1049
    movl -8(%esp), %eax  # stack load f1049
# end emit-variable-ref
    mov %eax, -24(%esp)  # arg f1049
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
    je "_L_8978"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8978:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_8979
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8979:
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
# env=((f1051 . -12) (f1049 . -8) (f1039 . 4) (f1039 . 0))
# expr=((vector-ref f1039 0) f1051 0 f1049)
# emit-tail-funcall
#    si   =-16
#    env  = ((f1051 . -12) (f1049 . -8) (f1039 . 4) (f1039 . 0))
#    expr = (funcall (vector-ref f1039 0) f1051 0 f1049)
# emit-expr (vector-ref f1039 0)
# emit-expr f1039
# emit-variable-ref
# env=((f1051 . -12) (f1049 . -8) (f1039 . 4) (f1039 . 0))
# var=f1039
    movl 2(%edi), %eax  # frame load f1039
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_8980
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8980:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_8981"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8981:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_8983
    cmp  $0,%eax
    jge _L_8982
_L_8983:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_8982:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f1051
# emit-variable-ref
# env=((f1051 . -12) (f1049 . -8) (f1039 . 4) (f1039 . 0))
# var=f1051
    movl -12(%esp), %eax  # stack load f1051
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f1051
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -24(%esp)    # arg 0
# emit-expr f1049
# emit-variable-ref
# env=((f1051 . -12) (f1049 . -8) (f1039 . 4) (f1039 . 0))
# var=f1049
    movl -8(%esp), %eax  # stack load f1049
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f1049
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
_L_8973:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f1039 . 0))
     movl %eax, vector
# == explicit-begins  ==>
# (let* ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s)))) (write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))
# == eliminate-let*  ==>
# (let ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s))))) (let ((write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1)))))
# == uniquify-variables  ==>
# (let ((f1052 (lambda (f1053) (foreign-call "s_write" 2 f1053 (string-length f1053))))) (let ((f1061 (lambda (f1062 f1063) (begin (f1052 "error:") (f1052 (symbol->string f1062)) (f1052 ": ") (f1052 f1063) (f1052 "\n"))))) (lambda (f1066 f1067) (begin (f1061 f1066 f1067) (foreign-call "s_exit" 1)))))
# == vectorize-letrec  ==>
# (let ((f1052 (lambda (f1053) (foreign-call "s_write" 2 f1053 (string-length f1053))))) (let ((f1061 (lambda (f1062 f1063) (begin (f1052 "error:") (f1052 (symbol->string f1062)) (f1052 ": ") (f1052 f1063) (f1052 "\n"))))) (lambda (f1066 f1067) (begin (f1061 f1066 f1067) (foreign-call "s_exit" 1)))))
# == eliminate-set!  ==>
# (let ((f1052 (lambda (f1053) (let ((f1053 f1053)) (foreign-call "s_write" 2 f1053 (string-length f1053)))))) (let ((f1061 (lambda (f1062 f1063) (let ((f1062 f1062) (f1063 f1063)) (begin (f1052 "error:") (f1052 (symbol->string f1062)) (f1052 ": ") (f1052 f1063) (f1052 "\n")))))) (lambda (f1066 f1067) (let ((f1066 f1066) (f1067 f1067)) (begin (f1061 f1066 f1067) (foreign-call "s_exit" 1))))))
# == close-free-variables  ==>
# (let ((f1052 (closure (f1053) () (let ((f1053 f1053)) (foreign-call "s_write" 2 f1053 (string-length f1053)))))) (let ((f1061 (closure (f1062 f1063) (f1052 f1052 f1052 f1052 f1052) (let ((f1062 f1062) (f1063 f1063)) (begin (f1052 "error:") (f1052 (symbol->string f1062)) (f1052 ": ") (f1052 f1063) (f1052 "\n")))))) (closure (f1066 f1067) (f1061) (let ((f1066 f1066) (f1067 f1067)) (begin (f1061 f1066 f1067) (foreign-call "s_exit" 1))))))
# == eliminate-quote  ==>
# (let ((f1052 (closure (f1053) () (let ((f1053 f1053)) (foreign-call "s_write" 2 f1053 (string-length f1053)))))) (let ((f1061 (closure (f1062 f1063) (f1052 f1052 f1052 f1052 f1052) (let ((f1062 f1062) (f1063 f1063)) (begin (f1052 "error:") (f1052 (symbol->string f1062)) (f1052 ": ") (f1052 f1063) (f1052 "\n")))))) (closure (f1066 f1067) (f1061) (let ((f1066 f1066) (f1067 f1067)) (begin (f1061 f1066 f1067) (foreign-call "s_exit" 1))))))
# == eliminate-when/unless  ==>
# (let ((f1052 (closure (f1053) () (let ((f1053 f1053)) (foreign-call "s_write" 2 f1053 (string-length f1053)))))) (let ((f1061 (closure (f1062 f1063) (f1052 f1052 f1052 f1052 f1052) (let ((f1062 f1062) (f1063 f1063)) (begin (f1052 "error:") (f1052 (symbol->string f1062)) (f1052 ": ") (f1052 f1063) (f1052 "\n")))))) (closure (f1066 f1067) (f1061) (let ((f1066 f1066) (f1067 f1067)) (begin (f1061 f1066 f1067) (foreign-call "s_exit" 1))))))
# == eliminate-cond  ==>
# (let ((f1052 (closure (f1053) () (let ((f1053 f1053)) (foreign-call "s_write" 2 f1053 (string-length f1053)))))) (let ((f1061 (closure (f1062 f1063) (f1052 f1052 f1052 f1052 f1052) (let ((f1062 f1062) (f1063 f1063)) (begin (f1052 "error:") (f1052 (symbol->string f1062)) (f1052 ": ") (f1052 f1063) (f1052 "\n")))))) (closure (f1066 f1067) (f1061) (let ((f1066 f1066) (f1067 f1067)) (begin (f1061 f1066 f1067) (foreign-call "s_exit" 1))))))
# == external-symbols  ==>
# (let ((f1052 (closure (f1053) () (let ((f1053 f1053)) (foreign-call "s_write" 2 f1053 (string-length f1053)))))) (let ((f1061 (closure (f1062 f1063) (f1052 f1052 f1052 f1052 f1052) (let ((f1062 f1062) (f1063 f1063)) (begin (f1052 "error:") (f1052 (symbol->string f1062)) (f1052 ": ") (f1052 f1063) (f1052 "\n")))))) (closure (f1066 f1067) (f1061) (let ((f1066 f1066) (f1067 f1067)) (begin (f1061 f1066 f1067) (foreign-call "s_exit" 1))))))
# emit-expr (let ((f1052 (closure (f1053) () (let ((f1053 f1053)) (foreign-call "s_write" 2 f1053 (string-length f1053)))))) (let ((f1061 (closure (f1062 f1063) (f1052 f1052 f1052 f1052 f1052) (let ((f1062 f1062) (f1063 f1063)) (begin (f1052 "error:") (f1052 (symbol->string f1062)) (f1052 ": ") (f1052 f1063) (f1052 "\n")))))) (closure (f1066 f1067) (f1061) (let ((f1066 f1066) (f1067 f1067)) (begin (f1061 f1066 f1067) (foreign-call "s_exit" 1))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f1052 (closure (f1053) () (let ((f1053 f1053)) (foreign-call "s_write" 2 f1053 (string-length f1053))))))
#  body = (let ((f1061 (closure (f1062 f1063) (f1052 f1052 f1052 f1052 f1052) (let ((f1062 f1062) (f1063 f1063)) (begin (f1052 "error:") (f1052 (symbol->string f1062)) (f1052 ": ") (f1052 f1063) (f1052 "\n")))))) (closure (f1066 f1067) (f1061) (let ((f1066 f1066) (f1067 f1067)) (begin (f1061 f1066 f1067) (foreign-call "s_exit" 1)))))
# emit-expr (closure (f1053) () (let ((f1053 f1053)) (foreign-call "s_write" 2 f1053 (string-length f1053))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f1053) () (let ((f1053 f1053)) (foreign-call "s_write" 2 f1053 (string-length f1053))))
    movl $_L_8984, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_8985            # jump around closure body
_L_8984:
# check argument count
    cmp $4,%eax
    je _L_8986
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_8986:
# emit-tail-expr
# si=-12
# env=((f1053 . -8))
# expr=(let ((f1053 f1053)) (foreign-call "s_write" 2 f1053 (string-length f1053)))
# emit-tail-let
#  si   = -12
#  env  = ((f1053 . -8))
#  bindings = ((f1053 f1053))
#  body = (foreign-call "s_write" 2 f1053 (string-length f1053))
# emit-expr f1053
# emit-variable-ref
# env=((f1053 . -8))
# var=f1053
    movl -8(%esp), %eax  # stack load f1053
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f1053 . -12) (f1053 . -8))
# expr=(foreign-call "s_write" 2 f1053 (string-length f1053))
    movl %ecx,-16(%esp)
    movl %esp,-20(%esp)
# emit-expr (string-length f1053)
# emit-expr f1053
# emit-variable-ref
# env=((f1053 . -12) (f1053 . -8))
# var=f1053
    movl -12(%esp), %eax  # stack load f1053
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_8987
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_8987:
    movl -6(%eax), %eax
    movl %eax, -24(%esp)
# emit-expr f1053
# emit-variable-ref
# env=((f1053 . -12) (f1053 . -8))
# var=f1053
    movl -12(%esp), %eax  # stack load f1053
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
_L_8985:
    movl %eax, 0(%esp)  # stack save
# emit-expr (let ((f1061 (closure (f1062 f1063) (f1052 f1052 f1052 f1052 f1052) (let ((f1062 f1062) (f1063 f1063)) (begin (f1052 "error:") (f1052 (symbol->string f1062)) (f1052 ": ") (f1052 f1063) (f1052 "\n")))))) (closure (f1066 f1067) (f1061) (let ((f1066 f1066) (f1067 f1067)) (begin (f1061 f1066 f1067) (foreign-call "s_exit" 1)))))
# emit-let
#  si   = -4
#  env  = ((f1052 . 0))
#  bindings = ((f1061 (closure (f1062 f1063) (f1052 f1052 f1052 f1052 f1052) (let ((f1062 f1062) (f1063 f1063)) (begin (f1052 "error:") (f1052 (symbol->string f1062)) (f1052 ": ") (f1052 f1063) (f1052 "\n"))))))
#  body = (closure (f1066 f1067) (f1061) (let ((f1066 f1066) (f1067 f1067)) (begin (f1061 f1066 f1067) (foreign-call "s_exit" 1))))
# emit-expr (closure (f1062 f1063) (f1052 f1052 f1052 f1052 f1052) (let ((f1062 f1062) (f1063 f1063)) (begin (f1052 "error:") (f1052 (symbol->string f1062)) (f1052 ": ") (f1052 f1063) (f1052 "\n"))))
# emit-closure
# si = -4
# env = ((f1052 . 0))
# expr = (closure (f1062 f1063) (f1052 f1052 f1052 f1052 f1052) (let ((f1062 f1062) (f1063 f1063)) (begin (f1052 "error:") (f1052 (symbol->string f1062)) (f1052 ": ") (f1052 f1063) (f1052 "\n"))))
    movl $_L_8988, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f1052 . 0))
# var=f1052
    movl 0(%esp), %eax  # stack load f1052
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f1052
# emit-variable-ref
# env=((f1052 . 0))
# var=f1052
    movl 0(%esp), %eax  # stack load f1052
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f1052
# emit-variable-ref
# env=((f1052 . 0))
# var=f1052
    movl 0(%esp), %eax  # stack load f1052
# end emit-variable-ref
   movl  %eax, 12(%ebp)  # f1052
# emit-variable-ref
# env=((f1052 . 0))
# var=f1052
    movl 0(%esp), %eax  # stack load f1052
# end emit-variable-ref
   movl  %eax, 16(%ebp)  # f1052
# emit-variable-ref
# env=((f1052 . 0))
# var=f1052
    movl 0(%esp), %eax  # stack load f1052
# end emit-variable-ref
   movl  %eax, 20(%ebp)  # f1052
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $24, %ebp     # bump ebp
    jmp _L_8989            # jump around closure body
_L_8988:
# check argument count
    cmp $8,%eax
    je _L_8990
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_8990:
# emit-tail-expr
# si=-16
# env=((f1063 . -12) (f1062 . -8) (f1052 . 20) (f1052 . 16) (f1052 . 12) (f1052 . 8) (f1052 . 4) (f1052 . 0))
# expr=(let ((f1062 f1062) (f1063 f1063)) (begin (f1052 "error:") (f1052 (symbol->string f1062)) (f1052 ": ") (f1052 f1063) (f1052 "\n")))
# emit-tail-let
#  si   = -16
#  env  = ((f1063 . -12) (f1062 . -8) (f1052 . 20) (f1052 . 16) (f1052 . 12) (f1052 . 8) (f1052 . 4) (f1052 . 0))
#  bindings = ((f1062 f1062) (f1063 f1063))
#  body = (begin (f1052 "error:") (f1052 (symbol->string f1062)) (f1052 ": ") (f1052 f1063) (f1052 "\n"))
# emit-expr f1062
# emit-variable-ref
# env=((f1063 . -12) (f1062 . -8) (f1052 . 20) (f1052 . 16) (f1052 . 12) (f1052 . 8) (f1052 . 4) (f1052 . 0))
# var=f1062
    movl -8(%esp), %eax  # stack load f1062
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f1063
# emit-variable-ref
# env=((f1063 . -12) (f1062 . -8) (f1052 . 20) (f1052 . 16) (f1052 . 12) (f1052 . 8) (f1052 . 4) (f1052 . 0))
# var=f1063
    movl -12(%esp), %eax  # stack load f1063
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f1063 . -20) (f1062 . -16) (f1063 . -12) (f1062 . -8) (f1052 . 20) (f1052 . 16) (f1052 . 12) (f1052 . 8) (f1052 . 4) (f1052 . 0))
# expr=(begin (f1052 "error:") (f1052 (symbol->string f1062)) (f1052 ": ") (f1052 f1063) (f1052 "\n"))
# tail-begin (begin (f1052 "error:") (f1052 (symbol->string f1062)) (f1052 ": ") (f1052 f1063) (f1052 "\n"))
#   env=((f1063 . -20) (f1062 . -16) (f1063 . -12) (f1062 . -8) (f1052 . 20) (f1052 . 16) (f1052 . 12) (f1052 . 8) (f1052 . 4) (f1052 . 0))
# emit-expr (f1052 "error:")
# funcall
#    si   =-24
#    env  = ((f1063 . -20) (f1062 . -16) (f1063 . -12) (f1062 . -8) (f1052 . 20) (f1052 . 16) (f1052 . 12) (f1052 . 8) (f1052 . 4) (f1052 . 0))
#    expr = (funcall f1052 "error:")
# emit-expr f1052
# emit-variable-ref
# env=((f1063 . -20) (f1062 . -16) (f1063 . -12) (f1062 . -8) (f1052 . 20) (f1052 . 16) (f1052 . 12) (f1052 . 8) (f1052 . 4) (f1052 . 0))
# var=f1052
    movl 18(%edi), %eax  # frame load f1052
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_8991"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_8991":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr "error:"
# string literal
    jmp _L_8993
    .align 8,0x90
_L_8992 :
    .int 24
    .ascii "error:"
_L_8993:
    movl $_L_8992, %eax
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
# env=((f1063 . -20) (f1062 . -16) (f1063 . -12) (f1062 . -8) (f1052 . 20) (f1052 . 16) (f1052 . 12) (f1052 . 8) (f1052 . 4) (f1052 . 0))
# expr=(begin (f1052 (symbol->string f1062)) (f1052 ": ") (f1052 f1063) (f1052 "\n"))
# tail-begin (begin (f1052 (symbol->string f1062)) (f1052 ": ") (f1052 f1063) (f1052 "\n"))
#   env=((f1063 . -20) (f1062 . -16) (f1063 . -12) (f1062 . -8) (f1052 . 20) (f1052 . 16) (f1052 . 12) (f1052 . 8) (f1052 . 4) (f1052 . 0))
# emit-expr (f1052 (symbol->string f1062))
# funcall
#    si   =-24
#    env  = ((f1063 . -20) (f1062 . -16) (f1063 . -12) (f1062 . -8) (f1052 . 20) (f1052 . 16) (f1052 . 12) (f1052 . 8) (f1052 . 4) (f1052 . 0))
#    expr = (funcall f1052 (symbol->string f1062))
# emit-expr f1052
# emit-variable-ref
# env=((f1063 . -20) (f1062 . -16) (f1063 . -12) (f1062 . -8) (f1052 . 20) (f1052 . 16) (f1052 . 12) (f1052 . 8) (f1052 . 4) (f1052 . 0))
# var=f1052
    movl 18(%edi), %eax  # frame load f1052
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_8994"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_8994":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr (symbol->string f1062)
# symbol->string f1062
# emit-expr f1062
# emit-variable-ref
# env=((f1063 . -20) (f1062 . -16) (f1063 . -12) (f1062 . -8) (f1052 . 20) (f1052 . 16) (f1052 . 12) (f1052 . 8) (f1052 . 4) (f1052 . 0))
# var=f1062
    movl -16(%esp), %eax  # stack load f1062
# end emit-variable-ref
    movl -3(%eax), %eax
    mov %eax, -36(%esp)  # arg (symbol->string f1062)
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f1063 . -20) (f1062 . -16) (f1063 . -12) (f1062 . -8) (f1052 . 20) (f1052 . 16) (f1052 . 12) (f1052 . 8) (f1052 . 4) (f1052 . 0))
# expr=(begin (f1052 ": ") (f1052 f1063) (f1052 "\n"))
# tail-begin (begin (f1052 ": ") (f1052 f1063) (f1052 "\n"))
#   env=((f1063 . -20) (f1062 . -16) (f1063 . -12) (f1062 . -8) (f1052 . 20) (f1052 . 16) (f1052 . 12) (f1052 . 8) (f1052 . 4) (f1052 . 0))
# emit-expr (f1052 ": ")
# funcall
#    si   =-24
#    env  = ((f1063 . -20) (f1062 . -16) (f1063 . -12) (f1062 . -8) (f1052 . 20) (f1052 . 16) (f1052 . 12) (f1052 . 8) (f1052 . 4) (f1052 . 0))
#    expr = (funcall f1052 ": ")
# emit-expr f1052
# emit-variable-ref
# env=((f1063 . -20) (f1062 . -16) (f1063 . -12) (f1062 . -8) (f1052 . 20) (f1052 . 16) (f1052 . 12) (f1052 . 8) (f1052 . 4) (f1052 . 0))
# var=f1052
    movl 18(%edi), %eax  # frame load f1052
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_8995"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_8995":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr ": "
# string literal
    jmp _L_8997
    .align 8,0x90
_L_8996 :
    .int 8
    .ascii ": "
_L_8997:
    movl $_L_8996, %eax
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
# env=((f1063 . -20) (f1062 . -16) (f1063 . -12) (f1062 . -8) (f1052 . 20) (f1052 . 16) (f1052 . 12) (f1052 . 8) (f1052 . 4) (f1052 . 0))
# expr=(begin (f1052 f1063) (f1052 "\n"))
# tail-begin (begin (f1052 f1063) (f1052 "\n"))
#   env=((f1063 . -20) (f1062 . -16) (f1063 . -12) (f1062 . -8) (f1052 . 20) (f1052 . 16) (f1052 . 12) (f1052 . 8) (f1052 . 4) (f1052 . 0))
# emit-expr (f1052 f1063)
# funcall
#    si   =-24
#    env  = ((f1063 . -20) (f1062 . -16) (f1063 . -12) (f1062 . -8) (f1052 . 20) (f1052 . 16) (f1052 . 12) (f1052 . 8) (f1052 . 4) (f1052 . 0))
#    expr = (funcall f1052 f1063)
# emit-expr f1052
# emit-variable-ref
# env=((f1063 . -20) (f1062 . -16) (f1063 . -12) (f1062 . -8) (f1052 . 20) (f1052 . 16) (f1052 . 12) (f1052 . 8) (f1052 . 4) (f1052 . 0))
# var=f1052
    movl 18(%edi), %eax  # frame load f1052
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_8998"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_8998":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f1063
# emit-variable-ref
# env=((f1063 . -20) (f1062 . -16) (f1063 . -12) (f1062 . -8) (f1052 . 20) (f1052 . 16) (f1052 . 12) (f1052 . 8) (f1052 . 4) (f1052 . 0))
# var=f1063
    movl -20(%esp), %eax  # stack load f1063
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f1063
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f1063 . -20) (f1062 . -16) (f1063 . -12) (f1062 . -8) (f1052 . 20) (f1052 . 16) (f1052 . 12) (f1052 . 8) (f1052 . 4) (f1052 . 0))
# expr=(begin (f1052 "\n"))
# tail-begin (begin (f1052 "\n"))
#   env=((f1063 . -20) (f1062 . -16) (f1063 . -12) (f1062 . -8) (f1052 . 20) (f1052 . 16) (f1052 . 12) (f1052 . 8) (f1052 . 4) (f1052 . 0))
# emit-tail-expr
# si=-24
# env=((f1063 . -20) (f1062 . -16) (f1063 . -12) (f1062 . -8) (f1052 . 20) (f1052 . 16) (f1052 . 12) (f1052 . 8) (f1052 . 4) (f1052 . 0))
# expr=(f1052 "\n")
# emit-tail-funcall
#    si   =-24
#    env  = ((f1063 . -20) (f1062 . -16) (f1063 . -12) (f1062 . -8) (f1052 . 20) (f1052 . 16) (f1052 . 12) (f1052 . 8) (f1052 . 4) (f1052 . 0))
#    expr = (funcall f1052 "\n")
# emit-expr f1052
# emit-variable-ref
# env=((f1063 . -20) (f1062 . -16) (f1063 . -12) (f1062 . -8) (f1052 . 20) (f1052 . 16) (f1052 . 12) (f1052 . 8) (f1052 . 4) (f1052 . 0))
# var=f1052
    movl 18(%edi), %eax  # frame load f1052
# end emit-variable-ref
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr "\n"
# string literal
    jmp _L_9000
    .align 8,0x90
_L_8999 :
    .int 4
    .ascii "\n"
_L_9000:
    movl $_L_8999, %eax
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
_L_8989:
    movl %eax, -4(%esp)  # stack save
# emit-expr (closure (f1066 f1067) (f1061) (let ((f1066 f1066) (f1067 f1067)) (begin (f1061 f1066 f1067) (foreign-call "s_exit" 1))))
# emit-closure
# si = -8
# env = ((f1061 . -4) (f1052 . 0))
# expr = (closure (f1066 f1067) (f1061) (let ((f1066 f1066) (f1067 f1067)) (begin (f1061 f1066 f1067) (foreign-call "s_exit" 1))))
    movl $_L_9001, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f1061 . -4) (f1052 . 0))
# var=f1061
    movl -4(%esp), %eax  # stack load f1061
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f1061
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_9002            # jump around closure body
_L_9001:
# check argument count
    cmp $8,%eax
    je _L_9003
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9003:
# emit-tail-expr
# si=-16
# env=((f1067 . -12) (f1066 . -8) (f1061 . 4) (f1061 . -4) (f1052 . 0))
# expr=(let ((f1066 f1066) (f1067 f1067)) (begin (f1061 f1066 f1067) (foreign-call "s_exit" 1)))
# emit-tail-let
#  si   = -16
#  env  = ((f1067 . -12) (f1066 . -8) (f1061 . 4) (f1061 . -4) (f1052 . 0))
#  bindings = ((f1066 f1066) (f1067 f1067))
#  body = (begin (f1061 f1066 f1067) (foreign-call "s_exit" 1))
# emit-expr f1066
# emit-variable-ref
# env=((f1067 . -12) (f1066 . -8) (f1061 . 4) (f1061 . -4) (f1052 . 0))
# var=f1066
    movl -8(%esp), %eax  # stack load f1066
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f1067
# emit-variable-ref
# env=((f1067 . -12) (f1066 . -8) (f1061 . 4) (f1061 . -4) (f1052 . 0))
# var=f1067
    movl -12(%esp), %eax  # stack load f1067
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f1067 . -20) (f1066 . -16) (f1067 . -12) (f1066 . -8) (f1061 . 4) (f1061 . -4) (f1052 . 0))
# expr=(begin (f1061 f1066 f1067) (foreign-call "s_exit" 1))
# tail-begin (begin (f1061 f1066 f1067) (foreign-call "s_exit" 1))
#   env=((f1067 . -20) (f1066 . -16) (f1067 . -12) (f1066 . -8) (f1061 . 4) (f1061 . -4) (f1052 . 0))
# emit-expr (f1061 f1066 f1067)
# funcall
#    si   =-24
#    env  = ((f1067 . -20) (f1066 . -16) (f1067 . -12) (f1066 . -8) (f1061 . 4) (f1061 . -4) (f1052 . 0))
#    expr = (funcall f1061 f1066 f1067)
# emit-expr f1061
# emit-variable-ref
# env=((f1067 . -20) (f1066 . -16) (f1067 . -12) (f1066 . -8) (f1061 . 4) (f1061 . -4) (f1052 . 0))
# var=f1061
    movl 2(%edi), %eax  # frame load f1061
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9004"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9004":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f1066
# emit-variable-ref
# env=((f1067 . -20) (f1066 . -16) (f1067 . -12) (f1066 . -8) (f1061 . 4) (f1061 . -4) (f1052 . 0))
# var=f1066
    movl -16(%esp), %eax  # stack load f1066
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f1066
# emit-expr f1067
# emit-variable-ref
# env=((f1067 . -20) (f1066 . -16) (f1067 . -12) (f1066 . -8) (f1061 . 4) (f1061 . -4) (f1052 . 0))
# var=f1067
    movl -20(%esp), %eax  # stack load f1067
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg f1067
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f1067 . -20) (f1066 . -16) (f1067 . -12) (f1066 . -8) (f1061 . 4) (f1061 . -4) (f1052 . 0))
# expr=(begin (foreign-call "s_exit" 1))
# tail-begin (begin (foreign-call "s_exit" 1))
#   env=((f1067 . -20) (f1066 . -16) (f1067 . -12) (f1066 . -8) (f1061 . 4) (f1061 . -4) (f1052 . 0))
# emit-tail-expr
# si=-24
# env=((f1067 . -20) (f1066 . -16) (f1067 . -12) (f1066 . -8) (f1061 . 4) (f1061 . -4) (f1052 . 0))
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
_L_9002:
     movl %eax, error
# == explicit-begins  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == eliminate-let*  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == uniquify-variables  ==>
# (let ((f1068 (quote ()))) (begin (set! f1068 (cons (quote procedure?) f1068)) (set! f1068 (cons (quote cdr) f1068)) (set! f1068 (cons (quote car) f1068)) (set! f1068 (cons (quote symbol-value) f1068)) (set! f1068 (cons (quote symbol->string) f1068)) (set! f1068 (cons (quote make-symbol) f1068)) (set! f1068 (cons (quote symbol?) f1068)) (set! f1068 (cons (quote string-set!) f1068)) (set! f1068 (cons (quote string-ref) f1068)) (set! f1068 (cons (quote string-length) f1068)) (set! f1068 (cons (quote string?) f1068)) (set! f1068 (cons (quote make-string) f1068)) (set! f1068 (cons (quote vector-ref) f1068)) (set! f1068 (cons (quote vector-set!) f1068)) (set! f1068 (cons (quote vector-length) f1068)) (set! f1068 (cons (quote make-vector) f1068)) (set! f1068 (cons (quote vector?) f1068)) (set! f1068 (cons (quote set-cdr!) f1068)) (set! f1068 (cons (quote set-car!) f1068)) (set! f1068 (cons (quote cdr) f1068)) (set! f1068 (cons (quote car) f1068)) (set! f1068 (cons (quote cons) f1068)) (set! f1068 (cons (quote pair?) f1068)) (set! f1068 (cons (quote fx*) f1068)) (set! f1068 (cons (quote fx-) f1068)) (set! f1068 (cons (quote fx+) f1068)) (set! f1068 (cons (quote fx>=) f1068)) (set! f1068 (cons (quote fx>) f1068)) (set! f1068 (cons (quote fx<=) f1068)) (set! f1068 (cons (quote fx<) f1068)) (set! f1068 (cons (quote fx=) f1068)) (set! f1068 (cons (quote fxzero?) f1068)) (set! f1068 (cons (quote fxsub1) f1068)) (set! f1068 (cons (quote fxadd1) f1068)) (set! f1068 (cons (quote fxlogor) f1068)) (set! f1068 (cons (quote fxlogand) f1068)) (set! f1068 (cons (quote fxlognot) f1068)) (set! f1068 (cons (quote char=?) f1068)) (set! f1068 (cons (quote eq?) f1068)) (set! f1068 (cons (quote not) f1068)) (set! f1068 (cons (quote boolean?) f1068)) (set! f1068 (cons (quote fixnum?) f1068)) (set! f1068 (cons (quote char?) f1068)) (set! f1068 (cons (quote null?) f1068)) (set! f1068 (cons (quote char->fixnum) f1068)) (set! f1068 (cons (quote fixnum->char) f1068)) (lambda () f1068)))
# == vectorize-letrec  ==>
# (let ((f1068 (quote ()))) (begin (set! f1068 (cons (quote procedure?) f1068)) (set! f1068 (cons (quote cdr) f1068)) (set! f1068 (cons (quote car) f1068)) (set! f1068 (cons (quote symbol-value) f1068)) (set! f1068 (cons (quote symbol->string) f1068)) (set! f1068 (cons (quote make-symbol) f1068)) (set! f1068 (cons (quote symbol?) f1068)) (set! f1068 (cons (quote string-set!) f1068)) (set! f1068 (cons (quote string-ref) f1068)) (set! f1068 (cons (quote string-length) f1068)) (set! f1068 (cons (quote string?) f1068)) (set! f1068 (cons (quote make-string) f1068)) (set! f1068 (cons (quote vector-ref) f1068)) (set! f1068 (cons (quote vector-set!) f1068)) (set! f1068 (cons (quote vector-length) f1068)) (set! f1068 (cons (quote make-vector) f1068)) (set! f1068 (cons (quote vector?) f1068)) (set! f1068 (cons (quote set-cdr!) f1068)) (set! f1068 (cons (quote set-car!) f1068)) (set! f1068 (cons (quote cdr) f1068)) (set! f1068 (cons (quote car) f1068)) (set! f1068 (cons (quote cons) f1068)) (set! f1068 (cons (quote pair?) f1068)) (set! f1068 (cons (quote fx*) f1068)) (set! f1068 (cons (quote fx-) f1068)) (set! f1068 (cons (quote fx+) f1068)) (set! f1068 (cons (quote fx>=) f1068)) (set! f1068 (cons (quote fx>) f1068)) (set! f1068 (cons (quote fx<=) f1068)) (set! f1068 (cons (quote fx<) f1068)) (set! f1068 (cons (quote fx=) f1068)) (set! f1068 (cons (quote fxzero?) f1068)) (set! f1068 (cons (quote fxsub1) f1068)) (set! f1068 (cons (quote fxadd1) f1068)) (set! f1068 (cons (quote fxlogor) f1068)) (set! f1068 (cons (quote fxlogand) f1068)) (set! f1068 (cons (quote fxlognot) f1068)) (set! f1068 (cons (quote char=?) f1068)) (set! f1068 (cons (quote eq?) f1068)) (set! f1068 (cons (quote not) f1068)) (set! f1068 (cons (quote boolean?) f1068)) (set! f1068 (cons (quote fixnum?) f1068)) (set! f1068 (cons (quote char?) f1068)) (set! f1068 (cons (quote null?) f1068)) (set! f1068 (cons (quote char->fixnum) f1068)) (set! f1068 (cons (quote fixnum->char) f1068)) (lambda () f1068)))
# == eliminate-set!  ==>
# (let ((f1068 (vector (quote ())))) (begin (vector-set! f1068 0 (cons (quote procedure?) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote cdr) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote car) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote symbol-value) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote symbol->string) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote make-symbol) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote symbol?) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote string-set!) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote string-ref) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote string-length) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote string?) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote make-string) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote vector-ref) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote vector-set!) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote vector-length) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote make-vector) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote vector?) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote set-cdr!) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote set-car!) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote cdr) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote car) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote cons) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote pair?) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fx*) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fx-) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fx+) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fx>=) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fx>) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fx<=) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fx<) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fx=) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fxzero?) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fxsub1) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fxadd1) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fxlogor) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fxlogand) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fxlognot) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote char=?) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote eq?) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote not) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote boolean?) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fixnum?) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote char?) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote null?) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote char->fixnum) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fixnum->char) (vector-ref f1068 0))) (lambda () (let () (vector-ref f1068 0)))))
# == close-free-variables  ==>
# (let ((f1068 (vector (quote ())))) (begin (vector-set! f1068 0 (cons (quote procedure?) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote cdr) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote car) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote symbol-value) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote symbol->string) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote make-symbol) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote symbol?) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote string-set!) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote string-ref) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote string-length) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote string?) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote make-string) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote vector-ref) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote vector-set!) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote vector-length) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote make-vector) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote vector?) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote set-cdr!) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote set-car!) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote cdr) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote car) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote cons) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote pair?) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fx*) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fx-) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fx+) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fx>=) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fx>) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fx<=) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fx<) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fx=) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fxzero?) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fxsub1) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fxadd1) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fxlogor) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fxlogand) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fxlognot) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote char=?) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote eq?) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote not) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote boolean?) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fixnum?) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote char?) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote null?) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote char->fixnum) (vector-ref f1068 0))) (vector-set! f1068 0 (cons (quote fixnum->char) (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0)))))
# == eliminate-quote  ==>
# (let ((f1068 (vector ()))) (begin (vector-set! f1068 0 (cons (string->symbol "procedure?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "symbol-value") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "symbol->string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "make-symbol") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "symbol?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "string-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "string-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "string-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "string?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0)))))
# == eliminate-when/unless  ==>
# (let ((f1068 (vector ()))) (begin (vector-set! f1068 0 (cons (string->symbol "procedure?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "symbol-value") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "symbol->string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "make-symbol") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "symbol?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "string-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "string-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "string-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "string?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0)))))
# == eliminate-cond  ==>
# (let ((f1068 (vector ()))) (begin (vector-set! f1068 0 (cons (string->symbol "procedure?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "symbol-value") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "symbol->string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "make-symbol") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "symbol?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "string-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "string-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "string-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "string?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons (string->symbol "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0)))))
# == external-symbols  ==>
# (let ((f1068 ((primitive-ref vector) ()))) (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0)))))
# emit-expr (let ((f1068 ((primitive-ref vector) ()))) (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0)))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f1068 ((primitive-ref vector) ())))
#  body = (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
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
    je "_L_9005"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9005":
   movl %eax,  -8(%esp)  # stash funcall-oper in closure slot
# emit-expr ()
    movl $63, %eax     # immed ()
    mov %eax, -12(%esp)  # arg ()
    movl -8(%esp), %edi   # load new closure to %edi
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9006
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9006:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9007"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9007:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9009
    cmp  $0,%eax
    jge _L_9008
_L_9009:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9008:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "procedure?") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "procedure?")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "procedure?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9010"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9010":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "procedure?"
# string literal
    jmp _L_9012
    .align 8,0x90
_L_9011 :
    .int 40
    .ascii "procedure?"
_L_9012:
    movl $_L_9011, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg procedure?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9013
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9013:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9014"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9014:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9016
    cmp  $0,%eax
    jge _L_9015
_L_9016:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9015:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9017
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9017:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9018"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9018:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9020
    cmp  $0,%eax
    jge _L_9019
_L_9020:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9019:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "cdr") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "cdr")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cdr")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9021"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9021":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_9023
    .align 8,0x90
_L_9022 :
    .int 12
    .ascii "cdr"
_L_9023:
    movl $_L_9022, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cdr
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9024
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9024:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9025"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9025:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9027
    cmp  $0,%eax
    jge _L_9026
_L_9027:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9026:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9028
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9028:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9029"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9029:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9031
    cmp  $0,%eax
    jge _L_9030
_L_9031:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9030:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "car") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "car")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "car")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9032"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9032":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_9034
    .align 8,0x90
_L_9033 :
    .int 12
    .ascii "car"
_L_9034:
    movl $_L_9033, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg car
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9035
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9035:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9036"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9036:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9038
    cmp  $0,%eax
    jge _L_9037
_L_9038:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9037:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9039
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9039:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9040"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9040:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9042
    cmp  $0,%eax
    jge _L_9041
_L_9042:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9041:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "symbol-value") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "symbol-value")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol-value")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9043"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9043":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol-value"
# string literal
    jmp _L_9045
    .align 8,0x90
_L_9044 :
    .int 48
    .ascii "symbol-value"
_L_9045:
    movl $_L_9044, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol-value
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9046
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9046:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9047"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9047:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9049
    cmp  $0,%eax
    jge _L_9048
_L_9049:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9048:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9050
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9050:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9051"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9051:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9053
    cmp  $0,%eax
    jge _L_9052
_L_9053:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9052:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "symbol->string") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "symbol->string")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol->string")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9054"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9054":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol->string"
# string literal
    jmp _L_9056
    .align 8,0x90
_L_9055 :
    .int 56
    .ascii "symbol->string"
_L_9056:
    movl $_L_9055, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol->string
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9057
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9057:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9058"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9058:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9060
    cmp  $0,%eax
    jge _L_9059
_L_9060:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9059:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9061
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9061:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9062"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9062:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9064
    cmp  $0,%eax
    jge _L_9063
_L_9064:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9063:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "make-symbol") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "make-symbol")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-symbol")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9065"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9065":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-symbol"
# string literal
    jmp _L_9067
    .align 8,0x90
_L_9066 :
    .int 44
    .ascii "make-symbol"
_L_9067:
    movl $_L_9066, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-symbol
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9068
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9068:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9069"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9069:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9071
    cmp  $0,%eax
    jge _L_9070
_L_9071:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9070:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9072
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9072:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9073"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9073:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9075
    cmp  $0,%eax
    jge _L_9074
_L_9075:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9074:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "symbol?") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "symbol?")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9076"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9076":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol?"
# string literal
    jmp _L_9078
    .align 8,0x90
_L_9077 :
    .int 28
    .ascii "symbol?"
_L_9078:
    movl $_L_9077, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9079
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9079:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9080"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9080:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9082
    cmp  $0,%eax
    jge _L_9081
_L_9082:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9081:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9083
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9083:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9084"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9084:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9086
    cmp  $0,%eax
    jge _L_9085
_L_9086:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9085:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "string-set!") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "string-set!")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-set!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9087"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9087":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-set!"
# string literal
    jmp _L_9089
    .align 8,0x90
_L_9088 :
    .int 44
    .ascii "string-set!"
_L_9089:
    movl $_L_9088, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-set!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9090
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9090:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9091"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9091:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9093
    cmp  $0,%eax
    jge _L_9092
_L_9093:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9092:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9094
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9094:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9095"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9095:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9097
    cmp  $0,%eax
    jge _L_9096
_L_9097:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9096:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "string-ref") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "string-ref")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-ref")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9098"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9098":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-ref"
# string literal
    jmp _L_9100
    .align 8,0x90
_L_9099 :
    .int 40
    .ascii "string-ref"
_L_9100:
    movl $_L_9099, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-ref
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9101
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9101:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9102"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9102:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9104
    cmp  $0,%eax
    jge _L_9103
_L_9104:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9103:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9105
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9105:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9106"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9106:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9108
    cmp  $0,%eax
    jge _L_9107
_L_9108:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9107:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-length") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "string-length") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "string-length")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-length")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9109"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9109":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-length"
# string literal
    jmp _L_9111
    .align 8,0x90
_L_9110 :
    .int 52
    .ascii "string-length"
_L_9111:
    movl $_L_9110, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-length
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9112
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9112:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9113"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9113:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9115
    cmp  $0,%eax
    jge _L_9114
_L_9115:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9114:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9116
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9116:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9117"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9117:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9119
    cmp  $0,%eax
    jge _L_9118
_L_9119:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9118:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string?") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "string?") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "string?")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9120"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9120":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string?"
# string literal
    jmp _L_9122
    .align 8,0x90
_L_9121 :
    .int 28
    .ascii "string?"
_L_9122:
    movl $_L_9121, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9123
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9123:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9124"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9124:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9126
    cmp  $0,%eax
    jge _L_9125
_L_9126:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9125:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9127
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9127:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9128"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9128:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9130
    cmp  $0,%eax
    jge _L_9129
_L_9130:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9129:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-string") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "make-string") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "make-string")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-string")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9131"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9131":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-string"
# string literal
    jmp _L_9133
    .align 8,0x90
_L_9132 :
    .int 44
    .ascii "make-string"
_L_9133:
    movl $_L_9132, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-string
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9134
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9134:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9135"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9135:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9137
    cmp  $0,%eax
    jge _L_9136
_L_9137:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9136:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9138
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9138:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9139"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9139:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9141
    cmp  $0,%eax
    jge _L_9140
_L_9141:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9140:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "vector-ref") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "vector-ref")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-ref")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9142"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9142":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-ref"
# string literal
    jmp _L_9144
    .align 8,0x90
_L_9143 :
    .int 40
    .ascii "vector-ref"
_L_9144:
    movl $_L_9143, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-ref
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9145
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9145:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9146"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9146:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9148
    cmp  $0,%eax
    jge _L_9147
_L_9148:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9147:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9149
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9149:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9150"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9150:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9152
    cmp  $0,%eax
    jge _L_9151
_L_9152:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9151:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "vector-set!") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "vector-set!")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-set!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9153"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9153":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-set!"
# string literal
    jmp _L_9155
    .align 8,0x90
_L_9154 :
    .int 44
    .ascii "vector-set!"
_L_9155:
    movl $_L_9154, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-set!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9156
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9156:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9157"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9157:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9159
    cmp  $0,%eax
    jge _L_9158
_L_9159:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9158:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9160
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9160:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9161"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9161:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9163
    cmp  $0,%eax
    jge _L_9162
_L_9163:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9162:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "vector-length") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "vector-length")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-length")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9164"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9164":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-length"
# string literal
    jmp _L_9166
    .align 8,0x90
_L_9165 :
    .int 52
    .ascii "vector-length"
_L_9166:
    movl $_L_9165, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-length
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9167
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9167:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9168"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9168:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9170
    cmp  $0,%eax
    jge _L_9169
_L_9170:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9169:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9171
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9171:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9172"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9172:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9174
    cmp  $0,%eax
    jge _L_9173
_L_9174:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9173:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "make-vector") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "make-vector")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-vector")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9175"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9175":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-vector"
# string literal
    jmp _L_9177
    .align 8,0x90
_L_9176 :
    .int 44
    .ascii "make-vector"
_L_9177:
    movl $_L_9176, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-vector
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9178
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9178:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9179"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9179:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9181
    cmp  $0,%eax
    jge _L_9180
_L_9181:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9180:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9182
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9182:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9183"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9183:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9185
    cmp  $0,%eax
    jge _L_9184
_L_9185:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9184:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector?") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "vector?") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "vector?")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9186"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9186":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector?"
# string literal
    jmp _L_9188
    .align 8,0x90
_L_9187 :
    .int 28
    .ascii "vector?"
_L_9188:
    movl $_L_9187, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9189
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9189:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9190"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9190:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9192
    cmp  $0,%eax
    jge _L_9191
_L_9192:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9191:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9193
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9193:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9194"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9194:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9196
    cmp  $0,%eax
    jge _L_9195
_L_9196:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9195:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "set-cdr!") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "set-cdr!")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "set-cdr!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9197"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9197":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-cdr!"
# string literal
    jmp _L_9199
    .align 8,0x90
_L_9198 :
    .int 32
    .ascii "set-cdr!"
_L_9199:
    movl $_L_9198, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg set-cdr!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9200
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9200:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9201"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9201:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9203
    cmp  $0,%eax
    jge _L_9202
_L_9203:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9202:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9204
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9204:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9205"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9205:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9207
    cmp  $0,%eax
    jge _L_9206
_L_9207:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9206:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "set-car!") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "set-car!")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "set-car!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9208"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9208":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-car!"
# string literal
    jmp _L_9210
    .align 8,0x90
_L_9209 :
    .int 32
    .ascii "set-car!"
_L_9210:
    movl $_L_9209, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg set-car!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9211
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9211:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9212"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9212:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9214
    cmp  $0,%eax
    jge _L_9213
_L_9214:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9213:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9215
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9215:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9216"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9216:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9218
    cmp  $0,%eax
    jge _L_9217
_L_9218:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9217:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cdr") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "cdr") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "cdr")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cdr")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9219"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9219":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_9221
    .align 8,0x90
_L_9220 :
    .int 12
    .ascii "cdr"
_L_9221:
    movl $_L_9220, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cdr
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9222
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9222:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9223"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9223:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9225
    cmp  $0,%eax
    jge _L_9224
_L_9225:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9224:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9226
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9226:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9227"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9227:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9229
    cmp  $0,%eax
    jge _L_9228
_L_9229:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9228:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "car") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "car") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "car")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "car")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9230"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9230":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_9232
    .align 8,0x90
_L_9231 :
    .int 12
    .ascii "car"
_L_9232:
    movl $_L_9231, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg car
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9233
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9233:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9234"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9234:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9236
    cmp  $0,%eax
    jge _L_9235
_L_9236:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9235:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9237
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9237:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9238"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9238:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9240
    cmp  $0,%eax
    jge _L_9239
_L_9240:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9239:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cons") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "cons") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "cons")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cons")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9241"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9241":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cons"
# string literal
    jmp _L_9243
    .align 8,0x90
_L_9242 :
    .int 16
    .ascii "cons"
_L_9243:
    movl $_L_9242, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cons
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9244
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9244:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9245"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9245:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9247
    cmp  $0,%eax
    jge _L_9246
_L_9247:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9246:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9248
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9248:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9249"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9249:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9251
    cmp  $0,%eax
    jge _L_9250
_L_9251:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9250:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "pair?") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "pair?") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "pair?")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "pair?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9252"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9252":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "pair?"
# string literal
    jmp _L_9254
    .align 8,0x90
_L_9253 :
    .int 20
    .ascii "pair?"
_L_9254:
    movl $_L_9253, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg pair?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9255
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9255:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9256"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9256:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9258
    cmp  $0,%eax
    jge _L_9257
_L_9258:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9257:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9259
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9259:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9260"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9260:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9262
    cmp  $0,%eax
    jge _L_9261
_L_9262:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9261:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx*") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "fx*") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "fx*")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx*")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9263"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9263":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx*"
# string literal
    jmp _L_9265
    .align 8,0x90
_L_9264 :
    .int 12
    .ascii "fx*"
_L_9265:
    movl $_L_9264, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx*
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9266
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9266:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9267"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9267:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9269
    cmp  $0,%eax
    jge _L_9268
_L_9269:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9268:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9270
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9270:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9271"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9271:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9273
    cmp  $0,%eax
    jge _L_9272
_L_9273:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9272:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx-") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "fx-") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "fx-")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx-")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9274"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9274":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx-"
# string literal
    jmp _L_9276
    .align 8,0x90
_L_9275 :
    .int 12
    .ascii "fx-"
_L_9276:
    movl $_L_9275, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx-
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9277
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9277:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9278"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9278:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9280
    cmp  $0,%eax
    jge _L_9279
_L_9280:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9279:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9281
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9281:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9282"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9282:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9284
    cmp  $0,%eax
    jge _L_9283
_L_9284:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9283:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx+") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "fx+") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "fx+")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx+")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9285"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9285":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx+"
# string literal
    jmp _L_9287
    .align 8,0x90
_L_9286 :
    .int 12
    .ascii "fx+"
_L_9287:
    movl $_L_9286, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx+
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9288
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9288:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9289"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9289:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9291
    cmp  $0,%eax
    jge _L_9290
_L_9291:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9290:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9292
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9292:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9293"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9293:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9295
    cmp  $0,%eax
    jge _L_9294
_L_9295:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9294:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "fx>=") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "fx>=")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx>=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9296"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9296":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>="
# string literal
    jmp _L_9298
    .align 8,0x90
_L_9297 :
    .int 16
    .ascii "fx>="
_L_9298:
    movl $_L_9297, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx>=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9299
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9299:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9300"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9300:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9302
    cmp  $0,%eax
    jge _L_9301
_L_9302:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9301:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9303
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9303:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9304"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9304:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9306
    cmp  $0,%eax
    jge _L_9305
_L_9306:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9305:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx>") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "fx>") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "fx>")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx>")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9307"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9307":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>"
# string literal
    jmp _L_9309
    .align 8,0x90
_L_9308 :
    .int 12
    .ascii "fx>"
_L_9309:
    movl $_L_9308, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx>
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9310
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9310:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9311"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9311:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9313
    cmp  $0,%eax
    jge _L_9312
_L_9313:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9312:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9314
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9314:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9315"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9315:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9317
    cmp  $0,%eax
    jge _L_9316
_L_9317:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9316:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "fx<=") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "fx<=")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx<=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9318"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9318":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<="
# string literal
    jmp _L_9320
    .align 8,0x90
_L_9319 :
    .int 16
    .ascii "fx<="
_L_9320:
    movl $_L_9319, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx<=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9321
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9321:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9322"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9322:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9324
    cmp  $0,%eax
    jge _L_9323
_L_9324:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9323:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9325
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9325:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9326"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9326:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9328
    cmp  $0,%eax
    jge _L_9327
_L_9328:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9327:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx<") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "fx<") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "fx<")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx<")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9329"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9329":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<"
# string literal
    jmp _L_9331
    .align 8,0x90
_L_9330 :
    .int 12
    .ascii "fx<"
_L_9331:
    movl $_L_9330, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx<
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9332
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9332:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9333"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9333:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9335
    cmp  $0,%eax
    jge _L_9334
_L_9335:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9334:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9336
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9336:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9337"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9337:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9339
    cmp  $0,%eax
    jge _L_9338
_L_9339:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9338:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx=") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "fx=") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "fx=")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9340"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9340":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx="
# string literal
    jmp _L_9342
    .align 8,0x90
_L_9341 :
    .int 12
    .ascii "fx="
_L_9342:
    movl $_L_9341, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9343
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9343:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9344"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9344:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9346
    cmp  $0,%eax
    jge _L_9345
_L_9346:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9345:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9347
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9347:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9348"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9348:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9350
    cmp  $0,%eax
    jge _L_9349
_L_9350:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9349:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "fxzero?") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "fxzero?")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxzero?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9351"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9351":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxzero?"
# string literal
    jmp _L_9353
    .align 8,0x90
_L_9352 :
    .int 28
    .ascii "fxzero?"
_L_9353:
    movl $_L_9352, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxzero?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9354
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9354:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9355"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9355:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9357
    cmp  $0,%eax
    jge _L_9356
_L_9357:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9356:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9358
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9358:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9359"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9359:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9361
    cmp  $0,%eax
    jge _L_9360
_L_9361:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9360:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "fxsub1") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "fxsub1")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxsub1")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9362"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9362":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxsub1"
# string literal
    jmp _L_9364
    .align 8,0x90
_L_9363 :
    .int 24
    .ascii "fxsub1"
_L_9364:
    movl $_L_9363, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxsub1
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9365
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9365:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9366"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9366:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9368
    cmp  $0,%eax
    jge _L_9367
_L_9368:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9367:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9369
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9369:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9370"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9370:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9372
    cmp  $0,%eax
    jge _L_9371
_L_9372:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9371:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "fxadd1") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "fxadd1")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxadd1")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9373"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9373":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxadd1"
# string literal
    jmp _L_9375
    .align 8,0x90
_L_9374 :
    .int 24
    .ascii "fxadd1"
_L_9375:
    movl $_L_9374, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxadd1
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9376
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9376:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9377"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9377:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9379
    cmp  $0,%eax
    jge _L_9378
_L_9379:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9378:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9380
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9380:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9381"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9381:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9383
    cmp  $0,%eax
    jge _L_9382
_L_9383:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9382:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "fxlogor") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "fxlogor")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlogor")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9384"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9384":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogor"
# string literal
    jmp _L_9386
    .align 8,0x90
_L_9385 :
    .int 28
    .ascii "fxlogor"
_L_9386:
    movl $_L_9385, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlogor
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9387
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9387:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9388"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9388:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9390
    cmp  $0,%eax
    jge _L_9389
_L_9390:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9389:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9391
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9391:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9392"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9392:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9394
    cmp  $0,%eax
    jge _L_9393
_L_9394:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9393:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "fxlogand") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "fxlogand")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlogand")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9395"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9395":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogand"
# string literal
    jmp _L_9397
    .align 8,0x90
_L_9396 :
    .int 32
    .ascii "fxlogand"
_L_9397:
    movl $_L_9396, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlogand
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9398
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9398:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9399"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9399:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9401
    cmp  $0,%eax
    jge _L_9400
_L_9401:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9400:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9402
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9402:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9403"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9403:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9405
    cmp  $0,%eax
    jge _L_9404
_L_9405:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9404:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "fxlognot") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "fxlognot")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlognot")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9406"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9406":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlognot"
# string literal
    jmp _L_9408
    .align 8,0x90
_L_9407 :
    .int 32
    .ascii "fxlognot"
_L_9408:
    movl $_L_9407, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlognot
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9409
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9409:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9410"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9410:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9412
    cmp  $0,%eax
    jge _L_9411
_L_9412:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9411:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9413
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9413:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9414"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9414:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9416
    cmp  $0,%eax
    jge _L_9415
_L_9416:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9415:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char=?") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "char=?") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "char=?")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char=?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9417"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9417":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char=?"
# string literal
    jmp _L_9419
    .align 8,0x90
_L_9418 :
    .int 24
    .ascii "char=?"
_L_9419:
    movl $_L_9418, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char=?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9420
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9420:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9421"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9421:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9423
    cmp  $0,%eax
    jge _L_9422
_L_9423:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9422:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9424
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9424:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9425"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9425:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9427
    cmp  $0,%eax
    jge _L_9426
_L_9427:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9426:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "eq?") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "eq?") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "eq?")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "eq?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9428"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9428":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "eq?"
# string literal
    jmp _L_9430
    .align 8,0x90
_L_9429 :
    .int 12
    .ascii "eq?"
_L_9430:
    movl $_L_9429, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg eq?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9431
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9431:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9432"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9432:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9434
    cmp  $0,%eax
    jge _L_9433
_L_9434:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9433:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9435
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9435:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9436"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9436:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9438
    cmp  $0,%eax
    jge _L_9437
_L_9438:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9437:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "not") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "not") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "not")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "not")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9439"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9439":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "not"
# string literal
    jmp _L_9441
    .align 8,0x90
_L_9440 :
    .int 12
    .ascii "not"
_L_9441:
    movl $_L_9440, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg not
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9442
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9442:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9443"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9443:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9445
    cmp  $0,%eax
    jge _L_9444
_L_9445:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9444:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9446
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9446:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9447"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9447:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9449
    cmp  $0,%eax
    jge _L_9448
_L_9449:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9448:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "boolean?") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "boolean?")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "boolean?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9450"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9450":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "boolean?"
# string literal
    jmp _L_9452
    .align 8,0x90
_L_9451 :
    .int 32
    .ascii "boolean?"
_L_9452:
    movl $_L_9451, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg boolean?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9453
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9453:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9454"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9454:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9456
    cmp  $0,%eax
    jge _L_9455
_L_9456:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9455:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9457
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9457:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9458"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9458:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9460
    cmp  $0,%eax
    jge _L_9459
_L_9460:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9459:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "fixnum?") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "fixnum?")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fixnum?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9461"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9461":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum?"
# string literal
    jmp _L_9463
    .align 8,0x90
_L_9462 :
    .int 28
    .ascii "fixnum?"
_L_9463:
    movl $_L_9462, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fixnum?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9464
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9464:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9465"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9465:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9467
    cmp  $0,%eax
    jge _L_9466
_L_9467:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9466:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9468
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9468:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9469"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9469:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9471
    cmp  $0,%eax
    jge _L_9470
_L_9471:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9470:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char?") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "char?") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "char?")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9472"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9472":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char?"
# string literal
    jmp _L_9474
    .align 8,0x90
_L_9473 :
    .int 20
    .ascii "char?"
_L_9474:
    movl $_L_9473, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9475
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9475:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9476"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9476:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9478
    cmp  $0,%eax
    jge _L_9477
_L_9478:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9477:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9479
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9479:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9480"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9480:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9482
    cmp  $0,%eax
    jge _L_9481
_L_9482:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9481:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "null?") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "null?") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "null?")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "null?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9483"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9483":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "null?"
# string literal
    jmp _L_9485
    .align 8,0x90
_L_9484 :
    .int 20
    .ascii "null?"
_L_9485:
    movl $_L_9484, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg null?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9486
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9486:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9487"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9487:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9489
    cmp  $0,%eax
    jge _L_9488
_L_9489:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9488:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))) (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9490
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9490:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9491"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9491:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9493
    cmp  $0,%eax
    jge _L_9492
_L_9493:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9492:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "char->fixnum") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "char->fixnum")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char->fixnum")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9494"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9494":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char->fixnum"
# string literal
    jmp _L_9496
    .align 8,0x90
_L_9495 :
    .int 48
    .ascii "char->fixnum"
_L_9496:
    movl $_L_9495, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char->fixnum
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9497
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9497:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9498"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9498:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9500
    cmp  $0,%eax
    jge _L_9499
_L_9500:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9499:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))) (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (vector-set! f1068 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0)))
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9501
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9501:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9502"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9502:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9504
    cmp  $0,%eax
    jge _L_9503
_L_9504:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9503:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f1068 0))
# cons arg1=((primitive-ref string->symbol) "fixnum->char") arg2=(vector-ref f1068 0)
# emit-expr ((primitive-ref string->symbol) "fixnum->char")
# funcall
#    si   =-12
#    env  = ((f1068 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fixnum->char")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9505"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9505":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum->char"
# string literal
    jmp _L_9507
    .align 8,0x90
_L_9506 :
    .int 48
    .ascii "fixnum->char"
_L_9507:
    movl $_L_9506, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fixnum->char
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f1068 0)
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9508
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9508:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9509"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9509:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9511
    cmp  $0,%eax
    jge _L_9510
_L_9511:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9510:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (closure () (f1068) (let () (vector-ref f1068 0))))
# emit-begin
#   expr=(begin (closure () (f1068) (let () (vector-ref f1068 0))))
#   env=((f1068 . 0))
# emit-expr (closure () (f1068) (let () (vector-ref f1068 0)))
# emit-closure
# si = -4
# env = ((f1068 . 0))
# expr = (closure () (f1068) (let () (vector-ref f1068 0)))
    movl $_L_9512, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f1068 . 0))
# var=f1068
    movl 0(%esp), %eax  # stack load f1068
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f1068
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_9513            # jump around closure body
_L_9512:
# check argument count
    cmp $0,%eax
    je _L_9514
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9514:
# emit-tail-expr
# si=-8
# env=((f1068 . 4) (f1068 . 0))
# expr=(let () (vector-ref f1068 0))
# emit-tail-let
#  si   = -8
#  env  = ((f1068 . 4) (f1068 . 0))
#  bindings = ()
#  body = (vector-ref f1068 0)
# emit-tail-expr
# si=-8
# env=((f1068 . 4) (f1068 . 0))
# expr=(vector-ref f1068 0)
# tail primcall
# emit-expr f1068
# emit-variable-ref
# env=((f1068 . 4) (f1068 . 0))
# var=f1068
    movl 2(%edi), %eax  # frame load f1068
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_9515
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9515:
    movl %eax, -8(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_9516"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_9516:
# check bounds on vector index
    movl -8(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_9518
    cmp  $0,%eax
    jge _L_9517
_L_9518:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_9517:
    movl -8(%esp), %esi
    movl -1(%eax,%esi), %eax
#return from tail (vector-ref f1068 0)
    ret
    .align 4,0x90
_L_9513:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f1068 . 0))
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
    movl $_L_9519, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_9520            # jump around closure body
_L_9519:
# check argument count
    cmp $0,%eax
    je _L_9521
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9521:
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
    je "_L_9522"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9522":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_9524
    .align 8,0x90
_L_9523 :
    .int 28
    .ascii "funcall"
_L_9524:
    movl $_L_9523, %eax
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
    jmp _L_9526
    .align 8,0x90
_L_9525 :
    .int 100
    .ascii "arg 1 must be a procedure"
_L_9526:
    movl $_L_9525, %eax
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
_L_9520:
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
    movl $_L_9527, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_9528            # jump around closure body
_L_9527:
# check argument count
    cmp $0,%eax
    je _L_9529
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9529:
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
    je "_L_9530"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9530":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_9532
    .align 8,0x90
_L_9531 :
    .int 28
    .ascii "funcall"
_L_9532:
    movl $_L_9531, %eax
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
    jmp _L_9534
    .align 8,0x90
_L_9533 :
    .int 80
    .ascii "wrong number of args"
_L_9534:
    movl $_L_9533, %eax
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
_L_9528:
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
    movl $_L_9535, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_9536            # jump around closure body
_L_9535:
# check argument count
    cmp $0,%eax
    je _L_9537
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9537:
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
    je "_L_9538"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9538":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_9540
    .align 8,0x90
_L_9539 :
    .int 28
    .ascii "funcall"
_L_9540:
    movl $_L_9539, %eax
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
    jmp _L_9542
    .align 8,0x90
_L_9541 :
    .int 48
    .ascii "too few args"
_L_9542:
    movl $_L_9541, %eax
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
_L_9536:
     movl %eax, eh$uargcount$umin
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == uniquify-variables  ==>
# (lambda (f1069) (error (list-ref (primitives) f1069) "arg must be a fixnum"))
# == vectorize-letrec  ==>
# (lambda (f1069) (error (list-ref (primitives) f1069) "arg must be a fixnum"))
# == eliminate-set!  ==>
# (lambda (f1069) (let ((f1069 f1069)) (error (list-ref (primitives) f1069) "arg must be a fixnum")))
# == close-free-variables  ==>
# (closure (f1069) (error list-ref primitives) (let ((f1069 f1069)) (error (list-ref (primitives) f1069) "arg must be a fixnum")))
# == eliminate-quote  ==>
# (closure (f1069) (error list-ref primitives) (let ((f1069 f1069)) (error (list-ref (primitives) f1069) "arg must be a fixnum")))
# == eliminate-when/unless  ==>
# (closure (f1069) (error list-ref primitives) (let ((f1069 f1069)) (error (list-ref (primitives) f1069) "arg must be a fixnum")))
# == eliminate-cond  ==>
# (closure (f1069) (error list-ref primitives) (let ((f1069 f1069)) (error (list-ref (primitives) f1069) "arg must be a fixnum")))
# == external-symbols  ==>
# (closure (f1069) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1069 f1069)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1069) "arg must be a fixnum")))
# emit-expr (closure (f1069) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1069 f1069)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1069) "arg must be a fixnum")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f1069) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1069 f1069)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1069) "arg must be a fixnum")))
    movl $_L_9543, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_9544            # jump around closure body
_L_9543:
# check argument count
    cmp $4,%eax
    je _L_9545
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9545:
# emit-tail-expr
# si=-12
# env=((f1069 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f1069 f1069)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1069) "arg must be a fixnum"))
# emit-tail-let
#  si   = -12
#  env  = ((f1069 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f1069 f1069))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1069) "arg must be a fixnum")
# emit-expr f1069
# emit-variable-ref
# env=((f1069 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1069
    movl -8(%esp), %eax  # stack load f1069
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f1069 . -12) (f1069 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1069) "arg must be a fixnum")
# emit-tail-funcall
#    si   =-16
#    env  = ((f1069 . -12) (f1069 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1069) "arg must be a fixnum")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f1069)
# funcall
#    si   =-20
#    env  = ((f1069 . -12) (f1069 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f1069)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9546"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9546":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f1069 . -12) (f1069 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9547"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9547":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f1069
# emit-variable-ref
# env=((f1069 . -12) (f1069 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1069
    movl -12(%esp), %eax  # stack load f1069
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f1069
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f1069)
# emit-expr "arg must be a fixnum"
# string literal
    jmp _L_9549
    .align 8,0x90
_L_9548 :
    .int 80
    .ascii "arg must be a fixnum"
_L_9549:
    movl $_L_9548, %eax
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
_L_9544:
     movl %eax, eh$ufixnum
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == uniquify-variables  ==>
# (lambda (f1070) (error (list-ref (primitives) f1070) "arg must be a string"))
# == vectorize-letrec  ==>
# (lambda (f1070) (error (list-ref (primitives) f1070) "arg must be a string"))
# == eliminate-set!  ==>
# (lambda (f1070) (let ((f1070 f1070)) (error (list-ref (primitives) f1070) "arg must be a string")))
# == close-free-variables  ==>
# (closure (f1070) (error list-ref primitives) (let ((f1070 f1070)) (error (list-ref (primitives) f1070) "arg must be a string")))
# == eliminate-quote  ==>
# (closure (f1070) (error list-ref primitives) (let ((f1070 f1070)) (error (list-ref (primitives) f1070) "arg must be a string")))
# == eliminate-when/unless  ==>
# (closure (f1070) (error list-ref primitives) (let ((f1070 f1070)) (error (list-ref (primitives) f1070) "arg must be a string")))
# == eliminate-cond  ==>
# (closure (f1070) (error list-ref primitives) (let ((f1070 f1070)) (error (list-ref (primitives) f1070) "arg must be a string")))
# == external-symbols  ==>
# (closure (f1070) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1070 f1070)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1070) "arg must be a string")))
# emit-expr (closure (f1070) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1070 f1070)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1070) "arg must be a string")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f1070) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1070 f1070)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1070) "arg must be a string")))
    movl $_L_9550, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_9551            # jump around closure body
_L_9550:
# check argument count
    cmp $4,%eax
    je _L_9552
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9552:
# emit-tail-expr
# si=-12
# env=((f1070 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f1070 f1070)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1070) "arg must be a string"))
# emit-tail-let
#  si   = -12
#  env  = ((f1070 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f1070 f1070))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1070) "arg must be a string")
# emit-expr f1070
# emit-variable-ref
# env=((f1070 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1070
    movl -8(%esp), %eax  # stack load f1070
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f1070 . -12) (f1070 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1070) "arg must be a string")
# emit-tail-funcall
#    si   =-16
#    env  = ((f1070 . -12) (f1070 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1070) "arg must be a string")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f1070)
# funcall
#    si   =-20
#    env  = ((f1070 . -12) (f1070 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f1070)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9553"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9553":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f1070 . -12) (f1070 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9554"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9554":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f1070
# emit-variable-ref
# env=((f1070 . -12) (f1070 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1070
    movl -12(%esp), %eax  # stack load f1070
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f1070
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f1070)
# emit-expr "arg must be a string"
# string literal
    jmp _L_9556
    .align 8,0x90
_L_9555 :
    .int 80
    .ascii "arg must be a string"
_L_9556:
    movl $_L_9555, %eax
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
_L_9551:
     movl %eax, eh$ustring
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == uniquify-variables  ==>
# (lambda (f1071) (error (list-ref (primitives) f1071) "arg must be a character"))
# == vectorize-letrec  ==>
# (lambda (f1071) (error (list-ref (primitives) f1071) "arg must be a character"))
# == eliminate-set!  ==>
# (lambda (f1071) (let ((f1071 f1071)) (error (list-ref (primitives) f1071) "arg must be a character")))
# == close-free-variables  ==>
# (closure (f1071) (error list-ref primitives) (let ((f1071 f1071)) (error (list-ref (primitives) f1071) "arg must be a character")))
# == eliminate-quote  ==>
# (closure (f1071) (error list-ref primitives) (let ((f1071 f1071)) (error (list-ref (primitives) f1071) "arg must be a character")))
# == eliminate-when/unless  ==>
# (closure (f1071) (error list-ref primitives) (let ((f1071 f1071)) (error (list-ref (primitives) f1071) "arg must be a character")))
# == eliminate-cond  ==>
# (closure (f1071) (error list-ref primitives) (let ((f1071 f1071)) (error (list-ref (primitives) f1071) "arg must be a character")))
# == external-symbols  ==>
# (closure (f1071) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1071 f1071)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1071) "arg must be a character")))
# emit-expr (closure (f1071) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1071 f1071)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1071) "arg must be a character")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f1071) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1071 f1071)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1071) "arg must be a character")))
    movl $_L_9557, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_9558            # jump around closure body
_L_9557:
# check argument count
    cmp $4,%eax
    je _L_9559
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9559:
# emit-tail-expr
# si=-12
# env=((f1071 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f1071 f1071)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1071) "arg must be a character"))
# emit-tail-let
#  si   = -12
#  env  = ((f1071 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f1071 f1071))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1071) "arg must be a character")
# emit-expr f1071
# emit-variable-ref
# env=((f1071 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1071
    movl -8(%esp), %eax  # stack load f1071
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f1071 . -12) (f1071 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1071) "arg must be a character")
# emit-tail-funcall
#    si   =-16
#    env  = ((f1071 . -12) (f1071 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1071) "arg must be a character")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f1071)
# funcall
#    si   =-20
#    env  = ((f1071 . -12) (f1071 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f1071)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9560"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9560":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f1071 . -12) (f1071 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9561"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9561":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f1071
# emit-variable-ref
# env=((f1071 . -12) (f1071 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1071
    movl -12(%esp), %eax  # stack load f1071
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f1071
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f1071)
# emit-expr "arg must be a character"
# string literal
    jmp _L_9563
    .align 8,0x90
_L_9562 :
    .int 92
    .ascii "arg must be a character"
_L_9563:
    movl $_L_9562, %eax
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
_L_9558:
     movl %eax, eh$ucharacter
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == uniquify-variables  ==>
# (lambda (f1072) (error (list-ref (primitives) f1072) "arg must be a pair"))
# == vectorize-letrec  ==>
# (lambda (f1072) (error (list-ref (primitives) f1072) "arg must be a pair"))
# == eliminate-set!  ==>
# (lambda (f1072) (let ((f1072 f1072)) (error (list-ref (primitives) f1072) "arg must be a pair")))
# == close-free-variables  ==>
# (closure (f1072) (error list-ref primitives) (let ((f1072 f1072)) (error (list-ref (primitives) f1072) "arg must be a pair")))
# == eliminate-quote  ==>
# (closure (f1072) (error list-ref primitives) (let ((f1072 f1072)) (error (list-ref (primitives) f1072) "arg must be a pair")))
# == eliminate-when/unless  ==>
# (closure (f1072) (error list-ref primitives) (let ((f1072 f1072)) (error (list-ref (primitives) f1072) "arg must be a pair")))
# == eliminate-cond  ==>
# (closure (f1072) (error list-ref primitives) (let ((f1072 f1072)) (error (list-ref (primitives) f1072) "arg must be a pair")))
# == external-symbols  ==>
# (closure (f1072) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1072 f1072)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1072) "arg must be a pair")))
# emit-expr (closure (f1072) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1072 f1072)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1072) "arg must be a pair")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f1072) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1072 f1072)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1072) "arg must be a pair")))
    movl $_L_9564, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_9565            # jump around closure body
_L_9564:
# check argument count
    cmp $4,%eax
    je _L_9566
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9566:
# emit-tail-expr
# si=-12
# env=((f1072 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f1072 f1072)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1072) "arg must be a pair"))
# emit-tail-let
#  si   = -12
#  env  = ((f1072 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f1072 f1072))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1072) "arg must be a pair")
# emit-expr f1072
# emit-variable-ref
# env=((f1072 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1072
    movl -8(%esp), %eax  # stack load f1072
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f1072 . -12) (f1072 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1072) "arg must be a pair")
# emit-tail-funcall
#    si   =-16
#    env  = ((f1072 . -12) (f1072 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1072) "arg must be a pair")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f1072)
# funcall
#    si   =-20
#    env  = ((f1072 . -12) (f1072 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f1072)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9567"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9567":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f1072 . -12) (f1072 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9568"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9568":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f1072
# emit-variable-ref
# env=((f1072 . -12) (f1072 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1072
    movl -12(%esp), %eax  # stack load f1072
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f1072
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f1072)
# emit-expr "arg must be a pair"
# string literal
    jmp _L_9570
    .align 8,0x90
_L_9569 :
    .int 72
    .ascii "arg must be a pair"
_L_9570:
    movl $_L_9569, %eax
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
_L_9565:
     movl %eax, eh$upair
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == uniquify-variables  ==>
# (lambda (f1073) (error (list-ref (primitives) f1073) "arg must be a vector"))
# == vectorize-letrec  ==>
# (lambda (f1073) (error (list-ref (primitives) f1073) "arg must be a vector"))
# == eliminate-set!  ==>
# (lambda (f1073) (let ((f1073 f1073)) (error (list-ref (primitives) f1073) "arg must be a vector")))
# == close-free-variables  ==>
# (closure (f1073) (error list-ref primitives) (let ((f1073 f1073)) (error (list-ref (primitives) f1073) "arg must be a vector")))
# == eliminate-quote  ==>
# (closure (f1073) (error list-ref primitives) (let ((f1073 f1073)) (error (list-ref (primitives) f1073) "arg must be a vector")))
# == eliminate-when/unless  ==>
# (closure (f1073) (error list-ref primitives) (let ((f1073 f1073)) (error (list-ref (primitives) f1073) "arg must be a vector")))
# == eliminate-cond  ==>
# (closure (f1073) (error list-ref primitives) (let ((f1073 f1073)) (error (list-ref (primitives) f1073) "arg must be a vector")))
# == external-symbols  ==>
# (closure (f1073) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1073 f1073)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1073) "arg must be a vector")))
# emit-expr (closure (f1073) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1073 f1073)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1073) "arg must be a vector")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f1073) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1073 f1073)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1073) "arg must be a vector")))
    movl $_L_9571, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_9572            # jump around closure body
_L_9571:
# check argument count
    cmp $4,%eax
    je _L_9573
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9573:
# emit-tail-expr
# si=-12
# env=((f1073 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f1073 f1073)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1073) "arg must be a vector"))
# emit-tail-let
#  si   = -12
#  env  = ((f1073 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f1073 f1073))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1073) "arg must be a vector")
# emit-expr f1073
# emit-variable-ref
# env=((f1073 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1073
    movl -8(%esp), %eax  # stack load f1073
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f1073 . -12) (f1073 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1073) "arg must be a vector")
# emit-tail-funcall
#    si   =-16
#    env  = ((f1073 . -12) (f1073 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1073) "arg must be a vector")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f1073)
# funcall
#    si   =-20
#    env  = ((f1073 . -12) (f1073 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f1073)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9574"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9574":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f1073 . -12) (f1073 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9575"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9575":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f1073
# emit-variable-ref
# env=((f1073 . -12) (f1073 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1073
    movl -12(%esp), %eax  # stack load f1073
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f1073
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f1073)
# emit-expr "arg must be a vector"
# string literal
    jmp _L_9577
    .align 8,0x90
_L_9576 :
    .int 80
    .ascii "arg must be a vector"
_L_9577:
    movl $_L_9576, %eax
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
_L_9572:
     movl %eax, eh$uvector
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == uniquify-variables  ==>
# (lambda (f1074) (error (list-ref (primitives) f1074) "length must be a fixnum >= 0"))
# == vectorize-letrec  ==>
# (lambda (f1074) (error (list-ref (primitives) f1074) "length must be a fixnum >= 0"))
# == eliminate-set!  ==>
# (lambda (f1074) (let ((f1074 f1074)) (error (list-ref (primitives) f1074) "length must be a fixnum >= 0")))
# == close-free-variables  ==>
# (closure (f1074) (error list-ref primitives) (let ((f1074 f1074)) (error (list-ref (primitives) f1074) "length must be a fixnum >= 0")))
# == eliminate-quote  ==>
# (closure (f1074) (error list-ref primitives) (let ((f1074 f1074)) (error (list-ref (primitives) f1074) "length must be a fixnum >= 0")))
# == eliminate-when/unless  ==>
# (closure (f1074) (error list-ref primitives) (let ((f1074 f1074)) (error (list-ref (primitives) f1074) "length must be a fixnum >= 0")))
# == eliminate-cond  ==>
# (closure (f1074) (error list-ref primitives) (let ((f1074 f1074)) (error (list-ref (primitives) f1074) "length must be a fixnum >= 0")))
# == external-symbols  ==>
# (closure (f1074) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1074 f1074)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1074) "length must be a fixnum >= 0")))
# emit-expr (closure (f1074) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1074 f1074)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1074) "length must be a fixnum >= 0")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f1074) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1074 f1074)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1074) "length must be a fixnum >= 0")))
    movl $_L_9578, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_9579            # jump around closure body
_L_9578:
# check argument count
    cmp $4,%eax
    je _L_9580
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9580:
# emit-tail-expr
# si=-12
# env=((f1074 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f1074 f1074)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1074) "length must be a fixnum >= 0"))
# emit-tail-let
#  si   = -12
#  env  = ((f1074 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f1074 f1074))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1074) "length must be a fixnum >= 0")
# emit-expr f1074
# emit-variable-ref
# env=((f1074 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1074
    movl -8(%esp), %eax  # stack load f1074
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f1074 . -12) (f1074 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1074) "length must be a fixnum >= 0")
# emit-tail-funcall
#    si   =-16
#    env  = ((f1074 . -12) (f1074 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1074) "length must be a fixnum >= 0")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f1074)
# funcall
#    si   =-20
#    env  = ((f1074 . -12) (f1074 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f1074)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9581"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9581":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f1074 . -12) (f1074 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9582"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9582":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f1074
# emit-variable-ref
# env=((f1074 . -12) (f1074 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1074
    movl -12(%esp), %eax  # stack load f1074
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f1074
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f1074)
# emit-expr "length must be a fixnum >= 0"
# string literal
    jmp _L_9584
    .align 8,0x90
_L_9583 :
    .int 112
    .ascii "length must be a fixnum >= 0"
_L_9584:
    movl $_L_9583, %eax
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
_L_9579:
     movl %eax, eh$ulength
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == uniquify-variables  ==>
# (lambda (f1075) (error (list-ref (primitives) f1075) "index out of bounds"))
# == vectorize-letrec  ==>
# (lambda (f1075) (error (list-ref (primitives) f1075) "index out of bounds"))
# == eliminate-set!  ==>
# (lambda (f1075) (let ((f1075 f1075)) (error (list-ref (primitives) f1075) "index out of bounds")))
# == close-free-variables  ==>
# (closure (f1075) (error list-ref primitives) (let ((f1075 f1075)) (error (list-ref (primitives) f1075) "index out of bounds")))
# == eliminate-quote  ==>
# (closure (f1075) (error list-ref primitives) (let ((f1075 f1075)) (error (list-ref (primitives) f1075) "index out of bounds")))
# == eliminate-when/unless  ==>
# (closure (f1075) (error list-ref primitives) (let ((f1075 f1075)) (error (list-ref (primitives) f1075) "index out of bounds")))
# == eliminate-cond  ==>
# (closure (f1075) (error list-ref primitives) (let ((f1075 f1075)) (error (list-ref (primitives) f1075) "index out of bounds")))
# == external-symbols  ==>
# (closure (f1075) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1075 f1075)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1075) "index out of bounds")))
# emit-expr (closure (f1075) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1075 f1075)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1075) "index out of bounds")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f1075) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1075 f1075)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1075) "index out of bounds")))
    movl $_L_9585, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_9586            # jump around closure body
_L_9585:
# check argument count
    cmp $4,%eax
    je _L_9587
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9587:
# emit-tail-expr
# si=-12
# env=((f1075 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f1075 f1075)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1075) "index out of bounds"))
# emit-tail-let
#  si   = -12
#  env  = ((f1075 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f1075 f1075))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1075) "index out of bounds")
# emit-expr f1075
# emit-variable-ref
# env=((f1075 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1075
    movl -8(%esp), %eax  # stack load f1075
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f1075 . -12) (f1075 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1075) "index out of bounds")
# emit-tail-funcall
#    si   =-16
#    env  = ((f1075 . -12) (f1075 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1075) "index out of bounds")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f1075)
# funcall
#    si   =-20
#    env  = ((f1075 . -12) (f1075 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f1075)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9588"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9588":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f1075 . -12) (f1075 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9589"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9589":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f1075
# emit-variable-ref
# env=((f1075 . -12) (f1075 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1075
    movl -12(%esp), %eax  # stack load f1075
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f1075
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f1075)
# emit-expr "index out of bounds"
# string literal
    jmp _L_9591
    .align 8,0x90
_L_9590 :
    .int 76
    .ascii "index out of bounds"
_L_9591:
    movl $_L_9590, %eax
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
_L_9586:
     movl %eax, eh$uvector$uindex
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == uniquify-variables  ==>
# (lambda (f1076) (error (list-ref (primitives) f1076) "index out of bounds"))
# == vectorize-letrec  ==>
# (lambda (f1076) (error (list-ref (primitives) f1076) "index out of bounds"))
# == eliminate-set!  ==>
# (lambda (f1076) (let ((f1076 f1076)) (error (list-ref (primitives) f1076) "index out of bounds")))
# == close-free-variables  ==>
# (closure (f1076) (error list-ref primitives) (let ((f1076 f1076)) (error (list-ref (primitives) f1076) "index out of bounds")))
# == eliminate-quote  ==>
# (closure (f1076) (error list-ref primitives) (let ((f1076 f1076)) (error (list-ref (primitives) f1076) "index out of bounds")))
# == eliminate-when/unless  ==>
# (closure (f1076) (error list-ref primitives) (let ((f1076 f1076)) (error (list-ref (primitives) f1076) "index out of bounds")))
# == eliminate-cond  ==>
# (closure (f1076) (error list-ref primitives) (let ((f1076 f1076)) (error (list-ref (primitives) f1076) "index out of bounds")))
# == external-symbols  ==>
# (closure (f1076) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1076 f1076)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1076) "index out of bounds")))
# emit-expr (closure (f1076) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1076 f1076)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1076) "index out of bounds")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f1076) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f1076 f1076)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1076) "index out of bounds")))
    movl $_L_9592, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_9593            # jump around closure body
_L_9592:
# check argument count
    cmp $4,%eax
    je _L_9594
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_9594:
# emit-tail-expr
# si=-12
# env=((f1076 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f1076 f1076)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1076) "index out of bounds"))
# emit-tail-let
#  si   = -12
#  env  = ((f1076 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f1076 f1076))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1076) "index out of bounds")
# emit-expr f1076
# emit-variable-ref
# env=((f1076 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1076
    movl -8(%esp), %eax  # stack load f1076
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f1076 . -12) (f1076 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1076) "index out of bounds")
# emit-tail-funcall
#    si   =-16
#    env  = ((f1076 . -12) (f1076 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f1076) "index out of bounds")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f1076)
# funcall
#    si   =-20
#    env  = ((f1076 . -12) (f1076 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f1076)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9595"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9595":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f1076 . -12) (f1076 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_9596"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_9596":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f1076
# emit-variable-ref
# env=((f1076 . -12) (f1076 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f1076
    movl -12(%esp), %eax  # stack load f1076
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f1076
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f1076)
# emit-expr "index out of bounds"
# string literal
    jmp _L_9598
    .align 8,0x90
_L_9597 :
    .int 76
    .ascii "index out of bounds"
_L_9598:
    movl $_L_9597, %eax
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
_L_9593:
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
