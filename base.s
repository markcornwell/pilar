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
     .text
     .global base_init
     .align 4
base_init:
# == explicit-begins  ==>
# (let ((interned-symbols (cons (make-symbol "nil" ()) ()))) (lambda () interned-symbols))
# == eliminate-let*  ==>
# (let ((interned-symbols (cons (make-symbol "nil" ()) ()))) (lambda () interned-symbols))
# == uniquify-variables  ==>
# (let ((f110949 (cons (make-symbol "nil" ()) ()))) (lambda () f110949))
# == vectorize-letrec  ==>
# (let ((f110949 (cons (make-symbol "nil" ()) ()))) (lambda () f110949))
# == eliminate-set!  ==>
# (let ((f110949 (cons (make-symbol "nil" ()) ()))) (lambda () (let () f110949)))
# == close-free-variables  ==>
# (let ((f110949 (cons (make-symbol "nil" ()) ()))) (closure () (f110949) (let () f110949)))
# == eliminate-quote  ==>
# (let ((f110949 (cons (make-symbol "nil" ()) ()))) (closure () (f110949) (let () f110949)))
# == eliminate-when/unless  ==>
# (let ((f110949 (cons (make-symbol "nil" ()) ()))) (closure () (f110949) (let () f110949)))
# == eliminate-cond  ==>
# (let ((f110949 (cons (make-symbol "nil" ()) ()))) (closure () (f110949) (let () f110949)))
# == external-symbols  ==>
# (let ((f110949 (cons (make-symbol "nil" ()) ()))) (closure () (f110949) (let () f110949)))
# emit-expr (let ((f110949 (cons (make-symbol "nil" ()) ()))) (closure () (f110949) (let () f110949)))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f110949 (cons (make-symbol "nil" ()) ())))
#  body = (closure () (f110949) (let () f110949))
# emit-expr (cons (make-symbol "nil" ()) ())
# cons arg1=(make-symbol "nil" ()) arg2=()
# emit-expr (make-symbol "nil" ())
# make-symbol arg1="nil" arg2=()
# emit-expr "nil"
# string literal
    jmp _L_897746
    .align 8,0x90
_L_897745 :
    .int 12
    .ascii "nil"
_L_897746:
    movl $_L_897745, %eax
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
# emit-expr (closure () (f110949) (let () f110949))
# emit-closure
# si = -4
# env = ((f110949 . 0))
# expr = (closure () (f110949) (let () f110949))
    movl $_L_897747, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f110949 . 0))
# var=f110949
    movl 0(%esp), %eax  # stack load f110949
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f110949
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_897748            # jump around closure body
_L_897747:
# check argument count
    cmp $0,%eax
    je _L_897749
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_897749:
# emit-tail-expr
# si=-8
# env=((f110949 . 4) (f110949 . 0))
# expr=(let () f110949)
# emit-tail-let
#  si   = -8
#  env  = ((f110949 . 4) (f110949 . 0))
#  bindings = ()
#  body = f110949
# emit-tail-expr
# si=-8
# env=((f110949 . 4) (f110949 . 0))
# expr=f110949
# emit-tail-variable-ref
# emit-variable-ref
# env=((f110949 . 4) (f110949 . 0))
# var=f110949
    movl 2(%edi), %eax  # frame load f110949
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    .align 4,0x90
_L_897748:
     movl %eax, symbols
# == explicit-begins  ==>
# (letrec ((slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if (si= s1 s2 i) (si<n= s1 s2 (fx+ i 1) n) #f)))) (ss= (lambda (s1 s2) (if (slen= s1 s2) (si<n= s1 s2 0 (string-length s1)) #f)))) ss=)
# == eliminate-let*  ==>
# (letrec ((slen= (lambda (s1 s2) (fx= (string-length s1) (string-length s2)))) (si= (lambda (s1 s2 i) (char=? (string-ref s1 i) (string-ref s2 i)))) (si<n= (lambda (s1 s2 i n) (if (fx= i n) #t (if (si= s1 s2 i) (si<n= s1 s2 (fx+ i 1) n) #f)))) (ss= (lambda (s1 s2) (if (slen= s1 s2) (si<n= s1 s2 0 (string-length s1)) #f)))) ss=)
# == uniquify-variables  ==>
# (letrec ((f110953 (lambda (f110974 f110975) (fx= (string-length f110974) (string-length f110975)))) (f110952 (lambda (f110971 f110972 f110973) (char=? (string-ref f110971 f110973) (string-ref f110972 f110973)))) (f110951 (lambda (f110967 f110968 f110969 f110970) (if (fx= f110969 f110970) #t (if (f110952 f110967 f110968 f110969) (f110951 f110967 f110968 (fx+ f110969 1) f110970) #f)))) (f110950 (lambda (f110965 f110966) (if (f110953 f110965 f110966) (f110951 f110965 f110966 0 (string-length f110965)) #f)))) f110950)
# == vectorize-letrec  ==>
# (let ((f110953 (make-vector 1)) (f110952 (make-vector 1)) (f110951 (make-vector 1)) (f110950 (make-vector 1))) (begin (begin (vector-set! f110953 0 (lambda (f110974 f110975) (fx= (string-length f110974) (string-length f110975)))) (vector-set! f110952 0 (lambda (f110971 f110972 f110973) (char=? (string-ref f110971 f110973) (string-ref f110972 f110973)))) (vector-set! f110951 0 (lambda (f110967 f110968 f110969 f110970) (if (fx= f110969 f110970) #t (if ((vector-ref f110952 0) f110967 f110968 f110969) ((vector-ref f110951 0) f110967 f110968 (fx+ f110969 1) f110970) #f)))) (vector-set! f110950 0 (lambda (f110965 f110966) (if ((vector-ref f110953 0) f110965 f110966) ((vector-ref f110951 0) f110965 f110966 0 (string-length f110965)) #f)))) (vector-ref f110950 0)))
# == eliminate-set!  ==>
# (let ((f110953 (make-vector 1)) (f110952 (make-vector 1)) (f110951 (make-vector 1)) (f110950 (make-vector 1))) (begin (begin (vector-set! f110953 0 (lambda (f110974 f110975) (let ((f110974 f110974) (f110975 f110975)) (fx= (string-length f110974) (string-length f110975))))) (vector-set! f110952 0 (lambda (f110971 f110972 f110973) (let ((f110971 f110971) (f110972 f110972) (f110973 f110973)) (char=? (string-ref f110971 f110973) (string-ref f110972 f110973))))) (vector-set! f110951 0 (lambda (f110967 f110968 f110969 f110970) (let ((f110967 f110967) (f110968 f110968) (f110969 f110969) (f110970 f110970)) (if (fx= f110969 f110970) #t (if ((vector-ref f110952 0) f110967 f110968 f110969) ((vector-ref f110951 0) f110967 f110968 (fx+ f110969 1) f110970) #f))))) (vector-set! f110950 0 (lambda (f110965 f110966) (let ((f110965 f110965) (f110966 f110966)) (if ((vector-ref f110953 0) f110965 f110966) ((vector-ref f110951 0) f110965 f110966 0 (string-length f110965)) #f))))) (vector-ref f110950 0)))
# == close-free-variables  ==>
# (let ((f110953 (make-vector 1)) (f110952 (make-vector 1)) (f110951 (make-vector 1)) (f110950 (make-vector 1))) (begin (begin (vector-set! f110953 0 (closure (f110974 f110975) () (let ((f110974 f110974) (f110975 f110975)) (fx= (string-length f110974) (string-length f110975))))) (vector-set! f110952 0 (closure (f110971 f110972 f110973) () (let ((f110971 f110971) (f110972 f110972) (f110973 f110973)) (char=? (string-ref f110971 f110973) (string-ref f110972 f110973))))) (vector-set! f110951 0 (closure (f110967 f110968 f110969 f110970) (f110952 f110951) (let ((f110967 f110967) (f110968 f110968) (f110969 f110969) (f110970 f110970)) (if (fx= f110969 f110970) #t (if ((vector-ref f110952 0) f110967 f110968 f110969) ((vector-ref f110951 0) f110967 f110968 (fx+ f110969 1) f110970) #f))))) (vector-set! f110950 0 (closure (f110965 f110966) (f110953 f110951) (let ((f110965 f110965) (f110966 f110966)) (if ((vector-ref f110953 0) f110965 f110966) ((vector-ref f110951 0) f110965 f110966 0 (string-length f110965)) #f))))) (vector-ref f110950 0)))
# == eliminate-quote  ==>
# (let ((f110953 (make-vector 1)) (f110952 (make-vector 1)) (f110951 (make-vector 1)) (f110950 (make-vector 1))) (begin (begin (vector-set! f110953 0 (closure (f110974 f110975) () (let ((f110974 f110974) (f110975 f110975)) (fx= (string-length f110974) (string-length f110975))))) (vector-set! f110952 0 (closure (f110971 f110972 f110973) () (let ((f110971 f110971) (f110972 f110972) (f110973 f110973)) (char=? (string-ref f110971 f110973) (string-ref f110972 f110973))))) (vector-set! f110951 0 (closure (f110967 f110968 f110969 f110970) (f110952 f110951) (let ((f110967 f110967) (f110968 f110968) (f110969 f110969) (f110970 f110970)) (if (fx= f110969 f110970) #t (if ((vector-ref f110952 0) f110967 f110968 f110969) ((vector-ref f110951 0) f110967 f110968 (fx+ f110969 1) f110970) #f))))) (vector-set! f110950 0 (closure (f110965 f110966) (f110953 f110951) (let ((f110965 f110965) (f110966 f110966)) (if ((vector-ref f110953 0) f110965 f110966) ((vector-ref f110951 0) f110965 f110966 0 (string-length f110965)) #f))))) (vector-ref f110950 0)))
# == eliminate-when/unless  ==>
# (let ((f110953 (make-vector 1)) (f110952 (make-vector 1)) (f110951 (make-vector 1)) (f110950 (make-vector 1))) (begin (begin (vector-set! f110953 0 (closure (f110974 f110975) () (let ((f110974 f110974) (f110975 f110975)) (fx= (string-length f110974) (string-length f110975))))) (vector-set! f110952 0 (closure (f110971 f110972 f110973) () (let ((f110971 f110971) (f110972 f110972) (f110973 f110973)) (char=? (string-ref f110971 f110973) (string-ref f110972 f110973))))) (vector-set! f110951 0 (closure (f110967 f110968 f110969 f110970) (f110952 f110951) (let ((f110967 f110967) (f110968 f110968) (f110969 f110969) (f110970 f110970)) (if (fx= f110969 f110970) #t (if ((vector-ref f110952 0) f110967 f110968 f110969) ((vector-ref f110951 0) f110967 f110968 (fx+ f110969 1) f110970) #f))))) (vector-set! f110950 0 (closure (f110965 f110966) (f110953 f110951) (let ((f110965 f110965) (f110966 f110966)) (if ((vector-ref f110953 0) f110965 f110966) ((vector-ref f110951 0) f110965 f110966 0 (string-length f110965)) #f))))) (vector-ref f110950 0)))
# == eliminate-cond  ==>
# (let ((f110953 (make-vector 1)) (f110952 (make-vector 1)) (f110951 (make-vector 1)) (f110950 (make-vector 1))) (begin (begin (vector-set! f110953 0 (closure (f110974 f110975) () (let ((f110974 f110974) (f110975 f110975)) (fx= (string-length f110974) (string-length f110975))))) (vector-set! f110952 0 (closure (f110971 f110972 f110973) () (let ((f110971 f110971) (f110972 f110972) (f110973 f110973)) (char=? (string-ref f110971 f110973) (string-ref f110972 f110973))))) (vector-set! f110951 0 (closure (f110967 f110968 f110969 f110970) (f110952 f110951) (let ((f110967 f110967) (f110968 f110968) (f110969 f110969) (f110970 f110970)) (if (fx= f110969 f110970) #t (if ((vector-ref f110952 0) f110967 f110968 f110969) ((vector-ref f110951 0) f110967 f110968 (fx+ f110969 1) f110970) #f))))) (vector-set! f110950 0 (closure (f110965 f110966) (f110953 f110951) (let ((f110965 f110965) (f110966 f110966)) (if ((vector-ref f110953 0) f110965 f110966) ((vector-ref f110951 0) f110965 f110966 0 (string-length f110965)) #f))))) (vector-ref f110950 0)))
# == external-symbols  ==>
# (let ((f110953 (make-vector 1)) (f110952 (make-vector 1)) (f110951 (make-vector 1)) (f110950 (make-vector 1))) (begin (begin (vector-set! f110953 0 (closure (f110974 f110975) () (let ((f110974 f110974) (f110975 f110975)) (fx= (string-length f110974) (string-length f110975))))) (vector-set! f110952 0 (closure (f110971 f110972 f110973) () (let ((f110971 f110971) (f110972 f110972) (f110973 f110973)) (char=? (string-ref f110971 f110973) (string-ref f110972 f110973))))) (vector-set! f110951 0 (closure (f110967 f110968 f110969 f110970) (f110952 f110951) (let ((f110967 f110967) (f110968 f110968) (f110969 f110969) (f110970 f110970)) (if (fx= f110969 f110970) #t (if ((vector-ref f110952 0) f110967 f110968 f110969) ((vector-ref f110951 0) f110967 f110968 (fx+ f110969 1) f110970) #f))))) (vector-set! f110950 0 (closure (f110965 f110966) (f110953 f110951) (let ((f110965 f110965) (f110966 f110966)) (if ((vector-ref f110953 0) f110965 f110966) ((vector-ref f110951 0) f110965 f110966 0 (string-length f110965)) #f))))) (vector-ref f110950 0)))
# emit-expr (let ((f110953 (make-vector 1)) (f110952 (make-vector 1)) (f110951 (make-vector 1)) (f110950 (make-vector 1))) (begin (begin (vector-set! f110953 0 (closure (f110974 f110975) () (let ((f110974 f110974) (f110975 f110975)) (fx= (string-length f110974) (string-length f110975))))) (vector-set! f110952 0 (closure (f110971 f110972 f110973) () (let ((f110971 f110971) (f110972 f110972) (f110973 f110973)) (char=? (string-ref f110971 f110973) (string-ref f110972 f110973))))) (vector-set! f110951 0 (closure (f110967 f110968 f110969 f110970) (f110952 f110951) (let ((f110967 f110967) (f110968 f110968) (f110969 f110969) (f110970 f110970)) (if (fx= f110969 f110970) #t (if ((vector-ref f110952 0) f110967 f110968 f110969) ((vector-ref f110951 0) f110967 f110968 (fx+ f110969 1) f110970) #f))))) (vector-set! f110950 0 (closure (f110965 f110966) (f110953 f110951) (let ((f110965 f110965) (f110966 f110966)) (if ((vector-ref f110953 0) f110965 f110966) ((vector-ref f110951 0) f110965 f110966 0 (string-length f110965)) #f))))) (vector-ref f110950 0)))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f110953 (make-vector 1)) (f110952 (make-vector 1)) (f110951 (make-vector 1)) (f110950 (make-vector 1)))
#  body = (begin (begin (vector-set! f110953 0 (closure (f110974 f110975) () (let ((f110974 f110974) (f110975 f110975)) (fx= (string-length f110974) (string-length f110975))))) (vector-set! f110952 0 (closure (f110971 f110972 f110973) () (let ((f110971 f110971) (f110972 f110972) (f110973 f110973)) (char=? (string-ref f110971 f110973) (string-ref f110972 f110973))))) (vector-set! f110951 0 (closure (f110967 f110968 f110969 f110970) (f110952 f110951) (let ((f110967 f110967) (f110968 f110968) (f110969 f110969) (f110970 f110970)) (if (fx= f110969 f110970) #t (if ((vector-ref f110952 0) f110967 f110968 f110969) ((vector-ref f110951 0) f110967 f110968 (fx+ f110969 1) f110970) #f))))) (vector-set! f110950 0 (closure (f110965 f110966) (f110953 f110951) (let ((f110965 f110965) (f110966 f110966)) (if ((vector-ref f110953 0) f110965 f110966) ((vector-ref f110951 0) f110965 f110966 0 (string-length f110965)) #f))))) (vector-ref f110950 0))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897750"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897750:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_897751
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897751:
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
    je "_L_897752"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897752:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_897753
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897753:
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
    je "_L_897754"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897754:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_897755
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897755:
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
    je "_L_897756"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897756:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_897757
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897757:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, -12(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f110953 0 (closure (f110974 f110975) () (let ((f110974 f110974) (f110975 f110975)) (fx= (string-length f110974) (string-length f110975))))) (vector-set! f110952 0 (closure (f110971 f110972 f110973) () (let ((f110971 f110971) (f110972 f110972) (f110973 f110973)) (char=? (string-ref f110971 f110973) (string-ref f110972 f110973))))) (vector-set! f110951 0 (closure (f110967 f110968 f110969 f110970) (f110952 f110951) (let ((f110967 f110967) (f110968 f110968) (f110969 f110969) (f110970 f110970)) (if (fx= f110969 f110970) #t (if ((vector-ref f110952 0) f110967 f110968 f110969) ((vector-ref f110951 0) f110967 f110968 (fx+ f110969 1) f110970) #f))))) (vector-set! f110950 0 (closure (f110965 f110966) (f110953 f110951) (let ((f110965 f110965) (f110966 f110966)) (if ((vector-ref f110953 0) f110965 f110966) ((vector-ref f110951 0) f110965 f110966 0 (string-length f110965)) #f))))) (vector-ref f110950 0))
# emit-begin
#   expr=(begin (begin (vector-set! f110953 0 (closure (f110974 f110975) () (let ((f110974 f110974) (f110975 f110975)) (fx= (string-length f110974) (string-length f110975))))) (vector-set! f110952 0 (closure (f110971 f110972 f110973) () (let ((f110971 f110971) (f110972 f110972) (f110973 f110973)) (char=? (string-ref f110971 f110973) (string-ref f110972 f110973))))) (vector-set! f110951 0 (closure (f110967 f110968 f110969 f110970) (f110952 f110951) (let ((f110967 f110967) (f110968 f110968) (f110969 f110969) (f110970 f110970)) (if (fx= f110969 f110970) #t (if ((vector-ref f110952 0) f110967 f110968 f110969) ((vector-ref f110951 0) f110967 f110968 (fx+ f110969 1) f110970) #f))))) (vector-set! f110950 0 (closure (f110965 f110966) (f110953 f110951) (let ((f110965 f110965) (f110966 f110966)) (if ((vector-ref f110953 0) f110965 f110966) ((vector-ref f110951 0) f110965 f110966 0 (string-length f110965)) #f))))) (vector-ref f110950 0))
#   env=((f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# emit-expr (begin (vector-set! f110953 0 (closure (f110974 f110975) () (let ((f110974 f110974) (f110975 f110975)) (fx= (string-length f110974) (string-length f110975))))) (vector-set! f110952 0 (closure (f110971 f110972 f110973) () (let ((f110971 f110971) (f110972 f110972) (f110973 f110973)) (char=? (string-ref f110971 f110973) (string-ref f110972 f110973))))) (vector-set! f110951 0 (closure (f110967 f110968 f110969 f110970) (f110952 f110951) (let ((f110967 f110967) (f110968 f110968) (f110969 f110969) (f110970 f110970)) (if (fx= f110969 f110970) #t (if ((vector-ref f110952 0) f110967 f110968 f110969) ((vector-ref f110951 0) f110967 f110968 (fx+ f110969 1) f110970) #f))))) (vector-set! f110950 0 (closure (f110965 f110966) (f110953 f110951) (let ((f110965 f110965) (f110966 f110966)) (if ((vector-ref f110953 0) f110965 f110966) ((vector-ref f110951 0) f110965 f110966 0 (string-length f110965)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f110953 0 (closure (f110974 f110975) () (let ((f110974 f110974) (f110975 f110975)) (fx= (string-length f110974) (string-length f110975))))) (vector-set! f110952 0 (closure (f110971 f110972 f110973) () (let ((f110971 f110971) (f110972 f110972) (f110973 f110973)) (char=? (string-ref f110971 f110973) (string-ref f110972 f110973))))) (vector-set! f110951 0 (closure (f110967 f110968 f110969 f110970) (f110952 f110951) (let ((f110967 f110967) (f110968 f110968) (f110969 f110969) (f110970 f110970)) (if (fx= f110969 f110970) #t (if ((vector-ref f110952 0) f110967 f110968 f110969) ((vector-ref f110951 0) f110967 f110968 (fx+ f110969 1) f110970) #f))))) (vector-set! f110950 0 (closure (f110965 f110966) (f110953 f110951) (let ((f110965 f110965) (f110966 f110966)) (if ((vector-ref f110953 0) f110965 f110966) ((vector-ref f110951 0) f110965 f110966 0 (string-length f110965)) #f)))))
#   env=((f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# emit-expr (vector-set! f110953 0 (closure (f110974 f110975) () (let ((f110974 f110974) (f110975 f110975)) (fx= (string-length f110974) (string-length f110975)))))
# emit-expr f110953
# emit-variable-ref
# env=((f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110953
    movl 0(%esp), %eax  # stack load f110953
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_897758
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897758:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897759"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897759:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_897761
    cmp  $0,%eax
    jge _L_897760
_L_897761:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_897760:
    movl %eax, -20(%esp)
# emit-expr (closure (f110974 f110975) () (let ((f110974 f110974) (f110975 f110975)) (fx= (string-length f110974) (string-length f110975))))
# emit-closure
# si = -24
# env = ((f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# expr = (closure (f110974 f110975) () (let ((f110974 f110974) (f110975 f110975)) (fx= (string-length f110974) (string-length f110975))))
    movl $_L_897762, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_897763            # jump around closure body
_L_897762:
# check argument count
    cmp $8,%eax
    je _L_897764
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_897764:
# emit-tail-expr
# si=-16
# env=((f110975 . -12) (f110974 . -8) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# expr=(let ((f110974 f110974) (f110975 f110975)) (fx= (string-length f110974) (string-length f110975)))
# emit-tail-let
#  si   = -16
#  env  = ((f110975 . -12) (f110974 . -8) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
#  bindings = ((f110974 f110974) (f110975 f110975))
#  body = (fx= (string-length f110974) (string-length f110975))
# emit-expr f110974
# emit-variable-ref
# env=((f110975 . -12) (f110974 . -8) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110974
    movl -8(%esp), %eax  # stack load f110974
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f110975
# emit-variable-ref
# env=((f110975 . -12) (f110974 . -8) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110975
    movl -12(%esp), %eax  # stack load f110975
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f110975 . -20) (f110974 . -16) (f110975 . -12) (f110974 . -8) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# expr=(fx= (string-length f110974) (string-length f110975))
# tail primcall
# emit-expr (string-length f110975)
# emit-expr f110975
# emit-variable-ref
# env=((f110975 . -20) (f110974 . -16) (f110975 . -12) (f110974 . -8) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110975
    movl -20(%esp), %eax  # stack load f110975
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_897765
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897765:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897766"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897766:
    movl %eax, -24(%esp)
# emit-expr (string-length f110974)
# emit-expr f110974
# emit-variable-ref
# env=((f110975 . -20) (f110974 . -16) (f110975 . -12) (f110974 . -8) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110974
    movl -16(%esp), %eax  # stack load f110974
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_897767
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897767:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897768"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897768:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (fx= (string-length f110974) (string-length f110975))
    ret
    .align 4,0x90
_L_897763:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f110952 0 (closure (f110971 f110972 f110973) () (let ((f110971 f110971) (f110972 f110972) (f110973 f110973)) (char=? (string-ref f110971 f110973) (string-ref f110972 f110973))))) (vector-set! f110951 0 (closure (f110967 f110968 f110969 f110970) (f110952 f110951) (let ((f110967 f110967) (f110968 f110968) (f110969 f110969) (f110970 f110970)) (if (fx= f110969 f110970) #t (if ((vector-ref f110952 0) f110967 f110968 f110969) ((vector-ref f110951 0) f110967 f110968 (fx+ f110969 1) f110970) #f))))) (vector-set! f110950 0 (closure (f110965 f110966) (f110953 f110951) (let ((f110965 f110965) (f110966 f110966)) (if ((vector-ref f110953 0) f110965 f110966) ((vector-ref f110951 0) f110965 f110966 0 (string-length f110965)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f110952 0 (closure (f110971 f110972 f110973) () (let ((f110971 f110971) (f110972 f110972) (f110973 f110973)) (char=? (string-ref f110971 f110973) (string-ref f110972 f110973))))) (vector-set! f110951 0 (closure (f110967 f110968 f110969 f110970) (f110952 f110951) (let ((f110967 f110967) (f110968 f110968) (f110969 f110969) (f110970 f110970)) (if (fx= f110969 f110970) #t (if ((vector-ref f110952 0) f110967 f110968 f110969) ((vector-ref f110951 0) f110967 f110968 (fx+ f110969 1) f110970) #f))))) (vector-set! f110950 0 (closure (f110965 f110966) (f110953 f110951) (let ((f110965 f110965) (f110966 f110966)) (if ((vector-ref f110953 0) f110965 f110966) ((vector-ref f110951 0) f110965 f110966 0 (string-length f110965)) #f)))))
#   env=((f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# emit-expr (vector-set! f110952 0 (closure (f110971 f110972 f110973) () (let ((f110971 f110971) (f110972 f110972) (f110973 f110973)) (char=? (string-ref f110971 f110973) (string-ref f110972 f110973)))))
# emit-expr f110952
# emit-variable-ref
# env=((f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110952
    movl -4(%esp), %eax  # stack load f110952
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_897769
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897769:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897770"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897770:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_897772
    cmp  $0,%eax
    jge _L_897771
_L_897772:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_897771:
    movl %eax, -20(%esp)
# emit-expr (closure (f110971 f110972 f110973) () (let ((f110971 f110971) (f110972 f110972) (f110973 f110973)) (char=? (string-ref f110971 f110973) (string-ref f110972 f110973))))
# emit-closure
# si = -24
# env = ((f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# expr = (closure (f110971 f110972 f110973) () (let ((f110971 f110971) (f110972 f110972) (f110973 f110973)) (char=? (string-ref f110971 f110973) (string-ref f110972 f110973))))
    movl $_L_897773, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_897774            # jump around closure body
_L_897773:
# check argument count
    cmp $12,%eax
    je _L_897775
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_897775:
# emit-tail-expr
# si=-20
# env=((f110973 . -16) (f110972 . -12) (f110971 . -8) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# expr=(let ((f110971 f110971) (f110972 f110972) (f110973 f110973)) (char=? (string-ref f110971 f110973) (string-ref f110972 f110973)))
# emit-tail-let
#  si   = -20
#  env  = ((f110973 . -16) (f110972 . -12) (f110971 . -8) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
#  bindings = ((f110971 f110971) (f110972 f110972) (f110973 f110973))
#  body = (char=? (string-ref f110971 f110973) (string-ref f110972 f110973))
# emit-expr f110971
# emit-variable-ref
# env=((f110973 . -16) (f110972 . -12) (f110971 . -8) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110971
    movl -8(%esp), %eax  # stack load f110971
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr f110972
# emit-variable-ref
# env=((f110973 . -16) (f110972 . -12) (f110971 . -8) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110972
    movl -12(%esp), %eax  # stack load f110972
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f110973
# emit-variable-ref
# env=((f110973 . -16) (f110972 . -12) (f110971 . -8) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110973
    movl -16(%esp), %eax  # stack load f110973
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((f110973 . -28) (f110972 . -24) (f110971 . -20) (f110973 . -16) (f110972 . -12) (f110971 . -8) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# expr=(char=? (string-ref f110971 f110973) (string-ref f110972 f110973))
# tail primcall
# char= c1=(string-ref f110971 f110973) c2=(string-ref f110972 f110973)
# emit-expr (string-ref f110971 f110973)
# emit-expr f110971
# emit-variable-ref
# env=((f110973 . -28) (f110972 . -24) (f110971 . -20) (f110973 . -16) (f110972 . -12) (f110971 . -8) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110971
    movl -20(%esp), %eax  # stack load f110971
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_897776
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897776:
    movl %eax, -32(%esp)
# emit-expr f110973
# emit-variable-ref
# env=((f110973 . -28) (f110972 . -24) (f110971 . -20) (f110973 . -16) (f110972 . -12) (f110971 . -8) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110973
    movl -28(%esp), %eax  # stack load f110973
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897777"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897777:
# check bounds on string index
    movl -32(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_897779
    cmp  $0,%eax
    jge _L_897778
_L_897779:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_897778:
    sar $2, %eax
    movl -32(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_897780"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897780:
    movb %ah, -32(%esp)
# emit-expr (string-ref f110972 f110973)
# emit-expr f110972
# emit-variable-ref
# env=((f110973 . -28) (f110972 . -24) (f110971 . -20) (f110973 . -16) (f110972 . -12) (f110971 . -8) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110972
    movl -24(%esp), %eax  # stack load f110972
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_897781
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897781:
    movl %eax, -36(%esp)
# emit-expr f110973
# emit-variable-ref
# env=((f110973 . -28) (f110972 . -24) (f110971 . -20) (f110973 . -16) (f110972 . -12) (f110971 . -8) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110973
    movl -28(%esp), %eax  # stack load f110973
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897782"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897782:
# check bounds on string index
    movl -36(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_897784
    cmp  $0,%eax
    jge _L_897783
_L_897784:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $148,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_897783:
    sar $2, %eax
    movl -36(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_897785"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897785:
    cmp %ah, -32(%esp)
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (char=? (string-ref f110971 f110973) (string-ref f110972 f110973))
    ret
    .align 4,0x90
_L_897774:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f110951 0 (closure (f110967 f110968 f110969 f110970) (f110952 f110951) (let ((f110967 f110967) (f110968 f110968) (f110969 f110969) (f110970 f110970)) (if (fx= f110969 f110970) #t (if ((vector-ref f110952 0) f110967 f110968 f110969) ((vector-ref f110951 0) f110967 f110968 (fx+ f110969 1) f110970) #f))))) (vector-set! f110950 0 (closure (f110965 f110966) (f110953 f110951) (let ((f110965 f110965) (f110966 f110966)) (if ((vector-ref f110953 0) f110965 f110966) ((vector-ref f110951 0) f110965 f110966 0 (string-length f110965)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f110951 0 (closure (f110967 f110968 f110969 f110970) (f110952 f110951) (let ((f110967 f110967) (f110968 f110968) (f110969 f110969) (f110970 f110970)) (if (fx= f110969 f110970) #t (if ((vector-ref f110952 0) f110967 f110968 f110969) ((vector-ref f110951 0) f110967 f110968 (fx+ f110969 1) f110970) #f))))) (vector-set! f110950 0 (closure (f110965 f110966) (f110953 f110951) (let ((f110965 f110965) (f110966 f110966)) (if ((vector-ref f110953 0) f110965 f110966) ((vector-ref f110951 0) f110965 f110966 0 (string-length f110965)) #f)))))
#   env=((f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# emit-expr (vector-set! f110951 0 (closure (f110967 f110968 f110969 f110970) (f110952 f110951) (let ((f110967 f110967) (f110968 f110968) (f110969 f110969) (f110970 f110970)) (if (fx= f110969 f110970) #t (if ((vector-ref f110952 0) f110967 f110968 f110969) ((vector-ref f110951 0) f110967 f110968 (fx+ f110969 1) f110970) #f)))))
# emit-expr f110951
# emit-variable-ref
# env=((f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110951
    movl -8(%esp), %eax  # stack load f110951
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_897786
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897786:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897787"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897787:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_897789
    cmp  $0,%eax
    jge _L_897788
_L_897789:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_897788:
    movl %eax, -20(%esp)
# emit-expr (closure (f110967 f110968 f110969 f110970) (f110952 f110951) (let ((f110967 f110967) (f110968 f110968) (f110969 f110969) (f110970 f110970)) (if (fx= f110969 f110970) #t (if ((vector-ref f110952 0) f110967 f110968 f110969) ((vector-ref f110951 0) f110967 f110968 (fx+ f110969 1) f110970) #f))))
# emit-closure
# si = -24
# env = ((f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# expr = (closure (f110967 f110968 f110969 f110970) (f110952 f110951) (let ((f110967 f110967) (f110968 f110968) (f110969 f110969) (f110970 f110970)) (if (fx= f110969 f110970) #t (if ((vector-ref f110952 0) f110967 f110968 f110969) ((vector-ref f110951 0) f110967 f110968 (fx+ f110969 1) f110970) #f))))
    movl $_L_897790, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110952
    movl -4(%esp), %eax  # stack load f110952
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f110952
# emit-variable-ref
# env=((f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110951
    movl -8(%esp), %eax  # stack load f110951
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f110951
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_897791            # jump around closure body
_L_897790:
# check argument count
    cmp $16,%eax
    je _L_897792
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_897792:
# emit-tail-expr
# si=-24
# env=((f110970 . -20) (f110969 . -16) (f110968 . -12) (f110967 . -8) (f110951 . 8) (f110952 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# expr=(let ((f110967 f110967) (f110968 f110968) (f110969 f110969) (f110970 f110970)) (if (fx= f110969 f110970) #t (if ((vector-ref f110952 0) f110967 f110968 f110969) ((vector-ref f110951 0) f110967 f110968 (fx+ f110969 1) f110970) #f)))
# emit-tail-let
#  si   = -24
#  env  = ((f110970 . -20) (f110969 . -16) (f110968 . -12) (f110967 . -8) (f110951 . 8) (f110952 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
#  bindings = ((f110967 f110967) (f110968 f110968) (f110969 f110969) (f110970 f110970))
#  body = (if (fx= f110969 f110970) #t (if ((vector-ref f110952 0) f110967 f110968 f110969) ((vector-ref f110951 0) f110967 f110968 (fx+ f110969 1) f110970) #f))
# emit-expr f110967
# emit-variable-ref
# env=((f110970 . -20) (f110969 . -16) (f110968 . -12) (f110967 . -8) (f110951 . 8) (f110952 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110967
    movl -8(%esp), %eax  # stack load f110967
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f110968
# emit-variable-ref
# env=((f110970 . -20) (f110969 . -16) (f110968 . -12) (f110967 . -8) (f110951 . 8) (f110952 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110968
    movl -12(%esp), %eax  # stack load f110968
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-expr f110969
# emit-variable-ref
# env=((f110970 . -20) (f110969 . -16) (f110968 . -12) (f110967 . -8) (f110951 . 8) (f110952 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110969
    movl -16(%esp), %eax  # stack load f110969
# end emit-variable-ref
    movl %eax, -32(%esp)  # stack save
# emit-expr f110970
# emit-variable-ref
# env=((f110970 . -20) (f110969 . -16) (f110968 . -12) (f110967 . -8) (f110951 . 8) (f110952 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110970
    movl -20(%esp), %eax  # stack load f110970
# end emit-variable-ref
    movl %eax, -36(%esp)  # stack save
# emit-tail-expr
# si=-40
# env=((f110970 . -36) (f110969 . -32) (f110968 . -28) (f110967 . -24) (f110970 . -20) (f110969 . -16) (f110968 . -12) (f110967 . -8) (f110951 . 8) (f110952 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# expr=(if (fx= f110969 f110970) #t (if ((vector-ref f110952 0) f110967 f110968 f110969) ((vector-ref f110951 0) f110967 f110968 (fx+ f110969 1) f110970) #f))
# emit-expr (fx= f110969 f110970)
# emit-expr f110970
# emit-variable-ref
# env=((f110970 . -36) (f110969 . -32) (f110968 . -28) (f110967 . -24) (f110970 . -20) (f110969 . -16) (f110968 . -12) (f110967 . -8) (f110951 . 8) (f110952 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110970
    movl -36(%esp), %eax  # stack load f110970
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897795"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897795:
    movl %eax, -40(%esp)
# emit-expr f110969
# emit-variable-ref
# env=((f110970 . -36) (f110969 . -32) (f110968 . -28) (f110967 . -24) (f110970 . -20) (f110969 . -16) (f110968 . -12) (f110967 . -8) (f110951 . 8) (f110952 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110969
    movl -32(%esp), %eax  # stack load f110969
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897796"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897796:
    cmp -40(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_897793
# emit-tail-expr
# si=-40
# env=((f110970 . -36) (f110969 . -32) (f110968 . -28) (f110967 . -24) (f110970 . -20) (f110969 . -16) (f110968 . -12) (f110967 . -8) (f110951 . 8) (f110952 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# expr=#t
    movl $111, %eax     # immed #t
    ret                  # immediate tail return
    jmp _L_897794
_L_897793:
# emit-tail-expr
# si=-40
# env=((f110970 . -36) (f110969 . -32) (f110968 . -28) (f110967 . -24) (f110970 . -20) (f110969 . -16) (f110968 . -12) (f110967 . -8) (f110951 . 8) (f110952 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# expr=(if ((vector-ref f110952 0) f110967 f110968 f110969) ((vector-ref f110951 0) f110967 f110968 (fx+ f110969 1) f110970) #f)
# emit-expr ((vector-ref f110952 0) f110967 f110968 f110969)
# funcall
#    si   =-40
#    env  = ((f110970 . -36) (f110969 . -32) (f110968 . -28) (f110967 . -24) (f110970 . -20) (f110969 . -16) (f110968 . -12) (f110967 . -8) (f110951 . 8) (f110952 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
#    expr = (funcall (vector-ref f110952 0) f110967 f110968 f110969)
# emit-expr (vector-ref f110952 0)
# emit-expr f110952
# emit-variable-ref
# env=((f110970 . -36) (f110969 . -32) (f110968 . -28) (f110967 . -24) (f110970 . -20) (f110969 . -16) (f110968 . -12) (f110967 . -8) (f110951 . 8) (f110952 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110952
    movl 2(%edi), %eax  # frame load f110952
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_897799
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897799:
    movl %eax, -48(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897800"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897800:
# check bounds on vector index
    movl -48(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_897802
    cmp  $0,%eax
    jge _L_897801
_L_897802:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_897801:
    movl -48(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_897803"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_897803":
   movl %eax,  -48(%esp)  # stash funcall-oper in closure slot
# emit-expr f110967
# emit-variable-ref
# env=((f110970 . -36) (f110969 . -32) (f110968 . -28) (f110967 . -24) (f110970 . -20) (f110969 . -16) (f110968 . -12) (f110967 . -8) (f110951 . 8) (f110952 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110967
    movl -24(%esp), %eax  # stack load f110967
# end emit-variable-ref
    mov %eax, -52(%esp)  # arg f110967
# emit-expr f110968
# emit-variable-ref
# env=((f110970 . -36) (f110969 . -32) (f110968 . -28) (f110967 . -24) (f110970 . -20) (f110969 . -16) (f110968 . -12) (f110967 . -8) (f110951 . 8) (f110952 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110968
    movl -28(%esp), %eax  # stack load f110968
# end emit-variable-ref
    mov %eax, -56(%esp)  # arg f110968
# emit-expr f110969
# emit-variable-ref
# env=((f110970 . -36) (f110969 . -32) (f110968 . -28) (f110967 . -24) (f110970 . -20) (f110969 . -16) (f110968 . -12) (f110967 . -8) (f110951 . 8) (f110952 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110969
    movl -32(%esp), %eax  # stack load f110969
# end emit-variable-ref
    mov %eax, -60(%esp)  # arg f110969
    movl -48(%esp), %edi   # load new closure to %edi
    add $-40, %esp   # adjust base
    movl $12,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $40, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_897797
# emit-tail-expr
# si=-40
# env=((f110970 . -36) (f110969 . -32) (f110968 . -28) (f110967 . -24) (f110970 . -20) (f110969 . -16) (f110968 . -12) (f110967 . -8) (f110951 . 8) (f110952 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# expr=((vector-ref f110951 0) f110967 f110968 (fx+ f110969 1) f110970)
# emit-tail-funcall
#    si   =-40
#    env  = ((f110970 . -36) (f110969 . -32) (f110968 . -28) (f110967 . -24) (f110970 . -20) (f110969 . -16) (f110968 . -12) (f110967 . -8) (f110951 . 8) (f110952 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
#    expr = (funcall (vector-ref f110951 0) f110967 f110968 (fx+ f110969 1) f110970)
# emit-expr (vector-ref f110951 0)
# emit-expr f110951
# emit-variable-ref
# env=((f110970 . -36) (f110969 . -32) (f110968 . -28) (f110967 . -24) (f110970 . -20) (f110969 . -16) (f110968 . -12) (f110967 . -8) (f110951 . 8) (f110952 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110951
    movl 6(%edi), %eax  # frame load f110951
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_897804
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897804:
    movl %eax, -40(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897805"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897805:
# check bounds on vector index
    movl -40(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_897807
    cmp  $0,%eax
    jge _L_897806
_L_897807:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_897806:
    movl -40(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -40(%esp)  # stash funcall-oper in next closure slot
# emit-expr f110967
# emit-variable-ref
# env=((f110970 . -36) (f110969 . -32) (f110968 . -28) (f110967 . -24) (f110970 . -20) (f110969 . -16) (f110968 . -12) (f110967 . -8) (f110951 . 8) (f110952 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110967
    movl -24(%esp), %eax  # stack load f110967
# end emit-variable-ref
    mov %eax, -44(%esp)    # arg f110967
# emit-expr f110968
# emit-variable-ref
# env=((f110970 . -36) (f110969 . -32) (f110968 . -28) (f110967 . -24) (f110970 . -20) (f110969 . -16) (f110968 . -12) (f110967 . -8) (f110951 . 8) (f110952 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110968
    movl -28(%esp), %eax  # stack load f110968
# end emit-variable-ref
    mov %eax, -48(%esp)    # arg f110968
# emit-expr (fx+ f110969 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897808"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897808:
    movl %eax, -52(%esp)  # fx+ push arg1
# emit-expr f110969
# emit-variable-ref
# env=((f110970 . -36) (f110969 . -32) (f110968 . -28) (f110967 . -24) (f110970 . -20) (f110969 . -16) (f110968 . -12) (f110967 . -8) (f110951 . 8) (f110952 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110969
    movl -32(%esp), %eax  # stack load f110969
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897809"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897809:
    addl -52(%esp), %eax  # fx+ arg1 arg2
    mov %eax, -52(%esp)    # arg (fx+ f110969 1)
# emit-expr f110970
# emit-variable-ref
# env=((f110970 . -36) (f110969 . -32) (f110968 . -28) (f110967 . -24) (f110970 . -20) (f110969 . -16) (f110968 . -12) (f110967 . -8) (f110951 . 8) (f110952 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110970
    movl -36(%esp), %eax  # stack load f110970
# end emit-variable-ref
    mov %eax, -56(%esp)    # arg f110970
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
    jmp _L_897798
_L_897797:
# emit-tail-expr
# si=-40
# env=((f110970 . -36) (f110969 . -32) (f110968 . -28) (f110967 . -24) (f110970 . -20) (f110969 . -16) (f110968 . -12) (f110967 . -8) (f110951 . 8) (f110952 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_897798:
_L_897794:
    .align 4,0x90
_L_897791:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f110950 0 (closure (f110965 f110966) (f110953 f110951) (let ((f110965 f110965) (f110966 f110966)) (if ((vector-ref f110953 0) f110965 f110966) ((vector-ref f110951 0) f110965 f110966 0 (string-length f110965)) #f)))))
# emit-begin
#   expr=(begin (vector-set! f110950 0 (closure (f110965 f110966) (f110953 f110951) (let ((f110965 f110965) (f110966 f110966)) (if ((vector-ref f110953 0) f110965 f110966) ((vector-ref f110951 0) f110965 f110966 0 (string-length f110965)) #f)))))
#   env=((f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# emit-expr (vector-set! f110950 0 (closure (f110965 f110966) (f110953 f110951) (let ((f110965 f110965) (f110966 f110966)) (if ((vector-ref f110953 0) f110965 f110966) ((vector-ref f110951 0) f110965 f110966 0 (string-length f110965)) #f))))
# emit-expr f110950
# emit-variable-ref
# env=((f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110950
    movl -12(%esp), %eax  # stack load f110950
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_897810
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897810:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897811"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897811:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_897813
    cmp  $0,%eax
    jge _L_897812
_L_897813:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_897812:
    movl %eax, -20(%esp)
# emit-expr (closure (f110965 f110966) (f110953 f110951) (let ((f110965 f110965) (f110966 f110966)) (if ((vector-ref f110953 0) f110965 f110966) ((vector-ref f110951 0) f110965 f110966 0 (string-length f110965)) #f)))
# emit-closure
# si = -24
# env = ((f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# expr = (closure (f110965 f110966) (f110953 f110951) (let ((f110965 f110965) (f110966 f110966)) (if ((vector-ref f110953 0) f110965 f110966) ((vector-ref f110951 0) f110965 f110966 0 (string-length f110965)) #f)))
    movl $_L_897814, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110953
    movl 0(%esp), %eax  # stack load f110953
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f110953
# emit-variable-ref
# env=((f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110951
    movl -8(%esp), %eax  # stack load f110951
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f110951
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_897815            # jump around closure body
_L_897814:
# check argument count
    cmp $8,%eax
    je _L_897816
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_897816:
# emit-tail-expr
# si=-16
# env=((f110966 . -12) (f110965 . -8) (f110951 . 8) (f110953 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# expr=(let ((f110965 f110965) (f110966 f110966)) (if ((vector-ref f110953 0) f110965 f110966) ((vector-ref f110951 0) f110965 f110966 0 (string-length f110965)) #f))
# emit-tail-let
#  si   = -16
#  env  = ((f110966 . -12) (f110965 . -8) (f110951 . 8) (f110953 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
#  bindings = ((f110965 f110965) (f110966 f110966))
#  body = (if ((vector-ref f110953 0) f110965 f110966) ((vector-ref f110951 0) f110965 f110966 0 (string-length f110965)) #f)
# emit-expr f110965
# emit-variable-ref
# env=((f110966 . -12) (f110965 . -8) (f110951 . 8) (f110953 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110965
    movl -8(%esp), %eax  # stack load f110965
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f110966
# emit-variable-ref
# env=((f110966 . -12) (f110965 . -8) (f110951 . 8) (f110953 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110966
    movl -12(%esp), %eax  # stack load f110966
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f110966 . -20) (f110965 . -16) (f110966 . -12) (f110965 . -8) (f110951 . 8) (f110953 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# expr=(if ((vector-ref f110953 0) f110965 f110966) ((vector-ref f110951 0) f110965 f110966 0 (string-length f110965)) #f)
# emit-expr ((vector-ref f110953 0) f110965 f110966)
# funcall
#    si   =-24
#    env  = ((f110966 . -20) (f110965 . -16) (f110966 . -12) (f110965 . -8) (f110951 . 8) (f110953 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
#    expr = (funcall (vector-ref f110953 0) f110965 f110966)
# emit-expr (vector-ref f110953 0)
# emit-expr f110953
# emit-variable-ref
# env=((f110966 . -20) (f110965 . -16) (f110966 . -12) (f110965 . -8) (f110951 . 8) (f110953 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110953
    movl 2(%edi), %eax  # frame load f110953
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_897819
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897819:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897820"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897820:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_897822
    cmp  $0,%eax
    jge _L_897821
_L_897822:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_897821:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_897823"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_897823":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f110965
# emit-variable-ref
# env=((f110966 . -20) (f110965 . -16) (f110966 . -12) (f110965 . -8) (f110951 . 8) (f110953 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110965
    movl -16(%esp), %eax  # stack load f110965
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f110965
# emit-expr f110966
# emit-variable-ref
# env=((f110966 . -20) (f110965 . -16) (f110966 . -12) (f110965 . -8) (f110951 . 8) (f110953 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110966
    movl -20(%esp), %eax  # stack load f110966
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg f110966
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_897817
# emit-tail-expr
# si=-24
# env=((f110966 . -20) (f110965 . -16) (f110966 . -12) (f110965 . -8) (f110951 . 8) (f110953 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# expr=((vector-ref f110951 0) f110965 f110966 0 (string-length f110965))
# emit-tail-funcall
#    si   =-24
#    env  = ((f110966 . -20) (f110965 . -16) (f110966 . -12) (f110965 . -8) (f110951 . 8) (f110953 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
#    expr = (funcall (vector-ref f110951 0) f110965 f110966 0 (string-length f110965))
# emit-expr (vector-ref f110951 0)
# emit-expr f110951
# emit-variable-ref
# env=((f110966 . -20) (f110965 . -16) (f110966 . -12) (f110965 . -8) (f110951 . 8) (f110953 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110951
    movl 6(%edi), %eax  # frame load f110951
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_897824
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897824:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897825"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897825:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_897827
    cmp  $0,%eax
    jge _L_897826
_L_897827:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_897826:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr f110965
# emit-variable-ref
# env=((f110966 . -20) (f110965 . -16) (f110966 . -12) (f110965 . -8) (f110951 . 8) (f110953 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110965
    movl -16(%esp), %eax  # stack load f110965
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f110965
# emit-expr f110966
# emit-variable-ref
# env=((f110966 . -20) (f110965 . -16) (f110966 . -12) (f110965 . -8) (f110951 . 8) (f110953 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110966
    movl -20(%esp), %eax  # stack load f110966
# end emit-variable-ref
    mov %eax, -32(%esp)    # arg f110966
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -36(%esp)    # arg 0
# emit-expr (string-length f110965)
# emit-expr f110965
# emit-variable-ref
# env=((f110966 . -20) (f110965 . -16) (f110966 . -12) (f110965 . -8) (f110951 . 8) (f110953 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110965
    movl -16(%esp), %eax  # stack load f110965
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_897828
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897828:
    movl -6(%eax), %eax
    mov %eax, -40(%esp)    # arg (string-length f110965)
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
    jmp _L_897818
_L_897817:
# emit-tail-expr
# si=-24
# env=((f110966 . -20) (f110965 . -16) (f110966 . -12) (f110965 . -8) (f110951 . 8) (f110953 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_897818:
    .align 4,0x90
_L_897815:
    movl -16(%esp), %ebx
    movl -20(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# emit-expr (begin (vector-ref f110950 0))
# emit-begin
#   expr=(begin (vector-ref f110950 0))
#   env=((f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# emit-expr (vector-ref f110950 0)
# emit-expr f110950
# emit-variable-ref
# env=((f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# var=f110950
    movl -12(%esp), %eax  # stack load f110950
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_897829
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897829:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897830"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897830:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_897832
    cmp  $0,%eax
    jge _L_897831
_L_897832:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_897831:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
     movl %eax, string$e$q
# == explicit-begins  ==>
# (letrec ((str->sym (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let* ((new-sym (make-symbol str #f)) (new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym)) (str->sym str (cdr symlist))))))) (lambda (str) (str->sym str (symbols))))
# == eliminate-let*  ==>
# (letrec ((str->sym (lambda (str symlist) (if (string=? str (symbol->string (car symlist))) (car symlist) (if (null? (cdr symlist)) (let ((new-sym (make-symbol str #f))) (let ((new-cdr (cons new-sym ()))) (begin (set-cdr! symlist new-cdr) new-sym))) (str->sym str (cdr symlist))))))) (lambda (str) (str->sym str (symbols))))
# == uniquify-variables  ==>
# (letrec ((f110976 (lambda (f110985 f110986) (if (string=? f110985 (symbol->string (car f110986))) (car f110986) (if (null? (cdr f110986)) (let ((f110990 (make-symbol f110985 #f))) (let ((f110992 (cons f110990 ()))) (begin (set-cdr! f110986 f110992) f110990))) (f110976 f110985 (cdr f110986))))))) (lambda (f110994) (f110976 f110994 (symbols))))
# == vectorize-letrec  ==>
# (let ((f110976 (make-vector 1))) (begin (begin (vector-set! f110976 0 (lambda (f110985 f110986) (if (string=? f110985 (symbol->string (car f110986))) (car f110986) (if (null? (cdr f110986)) (let ((f110990 (make-symbol f110985 #f))) (let ((f110992 (cons f110990 ()))) (begin (set-cdr! f110986 f110992) f110990))) ((vector-ref f110976 0) f110985 (cdr f110986))))))) (lambda (f110994) ((vector-ref f110976 0) f110994 (symbols)))))
# == eliminate-set!  ==>
# (let ((f110976 (make-vector 1))) (begin (begin (vector-set! f110976 0 (lambda (f110985 f110986) (let ((f110985 f110985) (f110986 f110986)) (if (string=? f110985 (symbol->string (car f110986))) (car f110986) (if (null? (cdr f110986)) (let ((f110990 (make-symbol f110985 #f))) (let ((f110992 (cons f110990 ()))) (begin (set-cdr! f110986 f110992) f110990))) ((vector-ref f110976 0) f110985 (cdr f110986)))))))) (lambda (f110994) (let ((f110994 f110994)) ((vector-ref f110976 0) f110994 (symbols))))))
# == close-free-variables  ==>
# (let ((f110976 (make-vector 1))) (begin (begin (vector-set! f110976 0 (closure (f110985 f110986) (string=? f110976) (let ((f110985 f110985) (f110986 f110986)) (if (string=? f110985 (symbol->string (car f110986))) (car f110986) (if (null? (cdr f110986)) (let ((f110990 (make-symbol f110985 #f))) (let ((f110992 (cons f110990 ()))) (begin (set-cdr! f110986 f110992) f110990))) ((vector-ref f110976 0) f110985 (cdr f110986)))))))) (closure (f110994) (f110976 symbols) (let ((f110994 f110994)) ((vector-ref f110976 0) f110994 (symbols))))))
# == eliminate-quote  ==>
# (let ((f110976 (make-vector 1))) (begin (begin (vector-set! f110976 0 (closure (f110985 f110986) (string=? f110976) (let ((f110985 f110985) (f110986 f110986)) (if (string=? f110985 (symbol->string (car f110986))) (car f110986) (if (null? (cdr f110986)) (let ((f110990 (make-symbol f110985 #f))) (let ((f110992 (cons f110990 ()))) (begin (set-cdr! f110986 f110992) f110990))) ((vector-ref f110976 0) f110985 (cdr f110986)))))))) (closure (f110994) (f110976 symbols) (let ((f110994 f110994)) ((vector-ref f110976 0) f110994 (symbols))))))
# == eliminate-when/unless  ==>
# (let ((f110976 (make-vector 1))) (begin (begin (vector-set! f110976 0 (closure (f110985 f110986) (string=? f110976) (let ((f110985 f110985) (f110986 f110986)) (if (string=? f110985 (symbol->string (car f110986))) (car f110986) (if (null? (cdr f110986)) (let ((f110990 (make-symbol f110985 #f))) (let ((f110992 (cons f110990 ()))) (begin (set-cdr! f110986 f110992) f110990))) ((vector-ref f110976 0) f110985 (cdr f110986)))))))) (closure (f110994) (f110976 symbols) (let ((f110994 f110994)) ((vector-ref f110976 0) f110994 (symbols))))))
# == eliminate-cond  ==>
# (let ((f110976 (make-vector 1))) (begin (begin (vector-set! f110976 0 (closure (f110985 f110986) (string=? f110976) (let ((f110985 f110985) (f110986 f110986)) (if (string=? f110985 (symbol->string (car f110986))) (car f110986) (if (null? (cdr f110986)) (let ((f110990 (make-symbol f110985 #f))) (let ((f110992 (cons f110990 ()))) (begin (set-cdr! f110986 f110992) f110990))) ((vector-ref f110976 0) f110985 (cdr f110986)))))))) (closure (f110994) (f110976 symbols) (let ((f110994 f110994)) ((vector-ref f110976 0) f110994 (symbols))))))
# == external-symbols  ==>
# (let ((f110976 (make-vector 1))) (begin (begin (vector-set! f110976 0 (closure (f110985 f110986) ((primitive-ref string=?) f110976) (let ((f110985 f110985) (f110986 f110986)) (if ((primitive-ref string=?) f110985 (symbol->string (car f110986))) (car f110986) (if (null? (cdr f110986)) (let ((f110990 (make-symbol f110985 #f))) (let ((f110992 (cons f110990 ()))) (begin (set-cdr! f110986 f110992) f110990))) ((vector-ref f110976 0) f110985 (cdr f110986)))))))) (closure (f110994) (f110976 (primitive-ref symbols)) (let ((f110994 f110994)) ((vector-ref f110976 0) f110994 ((primitive-ref symbols)))))))
# emit-expr (let ((f110976 (make-vector 1))) (begin (begin (vector-set! f110976 0 (closure (f110985 f110986) ((primitive-ref string=?) f110976) (let ((f110985 f110985) (f110986 f110986)) (if ((primitive-ref string=?) f110985 (symbol->string (car f110986))) (car f110986) (if (null? (cdr f110986)) (let ((f110990 (make-symbol f110985 #f))) (let ((f110992 (cons f110990 ()))) (begin (set-cdr! f110986 f110992) f110990))) ((vector-ref f110976 0) f110985 (cdr f110986)))))))) (closure (f110994) (f110976 (primitive-ref symbols)) (let ((f110994 f110994)) ((vector-ref f110976 0) f110994 ((primitive-ref symbols)))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f110976 (make-vector 1)))
#  body = (begin (begin (vector-set! f110976 0 (closure (f110985 f110986) ((primitive-ref string=?) f110976) (let ((f110985 f110985) (f110986 f110986)) (if ((primitive-ref string=?) f110985 (symbol->string (car f110986))) (car f110986) (if (null? (cdr f110986)) (let ((f110990 (make-symbol f110985 #f))) (let ((f110992 (cons f110990 ()))) (begin (set-cdr! f110986 f110992) f110990))) ((vector-ref f110976 0) f110985 (cdr f110986)))))))) (closure (f110994) (f110976 (primitive-ref symbols)) (let ((f110994 f110994)) ((vector-ref f110976 0) f110994 ((primitive-ref symbols))))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897833"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897833:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_897834
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897834:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f110976 0 (closure (f110985 f110986) ((primitive-ref string=?) f110976) (let ((f110985 f110985) (f110986 f110986)) (if ((primitive-ref string=?) f110985 (symbol->string (car f110986))) (car f110986) (if (null? (cdr f110986)) (let ((f110990 (make-symbol f110985 #f))) (let ((f110992 (cons f110990 ()))) (begin (set-cdr! f110986 f110992) f110990))) ((vector-ref f110976 0) f110985 (cdr f110986)))))))) (closure (f110994) (f110976 (primitive-ref symbols)) (let ((f110994 f110994)) ((vector-ref f110976 0) f110994 ((primitive-ref symbols))))))
# emit-begin
#   expr=(begin (begin (vector-set! f110976 0 (closure (f110985 f110986) ((primitive-ref string=?) f110976) (let ((f110985 f110985) (f110986 f110986)) (if ((primitive-ref string=?) f110985 (symbol->string (car f110986))) (car f110986) (if (null? (cdr f110986)) (let ((f110990 (make-symbol f110985 #f))) (let ((f110992 (cons f110990 ()))) (begin (set-cdr! f110986 f110992) f110990))) ((vector-ref f110976 0) f110985 (cdr f110986)))))))) (closure (f110994) (f110976 (primitive-ref symbols)) (let ((f110994 f110994)) ((vector-ref f110976 0) f110994 ((primitive-ref symbols))))))
#   env=((f110976 . 0))
# emit-expr (begin (vector-set! f110976 0 (closure (f110985 f110986) ((primitive-ref string=?) f110976) (let ((f110985 f110985) (f110986 f110986)) (if ((primitive-ref string=?) f110985 (symbol->string (car f110986))) (car f110986) (if (null? (cdr f110986)) (let ((f110990 (make-symbol f110985 #f))) (let ((f110992 (cons f110990 ()))) (begin (set-cdr! f110986 f110992) f110990))) ((vector-ref f110976 0) f110985 (cdr f110986))))))))
# emit-begin
#   expr=(begin (vector-set! f110976 0 (closure (f110985 f110986) ((primitive-ref string=?) f110976) (let ((f110985 f110985) (f110986 f110986)) (if ((primitive-ref string=?) f110985 (symbol->string (car f110986))) (car f110986) (if (null? (cdr f110986)) (let ((f110990 (make-symbol f110985 #f))) (let ((f110992 (cons f110990 ()))) (begin (set-cdr! f110986 f110992) f110990))) ((vector-ref f110976 0) f110985 (cdr f110986))))))))
#   env=((f110976 . 0))
# emit-expr (vector-set! f110976 0 (closure (f110985 f110986) ((primitive-ref string=?) f110976) (let ((f110985 f110985) (f110986 f110986)) (if ((primitive-ref string=?) f110985 (symbol->string (car f110986))) (car f110986) (if (null? (cdr f110986)) (let ((f110990 (make-symbol f110985 #f))) (let ((f110992 (cons f110990 ()))) (begin (set-cdr! f110986 f110992) f110990))) ((vector-ref f110976 0) f110985 (cdr f110986)))))))
# emit-expr f110976
# emit-variable-ref
# env=((f110976 . 0))
# var=f110976
    movl 0(%esp), %eax  # stack load f110976
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_897835
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897835:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897836"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897836:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_897838
    cmp  $0,%eax
    jge _L_897837
_L_897838:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_897837:
    movl %eax, -8(%esp)
# emit-expr (closure (f110985 f110986) ((primitive-ref string=?) f110976) (let ((f110985 f110985) (f110986 f110986)) (if ((primitive-ref string=?) f110985 (symbol->string (car f110986))) (car f110986) (if (null? (cdr f110986)) (let ((f110990 (make-symbol f110985 #f))) (let ((f110992 (cons f110990 ()))) (begin (set-cdr! f110986 f110992) f110990))) ((vector-ref f110976 0) f110985 (cdr f110986))))))
# emit-closure
# si = -12
# env = ((f110976 . 0))
# expr = (closure (f110985 f110986) ((primitive-ref string=?) f110976) (let ((f110985 f110985) (f110986 f110986)) (if ((primitive-ref string=?) f110985 (symbol->string (car f110986))) (car f110986) (if (null? (cdr f110986)) (let ((f110990 (make-symbol f110985 #f))) (let ((f110992 (cons f110990 ()))) (begin (set-cdr! f110986 f110992) f110990))) ((vector-ref f110976 0) f110985 (cdr f110986))))))
    movl $_L_897839, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref string=?) not defined in the environmnet
# emit-variable-ref
# env=((f110976 . 0))
# var=f110976
    movl 0(%esp), %eax  # stack load f110976
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f110976
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_897840            # jump around closure body
_L_897839:
# check argument count
    cmp $8,%eax
    je _L_897841
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_897841:
# emit-tail-expr
# si=-16
# env=((f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
# expr=(let ((f110985 f110985) (f110986 f110986)) (if ((primitive-ref string=?) f110985 (symbol->string (car f110986))) (car f110986) (if (null? (cdr f110986)) (let ((f110990 (make-symbol f110985 #f))) (let ((f110992 (cons f110990 ()))) (begin (set-cdr! f110986 f110992) f110990))) ((vector-ref f110976 0) f110985 (cdr f110986)))))
# emit-tail-let
#  si   = -16
#  env  = ((f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
#  bindings = ((f110985 f110985) (f110986 f110986))
#  body = (if ((primitive-ref string=?) f110985 (symbol->string (car f110986))) (car f110986) (if (null? (cdr f110986)) (let ((f110990 (make-symbol f110985 #f))) (let ((f110992 (cons f110990 ()))) (begin (set-cdr! f110986 f110992) f110990))) ((vector-ref f110976 0) f110985 (cdr f110986))))
# emit-expr f110985
# emit-variable-ref
# env=((f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
# var=f110985
    movl -8(%esp), %eax  # stack load f110985
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f110986
# emit-variable-ref
# env=((f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
# var=f110986
    movl -12(%esp), %eax  # stack load f110986
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f110986 . -20) (f110985 . -16) (f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
# expr=(if ((primitive-ref string=?) f110985 (symbol->string (car f110986))) (car f110986) (if (null? (cdr f110986)) (let ((f110990 (make-symbol f110985 #f))) (let ((f110992 (cons f110990 ()))) (begin (set-cdr! f110986 f110992) f110990))) ((vector-ref f110976 0) f110985 (cdr f110986))))
# emit-expr ((primitive-ref string=?) f110985 (symbol->string (car f110986)))
# funcall
#    si   =-24
#    env  = ((f110986 . -20) (f110985 . -16) (f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
#    expr = (funcall (primitive-ref string=?) f110985 (symbol->string (car f110986)))
# emit-expr (primitive-ref string=?)
    .extern string$e$q
    movl string$e$q,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_897844"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_897844":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f110985
# emit-variable-ref
# env=((f110986 . -20) (f110985 . -16) (f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
# var=f110985
    movl -16(%esp), %eax  # stack load f110985
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f110985
# emit-expr (symbol->string (car f110986))
# symbol->string (car f110986)
# emit-expr (car f110986)
# emit-expr f110986
# emit-variable-ref
# env=((f110986 . -20) (f110985 . -16) (f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
# var=f110986
    movl -20(%esp), %eax  # stack load f110986
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_897845
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897845:
    movl -1(%eax), %eax
    movl -3(%eax), %eax
    mov %eax, -40(%esp)  # arg (symbol->string (car f110986))
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    cmp $47, %al
    je _L_897842
# emit-tail-expr
# si=-24
# env=((f110986 . -20) (f110985 . -16) (f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
# expr=(car f110986)
# tail primcall
# emit-expr f110986
# emit-variable-ref
# env=((f110986 . -20) (f110985 . -16) (f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
# var=f110986
    movl -20(%esp), %eax  # stack load f110986
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_897846
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897846:
    movl -1(%eax), %eax
#return from tail (car f110986)
    ret
    jmp _L_897843
_L_897842:
# emit-tail-expr
# si=-24
# env=((f110986 . -20) (f110985 . -16) (f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
# expr=(if (null? (cdr f110986)) (let ((f110990 (make-symbol f110985 #f))) (let ((f110992 (cons f110990 ()))) (begin (set-cdr! f110986 f110992) f110990))) ((vector-ref f110976 0) f110985 (cdr f110986)))
# emit-expr (null? (cdr f110986))
# emit-expr (cdr f110986)
# emit-expr f110986
# emit-variable-ref
# env=((f110986 . -20) (f110985 . -16) (f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
# var=f110986
    movl -20(%esp), %eax  # stack load f110986
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_897849
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897849:
    movl 3(%eax), %eax
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_897847
# emit-tail-expr
# si=-24
# env=((f110986 . -20) (f110985 . -16) (f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
# expr=(let ((f110990 (make-symbol f110985 #f))) (let ((f110992 (cons f110990 ()))) (begin (set-cdr! f110986 f110992) f110990)))
# emit-tail-let
#  si   = -24
#  env  = ((f110986 . -20) (f110985 . -16) (f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
#  bindings = ((f110990 (make-symbol f110985 #f)))
#  body = (let ((f110992 (cons f110990 ()))) (begin (set-cdr! f110986 f110992) f110990))
# emit-expr (make-symbol f110985 #f)
# make-symbol arg1=f110985 arg2=#f
# emit-expr f110985
# emit-variable-ref
# env=((f110986 . -20) (f110985 . -16) (f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
# var=f110985
    movl -16(%esp), %eax  # stack load f110985
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
# env=((f110990 . -24) (f110986 . -20) (f110985 . -16) (f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
# expr=(let ((f110992 (cons f110990 ()))) (begin (set-cdr! f110986 f110992) f110990))
# emit-tail-let
#  si   = -28
#  env  = ((f110990 . -24) (f110986 . -20) (f110985 . -16) (f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
#  bindings = ((f110992 (cons f110990 ())))
#  body = (begin (set-cdr! f110986 f110992) f110990)
# emit-expr (cons f110990 ())
# cons arg1=f110990 arg2=()
# emit-expr f110990
# emit-variable-ref
# env=((f110990 . -24) (f110986 . -20) (f110985 . -16) (f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
# var=f110990
    movl -24(%esp), %eax  # stack load f110990
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
# env=((f110992 . -28) (f110990 . -24) (f110986 . -20) (f110985 . -16) (f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
# expr=(begin (set-cdr! f110986 f110992) f110990)
# tail-begin (begin (set-cdr! f110986 f110992) f110990)
#   env=((f110992 . -28) (f110990 . -24) (f110986 . -20) (f110985 . -16) (f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
# emit-expr (set-cdr! f110986 f110992)
# emit-expr f110986
# emit-variable-ref
# env=((f110992 . -28) (f110990 . -24) (f110986 . -20) (f110985 . -16) (f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
# var=f110986
    movl -20(%esp), %eax  # stack load f110986
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_897850
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897850:
    movl %eax, -32(%esp)
# emit-expr f110992
# emit-variable-ref
# env=((f110992 . -28) (f110990 . -24) (f110986 . -20) (f110985 . -16) (f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
# var=f110992
    movl -28(%esp), %eax  # stack load f110992
# end emit-variable-ref
    movl -32(%esp), %ebx
    movl %eax, 3(%ebx)
# emit-tail-expr
# si=-32
# env=((f110992 . -28) (f110990 . -24) (f110986 . -20) (f110985 . -16) (f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
# expr=(begin f110990)
# tail-begin (begin f110990)
#   env=((f110992 . -28) (f110990 . -24) (f110986 . -20) (f110985 . -16) (f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
# emit-tail-expr
# si=-32
# env=((f110992 . -28) (f110990 . -24) (f110986 . -20) (f110985 . -16) (f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
# expr=f110990
# emit-tail-variable-ref
# emit-variable-ref
# env=((f110992 . -28) (f110990 . -24) (f110986 . -20) (f110985 . -16) (f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
# var=f110990
    movl -24(%esp), %eax  # stack load f110990
# end emit-variable-ref
    ret
# end emit-tail-variable ref
     ret   # return thru stack
    jmp _L_897848
_L_897847:
# emit-tail-expr
# si=-24
# env=((f110986 . -20) (f110985 . -16) (f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
# expr=((vector-ref f110976 0) f110985 (cdr f110986))
# emit-tail-funcall
#    si   =-24
#    env  = ((f110986 . -20) (f110985 . -16) (f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
#    expr = (funcall (vector-ref f110976 0) f110985 (cdr f110986))
# emit-expr (vector-ref f110976 0)
# emit-expr f110976
# emit-variable-ref
# env=((f110986 . -20) (f110985 . -16) (f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
# var=f110976
    movl 6(%edi), %eax  # frame load f110976
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_897851
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897851:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897852"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897852:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_897854
    cmp  $0,%eax
    jge _L_897853
_L_897854:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_897853:
    movl -24(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr f110985
# emit-variable-ref
# env=((f110986 . -20) (f110985 . -16) (f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
# var=f110985
    movl -16(%esp), %eax  # stack load f110985
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f110985
# emit-expr (cdr f110986)
# emit-expr f110986
# emit-variable-ref
# env=((f110986 . -20) (f110985 . -16) (f110986 . -12) (f110985 . -8) (f110976 . 8) ((primitive-ref string=?) . 4) (f110976 . 0))
# var=f110986
    movl -20(%esp), %eax  # stack load f110986
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_897855
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897855:
    movl 3(%eax), %eax
    mov %eax, -32(%esp)    # arg (cdr f110986)
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
_L_897848:
_L_897843:
    .align 4,0x90
_L_897840:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f110976 . 0))
# emit-expr (begin (closure (f110994) (f110976 (primitive-ref symbols)) (let ((f110994 f110994)) ((vector-ref f110976 0) f110994 ((primitive-ref symbols))))))
# emit-begin
#   expr=(begin (closure (f110994) (f110976 (primitive-ref symbols)) (let ((f110994 f110994)) ((vector-ref f110976 0) f110994 ((primitive-ref symbols))))))
#   env=((f110976 . 0))
# emit-expr (closure (f110994) (f110976 (primitive-ref symbols)) (let ((f110994 f110994)) ((vector-ref f110976 0) f110994 ((primitive-ref symbols)))))
# emit-closure
# si = -4
# env = ((f110976 . 0))
# expr = (closure (f110994) (f110976 (primitive-ref symbols)) (let ((f110994 f110994)) ((vector-ref f110976 0) f110994 ((primitive-ref symbols)))))
    movl $_L_897856, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f110976 . 0))
# var=f110976
    movl 0(%esp), %eax  # stack load f110976
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f110976
# WARNING: free var (primitive-ref symbols) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_897857            # jump around closure body
_L_897856:
# check argument count
    cmp $4,%eax
    je _L_897858
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_897858:
# emit-tail-expr
# si=-12
# env=((f110994 . -8) ((primitive-ref symbols) . 8) (f110976 . 4) (f110976 . 0))
# expr=(let ((f110994 f110994)) ((vector-ref f110976 0) f110994 ((primitive-ref symbols))))
# emit-tail-let
#  si   = -12
#  env  = ((f110994 . -8) ((primitive-ref symbols) . 8) (f110976 . 4) (f110976 . 0))
#  bindings = ((f110994 f110994))
#  body = ((vector-ref f110976 0) f110994 ((primitive-ref symbols)))
# emit-expr f110994
# emit-variable-ref
# env=((f110994 . -8) ((primitive-ref symbols) . 8) (f110976 . 4) (f110976 . 0))
# var=f110994
    movl -8(%esp), %eax  # stack load f110994
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f110994 . -12) (f110994 . -8) ((primitive-ref symbols) . 8) (f110976 . 4) (f110976 . 0))
# expr=((vector-ref f110976 0) f110994 ((primitive-ref symbols)))
# emit-tail-funcall
#    si   =-16
#    env  = ((f110994 . -12) (f110994 . -8) ((primitive-ref symbols) . 8) (f110976 . 4) (f110976 . 0))
#    expr = (funcall (vector-ref f110976 0) f110994 ((primitive-ref symbols)))
# emit-expr (vector-ref f110976 0)
# emit-expr f110976
# emit-variable-ref
# env=((f110994 . -12) (f110994 . -8) ((primitive-ref symbols) . 8) (f110976 . 4) (f110976 . 0))
# var=f110976
    movl 2(%edi), %eax  # frame load f110976
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_897859
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897859:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897860"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897860:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_897862
    cmp  $0,%eax
    jge _L_897861
_L_897862:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_897861:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f110994
# emit-variable-ref
# env=((f110994 . -12) (f110994 . -8) ((primitive-ref symbols) . 8) (f110976 . 4) (f110976 . 0))
# var=f110994
    movl -12(%esp), %eax  # stack load f110994
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f110994
# emit-expr ((primitive-ref symbols))
# funcall
#    si   =-24
#    env  = ((f110994 . -12) (f110994 . -8) ((primitive-ref symbols) . 8) (f110976 . 4) (f110976 . 0))
#    expr = (funcall (primitive-ref symbols))
# emit-expr (primitive-ref symbols)
    .extern symbols
    movl symbols,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_897863"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_897863":
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
_L_897857:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f110976 . 0))
     movl %eax, string$m$gsymbol
# == explicit-begins  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == eliminate-let*  ==>
# (lambda (lst elt) (if (null? lst) (cons e nil) (cons (car lst) (append1 (cdr lst) elt))))
# == uniquify-variables  ==>
# (lambda (f110995 f110996) (if (null? f110995) (cons e nil) (cons (car f110995) (append1 (cdr f110995) f110996))))
# == vectorize-letrec  ==>
# (lambda (f110995 f110996) (if (null? f110995) (cons e nil) (cons (car f110995) (append1 (cdr f110995) f110996))))
# == eliminate-set!  ==>
# (lambda (f110995 f110996) (let ((f110995 f110995) (f110996 f110996)) (if (null? f110995) (cons e nil) (cons (car f110995) (append1 (cdr f110995) f110996)))))
# == close-free-variables  ==>
# (closure (f110995 f110996) (e nil append1) (let ((f110995 f110995) (f110996 f110996)) (if (null? f110995) (cons e nil) (cons (car f110995) (append1 (cdr f110995) f110996)))))
# == eliminate-quote  ==>
# (closure (f110995 f110996) (e nil append1) (let ((f110995 f110995) (f110996 f110996)) (if (null? f110995) (cons e nil) (cons (car f110995) (append1 (cdr f110995) f110996)))))
# == eliminate-when/unless  ==>
# (closure (f110995 f110996) (e nil append1) (let ((f110995 f110995) (f110996 f110996)) (if (null? f110995) (cons e nil) (cons (car f110995) (append1 (cdr f110995) f110996)))))
# == eliminate-cond  ==>
# (closure (f110995 f110996) (e nil append1) (let ((f110995 f110995) (f110996 f110996)) (if (null? f110995) (cons e nil) (cons (car f110995) (append1 (cdr f110995) f110996)))))
# == external-symbols  ==>
# (closure (f110995 f110996) (e nil (primitive-ref append1)) (let ((f110995 f110995) (f110996 f110996)) (if (null? f110995) (cons e nil) (cons (car f110995) ((primitive-ref append1) (cdr f110995) f110996)))))
# emit-expr (closure (f110995 f110996) (e nil (primitive-ref append1)) (let ((f110995 f110995) (f110996 f110996)) (if (null? f110995) (cons e nil) (cons (car f110995) ((primitive-ref append1) (cdr f110995) f110996)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f110995 f110996) (e nil (primitive-ref append1)) (let ((f110995 f110995) (f110996 f110996)) (if (null? f110995) (cons e nil) (cons (car f110995) ((primitive-ref append1) (cdr f110995) f110996)))))
    movl $_L_897864, 0(%ebp)  # closure label
# WARNING: free var e not defined in the environmnet
# WARNING: free var nil not defined in the environmnet
# WARNING: free var (primitive-ref append1) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_897865            # jump around closure body
_L_897864:
# check argument count
    cmp $8,%eax
    je _L_897866
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_897866:
# emit-tail-expr
# si=-16
# env=((f110996 . -12) (f110995 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(let ((f110995 f110995) (f110996 f110996)) (if (null? f110995) (cons e nil) (cons (car f110995) ((primitive-ref append1) (cdr f110995) f110996))))
# emit-tail-let
#  si   = -16
#  env  = ((f110996 . -12) (f110995 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
#  bindings = ((f110995 f110995) (f110996 f110996))
#  body = (if (null? f110995) (cons e nil) (cons (car f110995) ((primitive-ref append1) (cdr f110995) f110996)))
# emit-expr f110995
# emit-variable-ref
# env=((f110996 . -12) (f110995 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f110995
    movl -8(%esp), %eax  # stack load f110995
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f110996
# emit-variable-ref
# env=((f110996 . -12) (f110995 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f110996
    movl -12(%esp), %eax  # stack load f110996
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f110996 . -20) (f110995 . -16) (f110996 . -12) (f110995 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(if (null? f110995) (cons e nil) (cons (car f110995) ((primitive-ref append1) (cdr f110995) f110996)))
# emit-expr (null? f110995)
# emit-expr f110995
# emit-variable-ref
# env=((f110996 . -20) (f110995 . -16) (f110996 . -12) (f110995 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f110995
    movl -16(%esp), %eax  # stack load f110995
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_897867
# emit-tail-expr
# si=-24
# env=((f110996 . -20) (f110995 . -16) (f110996 . -12) (f110995 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(cons e nil)
# tail primcall
# cons arg1=e arg2=nil
# emit-expr e
# emit-variable-ref
# env=((f110996 . -20) (f110995 . -16) (f110996 . -12) (f110995 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=e
    movl 2(%edi), %eax  # frame load e
# end emit-variable-ref
    movl %eax, -24(%esp)
# emit-expr nil
# emit-variable-ref
# env=((f110996 . -20) (f110995 . -16) (f110996 . -12) (f110995 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
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
    jmp _L_897868
_L_897867:
# emit-tail-expr
# si=-24
# env=((f110996 . -20) (f110995 . -16) (f110996 . -12) (f110995 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# expr=(cons (car f110995) ((primitive-ref append1) (cdr f110995) f110996))
# tail primcall
# cons arg1=(car f110995) arg2=((primitive-ref append1) (cdr f110995) f110996)
# emit-expr (car f110995)
# emit-expr f110995
# emit-variable-ref
# env=((f110996 . -20) (f110995 . -16) (f110996 . -12) (f110995 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f110995
    movl -16(%esp), %eax  # stack load f110995
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_897869
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897869:
    movl -1(%eax), %eax
    movl %eax, -24(%esp)
# emit-expr ((primitive-ref append1) (cdr f110995) f110996)
# funcall
#    si   =-28
#    env  = ((f110996 . -20) (f110995 . -16) (f110996 . -12) (f110995 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
#    expr = (funcall (primitive-ref append1) (cdr f110995) f110996)
# emit-expr (primitive-ref append1)
    .extern append1
    movl append1,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_897870"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_897870":
   movl %eax,  -36(%esp)  # stash funcall-oper in closure slot
# emit-expr (cdr f110995)
# emit-expr f110995
# emit-variable-ref
# env=((f110996 . -20) (f110995 . -16) (f110996 . -12) (f110995 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f110995
    movl -16(%esp), %eax  # stack load f110995
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_897871
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897871:
    movl 3(%eax), %eax
    mov %eax, -40(%esp)  # arg (cdr f110995)
# emit-expr f110996
# emit-variable-ref
# env=((f110996 . -20) (f110995 . -16) (f110996 . -12) (f110995 . -8) ((primitive-ref append1) . 12) (nil . 8) (e . 4))
# var=f110996
    movl -20(%esp), %eax  # stack load f110996
# end emit-variable-ref
    mov %eax, -44(%esp)  # arg f110996
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
#return from tail (cons (car f110995) ((primitive-ref append1) (cdr f110995) f110996))
    ret
_L_897868:
    .align 4,0x90
_L_897865:
     movl %eax, append1
# == explicit-begins  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == eliminate-let*  ==>
# (lambda (l k) (if (fx= k 0) (car l) (list-ref (cdr l) (fx- k 1))))
# == uniquify-variables  ==>
# (lambda (f110997 f110998) (if (fx= f110998 0) (car f110997) (list-ref (cdr f110997) (fx- f110998 1))))
# == vectorize-letrec  ==>
# (lambda (f110997 f110998) (if (fx= f110998 0) (car f110997) (list-ref (cdr f110997) (fx- f110998 1))))
# == eliminate-set!  ==>
# (lambda (f110997 f110998) (let ((f110997 f110997) (f110998 f110998)) (if (fx= f110998 0) (car f110997) (list-ref (cdr f110997) (fx- f110998 1)))))
# == close-free-variables  ==>
# (closure (f110997 f110998) (list-ref) (let ((f110997 f110997) (f110998 f110998)) (if (fx= f110998 0) (car f110997) (list-ref (cdr f110997) (fx- f110998 1)))))
# == eliminate-quote  ==>
# (closure (f110997 f110998) (list-ref) (let ((f110997 f110997) (f110998 f110998)) (if (fx= f110998 0) (car f110997) (list-ref (cdr f110997) (fx- f110998 1)))))
# == eliminate-when/unless  ==>
# (closure (f110997 f110998) (list-ref) (let ((f110997 f110997) (f110998 f110998)) (if (fx= f110998 0) (car f110997) (list-ref (cdr f110997) (fx- f110998 1)))))
# == eliminate-cond  ==>
# (closure (f110997 f110998) (list-ref) (let ((f110997 f110997) (f110998 f110998)) (if (fx= f110998 0) (car f110997) (list-ref (cdr f110997) (fx- f110998 1)))))
# == external-symbols  ==>
# (closure (f110997 f110998) ((primitive-ref list-ref)) (let ((f110997 f110997) (f110998 f110998)) (if (fx= f110998 0) (car f110997) ((primitive-ref list-ref) (cdr f110997) (fx- f110998 1)))))
# emit-expr (closure (f110997 f110998) ((primitive-ref list-ref)) (let ((f110997 f110997) (f110998 f110998)) (if (fx= f110998 0) (car f110997) ((primitive-ref list-ref) (cdr f110997) (fx- f110998 1)))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f110997 f110998) ((primitive-ref list-ref)) (let ((f110997 f110997) (f110998 f110998)) (if (fx= f110998 0) (car f110997) ((primitive-ref list-ref) (cdr f110997) (fx- f110998 1)))))
    movl $_L_897872, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_897873            # jump around closure body
_L_897872:
# check argument count
    cmp $8,%eax
    je _L_897874
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_897874:
# emit-tail-expr
# si=-16
# env=((f110998 . -12) (f110997 . -8) ((primitive-ref list-ref) . 4))
# expr=(let ((f110997 f110997) (f110998 f110998)) (if (fx= f110998 0) (car f110997) ((primitive-ref list-ref) (cdr f110997) (fx- f110998 1))))
# emit-tail-let
#  si   = -16
#  env  = ((f110998 . -12) (f110997 . -8) ((primitive-ref list-ref) . 4))
#  bindings = ((f110997 f110997) (f110998 f110998))
#  body = (if (fx= f110998 0) (car f110997) ((primitive-ref list-ref) (cdr f110997) (fx- f110998 1)))
# emit-expr f110997
# emit-variable-ref
# env=((f110998 . -12) (f110997 . -8) ((primitive-ref list-ref) . 4))
# var=f110997
    movl -8(%esp), %eax  # stack load f110997
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f110998
# emit-variable-ref
# env=((f110998 . -12) (f110997 . -8) ((primitive-ref list-ref) . 4))
# var=f110998
    movl -12(%esp), %eax  # stack load f110998
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f110998 . -20) (f110997 . -16) (f110998 . -12) (f110997 . -8) ((primitive-ref list-ref) . 4))
# expr=(if (fx= f110998 0) (car f110997) ((primitive-ref list-ref) (cdr f110997) (fx- f110998 1)))
# emit-expr (fx= f110998 0)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897877"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897877:
    movl %eax, -24(%esp)
# emit-expr f110998
# emit-variable-ref
# env=((f110998 . -20) (f110997 . -16) (f110998 . -12) (f110997 . -8) ((primitive-ref list-ref) . 4))
# var=f110998
    movl -20(%esp), %eax  # stack load f110998
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897878"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897878:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_897875
# emit-tail-expr
# si=-24
# env=((f110998 . -20) (f110997 . -16) (f110998 . -12) (f110997 . -8) ((primitive-ref list-ref) . 4))
# expr=(car f110997)
# tail primcall
# emit-expr f110997
# emit-variable-ref
# env=((f110998 . -20) (f110997 . -16) (f110998 . -12) (f110997 . -8) ((primitive-ref list-ref) . 4))
# var=f110997
    movl -16(%esp), %eax  # stack load f110997
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_897879
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897879:
    movl -1(%eax), %eax
#return from tail (car f110997)
    ret
    jmp _L_897876
_L_897875:
# emit-tail-expr
# si=-24
# env=((f110998 . -20) (f110997 . -16) (f110998 . -12) (f110997 . -8) ((primitive-ref list-ref) . 4))
# expr=((primitive-ref list-ref) (cdr f110997) (fx- f110998 1))
# emit-tail-funcall
#    si   =-24
#    env  = ((f110998 . -20) (f110997 . -16) (f110998 . -12) (f110997 . -8) ((primitive-ref list-ref) . 4))
#    expr = (funcall (primitive-ref list-ref) (cdr f110997) (fx- f110998 1))
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr (cdr f110997)
# emit-expr f110997
# emit-variable-ref
# env=((f110998 . -20) (f110997 . -16) (f110998 . -12) (f110997 . -8) ((primitive-ref list-ref) . 4))
# var=f110997
    movl -16(%esp), %eax  # stack load f110997
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_897880
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897880:
    movl 3(%eax), %eax
    mov %eax, -28(%esp)    # arg (cdr f110997)
# emit-expr (fx- f110998 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897881"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897881:
    movl %eax, -32(%esp)
# emit-expr f110998
# emit-variable-ref
# env=((f110998 . -20) (f110997 . -16) (f110998 . -12) (f110997 . -8) ((primitive-ref list-ref) . 4))
# var=f110998
    movl -20(%esp), %eax  # stack load f110998
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897882"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897882:
    subl -32(%esp), %eax
    mov %eax, -32(%esp)    # arg (fx- f110998 1)
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
_L_897876:
    .align 4,0x90
_L_897873:
     movl %eax, list$mref
# == explicit-begins  ==>
# (lambda (l) (if (null? l) 0 (fxadd1 (list-length (cdr l)))))
# == eliminate-let*  ==>
# (lambda (l) (if (null? l) 0 (fxadd1 (list-length (cdr l)))))
# == uniquify-variables  ==>
# (lambda (f110999) (if (null? f110999) 0 (fxadd1 (list-length (cdr f110999)))))
# == vectorize-letrec  ==>
# (lambda (f110999) (if (null? f110999) 0 (fxadd1 (list-length (cdr f110999)))))
# == eliminate-set!  ==>
# (lambda (f110999) (let ((f110999 f110999)) (if (null? f110999) 0 (fxadd1 (list-length (cdr f110999))))))
# == close-free-variables  ==>
# (closure (f110999) (list-length) (let ((f110999 f110999)) (if (null? f110999) 0 (fxadd1 (list-length (cdr f110999))))))
# == eliminate-quote  ==>
# (closure (f110999) (list-length) (let ((f110999 f110999)) (if (null? f110999) 0 (fxadd1 (list-length (cdr f110999))))))
# == eliminate-when/unless  ==>
# (closure (f110999) (list-length) (let ((f110999 f110999)) (if (null? f110999) 0 (fxadd1 (list-length (cdr f110999))))))
# == eliminate-cond  ==>
# (closure (f110999) (list-length) (let ((f110999 f110999)) (if (null? f110999) 0 (fxadd1 (list-length (cdr f110999))))))
# == external-symbols  ==>
# (closure (f110999) ((primitive-ref list-length)) (let ((f110999 f110999)) (if (null? f110999) 0 (fxadd1 ((primitive-ref list-length) (cdr f110999))))))
# emit-expr (closure (f110999) ((primitive-ref list-length)) (let ((f110999 f110999)) (if (null? f110999) 0 (fxadd1 ((primitive-ref list-length) (cdr f110999))))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f110999) ((primitive-ref list-length)) (let ((f110999 f110999)) (if (null? f110999) 0 (fxadd1 ((primitive-ref list-length) (cdr f110999))))))
    movl $_L_897883, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref list-length) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_897884            # jump around closure body
_L_897883:
# check argument count
    cmp $4,%eax
    je _L_897885
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_897885:
# emit-tail-expr
# si=-12
# env=((f110999 . -8) ((primitive-ref list-length) . 4))
# expr=(let ((f110999 f110999)) (if (null? f110999) 0 (fxadd1 ((primitive-ref list-length) (cdr f110999)))))
# emit-tail-let
#  si   = -12
#  env  = ((f110999 . -8) ((primitive-ref list-length) . 4))
#  bindings = ((f110999 f110999))
#  body = (if (null? f110999) 0 (fxadd1 ((primitive-ref list-length) (cdr f110999))))
# emit-expr f110999
# emit-variable-ref
# env=((f110999 . -8) ((primitive-ref list-length) . 4))
# var=f110999
    movl -8(%esp), %eax  # stack load f110999
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f110999 . -12) (f110999 . -8) ((primitive-ref list-length) . 4))
# expr=(if (null? f110999) 0 (fxadd1 ((primitive-ref list-length) (cdr f110999))))
# emit-expr (null? f110999)
# emit-expr f110999
# emit-variable-ref
# env=((f110999 . -12) (f110999 . -8) ((primitive-ref list-length) . 4))
# var=f110999
    movl -12(%esp), %eax  # stack load f110999
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_897886
# emit-tail-expr
# si=-16
# env=((f110999 . -12) (f110999 . -8) ((primitive-ref list-length) . 4))
# expr=0
    movl $0, %eax     # immed 0
    ret                  # immediate tail return
    jmp _L_897887
_L_897886:
# emit-tail-expr
# si=-16
# env=((f110999 . -12) (f110999 . -8) ((primitive-ref list-length) . 4))
# expr=(fxadd1 ((primitive-ref list-length) (cdr f110999)))
# tail primcall
# emit-expr ((primitive-ref list-length) (cdr f110999))
# funcall
#    si   =-16
#    env  = ((f110999 . -12) (f110999 . -8) ((primitive-ref list-length) . 4))
#    expr = (funcall (primitive-ref list-length) (cdr f110999))
# emit-expr (primitive-ref list-length)
    .extern list$mlength
    movl list$mlength,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_897888"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_897888":
   movl %eax,  -24(%esp)  # stash funcall-oper in closure slot
# emit-expr (cdr f110999)
# emit-expr f110999
# emit-variable-ref
# env=((f110999 . -12) (f110999 . -8) ((primitive-ref list-length) . 4))
# var=f110999
    movl -12(%esp), %eax  # stack load f110999
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_897889
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897889:
    movl 3(%eax), %eax
    mov %eax, -28(%esp)  # arg (cdr f110999)
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
    je "_L_897890"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897890:
     addl $4, %eax
#return from tail (fxadd1 ((primitive-ref list-length) (cdr f110999)))
    ret
_L_897887:
    .align 4,0x90
_L_897884:
     movl %eax, list$mlength
# == explicit-begins  ==>
# (letrec ((fill-vector (lambda (v k args) (if (null? args) v (begin (vector-set! v k (car args)) (fill-vector v (fxadd1 k) (cdr args))))))) (lambda args (let ((v (make-vector (list-length args)))) (fill-vector v 0 args))))
# == eliminate-let*  ==>
# (letrec ((fill-vector (lambda (v k args) (if (null? args) v (begin (vector-set! v k (car args)) (fill-vector v (fxadd1 k) (cdr args))))))) (lambda args (let ((v (make-vector (list-length args)))) (fill-vector v 0 args))))
# == uniquify-variables  ==>
# (letrec ((f111000 (lambda (f111004 f111005 f111006) (if (null? f111006) f111004 (begin (vector-set! f111004 f111005 (car f111006)) (f111000 f111004 (fxadd1 f111005) (cdr f111006))))))) (lambda f111010 (let ((f111012 (make-vector (list-length f111010)))) (f111000 f111012 0 f111010))))
# == vectorize-letrec  ==>
# (let ((f111000 (make-vector 1))) (begin (begin (vector-set! f111000 0 (lambda (f111004 f111005 f111006) (if (null? f111006) f111004 (begin (vector-set! f111004 f111005 (car f111006)) ((vector-ref f111000 0) f111004 (fxadd1 f111005) (cdr f111006))))))) (lambda f111010 (let ((f111012 (make-vector (list-length f111010)))) ((vector-ref f111000 0) f111012 0 f111010)))))
# == eliminate-set!  ==>
# (let ((f111000 (make-vector 1))) (begin (begin (vector-set! f111000 0 (lambda (f111004 f111005 f111006) (let ((f111004 f111004) (f111005 f111005) (f111006 f111006)) (if (null? f111006) f111004 (begin (vector-set! f111004 f111005 (car f111006)) ((vector-ref f111000 0) f111004 (fxadd1 f111005) (cdr f111006)))))))) (lambda f111010 (let () (let ((f111012 (make-vector (list-length f111010)))) ((vector-ref f111000 0) f111012 0 f111010))))))
# == close-free-variables  ==>
# (let ((f111000 (make-vector 1))) (begin (begin (vector-set! f111000 0 (closure (f111004 f111005 f111006) (f111000) (let ((f111004 f111004) (f111005 f111005) (f111006 f111006)) (if (null? f111006) f111004 (begin (vector-set! f111004 f111005 (car f111006)) ((vector-ref f111000 0) f111004 (fxadd1 f111005) (cdr f111006)))))))) (closure f111010 (f111000) (let () (let ((f111012 (make-vector (list-length f111010)))) ((vector-ref f111000 0) f111012 0 f111010))))))
# == eliminate-quote  ==>
# (let ((f111000 (make-vector 1))) (begin (begin (vector-set! f111000 0 (closure (f111004 f111005 f111006) (f111000) (let ((f111004 f111004) (f111005 f111005) (f111006 f111006)) (if (null? f111006) f111004 (begin (vector-set! f111004 f111005 (car f111006)) ((vector-ref f111000 0) f111004 (fxadd1 f111005) (cdr f111006)))))))) (closure f111010 (f111000) (let () (let ((f111012 (make-vector (list-length f111010)))) ((vector-ref f111000 0) f111012 0 f111010))))))
# == eliminate-when/unless  ==>
# (let ((f111000 (make-vector 1))) (begin (begin (vector-set! f111000 0 (closure (f111004 f111005 f111006) (f111000) (let ((f111004 f111004) (f111005 f111005) (f111006 f111006)) (if (null? f111006) f111004 (begin (vector-set! f111004 f111005 (car f111006)) ((vector-ref f111000 0) f111004 (fxadd1 f111005) (cdr f111006)))))))) (closure f111010 (f111000) (let () (let ((f111012 (make-vector (list-length f111010)))) ((vector-ref f111000 0) f111012 0 f111010))))))
# == eliminate-cond  ==>
# (let ((f111000 (make-vector 1))) (begin (begin (vector-set! f111000 0 (closure (f111004 f111005 f111006) (f111000) (let ((f111004 f111004) (f111005 f111005) (f111006 f111006)) (if (null? f111006) f111004 (begin (vector-set! f111004 f111005 (car f111006)) ((vector-ref f111000 0) f111004 (fxadd1 f111005) (cdr f111006)))))))) (closure f111010 (f111000) (let () (let ((f111012 (make-vector (list-length f111010)))) ((vector-ref f111000 0) f111012 0 f111010))))))
# == external-symbols  ==>
# (let ((f111000 (make-vector 1))) (begin (begin (vector-set! f111000 0 (closure (f111004 f111005 f111006) (f111000) (let ((f111004 f111004) (f111005 f111005) (f111006 f111006)) (if (null? f111006) f111004 (begin (vector-set! f111004 f111005 (car f111006)) ((vector-ref f111000 0) f111004 (fxadd1 f111005) (cdr f111006)))))))) (closure f111010 (f111000) (let () (let ((f111012 (make-vector ((primitive-ref list-length) f111010)))) ((vector-ref f111000 0) f111012 0 f111010))))))
# emit-expr (let ((f111000 (make-vector 1))) (begin (begin (vector-set! f111000 0 (closure (f111004 f111005 f111006) (f111000) (let ((f111004 f111004) (f111005 f111005) (f111006 f111006)) (if (null? f111006) f111004 (begin (vector-set! f111004 f111005 (car f111006)) ((vector-ref f111000 0) f111004 (fxadd1 f111005) (cdr f111006)))))))) (closure f111010 (f111000) (let () (let ((f111012 (make-vector ((primitive-ref list-length) f111010)))) ((vector-ref f111000 0) f111012 0 f111010))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f111000 (make-vector 1)))
#  body = (begin (begin (vector-set! f111000 0 (closure (f111004 f111005 f111006) (f111000) (let ((f111004 f111004) (f111005 f111005) (f111006 f111006)) (if (null? f111006) f111004 (begin (vector-set! f111004 f111005 (car f111006)) ((vector-ref f111000 0) f111004 (fxadd1 f111005) (cdr f111006)))))))) (closure f111010 (f111000) (let () (let ((f111012 (make-vector ((primitive-ref list-length) f111010)))) ((vector-ref f111000 0) f111012 0 f111010)))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897891"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897891:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_897892
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897892:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f111000 0 (closure (f111004 f111005 f111006) (f111000) (let ((f111004 f111004) (f111005 f111005) (f111006 f111006)) (if (null? f111006) f111004 (begin (vector-set! f111004 f111005 (car f111006)) ((vector-ref f111000 0) f111004 (fxadd1 f111005) (cdr f111006)))))))) (closure f111010 (f111000) (let () (let ((f111012 (make-vector ((primitive-ref list-length) f111010)))) ((vector-ref f111000 0) f111012 0 f111010)))))
# emit-begin
#   expr=(begin (begin (vector-set! f111000 0 (closure (f111004 f111005 f111006) (f111000) (let ((f111004 f111004) (f111005 f111005) (f111006 f111006)) (if (null? f111006) f111004 (begin (vector-set! f111004 f111005 (car f111006)) ((vector-ref f111000 0) f111004 (fxadd1 f111005) (cdr f111006)))))))) (closure f111010 (f111000) (let () (let ((f111012 (make-vector ((primitive-ref list-length) f111010)))) ((vector-ref f111000 0) f111012 0 f111010)))))
#   env=((f111000 . 0))
# emit-expr (begin (vector-set! f111000 0 (closure (f111004 f111005 f111006) (f111000) (let ((f111004 f111004) (f111005 f111005) (f111006 f111006)) (if (null? f111006) f111004 (begin (vector-set! f111004 f111005 (car f111006)) ((vector-ref f111000 0) f111004 (fxadd1 f111005) (cdr f111006))))))))
# emit-begin
#   expr=(begin (vector-set! f111000 0 (closure (f111004 f111005 f111006) (f111000) (let ((f111004 f111004) (f111005 f111005) (f111006 f111006)) (if (null? f111006) f111004 (begin (vector-set! f111004 f111005 (car f111006)) ((vector-ref f111000 0) f111004 (fxadd1 f111005) (cdr f111006))))))))
#   env=((f111000 . 0))
# emit-expr (vector-set! f111000 0 (closure (f111004 f111005 f111006) (f111000) (let ((f111004 f111004) (f111005 f111005) (f111006 f111006)) (if (null? f111006) f111004 (begin (vector-set! f111004 f111005 (car f111006)) ((vector-ref f111000 0) f111004 (fxadd1 f111005) (cdr f111006)))))))
# emit-expr f111000
# emit-variable-ref
# env=((f111000 . 0))
# var=f111000
    movl 0(%esp), %eax  # stack load f111000
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_897893
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897893:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897894"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897894:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_897896
    cmp  $0,%eax
    jge _L_897895
_L_897896:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_897895:
    movl %eax, -8(%esp)
# emit-expr (closure (f111004 f111005 f111006) (f111000) (let ((f111004 f111004) (f111005 f111005) (f111006 f111006)) (if (null? f111006) f111004 (begin (vector-set! f111004 f111005 (car f111006)) ((vector-ref f111000 0) f111004 (fxadd1 f111005) (cdr f111006))))))
# emit-closure
# si = -12
# env = ((f111000 . 0))
# expr = (closure (f111004 f111005 f111006) (f111000) (let ((f111004 f111004) (f111005 f111005) (f111006 f111006)) (if (null? f111006) f111004 (begin (vector-set! f111004 f111005 (car f111006)) ((vector-ref f111000 0) f111004 (fxadd1 f111005) (cdr f111006))))))
    movl $_L_897897, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f111000 . 0))
# var=f111000
    movl 0(%esp), %eax  # stack load f111000
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f111000
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_897898            # jump around closure body
_L_897897:
# check argument count
    cmp $12,%eax
    je _L_897899
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_897899:
# emit-tail-expr
# si=-20
# env=((f111006 . -16) (f111005 . -12) (f111004 . -8) (f111000 . 4) (f111000 . 0))
# expr=(let ((f111004 f111004) (f111005 f111005) (f111006 f111006)) (if (null? f111006) f111004 (begin (vector-set! f111004 f111005 (car f111006)) ((vector-ref f111000 0) f111004 (fxadd1 f111005) (cdr f111006)))))
# emit-tail-let
#  si   = -20
#  env  = ((f111006 . -16) (f111005 . -12) (f111004 . -8) (f111000 . 4) (f111000 . 0))
#  bindings = ((f111004 f111004) (f111005 f111005) (f111006 f111006))
#  body = (if (null? f111006) f111004 (begin (vector-set! f111004 f111005 (car f111006)) ((vector-ref f111000 0) f111004 (fxadd1 f111005) (cdr f111006))))
# emit-expr f111004
# emit-variable-ref
# env=((f111006 . -16) (f111005 . -12) (f111004 . -8) (f111000 . 4) (f111000 . 0))
# var=f111004
    movl -8(%esp), %eax  # stack load f111004
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr f111005
# emit-variable-ref
# env=((f111006 . -16) (f111005 . -12) (f111004 . -8) (f111000 . 4) (f111000 . 0))
# var=f111005
    movl -12(%esp), %eax  # stack load f111005
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f111006
# emit-variable-ref
# env=((f111006 . -16) (f111005 . -12) (f111004 . -8) (f111000 . 4) (f111000 . 0))
# var=f111006
    movl -16(%esp), %eax  # stack load f111006
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((f111006 . -28) (f111005 . -24) (f111004 . -20) (f111006 . -16) (f111005 . -12) (f111004 . -8) (f111000 . 4) (f111000 . 0))
# expr=(if (null? f111006) f111004 (begin (vector-set! f111004 f111005 (car f111006)) ((vector-ref f111000 0) f111004 (fxadd1 f111005) (cdr f111006))))
# emit-expr (null? f111006)
# emit-expr f111006
# emit-variable-ref
# env=((f111006 . -28) (f111005 . -24) (f111004 . -20) (f111006 . -16) (f111005 . -12) (f111004 . -8) (f111000 . 4) (f111000 . 0))
# var=f111006
    movl -28(%esp), %eax  # stack load f111006
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_897900
# emit-tail-expr
# si=-32
# env=((f111006 . -28) (f111005 . -24) (f111004 . -20) (f111006 . -16) (f111005 . -12) (f111004 . -8) (f111000 . 4) (f111000 . 0))
# expr=f111004
# emit-tail-variable-ref
# emit-variable-ref
# env=((f111006 . -28) (f111005 . -24) (f111004 . -20) (f111006 . -16) (f111005 . -12) (f111004 . -8) (f111000 . 4) (f111000 . 0))
# var=f111004
    movl -20(%esp), %eax  # stack load f111004
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    jmp _L_897901
_L_897900:
# emit-tail-expr
# si=-32
# env=((f111006 . -28) (f111005 . -24) (f111004 . -20) (f111006 . -16) (f111005 . -12) (f111004 . -8) (f111000 . 4) (f111000 . 0))
# expr=(begin (vector-set! f111004 f111005 (car f111006)) ((vector-ref f111000 0) f111004 (fxadd1 f111005) (cdr f111006)))
# tail-begin (begin (vector-set! f111004 f111005 (car f111006)) ((vector-ref f111000 0) f111004 (fxadd1 f111005) (cdr f111006)))
#   env=((f111006 . -28) (f111005 . -24) (f111004 . -20) (f111006 . -16) (f111005 . -12) (f111004 . -8) (f111000 . 4) (f111000 . 0))
# emit-expr (vector-set! f111004 f111005 (car f111006))
# emit-expr f111004
# emit-variable-ref
# env=((f111006 . -28) (f111005 . -24) (f111004 . -20) (f111006 . -16) (f111005 . -12) (f111004 . -8) (f111000 . 4) (f111000 . 0))
# var=f111004
    movl -20(%esp), %eax  # stack load f111004
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_897902
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897902:
    movl %eax, -32(%esp)
# emit-expr f111005
# emit-variable-ref
# env=((f111006 . -28) (f111005 . -24) (f111004 . -20) (f111006 . -16) (f111005 . -12) (f111004 . -8) (f111000 . 4) (f111000 . 0))
# var=f111005
    movl -24(%esp), %eax  # stack load f111005
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897903"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897903:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_897905
    cmp  $0,%eax
    jge _L_897904
_L_897905:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_897904:
    movl %eax, -36(%esp)
# emit-expr (car f111006)
# emit-expr f111006
# emit-variable-ref
# env=((f111006 . -28) (f111005 . -24) (f111004 . -20) (f111006 . -16) (f111005 . -12) (f111004 . -8) (f111000 . 4) (f111000 . 0))
# var=f111006
    movl -28(%esp), %eax  # stack load f111006
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_897906
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897906:
    movl -1(%eax), %eax
    movl -32(%esp), %ebx
    movl -36(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-tail-expr
# si=-32
# env=((f111006 . -28) (f111005 . -24) (f111004 . -20) (f111006 . -16) (f111005 . -12) (f111004 . -8) (f111000 . 4) (f111000 . 0))
# expr=(begin ((vector-ref f111000 0) f111004 (fxadd1 f111005) (cdr f111006)))
# tail-begin (begin ((vector-ref f111000 0) f111004 (fxadd1 f111005) (cdr f111006)))
#   env=((f111006 . -28) (f111005 . -24) (f111004 . -20) (f111006 . -16) (f111005 . -12) (f111004 . -8) (f111000 . 4) (f111000 . 0))
# emit-tail-expr
# si=-32
# env=((f111006 . -28) (f111005 . -24) (f111004 . -20) (f111006 . -16) (f111005 . -12) (f111004 . -8) (f111000 . 4) (f111000 . 0))
# expr=((vector-ref f111000 0) f111004 (fxadd1 f111005) (cdr f111006))
# emit-tail-funcall
#    si   =-32
#    env  = ((f111006 . -28) (f111005 . -24) (f111004 . -20) (f111006 . -16) (f111005 . -12) (f111004 . -8) (f111000 . 4) (f111000 . 0))
#    expr = (funcall (vector-ref f111000 0) f111004 (fxadd1 f111005) (cdr f111006))
# emit-expr (vector-ref f111000 0)
# emit-expr f111000
# emit-variable-ref
# env=((f111006 . -28) (f111005 . -24) (f111004 . -20) (f111006 . -16) (f111005 . -12) (f111004 . -8) (f111000 . 4) (f111000 . 0))
# var=f111000
    movl 2(%edi), %eax  # frame load f111000
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_897907
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897907:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897908"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897908:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_897910
    cmp  $0,%eax
    jge _L_897909
_L_897910:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_897909:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -32(%esp)  # stash funcall-oper in next closure slot
# emit-expr f111004
# emit-variable-ref
# env=((f111006 . -28) (f111005 . -24) (f111004 . -20) (f111006 . -16) (f111005 . -12) (f111004 . -8) (f111000 . 4) (f111000 . 0))
# var=f111004
    movl -20(%esp), %eax  # stack load f111004
# end emit-variable-ref
    mov %eax, -36(%esp)    # arg f111004
# emit-expr (fxadd1 f111005)
# emit-expr f111005
# emit-variable-ref
# env=((f111006 . -28) (f111005 . -24) (f111004 . -20) (f111006 . -16) (f111005 . -12) (f111004 . -8) (f111000 . 4) (f111000 . 0))
# var=f111005
    movl -24(%esp), %eax  # stack load f111005
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897911"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897911:
     addl $4, %eax
    mov %eax, -40(%esp)    # arg (fxadd1 f111005)
# emit-expr (cdr f111006)
# emit-expr f111006
# emit-variable-ref
# env=((f111006 . -28) (f111005 . -24) (f111004 . -20) (f111006 . -16) (f111005 . -12) (f111004 . -8) (f111000 . 4) (f111000 . 0))
# var=f111006
    movl -28(%esp), %eax  # stack load f111006
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_897912
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897912:
    movl 3(%eax), %eax
    mov %eax, -44(%esp)    # arg (cdr f111006)
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
_L_897901:
    .align 4,0x90
_L_897898:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f111000 . 0))
# emit-expr (begin (closure f111010 (f111000) (let () (let ((f111012 (make-vector ((primitive-ref list-length) f111010)))) ((vector-ref f111000 0) f111012 0 f111010)))))
# emit-begin
#   expr=(begin (closure f111010 (f111000) (let () (let ((f111012 (make-vector ((primitive-ref list-length) f111010)))) ((vector-ref f111000 0) f111012 0 f111010)))))
#   env=((f111000 . 0))
# emit-expr (closure f111010 (f111000) (let () (let ((f111012 (make-vector ((primitive-ref list-length) f111010)))) ((vector-ref f111000 0) f111012 0 f111010))))
# emit-closure
# si = -4
# env = ((f111000 . 0))
# expr = (closure f111010 (f111000) (let () (let ((f111012 (make-vector ((primitive-ref list-length) f111010)))) ((vector-ref f111000 0) f111012 0 f111010))))
    movl $_L_897913, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f111000 . 0))
# var=f111000
    movl 0(%esp), %eax  # stack load f111000
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f111000
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_897914            # jump around closure body
_L_897913:
# check argument count
    cmp $0,%eax
    jge _L_897915
# invoke error handler eh_argcount_min
    .extern eh$uargcount$umin
    movl eh$uargcount$umin, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_897915:
# emit-build-varargs-list
    movl $63, %esi       # args <- () 
    lea -4(%esp),%edi    # edi <- esp-4
    subl %eax, %edi      # edi <- esp-4-eax    addr of arg[K+N] on stack
_L_897917:
    lea -4(%esp),%ebx    # addr of arg[K] on stack
    cmp %edi, %ebx       # while edi <> esp+(si+4)
    je _L_897916
    movl (%edi),%ebx     # arg i -> car
    movl %ebx, 0(%ebp)
    movl %esi, 4(%ebp)  # esi -> cdr
    movl %ebp, %esi
    addl $1, %esi       # tag as pair
    addl $8,%ebp         # bump heap ptr
    addl $4,%edi         # move to next previous arg from the end
    jmp _L_897917
_L_897916:
    movl %esi, -8(%esp)  # set args
# emit-tail-expr
# si=-12
# env=((f111010 . -8) (f111000 . 4) (f111000 . 0))
# expr=(let () (let ((f111012 (make-vector ((primitive-ref list-length) f111010)))) ((vector-ref f111000 0) f111012 0 f111010)))
# emit-tail-let
#  si   = -12
#  env  = ((f111010 . -8) (f111000 . 4) (f111000 . 0))
#  bindings = ()
#  body = (let ((f111012 (make-vector ((primitive-ref list-length) f111010)))) ((vector-ref f111000 0) f111012 0 f111010))
# emit-tail-expr
# si=-12
# env=((f111010 . -8) (f111000 . 4) (f111000 . 0))
# expr=(let ((f111012 (make-vector ((primitive-ref list-length) f111010)))) ((vector-ref f111000 0) f111012 0 f111010))
# emit-tail-let
#  si   = -12
#  env  = ((f111010 . -8) (f111000 . 4) (f111000 . 0))
#  bindings = ((f111012 (make-vector ((primitive-ref list-length) f111010))))
#  body = ((vector-ref f111000 0) f111012 0 f111010)
# emit-expr (make-vector ((primitive-ref list-length) f111010))
# make-vector ((primitive-ref list-length) f111010)
# emit-expr ((primitive-ref list-length) f111010)
# funcall
#    si   =-12
#    env  = ((f111010 . -8) (f111000 . 4) (f111000 . 0))
#    expr = (funcall (primitive-ref list-length) f111010)
# emit-expr (primitive-ref list-length)
    .extern list$mlength
    movl list$mlength,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_897918"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_897918":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr f111010
# emit-variable-ref
# env=((f111010 . -8) (f111000 . 4) (f111000 . 0))
# var=f111010
    movl -8(%esp), %eax  # stack load f111010
# end emit-variable-ref
    mov %eax, -24(%esp)  # arg f111010
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
    je "_L_897919"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897919:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_897920
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897920:
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
# env=((f111012 . -12) (f111010 . -8) (f111000 . 4) (f111000 . 0))
# expr=((vector-ref f111000 0) f111012 0 f111010)
# emit-tail-funcall
#    si   =-16
#    env  = ((f111012 . -12) (f111010 . -8) (f111000 . 4) (f111000 . 0))
#    expr = (funcall (vector-ref f111000 0) f111012 0 f111010)
# emit-expr (vector-ref f111000 0)
# emit-expr f111000
# emit-variable-ref
# env=((f111012 . -12) (f111010 . -8) (f111000 . 4) (f111000 . 0))
# var=f111000
    movl 2(%edi), %eax  # frame load f111000
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_897921
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897921:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897922"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897922:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_897924
    cmp  $0,%eax
    jge _L_897923
_L_897924:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_897923:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f111012
# emit-variable-ref
# env=((f111012 . -12) (f111010 . -8) (f111000 . 4) (f111000 . 0))
# var=f111012
    movl -12(%esp), %eax  # stack load f111012
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f111012
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -24(%esp)    # arg 0
# emit-expr f111010
# emit-variable-ref
# env=((f111012 . -12) (f111010 . -8) (f111000 . 4) (f111000 . 0))
# var=f111010
    movl -8(%esp), %eax  # stack load f111010
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f111010
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
_L_897914:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f111000 . 0))
     movl %eax, vector
# == explicit-begins  ==>
# (letrec ((fill-string (lambda (s k args) (if (null? args) s (begin (string-set! s k (car args)) (fill-string s (fxadd1 k) (cdr args))))))) (lambda args (let ((s (make-string (list-length args)))) (fill-string s 0 args))))
# == eliminate-let*  ==>
# (letrec ((fill-string (lambda (s k args) (if (null? args) s (begin (string-set! s k (car args)) (fill-string s (fxadd1 k) (cdr args))))))) (lambda args (let ((s (make-string (list-length args)))) (fill-string s 0 args))))
# == uniquify-variables  ==>
# (letrec ((f111013 (lambda (f111017 f111018 f111019) (if (null? f111019) f111017 (begin (string-set! f111017 f111018 (car f111019)) (f111013 f111017 (fxadd1 f111018) (cdr f111019))))))) (lambda f111023 (let ((f111025 (make-string (list-length f111023)))) (f111013 f111025 0 f111023))))
# == vectorize-letrec  ==>
# (let ((f111013 (make-vector 1))) (begin (begin (vector-set! f111013 0 (lambda (f111017 f111018 f111019) (if (null? f111019) f111017 (begin (string-set! f111017 f111018 (car f111019)) ((vector-ref f111013 0) f111017 (fxadd1 f111018) (cdr f111019))))))) (lambda f111023 (let ((f111025 (make-string (list-length f111023)))) ((vector-ref f111013 0) f111025 0 f111023)))))
# == eliminate-set!  ==>
# (let ((f111013 (make-vector 1))) (begin (begin (vector-set! f111013 0 (lambda (f111017 f111018 f111019) (let ((f111017 f111017) (f111018 f111018) (f111019 f111019)) (if (null? f111019) f111017 (begin (string-set! f111017 f111018 (car f111019)) ((vector-ref f111013 0) f111017 (fxadd1 f111018) (cdr f111019)))))))) (lambda f111023 (let () (let ((f111025 (make-string (list-length f111023)))) ((vector-ref f111013 0) f111025 0 f111023))))))
# == close-free-variables  ==>
# (let ((f111013 (make-vector 1))) (begin (begin (vector-set! f111013 0 (closure (f111017 f111018 f111019) (f111013) (let ((f111017 f111017) (f111018 f111018) (f111019 f111019)) (if (null? f111019) f111017 (begin (string-set! f111017 f111018 (car f111019)) ((vector-ref f111013 0) f111017 (fxadd1 f111018) (cdr f111019)))))))) (closure f111023 (f111013) (let () (let ((f111025 (make-string (list-length f111023)))) ((vector-ref f111013 0) f111025 0 f111023))))))
# == eliminate-quote  ==>
# (let ((f111013 (make-vector 1))) (begin (begin (vector-set! f111013 0 (closure (f111017 f111018 f111019) (f111013) (let ((f111017 f111017) (f111018 f111018) (f111019 f111019)) (if (null? f111019) f111017 (begin (string-set! f111017 f111018 (car f111019)) ((vector-ref f111013 0) f111017 (fxadd1 f111018) (cdr f111019)))))))) (closure f111023 (f111013) (let () (let ((f111025 (make-string (list-length f111023)))) ((vector-ref f111013 0) f111025 0 f111023))))))
# == eliminate-when/unless  ==>
# (let ((f111013 (make-vector 1))) (begin (begin (vector-set! f111013 0 (closure (f111017 f111018 f111019) (f111013) (let ((f111017 f111017) (f111018 f111018) (f111019 f111019)) (if (null? f111019) f111017 (begin (string-set! f111017 f111018 (car f111019)) ((vector-ref f111013 0) f111017 (fxadd1 f111018) (cdr f111019)))))))) (closure f111023 (f111013) (let () (let ((f111025 (make-string (list-length f111023)))) ((vector-ref f111013 0) f111025 0 f111023))))))
# == eliminate-cond  ==>
# (let ((f111013 (make-vector 1))) (begin (begin (vector-set! f111013 0 (closure (f111017 f111018 f111019) (f111013) (let ((f111017 f111017) (f111018 f111018) (f111019 f111019)) (if (null? f111019) f111017 (begin (string-set! f111017 f111018 (car f111019)) ((vector-ref f111013 0) f111017 (fxadd1 f111018) (cdr f111019)))))))) (closure f111023 (f111013) (let () (let ((f111025 (make-string (list-length f111023)))) ((vector-ref f111013 0) f111025 0 f111023))))))
# == external-symbols  ==>
# (let ((f111013 (make-vector 1))) (begin (begin (vector-set! f111013 0 (closure (f111017 f111018 f111019) (f111013) (let ((f111017 f111017) (f111018 f111018) (f111019 f111019)) (if (null? f111019) f111017 (begin (string-set! f111017 f111018 (car f111019)) ((vector-ref f111013 0) f111017 (fxadd1 f111018) (cdr f111019)))))))) (closure f111023 (f111013) (let () (let ((f111025 (make-string ((primitive-ref list-length) f111023)))) ((vector-ref f111013 0) f111025 0 f111023))))))
# emit-expr (let ((f111013 (make-vector 1))) (begin (begin (vector-set! f111013 0 (closure (f111017 f111018 f111019) (f111013) (let ((f111017 f111017) (f111018 f111018) (f111019 f111019)) (if (null? f111019) f111017 (begin (string-set! f111017 f111018 (car f111019)) ((vector-ref f111013 0) f111017 (fxadd1 f111018) (cdr f111019)))))))) (closure f111023 (f111013) (let () (let ((f111025 (make-string ((primitive-ref list-length) f111023)))) ((vector-ref f111013 0) f111025 0 f111023))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f111013 (make-vector 1)))
#  body = (begin (begin (vector-set! f111013 0 (closure (f111017 f111018 f111019) (f111013) (let ((f111017 f111017) (f111018 f111018) (f111019 f111019)) (if (null? f111019) f111017 (begin (string-set! f111017 f111018 (car f111019)) ((vector-ref f111013 0) f111017 (fxadd1 f111018) (cdr f111019)))))))) (closure f111023 (f111013) (let () (let ((f111025 (make-string ((primitive-ref list-length) f111023)))) ((vector-ref f111013 0) f111025 0 f111023)))))
# emit-expr (make-vector 1)
# make-vector 1
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897925"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897925:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_897926
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897926:
    movl %eax, %esi
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    orl  $5, %eax
    addl $4, %esi
    addl $4, %esi
    andl $-8, %esi
    addl %esi, %ebp
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (begin (vector-set! f111013 0 (closure (f111017 f111018 f111019) (f111013) (let ((f111017 f111017) (f111018 f111018) (f111019 f111019)) (if (null? f111019) f111017 (begin (string-set! f111017 f111018 (car f111019)) ((vector-ref f111013 0) f111017 (fxadd1 f111018) (cdr f111019)))))))) (closure f111023 (f111013) (let () (let ((f111025 (make-string ((primitive-ref list-length) f111023)))) ((vector-ref f111013 0) f111025 0 f111023)))))
# emit-begin
#   expr=(begin (begin (vector-set! f111013 0 (closure (f111017 f111018 f111019) (f111013) (let ((f111017 f111017) (f111018 f111018) (f111019 f111019)) (if (null? f111019) f111017 (begin (string-set! f111017 f111018 (car f111019)) ((vector-ref f111013 0) f111017 (fxadd1 f111018) (cdr f111019)))))))) (closure f111023 (f111013) (let () (let ((f111025 (make-string ((primitive-ref list-length) f111023)))) ((vector-ref f111013 0) f111025 0 f111023)))))
#   env=((f111013 . 0))
# emit-expr (begin (vector-set! f111013 0 (closure (f111017 f111018 f111019) (f111013) (let ((f111017 f111017) (f111018 f111018) (f111019 f111019)) (if (null? f111019) f111017 (begin (string-set! f111017 f111018 (car f111019)) ((vector-ref f111013 0) f111017 (fxadd1 f111018) (cdr f111019))))))))
# emit-begin
#   expr=(begin (vector-set! f111013 0 (closure (f111017 f111018 f111019) (f111013) (let ((f111017 f111017) (f111018 f111018) (f111019 f111019)) (if (null? f111019) f111017 (begin (string-set! f111017 f111018 (car f111019)) ((vector-ref f111013 0) f111017 (fxadd1 f111018) (cdr f111019))))))))
#   env=((f111013 . 0))
# emit-expr (vector-set! f111013 0 (closure (f111017 f111018 f111019) (f111013) (let ((f111017 f111017) (f111018 f111018) (f111019 f111019)) (if (null? f111019) f111017 (begin (string-set! f111017 f111018 (car f111019)) ((vector-ref f111013 0) f111017 (fxadd1 f111018) (cdr f111019)))))))
# emit-expr f111013
# emit-variable-ref
# env=((f111013 . 0))
# var=f111013
    movl 0(%esp), %eax  # stack load f111013
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_897927
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897927:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897928"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897928:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_897930
    cmp  $0,%eax
    jge _L_897929
_L_897930:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_897929:
    movl %eax, -8(%esp)
# emit-expr (closure (f111017 f111018 f111019) (f111013) (let ((f111017 f111017) (f111018 f111018) (f111019 f111019)) (if (null? f111019) f111017 (begin (string-set! f111017 f111018 (car f111019)) ((vector-ref f111013 0) f111017 (fxadd1 f111018) (cdr f111019))))))
# emit-closure
# si = -12
# env = ((f111013 . 0))
# expr = (closure (f111017 f111018 f111019) (f111013) (let ((f111017 f111017) (f111018 f111018) (f111019 f111019)) (if (null? f111019) f111017 (begin (string-set! f111017 f111018 (car f111019)) ((vector-ref f111013 0) f111017 (fxadd1 f111018) (cdr f111019))))))
    movl $_L_897931, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f111013 . 0))
# var=f111013
    movl 0(%esp), %eax  # stack load f111013
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f111013
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_897932            # jump around closure body
_L_897931:
# check argument count
    cmp $12,%eax
    je _L_897933
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_897933:
# emit-tail-expr
# si=-20
# env=((f111019 . -16) (f111018 . -12) (f111017 . -8) (f111013 . 4) (f111013 . 0))
# expr=(let ((f111017 f111017) (f111018 f111018) (f111019 f111019)) (if (null? f111019) f111017 (begin (string-set! f111017 f111018 (car f111019)) ((vector-ref f111013 0) f111017 (fxadd1 f111018) (cdr f111019)))))
# emit-tail-let
#  si   = -20
#  env  = ((f111019 . -16) (f111018 . -12) (f111017 . -8) (f111013 . 4) (f111013 . 0))
#  bindings = ((f111017 f111017) (f111018 f111018) (f111019 f111019))
#  body = (if (null? f111019) f111017 (begin (string-set! f111017 f111018 (car f111019)) ((vector-ref f111013 0) f111017 (fxadd1 f111018) (cdr f111019))))
# emit-expr f111017
# emit-variable-ref
# env=((f111019 . -16) (f111018 . -12) (f111017 . -8) (f111013 . 4) (f111013 . 0))
# var=f111017
    movl -8(%esp), %eax  # stack load f111017
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-expr f111018
# emit-variable-ref
# env=((f111019 . -16) (f111018 . -12) (f111017 . -8) (f111013 . 4) (f111013 . 0))
# var=f111018
    movl -12(%esp), %eax  # stack load f111018
# end emit-variable-ref
    movl %eax, -24(%esp)  # stack save
# emit-expr f111019
# emit-variable-ref
# env=((f111019 . -16) (f111018 . -12) (f111017 . -8) (f111013 . 4) (f111013 . 0))
# var=f111019
    movl -16(%esp), %eax  # stack load f111019
# end emit-variable-ref
    movl %eax, -28(%esp)  # stack save
# emit-tail-expr
# si=-32
# env=((f111019 . -28) (f111018 . -24) (f111017 . -20) (f111019 . -16) (f111018 . -12) (f111017 . -8) (f111013 . 4) (f111013 . 0))
# expr=(if (null? f111019) f111017 (begin (string-set! f111017 f111018 (car f111019)) ((vector-ref f111013 0) f111017 (fxadd1 f111018) (cdr f111019))))
# emit-expr (null? f111019)
# emit-expr f111019
# emit-variable-ref
# env=((f111019 . -28) (f111018 . -24) (f111017 . -20) (f111019 . -16) (f111018 . -12) (f111017 . -8) (f111013 . 4) (f111013 . 0))
# var=f111019
    movl -28(%esp), %eax  # stack load f111019
# end emit-variable-ref
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_897934
# emit-tail-expr
# si=-32
# env=((f111019 . -28) (f111018 . -24) (f111017 . -20) (f111019 . -16) (f111018 . -12) (f111017 . -8) (f111013 . 4) (f111013 . 0))
# expr=f111017
# emit-tail-variable-ref
# emit-variable-ref
# env=((f111019 . -28) (f111018 . -24) (f111017 . -20) (f111019 . -16) (f111018 . -12) (f111017 . -8) (f111013 . 4) (f111013 . 0))
# var=f111017
    movl -20(%esp), %eax  # stack load f111017
# end emit-variable-ref
    ret
# end emit-tail-variable ref
    jmp _L_897935
_L_897934:
# emit-tail-expr
# si=-32
# env=((f111019 . -28) (f111018 . -24) (f111017 . -20) (f111019 . -16) (f111018 . -12) (f111017 . -8) (f111013 . 4) (f111013 . 0))
# expr=(begin (string-set! f111017 f111018 (car f111019)) ((vector-ref f111013 0) f111017 (fxadd1 f111018) (cdr f111019)))
# tail-begin (begin (string-set! f111017 f111018 (car f111019)) ((vector-ref f111013 0) f111017 (fxadd1 f111018) (cdr f111019)))
#   env=((f111019 . -28) (f111018 . -24) (f111017 . -20) (f111019 . -16) (f111018 . -12) (f111017 . -8) (f111013 . 4) (f111013 . 0))
# emit-expr (string-set! f111017 f111018 (car f111019))
# emit-expr f111017
# emit-variable-ref
# env=((f111019 . -28) (f111018 . -24) (f111017 . -20) (f111019 . -16) (f111018 . -12) (f111017 . -8) (f111013 . 4) (f111013 . 0))
# var=f111017
    movl -20(%esp), %eax  # stack load f111017
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_897936
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897936:
    movl %eax, -32(%esp)
# emit-expr f111018
# emit-variable-ref
# env=((f111019 . -28) (f111018 . -24) (f111017 . -20) (f111019 . -16) (f111018 . -12) (f111017 . -8) (f111013 . 4) (f111013 . 0))
# var=f111018
    movl -24(%esp), %eax  # stack load f111018
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897937"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897937:
# check bounds on string index
    movl -32(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_897939
    cmp  $0,%eax
    jge _L_897938
_L_897939:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_897938:
    movl %eax, -36(%esp)
# emit-expr (car f111019)
# emit-expr f111019
# emit-variable-ref
# env=((f111019 . -28) (f111018 . -24) (f111017 . -20) (f111019 . -16) (f111018 . -12) (f111017 . -8) (f111013 . 4) (f111013 . 0))
# var=f111019
    movl -28(%esp), %eax  # stack load f111019
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_897940
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $100,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897940:
    movl -1(%eax), %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_897941"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897941:
    movl -32(%esp), %ebx
    movl -36(%esp), %esi
    sar $2, %esi
    movb  %ah, -2(%ebx,%esi)
# emit-tail-expr
# si=-32
# env=((f111019 . -28) (f111018 . -24) (f111017 . -20) (f111019 . -16) (f111018 . -12) (f111017 . -8) (f111013 . 4) (f111013 . 0))
# expr=(begin ((vector-ref f111013 0) f111017 (fxadd1 f111018) (cdr f111019)))
# tail-begin (begin ((vector-ref f111013 0) f111017 (fxadd1 f111018) (cdr f111019)))
#   env=((f111019 . -28) (f111018 . -24) (f111017 . -20) (f111019 . -16) (f111018 . -12) (f111017 . -8) (f111013 . 4) (f111013 . 0))
# emit-tail-expr
# si=-32
# env=((f111019 . -28) (f111018 . -24) (f111017 . -20) (f111019 . -16) (f111018 . -12) (f111017 . -8) (f111013 . 4) (f111013 . 0))
# expr=((vector-ref f111013 0) f111017 (fxadd1 f111018) (cdr f111019))
# emit-tail-funcall
#    si   =-32
#    env  = ((f111019 . -28) (f111018 . -24) (f111017 . -20) (f111019 . -16) (f111018 . -12) (f111017 . -8) (f111013 . 4) (f111013 . 0))
#    expr = (funcall (vector-ref f111013 0) f111017 (fxadd1 f111018) (cdr f111019))
# emit-expr (vector-ref f111013 0)
# emit-expr f111013
# emit-variable-ref
# env=((f111019 . -28) (f111018 . -24) (f111017 . -20) (f111019 . -16) (f111018 . -12) (f111017 . -8) (f111013 . 4) (f111013 . 0))
# var=f111013
    movl 2(%edi), %eax  # frame load f111013
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_897942
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897942:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897943"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897943:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_897945
    cmp  $0,%eax
    jge _L_897944
_L_897945:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_897944:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -32(%esp)  # stash funcall-oper in next closure slot
# emit-expr f111017
# emit-variable-ref
# env=((f111019 . -28) (f111018 . -24) (f111017 . -20) (f111019 . -16) (f111018 . -12) (f111017 . -8) (f111013 . 4) (f111013 . 0))
# var=f111017
    movl -20(%esp), %eax  # stack load f111017
# end emit-variable-ref
    mov %eax, -36(%esp)    # arg f111017
# emit-expr (fxadd1 f111018)
# emit-expr f111018
# emit-variable-ref
# env=((f111019 . -28) (f111018 . -24) (f111017 . -20) (f111019 . -16) (f111018 . -12) (f111017 . -8) (f111013 . 4) (f111013 . 0))
# var=f111018
    movl -24(%esp), %eax  # stack load f111018
# end emit-variable-ref
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897946"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897946:
     addl $4, %eax
    mov %eax, -40(%esp)    # arg (fxadd1 f111018)
# emit-expr (cdr f111019)
# emit-expr f111019
# emit-variable-ref
# env=((f111019 . -28) (f111018 . -24) (f111017 . -20) (f111019 . -16) (f111018 . -12) (f111017 . -8) (f111013 . 4) (f111013 . 0))
# var=f111019
    movl -28(%esp), %eax  # stack load f111019
# end emit-variable-ref
# check the argument is a pair
    movl %eax,%ebx
    and $7, %bl
    cmp $1, %bl
    je _L_897947
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $104,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897947:
    movl 3(%eax), %eax
    mov %eax, -44(%esp)    # arg (cdr f111019)
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
_L_897935:
    .align 4,0x90
_L_897932:
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f111013 . 0))
# emit-expr (begin (closure f111023 (f111013) (let () (let ((f111025 (make-string ((primitive-ref list-length) f111023)))) ((vector-ref f111013 0) f111025 0 f111023)))))
# emit-begin
#   expr=(begin (closure f111023 (f111013) (let () (let ((f111025 (make-string ((primitive-ref list-length) f111023)))) ((vector-ref f111013 0) f111025 0 f111023)))))
#   env=((f111013 . 0))
# emit-expr (closure f111023 (f111013) (let () (let ((f111025 (make-string ((primitive-ref list-length) f111023)))) ((vector-ref f111013 0) f111025 0 f111023))))
# emit-closure
# si = -4
# env = ((f111013 . 0))
# expr = (closure f111023 (f111013) (let () (let ((f111025 (make-string ((primitive-ref list-length) f111023)))) ((vector-ref f111013 0) f111025 0 f111023))))
    movl $_L_897948, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f111013 . 0))
# var=f111013
    movl 0(%esp), %eax  # stack load f111013
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f111013
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_897949            # jump around closure body
_L_897948:
# check argument count
    cmp $0,%eax
    jge _L_897950
# invoke error handler eh_argcount_min
    .extern eh$uargcount$umin
    movl eh$uargcount$umin, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_897950:
# emit-build-varargs-list
    movl $63, %esi       # args <- () 
    lea -4(%esp),%edi    # edi <- esp-4
    subl %eax, %edi      # edi <- esp-4-eax    addr of arg[K+N] on stack
_L_897952:
    lea -4(%esp),%ebx    # addr of arg[K] on stack
    cmp %edi, %ebx       # while edi <> esp+(si+4)
    je _L_897951
    movl (%edi),%ebx     # arg i -> car
    movl %ebx, 0(%ebp)
    movl %esi, 4(%ebp)  # esi -> cdr
    movl %ebp, %esi
    addl $1, %esi       # tag as pair
    addl $8,%ebp         # bump heap ptr
    addl $4,%edi         # move to next previous arg from the end
    jmp _L_897952
_L_897951:
    movl %esi, -8(%esp)  # set args
# emit-tail-expr
# si=-12
# env=((f111023 . -8) (f111013 . 4) (f111013 . 0))
# expr=(let () (let ((f111025 (make-string ((primitive-ref list-length) f111023)))) ((vector-ref f111013 0) f111025 0 f111023)))
# emit-tail-let
#  si   = -12
#  env  = ((f111023 . -8) (f111013 . 4) (f111013 . 0))
#  bindings = ()
#  body = (let ((f111025 (make-string ((primitive-ref list-length) f111023)))) ((vector-ref f111013 0) f111025 0 f111023))
# emit-tail-expr
# si=-12
# env=((f111023 . -8) (f111013 . 4) (f111013 . 0))
# expr=(let ((f111025 (make-string ((primitive-ref list-length) f111023)))) ((vector-ref f111013 0) f111025 0 f111023))
# emit-tail-let
#  si   = -12
#  env  = ((f111023 . -8) (f111013 . 4) (f111013 . 0))
#  bindings = ((f111025 (make-string ((primitive-ref list-length) f111023))))
#  body = ((vector-ref f111013 0) f111025 0 f111023)
# emit-expr (make-string ((primitive-ref list-length) f111023))
# make-string len=((primitive-ref list-length) f111023)
# emit-expr ((primitive-ref list-length) f111023)
# funcall
#    si   =-12
#    env  = ((f111023 . -8) (f111013 . 4) (f111013 . 0))
#    expr = (funcall (primitive-ref list-length) f111023)
# emit-expr (primitive-ref list-length)
    .extern list$mlength
    movl list$mlength,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_897953"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_897953":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr f111023
# emit-variable-ref
# env=((f111023 . -8) (f111013 . 4) (f111013 . 0))
# var=f111023
    movl -8(%esp), %eax  # stack load f111023
# end emit-variable-ref
    mov %eax, -24(%esp)  # arg f111023
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
    je "_L_897954"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897954:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_897955
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897955:
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
# env=((f111025 . -12) (f111023 . -8) (f111013 . 4) (f111013 . 0))
# expr=((vector-ref f111013 0) f111025 0 f111023)
# emit-tail-funcall
#    si   =-16
#    env  = ((f111025 . -12) (f111023 . -8) (f111013 . 4) (f111013 . 0))
#    expr = (funcall (vector-ref f111013 0) f111025 0 f111023)
# emit-expr (vector-ref f111013 0)
# emit-expr f111013
# emit-variable-ref
# env=((f111025 . -12) (f111023 . -8) (f111013 . 4) (f111013 . 0))
# var=f111013
    movl 2(%edi), %eax  # frame load f111013
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_897956
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897956:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897957"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897957:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_897959
    cmp  $0,%eax
    jge _L_897958
_L_897959:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_897958:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr f111025
# emit-variable-ref
# env=((f111025 . -12) (f111023 . -8) (f111013 . 4) (f111013 . 0))
# var=f111025
    movl -12(%esp), %eax  # stack load f111025
# end emit-variable-ref
    mov %eax, -20(%esp)    # arg f111025
# emit-expr 0
    movl $0, %eax     # immed 0
    mov %eax, -24(%esp)    # arg 0
# emit-expr f111023
# emit-variable-ref
# env=((f111025 . -12) (f111023 . -8) (f111013 . 4) (f111013 . 0))
# var=f111023
    movl -8(%esp), %eax  # stack load f111023
# end emit-variable-ref
    mov %eax, -28(%esp)    # arg f111023
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
_L_897949:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f111013 . 0))
     movl %eax, string
# == explicit-begins  ==>
# (let* ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s)))) (write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1))))
# == eliminate-let*  ==>
# (let ((write-stderr (lambda (s) (foreign-call "s_write" 2 s (string-length s))))) (let ((write-errmsg (lambda (sym emsg) (begin (write-stderr "error:") (write-stderr (symbol->string sym)) (write-stderr ": ") (write-stderr emsg) (write-stderr "\n"))))) (lambda (sym emsg) (begin (write-errmsg sym emsg) (foreign-call "s_exit" 1)))))
# == uniquify-variables  ==>
# (let ((f111026 (lambda (f111027) (foreign-call "s_write" 2 f111027 (string-length f111027))))) (let ((f111035 (lambda (f111036 f111037) (begin (f111026 "error:") (f111026 (symbol->string f111036)) (f111026 ": ") (f111026 f111037) (f111026 "\n"))))) (lambda (f111040 f111041) (begin (f111035 f111040 f111041) (foreign-call "s_exit" 1)))))
# == vectorize-letrec  ==>
# (let ((f111026 (lambda (f111027) (foreign-call "s_write" 2 f111027 (string-length f111027))))) (let ((f111035 (lambda (f111036 f111037) (begin (f111026 "error:") (f111026 (symbol->string f111036)) (f111026 ": ") (f111026 f111037) (f111026 "\n"))))) (lambda (f111040 f111041) (begin (f111035 f111040 f111041) (foreign-call "s_exit" 1)))))
# == eliminate-set!  ==>
# (let ((f111026 (lambda (f111027) (let ((f111027 f111027)) (foreign-call "s_write" 2 f111027 (string-length f111027)))))) (let ((f111035 (lambda (f111036 f111037) (let ((f111036 f111036) (f111037 f111037)) (begin (f111026 "error:") (f111026 (symbol->string f111036)) (f111026 ": ") (f111026 f111037) (f111026 "\n")))))) (lambda (f111040 f111041) (let ((f111040 f111040) (f111041 f111041)) (begin (f111035 f111040 f111041) (foreign-call "s_exit" 1))))))
# == close-free-variables  ==>
# (let ((f111026 (closure (f111027) () (let ((f111027 f111027)) (foreign-call "s_write" 2 f111027 (string-length f111027)))))) (let ((f111035 (closure (f111036 f111037) (f111026 f111026 f111026 f111026 f111026) (let ((f111036 f111036) (f111037 f111037)) (begin (f111026 "error:") (f111026 (symbol->string f111036)) (f111026 ": ") (f111026 f111037) (f111026 "\n")))))) (closure (f111040 f111041) (f111035) (let ((f111040 f111040) (f111041 f111041)) (begin (f111035 f111040 f111041) (foreign-call "s_exit" 1))))))
# == eliminate-quote  ==>
# (let ((f111026 (closure (f111027) () (let ((f111027 f111027)) (foreign-call "s_write" 2 f111027 (string-length f111027)))))) (let ((f111035 (closure (f111036 f111037) (f111026 f111026 f111026 f111026 f111026) (let ((f111036 f111036) (f111037 f111037)) (begin (f111026 "error:") (f111026 (symbol->string f111036)) (f111026 ": ") (f111026 f111037) (f111026 "\n")))))) (closure (f111040 f111041) (f111035) (let ((f111040 f111040) (f111041 f111041)) (begin (f111035 f111040 f111041) (foreign-call "s_exit" 1))))))
# == eliminate-when/unless  ==>
# (let ((f111026 (closure (f111027) () (let ((f111027 f111027)) (foreign-call "s_write" 2 f111027 (string-length f111027)))))) (let ((f111035 (closure (f111036 f111037) (f111026 f111026 f111026 f111026 f111026) (let ((f111036 f111036) (f111037 f111037)) (begin (f111026 "error:") (f111026 (symbol->string f111036)) (f111026 ": ") (f111026 f111037) (f111026 "\n")))))) (closure (f111040 f111041) (f111035) (let ((f111040 f111040) (f111041 f111041)) (begin (f111035 f111040 f111041) (foreign-call "s_exit" 1))))))
# == eliminate-cond  ==>
# (let ((f111026 (closure (f111027) () (let ((f111027 f111027)) (foreign-call "s_write" 2 f111027 (string-length f111027)))))) (let ((f111035 (closure (f111036 f111037) (f111026 f111026 f111026 f111026 f111026) (let ((f111036 f111036) (f111037 f111037)) (begin (f111026 "error:") (f111026 (symbol->string f111036)) (f111026 ": ") (f111026 f111037) (f111026 "\n")))))) (closure (f111040 f111041) (f111035) (let ((f111040 f111040) (f111041 f111041)) (begin (f111035 f111040 f111041) (foreign-call "s_exit" 1))))))
# == external-symbols  ==>
# (let ((f111026 (closure (f111027) () (let ((f111027 f111027)) (foreign-call "s_write" 2 f111027 (string-length f111027)))))) (let ((f111035 (closure (f111036 f111037) (f111026 f111026 f111026 f111026 f111026) (let ((f111036 f111036) (f111037 f111037)) (begin (f111026 "error:") (f111026 (symbol->string f111036)) (f111026 ": ") (f111026 f111037) (f111026 "\n")))))) (closure (f111040 f111041) (f111035) (let ((f111040 f111040) (f111041 f111041)) (begin (f111035 f111040 f111041) (foreign-call "s_exit" 1))))))
# emit-expr (let ((f111026 (closure (f111027) () (let ((f111027 f111027)) (foreign-call "s_write" 2 f111027 (string-length f111027)))))) (let ((f111035 (closure (f111036 f111037) (f111026 f111026 f111026 f111026 f111026) (let ((f111036 f111036) (f111037 f111037)) (begin (f111026 "error:") (f111026 (symbol->string f111036)) (f111026 ": ") (f111026 f111037) (f111026 "\n")))))) (closure (f111040 f111041) (f111035) (let ((f111040 f111040) (f111041 f111041)) (begin (f111035 f111040 f111041) (foreign-call "s_exit" 1))))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f111026 (closure (f111027) () (let ((f111027 f111027)) (foreign-call "s_write" 2 f111027 (string-length f111027))))))
#  body = (let ((f111035 (closure (f111036 f111037) (f111026 f111026 f111026 f111026 f111026) (let ((f111036 f111036) (f111037 f111037)) (begin (f111026 "error:") (f111026 (symbol->string f111036)) (f111026 ": ") (f111026 f111037) (f111026 "\n")))))) (closure (f111040 f111041) (f111035) (let ((f111040 f111040) (f111041 f111041)) (begin (f111035 f111040 f111041) (foreign-call "s_exit" 1)))))
# emit-expr (closure (f111027) () (let ((f111027 f111027)) (foreign-call "s_write" 2 f111027 (string-length f111027))))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f111027) () (let ((f111027 f111027)) (foreign-call "s_write" 2 f111027 (string-length f111027))))
    movl $_L_897960, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_897961            # jump around closure body
_L_897960:
# check argument count
    cmp $4,%eax
    je _L_897962
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_897962:
# emit-tail-expr
# si=-12
# env=((f111027 . -8))
# expr=(let ((f111027 f111027)) (foreign-call "s_write" 2 f111027 (string-length f111027)))
# emit-tail-let
#  si   = -12
#  env  = ((f111027 . -8))
#  bindings = ((f111027 f111027))
#  body = (foreign-call "s_write" 2 f111027 (string-length f111027))
# emit-expr f111027
# emit-variable-ref
# env=((f111027 . -8))
# var=f111027
    movl -8(%esp), %eax  # stack load f111027
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f111027 . -12) (f111027 . -8))
# expr=(foreign-call "s_write" 2 f111027 (string-length f111027))
    movl %ecx,-16(%esp)
    movl %esp,-20(%esp)
# emit-expr (string-length f111027)
# emit-expr f111027
# emit-variable-ref
# env=((f111027 . -12) (f111027 . -8))
# var=f111027
    movl -12(%esp), %eax  # stack load f111027
# end emit-variable-ref
# check the argument is a string
    movl %eax,%ebx
    and $7, %bl
    cmp $6, %bl
    je _L_897963
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897963:
    movl -6(%eax), %eax
    movl %eax, -24(%esp)
# emit-expr f111027
# emit-variable-ref
# env=((f111027 . -12) (f111027 . -8))
# var=f111027
    movl -12(%esp), %eax  # stack load f111027
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
_L_897961:
    movl %eax, 0(%esp)  # stack save
# emit-expr (let ((f111035 (closure (f111036 f111037) (f111026 f111026 f111026 f111026 f111026) (let ((f111036 f111036) (f111037 f111037)) (begin (f111026 "error:") (f111026 (symbol->string f111036)) (f111026 ": ") (f111026 f111037) (f111026 "\n")))))) (closure (f111040 f111041) (f111035) (let ((f111040 f111040) (f111041 f111041)) (begin (f111035 f111040 f111041) (foreign-call "s_exit" 1)))))
# emit-let
#  si   = -4
#  env  = ((f111026 . 0))
#  bindings = ((f111035 (closure (f111036 f111037) (f111026 f111026 f111026 f111026 f111026) (let ((f111036 f111036) (f111037 f111037)) (begin (f111026 "error:") (f111026 (symbol->string f111036)) (f111026 ": ") (f111026 f111037) (f111026 "\n"))))))
#  body = (closure (f111040 f111041) (f111035) (let ((f111040 f111040) (f111041 f111041)) (begin (f111035 f111040 f111041) (foreign-call "s_exit" 1))))
# emit-expr (closure (f111036 f111037) (f111026 f111026 f111026 f111026 f111026) (let ((f111036 f111036) (f111037 f111037)) (begin (f111026 "error:") (f111026 (symbol->string f111036)) (f111026 ": ") (f111026 f111037) (f111026 "\n"))))
# emit-closure
# si = -4
# env = ((f111026 . 0))
# expr = (closure (f111036 f111037) (f111026 f111026 f111026 f111026 f111026) (let ((f111036 f111036) (f111037 f111037)) (begin (f111026 "error:") (f111026 (symbol->string f111036)) (f111026 ": ") (f111026 f111037) (f111026 "\n"))))
    movl $_L_897964, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f111026 . 0))
# var=f111026
    movl 0(%esp), %eax  # stack load f111026
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f111026
# emit-variable-ref
# env=((f111026 . 0))
# var=f111026
    movl 0(%esp), %eax  # stack load f111026
# end emit-variable-ref
   movl  %eax, 8(%ebp)  # f111026
# emit-variable-ref
# env=((f111026 . 0))
# var=f111026
    movl 0(%esp), %eax  # stack load f111026
# end emit-variable-ref
   movl  %eax, 12(%ebp)  # f111026
# emit-variable-ref
# env=((f111026 . 0))
# var=f111026
    movl 0(%esp), %eax  # stack load f111026
# end emit-variable-ref
   movl  %eax, 16(%ebp)  # f111026
# emit-variable-ref
# env=((f111026 . 0))
# var=f111026
    movl 0(%esp), %eax  # stack load f111026
# end emit-variable-ref
   movl  %eax, 20(%ebp)  # f111026
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $24, %ebp     # bump ebp
    jmp _L_897965            # jump around closure body
_L_897964:
# check argument count
    cmp $8,%eax
    je _L_897966
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_897966:
# emit-tail-expr
# si=-16
# env=((f111037 . -12) (f111036 . -8) (f111026 . 20) (f111026 . 16) (f111026 . 12) (f111026 . 8) (f111026 . 4) (f111026 . 0))
# expr=(let ((f111036 f111036) (f111037 f111037)) (begin (f111026 "error:") (f111026 (symbol->string f111036)) (f111026 ": ") (f111026 f111037) (f111026 "\n")))
# emit-tail-let
#  si   = -16
#  env  = ((f111037 . -12) (f111036 . -8) (f111026 . 20) (f111026 . 16) (f111026 . 12) (f111026 . 8) (f111026 . 4) (f111026 . 0))
#  bindings = ((f111036 f111036) (f111037 f111037))
#  body = (begin (f111026 "error:") (f111026 (symbol->string f111036)) (f111026 ": ") (f111026 f111037) (f111026 "\n"))
# emit-expr f111036
# emit-variable-ref
# env=((f111037 . -12) (f111036 . -8) (f111026 . 20) (f111026 . 16) (f111026 . 12) (f111026 . 8) (f111026 . 4) (f111026 . 0))
# var=f111036
    movl -8(%esp), %eax  # stack load f111036
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f111037
# emit-variable-ref
# env=((f111037 . -12) (f111036 . -8) (f111026 . 20) (f111026 . 16) (f111026 . 12) (f111026 . 8) (f111026 . 4) (f111026 . 0))
# var=f111037
    movl -12(%esp), %eax  # stack load f111037
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f111037 . -20) (f111036 . -16) (f111037 . -12) (f111036 . -8) (f111026 . 20) (f111026 . 16) (f111026 . 12) (f111026 . 8) (f111026 . 4) (f111026 . 0))
# expr=(begin (f111026 "error:") (f111026 (symbol->string f111036)) (f111026 ": ") (f111026 f111037) (f111026 "\n"))
# tail-begin (begin (f111026 "error:") (f111026 (symbol->string f111036)) (f111026 ": ") (f111026 f111037) (f111026 "\n"))
#   env=((f111037 . -20) (f111036 . -16) (f111037 . -12) (f111036 . -8) (f111026 . 20) (f111026 . 16) (f111026 . 12) (f111026 . 8) (f111026 . 4) (f111026 . 0))
# emit-expr (f111026 "error:")
# funcall
#    si   =-24
#    env  = ((f111037 . -20) (f111036 . -16) (f111037 . -12) (f111036 . -8) (f111026 . 20) (f111026 . 16) (f111026 . 12) (f111026 . 8) (f111026 . 4) (f111026 . 0))
#    expr = (funcall f111026 "error:")
# emit-expr f111026
# emit-variable-ref
# env=((f111037 . -20) (f111036 . -16) (f111037 . -12) (f111036 . -8) (f111026 . 20) (f111026 . 16) (f111026 . 12) (f111026 . 8) (f111026 . 4) (f111026 . 0))
# var=f111026
    movl 18(%edi), %eax  # frame load f111026
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_897967"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_897967":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr "error:"
# string literal
    jmp _L_897969
    .align 8,0x90
_L_897968 :
    .int 24
    .ascii "error:"
_L_897969:
    movl $_L_897968, %eax
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
# env=((f111037 . -20) (f111036 . -16) (f111037 . -12) (f111036 . -8) (f111026 . 20) (f111026 . 16) (f111026 . 12) (f111026 . 8) (f111026 . 4) (f111026 . 0))
# expr=(begin (f111026 (symbol->string f111036)) (f111026 ": ") (f111026 f111037) (f111026 "\n"))
# tail-begin (begin (f111026 (symbol->string f111036)) (f111026 ": ") (f111026 f111037) (f111026 "\n"))
#   env=((f111037 . -20) (f111036 . -16) (f111037 . -12) (f111036 . -8) (f111026 . 20) (f111026 . 16) (f111026 . 12) (f111026 . 8) (f111026 . 4) (f111026 . 0))
# emit-expr (f111026 (symbol->string f111036))
# funcall
#    si   =-24
#    env  = ((f111037 . -20) (f111036 . -16) (f111037 . -12) (f111036 . -8) (f111026 . 20) (f111026 . 16) (f111026 . 12) (f111026 . 8) (f111026 . 4) (f111026 . 0))
#    expr = (funcall f111026 (symbol->string f111036))
# emit-expr f111026
# emit-variable-ref
# env=((f111037 . -20) (f111036 . -16) (f111037 . -12) (f111036 . -8) (f111026 . 20) (f111026 . 16) (f111026 . 12) (f111026 . 8) (f111026 . 4) (f111026 . 0))
# var=f111026
    movl 18(%edi), %eax  # frame load f111026
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_897970"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_897970":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr (symbol->string f111036)
# symbol->string f111036
# emit-expr f111036
# emit-variable-ref
# env=((f111037 . -20) (f111036 . -16) (f111037 . -12) (f111036 . -8) (f111026 . 20) (f111026 . 16) (f111026 . 12) (f111026 . 8) (f111026 . 4) (f111026 . 0))
# var=f111036
    movl -16(%esp), %eax  # stack load f111036
# end emit-variable-ref
    movl -3(%eax), %eax
    mov %eax, -36(%esp)  # arg (symbol->string f111036)
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f111037 . -20) (f111036 . -16) (f111037 . -12) (f111036 . -8) (f111026 . 20) (f111026 . 16) (f111026 . 12) (f111026 . 8) (f111026 . 4) (f111026 . 0))
# expr=(begin (f111026 ": ") (f111026 f111037) (f111026 "\n"))
# tail-begin (begin (f111026 ": ") (f111026 f111037) (f111026 "\n"))
#   env=((f111037 . -20) (f111036 . -16) (f111037 . -12) (f111036 . -8) (f111026 . 20) (f111026 . 16) (f111026 . 12) (f111026 . 8) (f111026 . 4) (f111026 . 0))
# emit-expr (f111026 ": ")
# funcall
#    si   =-24
#    env  = ((f111037 . -20) (f111036 . -16) (f111037 . -12) (f111036 . -8) (f111026 . 20) (f111026 . 16) (f111026 . 12) (f111026 . 8) (f111026 . 4) (f111026 . 0))
#    expr = (funcall f111026 ": ")
# emit-expr f111026
# emit-variable-ref
# env=((f111037 . -20) (f111036 . -16) (f111037 . -12) (f111036 . -8) (f111026 . 20) (f111026 . 16) (f111026 . 12) (f111026 . 8) (f111026 . 4) (f111026 . 0))
# var=f111026
    movl 18(%edi), %eax  # frame load f111026
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_897971"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_897971":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr ": "
# string literal
    jmp _L_897973
    .align 8,0x90
_L_897972 :
    .int 8
    .ascii ": "
_L_897973:
    movl $_L_897972, %eax
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
# env=((f111037 . -20) (f111036 . -16) (f111037 . -12) (f111036 . -8) (f111026 . 20) (f111026 . 16) (f111026 . 12) (f111026 . 8) (f111026 . 4) (f111026 . 0))
# expr=(begin (f111026 f111037) (f111026 "\n"))
# tail-begin (begin (f111026 f111037) (f111026 "\n"))
#   env=((f111037 . -20) (f111036 . -16) (f111037 . -12) (f111036 . -8) (f111026 . 20) (f111026 . 16) (f111026 . 12) (f111026 . 8) (f111026 . 4) (f111026 . 0))
# emit-expr (f111026 f111037)
# funcall
#    si   =-24
#    env  = ((f111037 . -20) (f111036 . -16) (f111037 . -12) (f111036 . -8) (f111026 . 20) (f111026 . 16) (f111026 . 12) (f111026 . 8) (f111026 . 4) (f111026 . 0))
#    expr = (funcall f111026 f111037)
# emit-expr f111026
# emit-variable-ref
# env=((f111037 . -20) (f111036 . -16) (f111037 . -12) (f111036 . -8) (f111026 . 20) (f111026 . 16) (f111026 . 12) (f111026 . 8) (f111026 . 4) (f111026 . 0))
# var=f111026
    movl 18(%edi), %eax  # frame load f111026
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_897974"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_897974":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f111037
# emit-variable-ref
# env=((f111037 . -20) (f111036 . -16) (f111037 . -12) (f111036 . -8) (f111026 . 20) (f111026 . 16) (f111026 . 12) (f111026 . 8) (f111026 . 4) (f111026 . 0))
# var=f111037
    movl -20(%esp), %eax  # stack load f111037
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f111037
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f111037 . -20) (f111036 . -16) (f111037 . -12) (f111036 . -8) (f111026 . 20) (f111026 . 16) (f111026 . 12) (f111026 . 8) (f111026 . 4) (f111026 . 0))
# expr=(begin (f111026 "\n"))
# tail-begin (begin (f111026 "\n"))
#   env=((f111037 . -20) (f111036 . -16) (f111037 . -12) (f111036 . -8) (f111026 . 20) (f111026 . 16) (f111026 . 12) (f111026 . 8) (f111026 . 4) (f111026 . 0))
# emit-tail-expr
# si=-24
# env=((f111037 . -20) (f111036 . -16) (f111037 . -12) (f111036 . -8) (f111026 . 20) (f111026 . 16) (f111026 . 12) (f111026 . 8) (f111026 . 4) (f111026 . 0))
# expr=(f111026 "\n")
# emit-tail-funcall
#    si   =-24
#    env  = ((f111037 . -20) (f111036 . -16) (f111037 . -12) (f111036 . -8) (f111026 . 20) (f111026 . 16) (f111026 . 12) (f111026 . 8) (f111026 . 4) (f111026 . 0))
#    expr = (funcall f111026 "\n")
# emit-expr f111026
# emit-variable-ref
# env=((f111037 . -20) (f111036 . -16) (f111037 . -12) (f111036 . -8) (f111026 . 20) (f111026 . 16) (f111026 . 12) (f111026 . 8) (f111026 . 4) (f111026 . 0))
# var=f111026
    movl 18(%edi), %eax  # frame load f111026
# end emit-variable-ref
   movl %eax,  -24(%esp)  # stash funcall-oper in next closure slot
# emit-expr "\n"
# string literal
    jmp _L_897976
    .align 8,0x90
_L_897975 :
    .int 4
    .ascii "\n"
_L_897976:
    movl $_L_897975, %eax
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
_L_897965:
    movl %eax, -4(%esp)  # stack save
# emit-expr (closure (f111040 f111041) (f111035) (let ((f111040 f111040) (f111041 f111041)) (begin (f111035 f111040 f111041) (foreign-call "s_exit" 1))))
# emit-closure
# si = -8
# env = ((f111035 . -4) (f111026 . 0))
# expr = (closure (f111040 f111041) (f111035) (let ((f111040 f111040) (f111041 f111041)) (begin (f111035 f111040 f111041) (foreign-call "s_exit" 1))))
    movl $_L_897977, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f111035 . -4) (f111026 . 0))
# var=f111035
    movl -4(%esp), %eax  # stack load f111035
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f111035
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_897978            # jump around closure body
_L_897977:
# check argument count
    cmp $8,%eax
    je _L_897979
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_897979:
# emit-tail-expr
# si=-16
# env=((f111041 . -12) (f111040 . -8) (f111035 . 4) (f111035 . -4) (f111026 . 0))
# expr=(let ((f111040 f111040) (f111041 f111041)) (begin (f111035 f111040 f111041) (foreign-call "s_exit" 1)))
# emit-tail-let
#  si   = -16
#  env  = ((f111041 . -12) (f111040 . -8) (f111035 . 4) (f111035 . -4) (f111026 . 0))
#  bindings = ((f111040 f111040) (f111041 f111041))
#  body = (begin (f111035 f111040 f111041) (foreign-call "s_exit" 1))
# emit-expr f111040
# emit-variable-ref
# env=((f111041 . -12) (f111040 . -8) (f111035 . 4) (f111035 . -4) (f111026 . 0))
# var=f111040
    movl -8(%esp), %eax  # stack load f111040
# end emit-variable-ref
    movl %eax, -16(%esp)  # stack save
# emit-expr f111041
# emit-variable-ref
# env=((f111041 . -12) (f111040 . -8) (f111035 . 4) (f111035 . -4) (f111026 . 0))
# var=f111041
    movl -12(%esp), %eax  # stack load f111041
# end emit-variable-ref
    movl %eax, -20(%esp)  # stack save
# emit-tail-expr
# si=-24
# env=((f111041 . -20) (f111040 . -16) (f111041 . -12) (f111040 . -8) (f111035 . 4) (f111035 . -4) (f111026 . 0))
# expr=(begin (f111035 f111040 f111041) (foreign-call "s_exit" 1))
# tail-begin (begin (f111035 f111040 f111041) (foreign-call "s_exit" 1))
#   env=((f111041 . -20) (f111040 . -16) (f111041 . -12) (f111040 . -8) (f111035 . 4) (f111035 . -4) (f111026 . 0))
# emit-expr (f111035 f111040 f111041)
# funcall
#    si   =-24
#    env  = ((f111041 . -20) (f111040 . -16) (f111041 . -12) (f111040 . -8) (f111035 . 4) (f111035 . -4) (f111026 . 0))
#    expr = (funcall f111035 f111040 f111041)
# emit-expr f111035
# emit-variable-ref
# env=((f111041 . -20) (f111040 . -16) (f111041 . -12) (f111040 . -8) (f111035 . 4) (f111035 . -4) (f111026 . 0))
# var=f111035
    movl 2(%edi), %eax  # frame load f111035
# end emit-variable-ref
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_897980"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_897980":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr f111040
# emit-variable-ref
# env=((f111041 . -20) (f111040 . -16) (f111041 . -12) (f111040 . -8) (f111035 . 4) (f111035 . -4) (f111026 . 0))
# var=f111040
    movl -16(%esp), %eax  # stack load f111040
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f111040
# emit-expr f111041
# emit-variable-ref
# env=((f111041 . -20) (f111040 . -16) (f111041 . -12) (f111040 . -8) (f111035 . 4) (f111035 . -4) (f111026 . 0))
# var=f111041
    movl -20(%esp), %eax  # stack load f111041
# end emit-variable-ref
    mov %eax, -40(%esp)  # arg f111041
    movl -32(%esp), %edi   # load new closure to %edi
    add $-24, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $24, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
# emit-tail-expr
# si=-24
# env=((f111041 . -20) (f111040 . -16) (f111041 . -12) (f111040 . -8) (f111035 . 4) (f111035 . -4) (f111026 . 0))
# expr=(begin (foreign-call "s_exit" 1))
# tail-begin (begin (foreign-call "s_exit" 1))
#   env=((f111041 . -20) (f111040 . -16) (f111041 . -12) (f111040 . -8) (f111035 . 4) (f111035 . -4) (f111026 . 0))
# emit-tail-expr
# si=-24
# env=((f111041 . -20) (f111040 . -16) (f111041 . -12) (f111040 . -8) (f111035 . 4) (f111035 . -4) (f111026 . 0))
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
_L_897978:
     movl %eax, error
# == explicit-begins  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == eliminate-let*  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == uniquify-variables  ==>
# (let ((f111042 (quote ()))) (begin (set! f111042 (cons (quote procedure?) f111042)) (set! f111042 (cons (quote cdr) f111042)) (set! f111042 (cons (quote car) f111042)) (set! f111042 (cons (quote symbol-value) f111042)) (set! f111042 (cons (quote symbol->string) f111042)) (set! f111042 (cons (quote make-symbol) f111042)) (set! f111042 (cons (quote symbol?) f111042)) (set! f111042 (cons (quote string-set!) f111042)) (set! f111042 (cons (quote string-ref) f111042)) (set! f111042 (cons (quote string-length) f111042)) (set! f111042 (cons (quote string?) f111042)) (set! f111042 (cons (quote make-string) f111042)) (set! f111042 (cons (quote vector-ref) f111042)) (set! f111042 (cons (quote vector-set!) f111042)) (set! f111042 (cons (quote vector-length) f111042)) (set! f111042 (cons (quote make-vector) f111042)) (set! f111042 (cons (quote vector?) f111042)) (set! f111042 (cons (quote set-cdr!) f111042)) (set! f111042 (cons (quote set-car!) f111042)) (set! f111042 (cons (quote cdr) f111042)) (set! f111042 (cons (quote car) f111042)) (set! f111042 (cons (quote cons) f111042)) (set! f111042 (cons (quote pair?) f111042)) (set! f111042 (cons (quote fx*) f111042)) (set! f111042 (cons (quote fx-) f111042)) (set! f111042 (cons (quote fx+) f111042)) (set! f111042 (cons (quote fx>=) f111042)) (set! f111042 (cons (quote fx>) f111042)) (set! f111042 (cons (quote fx<=) f111042)) (set! f111042 (cons (quote fx<) f111042)) (set! f111042 (cons (quote fx=) f111042)) (set! f111042 (cons (quote fxzero?) f111042)) (set! f111042 (cons (quote fxsub1) f111042)) (set! f111042 (cons (quote fxadd1) f111042)) (set! f111042 (cons (quote fxlogor) f111042)) (set! f111042 (cons (quote fxlogand) f111042)) (set! f111042 (cons (quote fxlognot) f111042)) (set! f111042 (cons (quote char=?) f111042)) (set! f111042 (cons (quote eq?) f111042)) (set! f111042 (cons (quote not) f111042)) (set! f111042 (cons (quote boolean?) f111042)) (set! f111042 (cons (quote fixnum?) f111042)) (set! f111042 (cons (quote char?) f111042)) (set! f111042 (cons (quote null?) f111042)) (set! f111042 (cons (quote char->fixnum) f111042)) (set! f111042 (cons (quote fixnum->char) f111042)) (lambda () f111042)))
# == vectorize-letrec  ==>
# (let ((f111042 (quote ()))) (begin (set! f111042 (cons (quote procedure?) f111042)) (set! f111042 (cons (quote cdr) f111042)) (set! f111042 (cons (quote car) f111042)) (set! f111042 (cons (quote symbol-value) f111042)) (set! f111042 (cons (quote symbol->string) f111042)) (set! f111042 (cons (quote make-symbol) f111042)) (set! f111042 (cons (quote symbol?) f111042)) (set! f111042 (cons (quote string-set!) f111042)) (set! f111042 (cons (quote string-ref) f111042)) (set! f111042 (cons (quote string-length) f111042)) (set! f111042 (cons (quote string?) f111042)) (set! f111042 (cons (quote make-string) f111042)) (set! f111042 (cons (quote vector-ref) f111042)) (set! f111042 (cons (quote vector-set!) f111042)) (set! f111042 (cons (quote vector-length) f111042)) (set! f111042 (cons (quote make-vector) f111042)) (set! f111042 (cons (quote vector?) f111042)) (set! f111042 (cons (quote set-cdr!) f111042)) (set! f111042 (cons (quote set-car!) f111042)) (set! f111042 (cons (quote cdr) f111042)) (set! f111042 (cons (quote car) f111042)) (set! f111042 (cons (quote cons) f111042)) (set! f111042 (cons (quote pair?) f111042)) (set! f111042 (cons (quote fx*) f111042)) (set! f111042 (cons (quote fx-) f111042)) (set! f111042 (cons (quote fx+) f111042)) (set! f111042 (cons (quote fx>=) f111042)) (set! f111042 (cons (quote fx>) f111042)) (set! f111042 (cons (quote fx<=) f111042)) (set! f111042 (cons (quote fx<) f111042)) (set! f111042 (cons (quote fx=) f111042)) (set! f111042 (cons (quote fxzero?) f111042)) (set! f111042 (cons (quote fxsub1) f111042)) (set! f111042 (cons (quote fxadd1) f111042)) (set! f111042 (cons (quote fxlogor) f111042)) (set! f111042 (cons (quote fxlogand) f111042)) (set! f111042 (cons (quote fxlognot) f111042)) (set! f111042 (cons (quote char=?) f111042)) (set! f111042 (cons (quote eq?) f111042)) (set! f111042 (cons (quote not) f111042)) (set! f111042 (cons (quote boolean?) f111042)) (set! f111042 (cons (quote fixnum?) f111042)) (set! f111042 (cons (quote char?) f111042)) (set! f111042 (cons (quote null?) f111042)) (set! f111042 (cons (quote char->fixnum) f111042)) (set! f111042 (cons (quote fixnum->char) f111042)) (lambda () f111042)))
# == eliminate-set!  ==>
# (let ((f111042 (vector (quote ())))) (begin (vector-set! f111042 0 (cons (quote procedure?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote cdr) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote car) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote symbol-value) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote symbol->string) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote make-symbol) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote symbol?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote string-set!) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote string-ref) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote string-length) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote string?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote make-string) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote vector-ref) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote vector-set!) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote vector-length) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote make-vector) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote vector?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote set-cdr!) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote set-car!) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote cdr) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote car) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote cons) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote pair?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx*) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx-) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx+) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx>=) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx>) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx<=) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx<) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx=) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fxzero?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fxsub1) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fxadd1) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fxlogor) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fxlogand) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fxlognot) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote char=?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote eq?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote not) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote boolean?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fixnum?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote char?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote null?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote char->fixnum) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fixnum->char) (vector-ref f111042 0))) (lambda () (let () (vector-ref f111042 0)))))
# == close-free-variables  ==>
# (let ((f111042 (vector (quote ())))) (begin (vector-set! f111042 0 (cons (quote procedure?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote cdr) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote car) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote symbol-value) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote symbol->string) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote make-symbol) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote symbol?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote string-set!) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote string-ref) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote string-length) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote string?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote make-string) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote vector-ref) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote vector-set!) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote vector-length) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote make-vector) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote vector?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote set-cdr!) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote set-car!) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote cdr) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote car) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote cons) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote pair?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx*) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx-) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx+) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx>=) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx>) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx<=) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx<) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx=) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fxzero?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fxsub1) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fxadd1) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fxlogor) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fxlogand) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fxlognot) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote char=?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote eq?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote not) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote boolean?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fixnum?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote char?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote null?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote char->fixnum) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fixnum->char) (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0)))))
# == eliminate-quote  ==>
# (let ((f111042 (vector ()))) (begin (vector-set! f111042 0 (cons (string->symbol "procedure?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "symbol-value") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0)))))
# == eliminate-when/unless  ==>
# (let ((f111042 (vector ()))) (begin (vector-set! f111042 0 (cons (string->symbol "procedure?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "symbol-value") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0)))))
# == eliminate-cond  ==>
# (let ((f111042 (vector ()))) (begin (vector-set! f111042 0 (cons (string->symbol "procedure?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "symbol-value") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0)))))
# == external-symbols  ==>
# (let ((f111042 ((primitive-ref vector) ()))) (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0)))))
# emit-expr (let ((f111042 ((primitive-ref vector) ()))) (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0)))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f111042 ((primitive-ref vector) ())))
#  body = (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
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
    je "_L_897981"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_897981":
   movl %eax,  -8(%esp)  # stash funcall-oper in closure slot
# emit-expr ()
    movl $63, %eax     # immed ()
    mov %eax, -12(%esp)  # arg ()
    movl -8(%esp), %edi   # load new closure to %edi
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_897982
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897982:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897983"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897983:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_897985
    cmp  $0,%eax
    jge _L_897984
_L_897985:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_897984:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "procedure?") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "procedure?")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "procedure?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_897986"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_897986":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "procedure?"
# string literal
    jmp _L_897988
    .align 8,0x90
_L_897987 :
    .int 40
    .ascii "procedure?"
_L_897988:
    movl $_L_897987, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg procedure?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_897989
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897989:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897990"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897990:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_897992
    cmp  $0,%eax
    jge _L_897991
_L_897992:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_897991:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_897993
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897993:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_897994"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_897994:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_897996
    cmp  $0,%eax
    jge _L_897995
_L_897996:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_897995:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "cdr") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "cdr")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cdr")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_897997"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_897997":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_897999
    .align 8,0x90
_L_897998 :
    .int 12
    .ascii "cdr"
_L_897999:
    movl $_L_897998, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cdr
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898000
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898000:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898001"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898001:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898003
    cmp  $0,%eax
    jge _L_898002
_L_898003:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898002:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898004
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898004:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898005"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898005:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898007
    cmp  $0,%eax
    jge _L_898006
_L_898007:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898006:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "car") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "car")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "car")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898008"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898008":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_898010
    .align 8,0x90
_L_898009 :
    .int 12
    .ascii "car"
_L_898010:
    movl $_L_898009, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg car
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898011
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898011:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898012"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898012:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898014
    cmp  $0,%eax
    jge _L_898013
_L_898014:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898013:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898015
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898015:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898016"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898016:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898018
    cmp  $0,%eax
    jge _L_898017
_L_898018:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898017:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "symbol-value") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "symbol-value")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol-value")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898019"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898019":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol-value"
# string literal
    jmp _L_898021
    .align 8,0x90
_L_898020 :
    .int 48
    .ascii "symbol-value"
_L_898021:
    movl $_L_898020, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol-value
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898022
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898022:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898023"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898023:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898025
    cmp  $0,%eax
    jge _L_898024
_L_898025:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898024:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898026
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898026:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898027"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898027:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898029
    cmp  $0,%eax
    jge _L_898028
_L_898029:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898028:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "symbol->string") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "symbol->string")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol->string")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898030"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898030":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol->string"
# string literal
    jmp _L_898032
    .align 8,0x90
_L_898031 :
    .int 56
    .ascii "symbol->string"
_L_898032:
    movl $_L_898031, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol->string
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898033
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898033:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898034"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898034:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898036
    cmp  $0,%eax
    jge _L_898035
_L_898036:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898035:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898037
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898037:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898038"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898038:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898040
    cmp  $0,%eax
    jge _L_898039
_L_898040:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898039:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "make-symbol") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "make-symbol")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-symbol")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898041"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898041":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-symbol"
# string literal
    jmp _L_898043
    .align 8,0x90
_L_898042 :
    .int 44
    .ascii "make-symbol"
_L_898043:
    movl $_L_898042, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-symbol
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898044
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898044:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898045"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898045:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898047
    cmp  $0,%eax
    jge _L_898046
_L_898047:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898046:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898048
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898048:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898049"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898049:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898051
    cmp  $0,%eax
    jge _L_898050
_L_898051:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898050:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "symbol?") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "symbol?")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "symbol?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898052"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898052":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol?"
# string literal
    jmp _L_898054
    .align 8,0x90
_L_898053 :
    .int 28
    .ascii "symbol?"
_L_898054:
    movl $_L_898053, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg symbol?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898055
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898055:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898056"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898056:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898058
    cmp  $0,%eax
    jge _L_898057
_L_898058:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898057:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898059
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898059:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898060"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898060:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898062
    cmp  $0,%eax
    jge _L_898061
_L_898062:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898061:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "string-set!") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "string-set!")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-set!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898063"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898063":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-set!"
# string literal
    jmp _L_898065
    .align 8,0x90
_L_898064 :
    .int 44
    .ascii "string-set!"
_L_898065:
    movl $_L_898064, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-set!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898066
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898066:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898067"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898067:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898069
    cmp  $0,%eax
    jge _L_898068
_L_898069:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898068:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898070
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898070:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898071"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898071:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898073
    cmp  $0,%eax
    jge _L_898072
_L_898073:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898072:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "string-ref") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "string-ref")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-ref")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898074"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898074":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-ref"
# string literal
    jmp _L_898076
    .align 8,0x90
_L_898075 :
    .int 40
    .ascii "string-ref"
_L_898076:
    movl $_L_898075, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-ref
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898077
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898077:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898078"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898078:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898080
    cmp  $0,%eax
    jge _L_898079
_L_898080:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898079:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898081
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898081:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898082"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898082:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898084
    cmp  $0,%eax
    jge _L_898083
_L_898084:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898083:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "string-length") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "string-length")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string-length")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898085"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898085":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-length"
# string literal
    jmp _L_898087
    .align 8,0x90
_L_898086 :
    .int 52
    .ascii "string-length"
_L_898087:
    movl $_L_898086, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string-length
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898088
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898088:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898089"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898089:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898091
    cmp  $0,%eax
    jge _L_898090
_L_898091:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898090:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898092
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898092:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898093"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898093:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898095
    cmp  $0,%eax
    jge _L_898094
_L_898095:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898094:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "string?") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "string?")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "string?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898096"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898096":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string?"
# string literal
    jmp _L_898098
    .align 8,0x90
_L_898097 :
    .int 28
    .ascii "string?"
_L_898098:
    movl $_L_898097, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg string?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898099
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898099:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898100"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898100:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898102
    cmp  $0,%eax
    jge _L_898101
_L_898102:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898101:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898103
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898103:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898104"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898104:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898106
    cmp  $0,%eax
    jge _L_898105
_L_898106:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898105:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "make-string") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "make-string")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-string")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898107"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898107":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-string"
# string literal
    jmp _L_898109
    .align 8,0x90
_L_898108 :
    .int 44
    .ascii "make-string"
_L_898109:
    movl $_L_898108, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-string
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898110
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898110:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898111"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898111:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898113
    cmp  $0,%eax
    jge _L_898112
_L_898113:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898112:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898114
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898114:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898115"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898115:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898117
    cmp  $0,%eax
    jge _L_898116
_L_898117:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898116:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "vector-ref") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "vector-ref")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-ref")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898118"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898118":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-ref"
# string literal
    jmp _L_898120
    .align 8,0x90
_L_898119 :
    .int 40
    .ascii "vector-ref"
_L_898120:
    movl $_L_898119, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-ref
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898121
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898121:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898122"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898122:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898124
    cmp  $0,%eax
    jge _L_898123
_L_898124:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898123:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898125
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898125:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898126"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898126:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898128
    cmp  $0,%eax
    jge _L_898127
_L_898128:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898127:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "vector-set!") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "vector-set!")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-set!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898129"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898129":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-set!"
# string literal
    jmp _L_898131
    .align 8,0x90
_L_898130 :
    .int 44
    .ascii "vector-set!"
_L_898131:
    movl $_L_898130, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-set!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898132
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898132:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898133"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898133:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898135
    cmp  $0,%eax
    jge _L_898134
_L_898135:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898134:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898136
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898136:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898137"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898137:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898139
    cmp  $0,%eax
    jge _L_898138
_L_898139:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898138:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "vector-length") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "vector-length")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector-length")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898140"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898140":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-length"
# string literal
    jmp _L_898142
    .align 8,0x90
_L_898141 :
    .int 52
    .ascii "vector-length"
_L_898142:
    movl $_L_898141, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector-length
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898143
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898143:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898144"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898144:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898146
    cmp  $0,%eax
    jge _L_898145
_L_898146:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898145:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898147
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898147:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898148"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898148:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898150
    cmp  $0,%eax
    jge _L_898149
_L_898150:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898149:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "make-vector") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "make-vector")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "make-vector")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898151"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898151":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-vector"
# string literal
    jmp _L_898153
    .align 8,0x90
_L_898152 :
    .int 44
    .ascii "make-vector"
_L_898153:
    movl $_L_898152, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg make-vector
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898154
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898154:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898155"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898155:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898157
    cmp  $0,%eax
    jge _L_898156
_L_898157:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898156:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898158
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898158:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898159"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898159:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898161
    cmp  $0,%eax
    jge _L_898160
_L_898161:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898160:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "vector?") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "vector?")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "vector?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898162"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898162":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector?"
# string literal
    jmp _L_898164
    .align 8,0x90
_L_898163 :
    .int 28
    .ascii "vector?"
_L_898164:
    movl $_L_898163, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg vector?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898165
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898165:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898166"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898166:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898168
    cmp  $0,%eax
    jge _L_898167
_L_898168:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898167:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898169
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898169:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898170"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898170:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898172
    cmp  $0,%eax
    jge _L_898171
_L_898172:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898171:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "set-cdr!") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "set-cdr!")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "set-cdr!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898173"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898173":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-cdr!"
# string literal
    jmp _L_898175
    .align 8,0x90
_L_898174 :
    .int 32
    .ascii "set-cdr!"
_L_898175:
    movl $_L_898174, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg set-cdr!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898176
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898176:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898177"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898177:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898179
    cmp  $0,%eax
    jge _L_898178
_L_898179:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898178:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898180
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898180:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898181"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898181:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898183
    cmp  $0,%eax
    jge _L_898182
_L_898183:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898182:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "set-car!") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "set-car!")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "set-car!")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898184"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898184":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-car!"
# string literal
    jmp _L_898186
    .align 8,0x90
_L_898185 :
    .int 32
    .ascii "set-car!"
_L_898186:
    movl $_L_898185, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg set-car!
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898187
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898187:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898188"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898188:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898190
    cmp  $0,%eax
    jge _L_898189
_L_898190:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898189:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898191
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898191:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898192"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898192:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898194
    cmp  $0,%eax
    jge _L_898193
_L_898194:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898193:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "cdr") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "cdr")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cdr")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898195"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898195":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_898197
    .align 8,0x90
_L_898196 :
    .int 12
    .ascii "cdr"
_L_898197:
    movl $_L_898196, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cdr
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898198
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898198:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898199"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898199:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898201
    cmp  $0,%eax
    jge _L_898200
_L_898201:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898200:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898202
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898202:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898203"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898203:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898205
    cmp  $0,%eax
    jge _L_898204
_L_898205:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898204:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "car") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "car")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "car")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898206"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898206":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_898208
    .align 8,0x90
_L_898207 :
    .int 12
    .ascii "car"
_L_898208:
    movl $_L_898207, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg car
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898209
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898209:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898210"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898210:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898212
    cmp  $0,%eax
    jge _L_898211
_L_898212:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898211:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898213
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898213:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898214"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898214:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898216
    cmp  $0,%eax
    jge _L_898215
_L_898216:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898215:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "cons") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "cons")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "cons")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898217"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898217":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cons"
# string literal
    jmp _L_898219
    .align 8,0x90
_L_898218 :
    .int 16
    .ascii "cons"
_L_898219:
    movl $_L_898218, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg cons
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898220
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898220:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898221"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898221:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898223
    cmp  $0,%eax
    jge _L_898222
_L_898223:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898222:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898224
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898224:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898225"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898225:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898227
    cmp  $0,%eax
    jge _L_898226
_L_898227:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898226:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "pair?") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "pair?")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "pair?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898228"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898228":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "pair?"
# string literal
    jmp _L_898230
    .align 8,0x90
_L_898229 :
    .int 20
    .ascii "pair?"
_L_898230:
    movl $_L_898229, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg pair?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898231
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898231:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898232"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898232:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898234
    cmp  $0,%eax
    jge _L_898233
_L_898234:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898233:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898235
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898235:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898236"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898236:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898238
    cmp  $0,%eax
    jge _L_898237
_L_898238:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898237:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "fx*") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "fx*")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx*")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898239"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898239":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx*"
# string literal
    jmp _L_898241
    .align 8,0x90
_L_898240 :
    .int 12
    .ascii "fx*"
_L_898241:
    movl $_L_898240, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx*
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898242
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898242:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898243"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898243:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898245
    cmp  $0,%eax
    jge _L_898244
_L_898245:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898244:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898246
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898246:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898247"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898247:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898249
    cmp  $0,%eax
    jge _L_898248
_L_898249:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898248:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "fx-") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "fx-")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx-")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898250"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898250":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx-"
# string literal
    jmp _L_898252
    .align 8,0x90
_L_898251 :
    .int 12
    .ascii "fx-"
_L_898252:
    movl $_L_898251, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx-
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898253
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898253:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898254"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898254:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898256
    cmp  $0,%eax
    jge _L_898255
_L_898256:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898255:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898257
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898257:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898258"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898258:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898260
    cmp  $0,%eax
    jge _L_898259
_L_898260:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898259:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "fx+") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "fx+")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx+")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898261"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898261":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx+"
# string literal
    jmp _L_898263
    .align 8,0x90
_L_898262 :
    .int 12
    .ascii "fx+"
_L_898263:
    movl $_L_898262, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx+
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898264
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898264:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898265"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898265:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898267
    cmp  $0,%eax
    jge _L_898266
_L_898267:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898266:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898268
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898268:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898269"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898269:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898271
    cmp  $0,%eax
    jge _L_898270
_L_898271:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898270:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "fx>=") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "fx>=")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx>=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898272"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898272":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>="
# string literal
    jmp _L_898274
    .align 8,0x90
_L_898273 :
    .int 16
    .ascii "fx>="
_L_898274:
    movl $_L_898273, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx>=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898275
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898275:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898276"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898276:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898278
    cmp  $0,%eax
    jge _L_898277
_L_898278:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898277:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898279
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898279:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898280"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898280:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898282
    cmp  $0,%eax
    jge _L_898281
_L_898282:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898281:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "fx>") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "fx>")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx>")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898283"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898283":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>"
# string literal
    jmp _L_898285
    .align 8,0x90
_L_898284 :
    .int 12
    .ascii "fx>"
_L_898285:
    movl $_L_898284, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx>
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898286
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898286:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898287"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898287:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898289
    cmp  $0,%eax
    jge _L_898288
_L_898289:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898288:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898290
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898290:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898291"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898291:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898293
    cmp  $0,%eax
    jge _L_898292
_L_898293:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898292:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "fx<=") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "fx<=")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx<=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898294"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898294":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<="
# string literal
    jmp _L_898296
    .align 8,0x90
_L_898295 :
    .int 16
    .ascii "fx<="
_L_898296:
    movl $_L_898295, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx<=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898297
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898297:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898298"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898298:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898300
    cmp  $0,%eax
    jge _L_898299
_L_898300:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898299:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898301
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898301:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898302"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898302:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898304
    cmp  $0,%eax
    jge _L_898303
_L_898304:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898303:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "fx<") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "fx<")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx<")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898305"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898305":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<"
# string literal
    jmp _L_898307
    .align 8,0x90
_L_898306 :
    .int 12
    .ascii "fx<"
_L_898307:
    movl $_L_898306, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx<
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898308
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898308:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898309"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898309:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898311
    cmp  $0,%eax
    jge _L_898310
_L_898311:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898310:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898312
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898312:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898313"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898313:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898315
    cmp  $0,%eax
    jge _L_898314
_L_898315:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898314:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "fx=") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "fx=")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fx=")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898316"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898316":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx="
# string literal
    jmp _L_898318
    .align 8,0x90
_L_898317 :
    .int 12
    .ascii "fx="
_L_898318:
    movl $_L_898317, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fx=
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898319
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898319:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898320"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898320:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898322
    cmp  $0,%eax
    jge _L_898321
_L_898322:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898321:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898323
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898323:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898324"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898324:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898326
    cmp  $0,%eax
    jge _L_898325
_L_898326:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898325:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "fxzero?") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "fxzero?")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxzero?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898327"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898327":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxzero?"
# string literal
    jmp _L_898329
    .align 8,0x90
_L_898328 :
    .int 28
    .ascii "fxzero?"
_L_898329:
    movl $_L_898328, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxzero?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898330
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898330:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898331"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898331:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898333
    cmp  $0,%eax
    jge _L_898332
_L_898333:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898332:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898334
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898334:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898335"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898335:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898337
    cmp  $0,%eax
    jge _L_898336
_L_898337:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898336:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "fxsub1") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "fxsub1")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxsub1")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898338"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898338":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxsub1"
# string literal
    jmp _L_898340
    .align 8,0x90
_L_898339 :
    .int 24
    .ascii "fxsub1"
_L_898340:
    movl $_L_898339, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxsub1
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898341
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898341:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898342"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898342:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898344
    cmp  $0,%eax
    jge _L_898343
_L_898344:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898343:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898345
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898345:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898346"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898346:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898348
    cmp  $0,%eax
    jge _L_898347
_L_898348:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898347:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "fxadd1") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "fxadd1")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxadd1")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898349"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898349":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxadd1"
# string literal
    jmp _L_898351
    .align 8,0x90
_L_898350 :
    .int 24
    .ascii "fxadd1"
_L_898351:
    movl $_L_898350, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxadd1
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898352
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898352:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898353"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898353:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898355
    cmp  $0,%eax
    jge _L_898354
_L_898355:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898354:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898356
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898356:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898357"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898357:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898359
    cmp  $0,%eax
    jge _L_898358
_L_898359:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898358:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "fxlogor") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "fxlogor")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlogor")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898360"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898360":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogor"
# string literal
    jmp _L_898362
    .align 8,0x90
_L_898361 :
    .int 28
    .ascii "fxlogor"
_L_898362:
    movl $_L_898361, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlogor
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898363
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898363:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898364"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898364:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898366
    cmp  $0,%eax
    jge _L_898365
_L_898366:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898365:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898367
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898367:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898368"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898368:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898370
    cmp  $0,%eax
    jge _L_898369
_L_898370:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898369:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "fxlogand") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "fxlogand")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlogand")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898371"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898371":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogand"
# string literal
    jmp _L_898373
    .align 8,0x90
_L_898372 :
    .int 32
    .ascii "fxlogand"
_L_898373:
    movl $_L_898372, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlogand
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898374
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898374:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898375"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898375:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898377
    cmp  $0,%eax
    jge _L_898376
_L_898377:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898376:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898378
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898378:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898379"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898379:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898381
    cmp  $0,%eax
    jge _L_898380
_L_898381:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898380:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "fxlognot") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "fxlognot")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxlognot")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898382"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898382":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlognot"
# string literal
    jmp _L_898384
    .align 8,0x90
_L_898383 :
    .int 32
    .ascii "fxlognot"
_L_898384:
    movl $_L_898383, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxlognot
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898385
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898385:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898386"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898386:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898388
    cmp  $0,%eax
    jge _L_898387
_L_898388:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898387:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898389
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898389:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898390"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898390:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898392
    cmp  $0,%eax
    jge _L_898391
_L_898392:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898391:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "char=?") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "char=?")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char=?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898393"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898393":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char=?"
# string literal
    jmp _L_898395
    .align 8,0x90
_L_898394 :
    .int 24
    .ascii "char=?"
_L_898395:
    movl $_L_898394, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char=?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898396
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898396:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898397"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898397:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898399
    cmp  $0,%eax
    jge _L_898398
_L_898399:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898398:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898400
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898400:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898401"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898401:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898403
    cmp  $0,%eax
    jge _L_898402
_L_898403:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898402:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "eq?") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "eq?")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "eq?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898404"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898404":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "eq?"
# string literal
    jmp _L_898406
    .align 8,0x90
_L_898405 :
    .int 12
    .ascii "eq?"
_L_898406:
    movl $_L_898405, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg eq?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898407
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898407:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898408"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898408:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898410
    cmp  $0,%eax
    jge _L_898409
_L_898410:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898409:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898411
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898411:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898412"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898412:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898414
    cmp  $0,%eax
    jge _L_898413
_L_898414:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898413:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "not") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "not")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "not")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898415"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898415":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "not"
# string literal
    jmp _L_898417
    .align 8,0x90
_L_898416 :
    .int 12
    .ascii "not"
_L_898417:
    movl $_L_898416, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg not
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898418
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898418:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898419"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898419:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898421
    cmp  $0,%eax
    jge _L_898420
_L_898421:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898420:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898422
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898422:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898423"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898423:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898425
    cmp  $0,%eax
    jge _L_898424
_L_898425:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898424:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "boolean?") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "boolean?")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "boolean?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898426"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898426":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "boolean?"
# string literal
    jmp _L_898428
    .align 8,0x90
_L_898427 :
    .int 32
    .ascii "boolean?"
_L_898428:
    movl $_L_898427, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg boolean?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898429
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898429:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898430"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898430:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898432
    cmp  $0,%eax
    jge _L_898431
_L_898432:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898431:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898433
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898433:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898434"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898434:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898436
    cmp  $0,%eax
    jge _L_898435
_L_898436:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898435:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "fixnum?") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "fixnum?")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fixnum?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898437"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898437":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum?"
# string literal
    jmp _L_898439
    .align 8,0x90
_L_898438 :
    .int 28
    .ascii "fixnum?"
_L_898439:
    movl $_L_898438, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fixnum?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898440
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898440:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898441"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898441:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898443
    cmp  $0,%eax
    jge _L_898442
_L_898443:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898442:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898444
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898444:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898445"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898445:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898447
    cmp  $0,%eax
    jge _L_898446
_L_898447:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898446:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "char?") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "char?")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898448"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898448":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char?"
# string literal
    jmp _L_898450
    .align 8,0x90
_L_898449 :
    .int 20
    .ascii "char?"
_L_898450:
    movl $_L_898449, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898451
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898451:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898452"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898452:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898454
    cmp  $0,%eax
    jge _L_898453
_L_898454:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898453:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898455
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898455:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898456"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898456:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898458
    cmp  $0,%eax
    jge _L_898457
_L_898458:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898457:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "null?") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "null?")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "null?")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898459"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898459":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "null?"
# string literal
    jmp _L_898461
    .align 8,0x90
_L_898460 :
    .int 20
    .ascii "null?"
_L_898461:
    movl $_L_898460, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg null?
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898462
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898462:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898463"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898463:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898465
    cmp  $0,%eax
    jge _L_898464
_L_898465:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898464:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898466
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898466:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898467"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898467:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898469
    cmp  $0,%eax
    jge _L_898468
_L_898469:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898468:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "char->fixnum") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "char->fixnum")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "char->fixnum")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898470"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898470":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char->fixnum"
# string literal
    jmp _L_898472
    .align 8,0x90
_L_898471 :
    .int 48
    .ascii "char->fixnum"
_L_898472:
    movl $_L_898471, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg char->fixnum
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898473
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898473:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898474"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898474:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898476
    cmp  $0,%eax
    jge _L_898475
_L_898476:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898475:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0)))
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898477
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898477:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898478"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898478:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898480
    cmp  $0,%eax
    jge _L_898479
_L_898480:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898479:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "fixnum->char") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "fixnum->char")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fixnum->char")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898481"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898481":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum->char"
# string literal
    jmp _L_898483
    .align 8,0x90
_L_898482 :
    .int 48
    .ascii "fixnum->char"
_L_898483:
    movl $_L_898482, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fixnum->char
    movl -20(%esp), %edi   # load new closure to %edi
    add $-12, %esp   # adjust base
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $12, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, -12(%esp)
# emit-expr (vector-ref f111042 0)
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898484
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898484:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898485"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898485:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898487
    cmp  $0,%eax
    jge _L_898486
_L_898487:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898486:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (closure () (f111042) (let () (vector-ref f111042 0)))
# emit-closure
# si = -4
# env = ((f111042 . 0))
# expr = (closure () (f111042) (let () (vector-ref f111042 0)))
    movl $_L_898488, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f111042
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_898489            # jump around closure body
_L_898488:
# check argument count
    cmp $0,%eax
    je _L_898490
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_898490:
# emit-tail-expr
# si=-8
# env=((f111042 . 4) (f111042 . 0))
# expr=(let () (vector-ref f111042 0))
# emit-tail-let
#  si   = -8
#  env  = ((f111042 . 4) (f111042 . 0))
#  bindings = ()
#  body = (vector-ref f111042 0)
# emit-tail-expr
# si=-8
# env=((f111042 . 4) (f111042 . 0))
# expr=(vector-ref f111042 0)
# tail primcall
# emit-expr f111042
# emit-variable-ref
# env=((f111042 . 4) (f111042 . 0))
# var=f111042
    movl 2(%edi), %eax  # frame load f111042
# end emit-variable-ref
# check the argument is a vector
    movl %eax,%ebx
    and $7, %bl
    cmp $5, %bl
    je _L_898491
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898491:
    movl %eax, -8(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_898492"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_898492:
# check bounds on vector index
    movl -8(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_898494
    cmp  $0,%eax
    jge _L_898493
_L_898494:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $132,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_898493:
    movl -8(%esp), %esi
    movl -1(%eax,%esi), %eax
#return from tail (vector-ref f111042 0)
    ret
    .align 4,0x90
_L_898489:
# emit-expr (begin)
# emit-begin
#   expr=(begin)
#   env=((f111042 . 0))
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
    movl $_L_898495, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_898496            # jump around closure body
_L_898495:
# check argument count
    cmp $0,%eax
    je _L_898497
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_898497:
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
    je "_L_898498"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898498":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_898500
    .align 8,0x90
_L_898499 :
    .int 28
    .ascii "funcall"
_L_898500:
    movl $_L_898499, %eax
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
    jmp _L_898502
    .align 8,0x90
_L_898501 :
    .int 100
    .ascii "arg 1 must be a procedure"
_L_898502:
    movl $_L_898501, %eax
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
_L_898496:
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
    movl $_L_898503, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_898504            # jump around closure body
_L_898503:
# check argument count
    cmp $0,%eax
    je _L_898505
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_898505:
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
    je "_L_898506"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898506":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_898508
    .align 8,0x90
_L_898507 :
    .int 28
    .ascii "funcall"
_L_898508:
    movl $_L_898507, %eax
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
    jmp _L_898510
    .align 8,0x90
_L_898509 :
    .int 80
    .ascii "wrong number of args"
_L_898510:
    movl $_L_898509, %eax
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
_L_898504:
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
    movl $_L_898511, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_898512            # jump around closure body
_L_898511:
# check argument count
    cmp $0,%eax
    je _L_898513
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_898513:
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
    je "_L_898514"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898514":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_898516
    .align 8,0x90
_L_898515 :
    .int 28
    .ascii "funcall"
_L_898516:
    movl $_L_898515, %eax
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
    jmp _L_898518
    .align 8,0x90
_L_898517 :
    .int 48
    .ascii "too few args"
_L_898518:
    movl $_L_898517, %eax
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
_L_898512:
     movl %eax, eh$uargcount$umin
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a fixnum"))
# == uniquify-variables  ==>
# (lambda (f111043) (error (list-ref (primitives) f111043) "arg must be a fixnum"))
# == vectorize-letrec  ==>
# (lambda (f111043) (error (list-ref (primitives) f111043) "arg must be a fixnum"))
# == eliminate-set!  ==>
# (lambda (f111043) (let ((f111043 f111043)) (error (list-ref (primitives) f111043) "arg must be a fixnum")))
# == close-free-variables  ==>
# (closure (f111043) (error list-ref primitives) (let ((f111043 f111043)) (error (list-ref (primitives) f111043) "arg must be a fixnum")))
# == eliminate-quote  ==>
# (closure (f111043) (error list-ref primitives) (let ((f111043 f111043)) (error (list-ref (primitives) f111043) "arg must be a fixnum")))
# == eliminate-when/unless  ==>
# (closure (f111043) (error list-ref primitives) (let ((f111043 f111043)) (error (list-ref (primitives) f111043) "arg must be a fixnum")))
# == eliminate-cond  ==>
# (closure (f111043) (error list-ref primitives) (let ((f111043 f111043)) (error (list-ref (primitives) f111043) "arg must be a fixnum")))
# == external-symbols  ==>
# (closure (f111043) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f111043 f111043)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111043) "arg must be a fixnum")))
# emit-expr (closure (f111043) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f111043 f111043)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111043) "arg must be a fixnum")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f111043) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f111043 f111043)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111043) "arg must be a fixnum")))
    movl $_L_898519, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_898520            # jump around closure body
_L_898519:
# check argument count
    cmp $4,%eax
    je _L_898521
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_898521:
# emit-tail-expr
# si=-12
# env=((f111043 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f111043 f111043)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111043) "arg must be a fixnum"))
# emit-tail-let
#  si   = -12
#  env  = ((f111043 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f111043 f111043))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111043) "arg must be a fixnum")
# emit-expr f111043
# emit-variable-ref
# env=((f111043 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f111043
    movl -8(%esp), %eax  # stack load f111043
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f111043 . -12) (f111043 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111043) "arg must be a fixnum")
# emit-tail-funcall
#    si   =-16
#    env  = ((f111043 . -12) (f111043 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111043) "arg must be a fixnum")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f111043)
# funcall
#    si   =-20
#    env  = ((f111043 . -12) (f111043 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f111043)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898522"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898522":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f111043 . -12) (f111043 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898523"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898523":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f111043
# emit-variable-ref
# env=((f111043 . -12) (f111043 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f111043
    movl -12(%esp), %eax  # stack load f111043
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f111043
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f111043)
# emit-expr "arg must be a fixnum"
# string literal
    jmp _L_898525
    .align 8,0x90
_L_898524 :
    .int 80
    .ascii "arg must be a fixnum"
_L_898525:
    movl $_L_898524, %eax
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
_L_898520:
     movl %eax, eh$ufixnum
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a string"))
# == uniquify-variables  ==>
# (lambda (f111044) (error (list-ref (primitives) f111044) "arg must be a string"))
# == vectorize-letrec  ==>
# (lambda (f111044) (error (list-ref (primitives) f111044) "arg must be a string"))
# == eliminate-set!  ==>
# (lambda (f111044) (let ((f111044 f111044)) (error (list-ref (primitives) f111044) "arg must be a string")))
# == close-free-variables  ==>
# (closure (f111044) (error list-ref primitives) (let ((f111044 f111044)) (error (list-ref (primitives) f111044) "arg must be a string")))
# == eliminate-quote  ==>
# (closure (f111044) (error list-ref primitives) (let ((f111044 f111044)) (error (list-ref (primitives) f111044) "arg must be a string")))
# == eliminate-when/unless  ==>
# (closure (f111044) (error list-ref primitives) (let ((f111044 f111044)) (error (list-ref (primitives) f111044) "arg must be a string")))
# == eliminate-cond  ==>
# (closure (f111044) (error list-ref primitives) (let ((f111044 f111044)) (error (list-ref (primitives) f111044) "arg must be a string")))
# == external-symbols  ==>
# (closure (f111044) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f111044 f111044)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111044) "arg must be a string")))
# emit-expr (closure (f111044) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f111044 f111044)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111044) "arg must be a string")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f111044) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f111044 f111044)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111044) "arg must be a string")))
    movl $_L_898526, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_898527            # jump around closure body
_L_898526:
# check argument count
    cmp $4,%eax
    je _L_898528
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_898528:
# emit-tail-expr
# si=-12
# env=((f111044 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f111044 f111044)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111044) "arg must be a string"))
# emit-tail-let
#  si   = -12
#  env  = ((f111044 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f111044 f111044))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111044) "arg must be a string")
# emit-expr f111044
# emit-variable-ref
# env=((f111044 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f111044
    movl -8(%esp), %eax  # stack load f111044
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f111044 . -12) (f111044 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111044) "arg must be a string")
# emit-tail-funcall
#    si   =-16
#    env  = ((f111044 . -12) (f111044 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111044) "arg must be a string")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f111044)
# funcall
#    si   =-20
#    env  = ((f111044 . -12) (f111044 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f111044)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898529"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898529":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f111044 . -12) (f111044 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898530"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898530":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f111044
# emit-variable-ref
# env=((f111044 . -12) (f111044 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f111044
    movl -12(%esp), %eax  # stack load f111044
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f111044
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f111044)
# emit-expr "arg must be a string"
# string literal
    jmp _L_898532
    .align 8,0x90
_L_898531 :
    .int 80
    .ascii "arg must be a string"
_L_898532:
    movl $_L_898531, %eax
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
_L_898527:
     movl %eax, eh$ustring
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a character"))
# == uniquify-variables  ==>
# (lambda (f111045) (error (list-ref (primitives) f111045) "arg must be a character"))
# == vectorize-letrec  ==>
# (lambda (f111045) (error (list-ref (primitives) f111045) "arg must be a character"))
# == eliminate-set!  ==>
# (lambda (f111045) (let ((f111045 f111045)) (error (list-ref (primitives) f111045) "arg must be a character")))
# == close-free-variables  ==>
# (closure (f111045) (error list-ref primitives) (let ((f111045 f111045)) (error (list-ref (primitives) f111045) "arg must be a character")))
# == eliminate-quote  ==>
# (closure (f111045) (error list-ref primitives) (let ((f111045 f111045)) (error (list-ref (primitives) f111045) "arg must be a character")))
# == eliminate-when/unless  ==>
# (closure (f111045) (error list-ref primitives) (let ((f111045 f111045)) (error (list-ref (primitives) f111045) "arg must be a character")))
# == eliminate-cond  ==>
# (closure (f111045) (error list-ref primitives) (let ((f111045 f111045)) (error (list-ref (primitives) f111045) "arg must be a character")))
# == external-symbols  ==>
# (closure (f111045) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f111045 f111045)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111045) "arg must be a character")))
# emit-expr (closure (f111045) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f111045 f111045)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111045) "arg must be a character")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f111045) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f111045 f111045)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111045) "arg must be a character")))
    movl $_L_898533, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_898534            # jump around closure body
_L_898533:
# check argument count
    cmp $4,%eax
    je _L_898535
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_898535:
# emit-tail-expr
# si=-12
# env=((f111045 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f111045 f111045)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111045) "arg must be a character"))
# emit-tail-let
#  si   = -12
#  env  = ((f111045 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f111045 f111045))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111045) "arg must be a character")
# emit-expr f111045
# emit-variable-ref
# env=((f111045 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f111045
    movl -8(%esp), %eax  # stack load f111045
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f111045 . -12) (f111045 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111045) "arg must be a character")
# emit-tail-funcall
#    si   =-16
#    env  = ((f111045 . -12) (f111045 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111045) "arg must be a character")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f111045)
# funcall
#    si   =-20
#    env  = ((f111045 . -12) (f111045 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f111045)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898536"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898536":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f111045 . -12) (f111045 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898537"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898537":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f111045
# emit-variable-ref
# env=((f111045 . -12) (f111045 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f111045
    movl -12(%esp), %eax  # stack load f111045
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f111045
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f111045)
# emit-expr "arg must be a character"
# string literal
    jmp _L_898539
    .align 8,0x90
_L_898538 :
    .int 92
    .ascii "arg must be a character"
_L_898539:
    movl $_L_898538, %eax
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
_L_898534:
     movl %eax, eh$ucharacter
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a pair"))
# == uniquify-variables  ==>
# (lambda (f111046) (error (list-ref (primitives) f111046) "arg must be a pair"))
# == vectorize-letrec  ==>
# (lambda (f111046) (error (list-ref (primitives) f111046) "arg must be a pair"))
# == eliminate-set!  ==>
# (lambda (f111046) (let ((f111046 f111046)) (error (list-ref (primitives) f111046) "arg must be a pair")))
# == close-free-variables  ==>
# (closure (f111046) (error list-ref primitives) (let ((f111046 f111046)) (error (list-ref (primitives) f111046) "arg must be a pair")))
# == eliminate-quote  ==>
# (closure (f111046) (error list-ref primitives) (let ((f111046 f111046)) (error (list-ref (primitives) f111046) "arg must be a pair")))
# == eliminate-when/unless  ==>
# (closure (f111046) (error list-ref primitives) (let ((f111046 f111046)) (error (list-ref (primitives) f111046) "arg must be a pair")))
# == eliminate-cond  ==>
# (closure (f111046) (error list-ref primitives) (let ((f111046 f111046)) (error (list-ref (primitives) f111046) "arg must be a pair")))
# == external-symbols  ==>
# (closure (f111046) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f111046 f111046)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111046) "arg must be a pair")))
# emit-expr (closure (f111046) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f111046 f111046)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111046) "arg must be a pair")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f111046) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f111046 f111046)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111046) "arg must be a pair")))
    movl $_L_898540, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_898541            # jump around closure body
_L_898540:
# check argument count
    cmp $4,%eax
    je _L_898542
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_898542:
# emit-tail-expr
# si=-12
# env=((f111046 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f111046 f111046)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111046) "arg must be a pair"))
# emit-tail-let
#  si   = -12
#  env  = ((f111046 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f111046 f111046))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111046) "arg must be a pair")
# emit-expr f111046
# emit-variable-ref
# env=((f111046 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f111046
    movl -8(%esp), %eax  # stack load f111046
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f111046 . -12) (f111046 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111046) "arg must be a pair")
# emit-tail-funcall
#    si   =-16
#    env  = ((f111046 . -12) (f111046 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111046) "arg must be a pair")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f111046)
# funcall
#    si   =-20
#    env  = ((f111046 . -12) (f111046 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f111046)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898543"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898543":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f111046 . -12) (f111046 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898544"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898544":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f111046
# emit-variable-ref
# env=((f111046 . -12) (f111046 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f111046
    movl -12(%esp), %eax  # stack load f111046
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f111046
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f111046)
# emit-expr "arg must be a pair"
# string literal
    jmp _L_898546
    .align 8,0x90
_L_898545 :
    .int 72
    .ascii "arg must be a pair"
_L_898546:
    movl $_L_898545, %eax
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
_L_898541:
     movl %eax, eh$upair
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "arg must be a vector"))
# == uniquify-variables  ==>
# (lambda (f111047) (error (list-ref (primitives) f111047) "arg must be a vector"))
# == vectorize-letrec  ==>
# (lambda (f111047) (error (list-ref (primitives) f111047) "arg must be a vector"))
# == eliminate-set!  ==>
# (lambda (f111047) (let ((f111047 f111047)) (error (list-ref (primitives) f111047) "arg must be a vector")))
# == close-free-variables  ==>
# (closure (f111047) (error list-ref primitives) (let ((f111047 f111047)) (error (list-ref (primitives) f111047) "arg must be a vector")))
# == eliminate-quote  ==>
# (closure (f111047) (error list-ref primitives) (let ((f111047 f111047)) (error (list-ref (primitives) f111047) "arg must be a vector")))
# == eliminate-when/unless  ==>
# (closure (f111047) (error list-ref primitives) (let ((f111047 f111047)) (error (list-ref (primitives) f111047) "arg must be a vector")))
# == eliminate-cond  ==>
# (closure (f111047) (error list-ref primitives) (let ((f111047 f111047)) (error (list-ref (primitives) f111047) "arg must be a vector")))
# == external-symbols  ==>
# (closure (f111047) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f111047 f111047)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111047) "arg must be a vector")))
# emit-expr (closure (f111047) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f111047 f111047)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111047) "arg must be a vector")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f111047) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f111047 f111047)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111047) "arg must be a vector")))
    movl $_L_898547, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_898548            # jump around closure body
_L_898547:
# check argument count
    cmp $4,%eax
    je _L_898549
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_898549:
# emit-tail-expr
# si=-12
# env=((f111047 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f111047 f111047)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111047) "arg must be a vector"))
# emit-tail-let
#  si   = -12
#  env  = ((f111047 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f111047 f111047))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111047) "arg must be a vector")
# emit-expr f111047
# emit-variable-ref
# env=((f111047 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f111047
    movl -8(%esp), %eax  # stack load f111047
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f111047 . -12) (f111047 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111047) "arg must be a vector")
# emit-tail-funcall
#    si   =-16
#    env  = ((f111047 . -12) (f111047 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111047) "arg must be a vector")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f111047)
# funcall
#    si   =-20
#    env  = ((f111047 . -12) (f111047 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f111047)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898550"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898550":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f111047 . -12) (f111047 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898551"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898551":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f111047
# emit-variable-ref
# env=((f111047 . -12) (f111047 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f111047
    movl -12(%esp), %eax  # stack load f111047
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f111047
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f111047)
# emit-expr "arg must be a vector"
# string literal
    jmp _L_898553
    .align 8,0x90
_L_898552 :
    .int 80
    .ascii "arg must be a vector"
_L_898553:
    movl $_L_898552, %eax
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
_L_898548:
     movl %eax, eh$uvector
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "length must be a fixnum >= 0"))
# == uniquify-variables  ==>
# (lambda (f111048) (error (list-ref (primitives) f111048) "length must be a fixnum >= 0"))
# == vectorize-letrec  ==>
# (lambda (f111048) (error (list-ref (primitives) f111048) "length must be a fixnum >= 0"))
# == eliminate-set!  ==>
# (lambda (f111048) (let ((f111048 f111048)) (error (list-ref (primitives) f111048) "length must be a fixnum >= 0")))
# == close-free-variables  ==>
# (closure (f111048) (error list-ref primitives) (let ((f111048 f111048)) (error (list-ref (primitives) f111048) "length must be a fixnum >= 0")))
# == eliminate-quote  ==>
# (closure (f111048) (error list-ref primitives) (let ((f111048 f111048)) (error (list-ref (primitives) f111048) "length must be a fixnum >= 0")))
# == eliminate-when/unless  ==>
# (closure (f111048) (error list-ref primitives) (let ((f111048 f111048)) (error (list-ref (primitives) f111048) "length must be a fixnum >= 0")))
# == eliminate-cond  ==>
# (closure (f111048) (error list-ref primitives) (let ((f111048 f111048)) (error (list-ref (primitives) f111048) "length must be a fixnum >= 0")))
# == external-symbols  ==>
# (closure (f111048) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f111048 f111048)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111048) "length must be a fixnum >= 0")))
# emit-expr (closure (f111048) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f111048 f111048)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111048) "length must be a fixnum >= 0")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f111048) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f111048 f111048)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111048) "length must be a fixnum >= 0")))
    movl $_L_898554, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_898555            # jump around closure body
_L_898554:
# check argument count
    cmp $4,%eax
    je _L_898556
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_898556:
# emit-tail-expr
# si=-12
# env=((f111048 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f111048 f111048)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111048) "length must be a fixnum >= 0"))
# emit-tail-let
#  si   = -12
#  env  = ((f111048 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f111048 f111048))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111048) "length must be a fixnum >= 0")
# emit-expr f111048
# emit-variable-ref
# env=((f111048 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f111048
    movl -8(%esp), %eax  # stack load f111048
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f111048 . -12) (f111048 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111048) "length must be a fixnum >= 0")
# emit-tail-funcall
#    si   =-16
#    env  = ((f111048 . -12) (f111048 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111048) "length must be a fixnum >= 0")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f111048)
# funcall
#    si   =-20
#    env  = ((f111048 . -12) (f111048 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f111048)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898557"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898557":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f111048 . -12) (f111048 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898558"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898558":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f111048
# emit-variable-ref
# env=((f111048 . -12) (f111048 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f111048
    movl -12(%esp), %eax  # stack load f111048
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f111048
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f111048)
# emit-expr "length must be a fixnum >= 0"
# string literal
    jmp _L_898560
    .align 8,0x90
_L_898559 :
    .int 112
    .ascii "length must be a fixnum >= 0"
_L_898560:
    movl $_L_898559, %eax
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
_L_898555:
     movl %eax, eh$ulength
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == uniquify-variables  ==>
# (lambda (f111049) (error (list-ref (primitives) f111049) "index out of bounds"))
# == vectorize-letrec  ==>
# (lambda (f111049) (error (list-ref (primitives) f111049) "index out of bounds"))
# == eliminate-set!  ==>
# (lambda (f111049) (let ((f111049 f111049)) (error (list-ref (primitives) f111049) "index out of bounds")))
# == close-free-variables  ==>
# (closure (f111049) (error list-ref primitives) (let ((f111049 f111049)) (error (list-ref (primitives) f111049) "index out of bounds")))
# == eliminate-quote  ==>
# (closure (f111049) (error list-ref primitives) (let ((f111049 f111049)) (error (list-ref (primitives) f111049) "index out of bounds")))
# == eliminate-when/unless  ==>
# (closure (f111049) (error list-ref primitives) (let ((f111049 f111049)) (error (list-ref (primitives) f111049) "index out of bounds")))
# == eliminate-cond  ==>
# (closure (f111049) (error list-ref primitives) (let ((f111049 f111049)) (error (list-ref (primitives) f111049) "index out of bounds")))
# == external-symbols  ==>
# (closure (f111049) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f111049 f111049)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111049) "index out of bounds")))
# emit-expr (closure (f111049) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f111049 f111049)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111049) "index out of bounds")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f111049) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f111049 f111049)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111049) "index out of bounds")))
    movl $_L_898561, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_898562            # jump around closure body
_L_898561:
# check argument count
    cmp $4,%eax
    je _L_898563
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_898563:
# emit-tail-expr
# si=-12
# env=((f111049 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f111049 f111049)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111049) "index out of bounds"))
# emit-tail-let
#  si   = -12
#  env  = ((f111049 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f111049 f111049))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111049) "index out of bounds")
# emit-expr f111049
# emit-variable-ref
# env=((f111049 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f111049
    movl -8(%esp), %eax  # stack load f111049
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f111049 . -12) (f111049 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111049) "index out of bounds")
# emit-tail-funcall
#    si   =-16
#    env  = ((f111049 . -12) (f111049 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111049) "index out of bounds")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f111049)
# funcall
#    si   =-20
#    env  = ((f111049 . -12) (f111049 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f111049)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898564"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898564":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f111049 . -12) (f111049 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898565"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898565":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f111049
# emit-variable-ref
# env=((f111049 . -12) (f111049 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f111049
    movl -12(%esp), %eax  # stack load f111049
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f111049
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f111049)
# emit-expr "index out of bounds"
# string literal
    jmp _L_898567
    .align 8,0x90
_L_898566 :
    .int 76
    .ascii "index out of bounds"
_L_898567:
    movl $_L_898566, %eax
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
_L_898562:
     movl %eax, eh$uvector$uindex
# == explicit-begins  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == eliminate-let*  ==>
# (lambda (i) (error (list-ref (primitives) i) "index out of bounds"))
# == uniquify-variables  ==>
# (lambda (f111050) (error (list-ref (primitives) f111050) "index out of bounds"))
# == vectorize-letrec  ==>
# (lambda (f111050) (error (list-ref (primitives) f111050) "index out of bounds"))
# == eliminate-set!  ==>
# (lambda (f111050) (let ((f111050 f111050)) (error (list-ref (primitives) f111050) "index out of bounds")))
# == close-free-variables  ==>
# (closure (f111050) (error list-ref primitives) (let ((f111050 f111050)) (error (list-ref (primitives) f111050) "index out of bounds")))
# == eliminate-quote  ==>
# (closure (f111050) (error list-ref primitives) (let ((f111050 f111050)) (error (list-ref (primitives) f111050) "index out of bounds")))
# == eliminate-when/unless  ==>
# (closure (f111050) (error list-ref primitives) (let ((f111050 f111050)) (error (list-ref (primitives) f111050) "index out of bounds")))
# == eliminate-cond  ==>
# (closure (f111050) (error list-ref primitives) (let ((f111050 f111050)) (error (list-ref (primitives) f111050) "index out of bounds")))
# == external-symbols  ==>
# (closure (f111050) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f111050 f111050)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111050) "index out of bounds")))
# emit-expr (closure (f111050) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f111050 f111050)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111050) "index out of bounds")))
# emit-closure
# si = 0
# env = ()
# expr = (closure (f111050) ((primitive-ref error) (primitive-ref list-ref) (primitive-ref primitives)) (let ((f111050 f111050)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111050) "index out of bounds")))
    movl $_L_898568, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_898569            # jump around closure body
_L_898568:
# check argument count
    cmp $4,%eax
    je _L_898570
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_898570:
# emit-tail-expr
# si=-12
# env=((f111050 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=(let ((f111050 f111050)) ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111050) "index out of bounds"))
# emit-tail-let
#  si   = -12
#  env  = ((f111050 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#  bindings = ((f111050 f111050))
#  body = ((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111050) "index out of bounds")
# emit-expr f111050
# emit-variable-ref
# env=((f111050 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f111050
    movl -8(%esp), %eax  # stack load f111050
# end emit-variable-ref
    movl %eax, -12(%esp)  # stack save
# emit-tail-expr
# si=-16
# env=((f111050 . -12) (f111050 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# expr=((primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111050) "index out of bounds")
# emit-tail-funcall
#    si   =-16
#    env  = ((f111050 . -12) (f111050 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref error) ((primitive-ref list-ref) ((primitive-ref primitives)) f111050) "index out of bounds")
# emit-expr (primitive-ref error)
    .extern error
    movl error,%eax
   movl %eax,  -16(%esp)  # stash funcall-oper in next closure slot
# emit-expr ((primitive-ref list-ref) ((primitive-ref primitives)) f111050)
# funcall
#    si   =-20
#    env  = ((f111050 . -12) (f111050 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref list-ref) ((primitive-ref primitives)) f111050)
# emit-expr (primitive-ref list-ref)
    .extern list$mref
    movl list$mref,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898571"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898571":
   movl %eax,  -28(%esp)  # stash funcall-oper in closure slot
# emit-expr ((primitive-ref primitives))
# funcall
#    si   =-32
#    env  = ((f111050 . -12) (f111050 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
#    expr = (funcall (primitive-ref primitives))
# emit-expr (primitive-ref primitives)
    .extern primitives
    movl primitives,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_898572"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_898572":
   movl %eax,  -40(%esp)  # stash funcall-oper in closure slot
    movl -40(%esp), %edi   # load new closure to %edi
    add $-32, %esp   # adjust base
    movl $0,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $32, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -32(%esp)  # arg ((primitive-ref primitives))
# emit-expr f111050
# emit-variable-ref
# env=((f111050 . -12) (f111050 . -8) ((primitive-ref primitives) . 12) ((primitive-ref list-ref) . 8) ((primitive-ref error) . 4))
# var=f111050
    movl -12(%esp), %eax  # stack load f111050
# end emit-variable-ref
    mov %eax, -36(%esp)  # arg f111050
    movl -28(%esp), %edi   # load new closure to %edi
    add $-20, %esp   # adjust base
    movl $8,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    add $20, %esp   # adjust base
    movl -4(%esp), %edi   # restore closure frame ptr
    mov %eax, -20(%esp)    # arg ((primitive-ref list-ref) ((primitive-ref primitives)) f111050)
# emit-expr "index out of bounds"
# string literal
    jmp _L_898574
    .align 8,0x90
_L_898573 :
    .int 76
    .ascii "index out of bounds"
_L_898574:
    movl $_L_898573, %eax
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
_L_898569:
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
