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
    jmp _L_921352
    .align 8,0x90
_L_921351 :
    .int 12
    .ascii "nil"
_L_921352:
    movl $_L_921351, %eax
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
    movl $_L_921353, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f110949 . 0))
# var=f110949
    movl 0(%esp), %eax  # stack load f110949
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f110949
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_921354            # jump around closure body
_L_921353:
# check argument count
    cmp $0,%eax
    je _L_921355
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_921355:
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
_L_921354:
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
    je "_L_921356"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921356:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_921357
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921357:
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
    je "_L_921358"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921358:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_921359
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921359:
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
    je "_L_921360"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921360:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_921361
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921361:
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
    je "_L_921362"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921362:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_921363
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921363:
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
    je _L_921364
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921364:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921365"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921365:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921367
    cmp  $0,%eax
    jge _L_921366
_L_921367:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921366:
    movl %eax, -20(%esp)
# emit-expr (closure (f110974 f110975) () (let ((f110974 f110974) (f110975 f110975)) (fx= (string-length f110974) (string-length f110975))))
# emit-closure
# si = -24
# env = ((f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# expr = (closure (f110974 f110975) () (let ((f110974 f110974) (f110975 f110975)) (fx= (string-length f110974) (string-length f110975))))
    movl $_L_921368, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_921369            # jump around closure body
_L_921368:
# check argument count
    cmp $8,%eax
    je _L_921370
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_921370:
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
    je _L_921371
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921371:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921372"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921372:
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
    je _L_921373
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921373:
    movl -6(%eax), %eax
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921374"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921374:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (fx= (string-length f110974) (string-length f110975))
    ret
    .align 4,0x90
_L_921369:
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
    je _L_921375
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921375:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921376"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921376:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921378
    cmp  $0,%eax
    jge _L_921377
_L_921378:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921377:
    movl %eax, -20(%esp)
# emit-expr (closure (f110971 f110972 f110973) () (let ((f110971 f110971) (f110972 f110972) (f110973 f110973)) (char=? (string-ref f110971 f110973) (string-ref f110972 f110973))))
# emit-closure
# si = -24
# env = ((f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# expr = (closure (f110971 f110972 f110973) () (let ((f110971 f110971) (f110972 f110972) (f110973 f110973)) (char=? (string-ref f110971 f110973) (string-ref f110972 f110973))))
    movl $_L_921379, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_921380            # jump around closure body
_L_921379:
# check argument count
    cmp $12,%eax
    je _L_921381
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_921381:
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
    je _L_921382
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $156,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921382:
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
    je "_L_921383"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $156,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921383:
# check bounds on string index
    movl -32(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_921385
    cmp  $0,%eax
    jge _L_921384
_L_921385:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $156,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921384:
    sar $2, %eax
    movl -32(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_921386"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921386:
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
    je _L_921387
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $156,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921387:
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
    je "_L_921388"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $156,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921388:
# check bounds on string index
    movl -36(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_921390
    cmp  $0,%eax
    jge _L_921389
_L_921390:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $156,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921389:
    sar $2, %eax
    movl -36(%esp), %esi
    movl -2(%eax,%esi), %eax
    sal $8, %eax
    or  $15, %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_921391"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $32,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921391:
    cmp %ah, -32(%esp)
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
#return from tail (char=? (string-ref f110971 f110973) (string-ref f110972 f110973))
    ret
    .align 4,0x90
_L_921380:
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
    je _L_921392
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921392:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921393"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921393:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921395
    cmp  $0,%eax
    jge _L_921394
_L_921395:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921394:
    movl %eax, -20(%esp)
# emit-expr (closure (f110967 f110968 f110969 f110970) (f110952 f110951) (let ((f110967 f110967) (f110968 f110968) (f110969 f110969) (f110970 f110970)) (if (fx= f110969 f110970) #t (if ((vector-ref f110952 0) f110967 f110968 f110969) ((vector-ref f110951 0) f110967 f110968 (fx+ f110969 1) f110970) #f))))
# emit-closure
# si = -24
# env = ((f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# expr = (closure (f110967 f110968 f110969 f110970) (f110952 f110951) (let ((f110967 f110967) (f110968 f110968) (f110969 f110969) (f110970 f110970)) (if (fx= f110969 f110970) #t (if ((vector-ref f110952 0) f110967 f110968 f110969) ((vector-ref f110951 0) f110967 f110968 (fx+ f110969 1) f110970) #f))))
    movl $_L_921396, 0(%ebp)  # closure label
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
    jmp _L_921397            # jump around closure body
_L_921396:
# check argument count
    cmp $16,%eax
    je _L_921398
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_921398:
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
    je "_L_921401"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921401:
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
    je "_L_921402"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921402:
    cmp -40(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_921399
# emit-tail-expr
# si=-40
# env=((f110970 . -36) (f110969 . -32) (f110968 . -28) (f110967 . -24) (f110970 . -20) (f110969 . -16) (f110968 . -12) (f110967 . -8) (f110951 . 8) (f110952 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# expr=#t
    movl $111, %eax     # immed #t
    ret                  # immediate tail return
    jmp _L_921400
_L_921399:
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
    je _L_921405
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921405:
    movl %eax, -48(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921406"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921406:
# check bounds on vector index
    movl -48(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921408
    cmp  $0,%eax
    jge _L_921407
_L_921408:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921407:
    movl -48(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_921409"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921409":
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
    je _L_921403
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
    je _L_921410
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921410:
    movl %eax, -40(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921411"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921411:
# check bounds on vector index
    movl -40(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921413
    cmp  $0,%eax
    jge _L_921412
_L_921413:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921412:
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
    je "_L_921414"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921414:
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
    je "_L_921415"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $80,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921415:
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
    jmp _L_921404
_L_921403:
# emit-tail-expr
# si=-40
# env=((f110970 . -36) (f110969 . -32) (f110968 . -28) (f110967 . -24) (f110970 . -20) (f110969 . -16) (f110968 . -12) (f110967 . -8) (f110951 . 8) (f110952 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_921404:
_L_921400:
    .align 4,0x90
_L_921397:
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
    je _L_921416
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921416:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921417"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921417:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921419
    cmp  $0,%eax
    jge _L_921418
_L_921419:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921418:
    movl %eax, -20(%esp)
# emit-expr (closure (f110965 f110966) (f110953 f110951) (let ((f110965 f110965) (f110966 f110966)) (if ((vector-ref f110953 0) f110965 f110966) ((vector-ref f110951 0) f110965 f110966 0 (string-length f110965)) #f)))
# emit-closure
# si = -24
# env = ((f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# expr = (closure (f110965 f110966) (f110953 f110951) (let ((f110965 f110965) (f110966 f110966)) (if ((vector-ref f110953 0) f110965 f110966) ((vector-ref f110951 0) f110965 f110966 0 (string-length f110965)) #f)))
    movl $_L_921420, 0(%ebp)  # closure label
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
    jmp _L_921421            # jump around closure body
_L_921420:
# check argument count
    cmp $8,%eax
    je _L_921422
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_921422:
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
    je _L_921425
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921425:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921426"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921426:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921428
    cmp  $0,%eax
    jge _L_921427
_L_921428:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921427:
    movl -32(%esp), %esi
    movl -1(%eax,%esi), %eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_921429"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921429":
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
    je _L_921423
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
    je _L_921430
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921430:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921431"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921431:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921433
    cmp  $0,%eax
    jge _L_921432
_L_921433:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921432:
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
    je _L_921434
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921434:
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
    jmp _L_921424
_L_921423:
# emit-tail-expr
# si=-24
# env=((f110966 . -20) (f110965 . -16) (f110966 . -12) (f110965 . -8) (f110951 . 8) (f110953 . 4) (f110950 . -12) (f110951 . -8) (f110952 . -4) (f110953 . 0))
# expr=#f
    movl $47, %eax     # immed #f
    ret                  # immediate tail return
_L_921424:
    .align 4,0x90
_L_921421:
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
    je _L_921435
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921435:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921436"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921436:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921438
    cmp  $0,%eax
    jge _L_921437
_L_921438:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921437:
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
    je "_L_921439"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921439:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_921440
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921440:
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
    je _L_921441
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921441:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921442"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921442:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921444
    cmp  $0,%eax
    jge _L_921443
_L_921444:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921443:
    movl %eax, -8(%esp)
# emit-expr (closure (f110985 f110986) ((primitive-ref string=?) f110976) (let ((f110985 f110985) (f110986 f110986)) (if ((primitive-ref string=?) f110985 (symbol->string (car f110986))) (car f110986) (if (null? (cdr f110986)) (let ((f110990 (make-symbol f110985 #f))) (let ((f110992 (cons f110990 ()))) (begin (set-cdr! f110986 f110992) f110990))) ((vector-ref f110976 0) f110985 (cdr f110986))))))
# emit-closure
# si = -12
# env = ((f110976 . 0))
# expr = (closure (f110985 f110986) ((primitive-ref string=?) f110976) (let ((f110985 f110985) (f110986 f110986)) (if ((primitive-ref string=?) f110985 (symbol->string (car f110986))) (car f110986) (if (null? (cdr f110986)) (let ((f110990 (make-symbol f110985 #f))) (let ((f110992 (cons f110990 ()))) (begin (set-cdr! f110986 f110992) f110990))) ((vector-ref f110976 0) f110985 (cdr f110986))))))
    movl $_L_921445, 0(%ebp)  # closure label
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
    jmp _L_921446            # jump around closure body
_L_921445:
# check argument count
    cmp $8,%eax
    je _L_921447
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_921447:
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
    je "_L_921450"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921450":
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
    je _L_921451
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $108,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921451:
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
    je _L_921448
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
    je _L_921452
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $108,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921452:
    movl -1(%eax), %eax
#return from tail (car f110986)
    ret
    jmp _L_921449
_L_921448:
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
    je _L_921455
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921455:
    movl 3(%eax), %eax
    cmp $63, %eax
    mov $0, %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_921453
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
    je _L_921456
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $120,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921456:
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
    jmp _L_921454
_L_921453:
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
    je _L_921457
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921457:
    movl %eax, -24(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921458"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921458:
# check bounds on vector index
    movl -24(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921460
    cmp  $0,%eax
    jge _L_921459
_L_921460:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921459:
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
    je _L_921461
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921461:
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
_L_921454:
_L_921449:
    .align 4,0x90
_L_921446:
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
    movl $_L_921462, 0(%ebp)  # closure label
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
    jmp _L_921463            # jump around closure body
_L_921462:
# check argument count
    cmp $4,%eax
    je _L_921464
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_921464:
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
    je _L_921465
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921465:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921466"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921466:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921468
    cmp  $0,%eax
    jge _L_921467
_L_921468:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921467:
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
    je "_L_921469"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921469":
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
_L_921463:
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
    movl $_L_921470, 0(%ebp)  # closure label
# WARNING: free var e not defined in the environmnet
# WARNING: free var nil not defined in the environmnet
# WARNING: free var (primitive-ref append1) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_921471            # jump around closure body
_L_921470:
# check argument count
    cmp $8,%eax
    je _L_921472
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_921472:
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
    je _L_921473
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
    jmp _L_921474
_L_921473:
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
    je _L_921475
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $108,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921475:
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
    je "_L_921476"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921476":
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
    je _L_921477
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921477:
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
_L_921474:
    .align 4,0x90
_L_921471:
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
    movl $_L_921478, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_921479            # jump around closure body
_L_921478:
# check argument count
    cmp $8,%eax
    je _L_921480
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_921480:
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
    je "_L_921483"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921483:
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
    je "_L_921484"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $60,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921484:
    cmp -24(%esp), %eax
    sete %al
    movzbl %al, %eax
    sal $6, %al
    or $47, %al
    cmp $47, %al
    je _L_921481
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
    je _L_921485
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $108,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921485:
    movl -1(%eax), %eax
#return from tail (car f110997)
    ret
    jmp _L_921482
_L_921481:
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
    je _L_921486
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921486:
    movl 3(%eax), %eax
    mov %eax, -28(%esp)    # arg (cdr f110997)
# emit-expr (fx- f110998 1)
# emit-expr 1
    movl $4, %eax     # immed 1
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921487"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921487:
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
    je "_L_921488"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $84,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921488:
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
_L_921482:
    .align 4,0x90
_L_921479:
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
    movl $_L_921489, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref list-length) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_921490            # jump around closure body
_L_921489:
# check argument count
    cmp $4,%eax
    je _L_921491
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_921491:
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
    je _L_921492
# emit-tail-expr
# si=-16
# env=((f110999 . -12) (f110999 . -8) ((primitive-ref list-length) . 4))
# expr=0
    movl $0, %eax     # immed 0
    ret                  # immediate tail return
    jmp _L_921493
_L_921492:
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
    je "_L_921494"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921494":
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
    je _L_921495
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921495:
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
    je "_L_921496"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921496:
     addl $4, %eax
#return from tail (fxadd1 ((primitive-ref list-length) (cdr f110999)))
    ret
_L_921493:
    .align 4,0x90
_L_921490:
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
    je "_L_921497"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921497:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_921498
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921498:
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
    je _L_921499
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921499:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921500"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921500:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921502
    cmp  $0,%eax
    jge _L_921501
_L_921502:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921501:
    movl %eax, -8(%esp)
# emit-expr (closure (f111004 f111005 f111006) (f111000) (let ((f111004 f111004) (f111005 f111005) (f111006 f111006)) (if (null? f111006) f111004 (begin (vector-set! f111004 f111005 (car f111006)) ((vector-ref f111000 0) f111004 (fxadd1 f111005) (cdr f111006))))))
# emit-closure
# si = -12
# env = ((f111000 . 0))
# expr = (closure (f111004 f111005 f111006) (f111000) (let ((f111004 f111004) (f111005 f111005) (f111006 f111006)) (if (null? f111006) f111004 (begin (vector-set! f111004 f111005 (car f111006)) ((vector-ref f111000 0) f111004 (fxadd1 f111005) (cdr f111006))))))
    movl $_L_921503, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f111000 . 0))
# var=f111000
    movl 0(%esp), %eax  # stack load f111000
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f111000
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_921504            # jump around closure body
_L_921503:
# check argument count
    cmp $12,%eax
    je _L_921505
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_921505:
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
    je _L_921506
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
    jmp _L_921507
_L_921506:
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
    je _L_921508
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921508:
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
    je "_L_921509"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921509:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921511
    cmp  $0,%eax
    jge _L_921510
_L_921511:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921510:
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
    je _L_921512
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $108,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921512:
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
    je _L_921513
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921513:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921514"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921514:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921516
    cmp  $0,%eax
    jge _L_921515
_L_921516:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921515:
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
    je "_L_921517"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921517:
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
    je _L_921518
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921518:
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
_L_921507:
    .align 4,0x90
_L_921504:
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
    movl $_L_921519, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f111000 . 0))
# var=f111000
    movl 0(%esp), %eax  # stack load f111000
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f111000
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_921520            # jump around closure body
_L_921519:
# check argument count
    cmp $0,%eax
    jge _L_921521
# invoke error handler eh_argcount_min
    .extern eh$uargcount$umin
    movl eh$uargcount$umin, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_921521:
# emit-build-varargs-list
    movl $63, %esi       # args <- () 
    lea -4(%esp),%edi    # edi <- esp-4
    subl %eax, %edi      # edi <- esp-4-eax    addr of arg[K+N] on stack
_L_921523:
    lea -4(%esp),%ebx    # addr of arg[K] on stack
    cmp %edi, %ebx       # while edi <> esp+(si+4)
    je _L_921522
    movl (%edi),%ebx     # arg i -> car
    movl %ebx, 0(%ebp)
    movl %esi, 4(%ebp)  # esi -> cdr
    movl %ebp, %esi
    addl $1, %esi       # tag as pair
    addl $8,%ebp         # bump heap ptr
    addl $4,%edi         # move to next previous arg from the end
    jmp _L_921523
_L_921522:
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
    je "_L_921524"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921524":
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
    je "_L_921525"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921525:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_921526
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921526:
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
    je _L_921527
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921527:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921528"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921528:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921530
    cmp  $0,%eax
    jge _L_921529
_L_921530:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921529:
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
_L_921520:
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
    je "_L_921531"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921531:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_921532
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $128,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921532:
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
    je _L_921533
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921533:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921534"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921534:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921536
    cmp  $0,%eax
    jge _L_921535
_L_921536:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921535:
    movl %eax, -8(%esp)
# emit-expr (closure (f111017 f111018 f111019) (f111013) (let ((f111017 f111017) (f111018 f111018) (f111019 f111019)) (if (null? f111019) f111017 (begin (string-set! f111017 f111018 (car f111019)) ((vector-ref f111013 0) f111017 (fxadd1 f111018) (cdr f111019))))))
# emit-closure
# si = -12
# env = ((f111013 . 0))
# expr = (closure (f111017 f111018 f111019) (f111013) (let ((f111017 f111017) (f111018 f111018) (f111019 f111019)) (if (null? f111019) f111017 (begin (string-set! f111017 f111018 (car f111019)) ((vector-ref f111013 0) f111017 (fxadd1 f111018) (cdr f111019))))))
    movl $_L_921537, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f111013 . 0))
# var=f111013
    movl 0(%esp), %eax  # stack load f111013
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f111013
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_921538            # jump around closure body
_L_921537:
# check argument count
    cmp $12,%eax
    je _L_921539
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_921539:
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
    je _L_921540
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
    jmp _L_921541
_L_921540:
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
    je _L_921542
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $160,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921542:
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
    je "_L_921543"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $160,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921543:
# check bounds on string index
    movl -32(%esp), %ebx
    cmp  %eax,-6(%ebx) 
    jle _L_921545
    cmp  $0,%eax
    jge _L_921544
_L_921545:
# invoke error handler eh_string_index
    .extern eh$ustring$uindex
    movl eh$ustring$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $160,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921544:
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
    je _L_921546
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $108,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921546:
    movl -1(%eax), %eax
# check the argument is a char
    movl %eax,%ebx
    and $255, %bl
    cmp $15, %bl
    je "_L_921547"
# invoke error handler eh_character
    .extern eh$ucharacter
    movl eh$ucharacter, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $160,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921547:
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
    je _L_921548
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921548:
    movl %eax, -32(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921549"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921549:
# check bounds on vector index
    movl -32(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921551
    cmp  $0,%eax
    jge _L_921550
_L_921551:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921550:
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
    je "_L_921552"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $48,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921552:
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
    je _L_921553
# invoke error handler eh_pair
    .extern eh$upair
    movl eh$upair, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $112,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921553:
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
_L_921541:
    .align 4,0x90
_L_921538:
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
    movl $_L_921554, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f111013 . 0))
# var=f111013
    movl 0(%esp), %eax  # stack load f111013
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f111013
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_921555            # jump around closure body
_L_921554:
# check argument count
    cmp $0,%eax
    jge _L_921556
# invoke error handler eh_argcount_min
    .extern eh$uargcount$umin
    movl eh$uargcount$umin, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_921556:
# emit-build-varargs-list
    movl $63, %esi       # args <- () 
    lea -4(%esp),%edi    # edi <- esp-4
    subl %eax, %edi      # edi <- esp-4-eax    addr of arg[K+N] on stack
_L_921558:
    lea -4(%esp),%ebx    # addr of arg[K] on stack
    cmp %edi, %ebx       # while edi <> esp+(si+4)
    je _L_921557
    movl (%edi),%ebx     # arg i -> car
    movl %ebx, 0(%ebp)
    movl %esi, 4(%ebp)  # esi -> cdr
    movl %ebp, %esi
    addl $1, %esi       # tag as pair
    addl $8,%ebp         # bump heap ptr
    addl $4,%edi         # move to next previous arg from the end
    jmp _L_921558
_L_921557:
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
    je "_L_921559"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921559":
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
    je "_L_921560"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921560:
# check the argument is a fixnum >= 0
    cmp $0,%eax
    jge _L_921561
# invoke error handler eh_length
    .extern eh$ulength
    movl eh$ulength, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $144,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921561:
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
    je _L_921562
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921562:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921563"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921563:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921565
    cmp  $0,%eax
    jge _L_921564
_L_921565:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921564:
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
_L_921555:
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
    movl $_L_921566, 0(%ebp)  # closure label
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_921567            # jump around closure body
_L_921566:
# check argument count
    cmp $4,%eax
    je _L_921568
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_921568:
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
    je _L_921569
# invoke error handler eh_string
    .extern eh$ustring
    movl eh$ustring, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $152,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921569:
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
_L_921567:
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
    movl $_L_921570, 0(%ebp)  # closure label
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
    jmp _L_921571            # jump around closure body
_L_921570:
# check argument count
    cmp $8,%eax
    je _L_921572
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_921572:
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
    je "_L_921573"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921573":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr "error:"
# string literal
    jmp _L_921575
    .align 8,0x90
_L_921574 :
    .int 24
    .ascii "error:"
_L_921575:
    movl $_L_921574, %eax
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
    je "_L_921576"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921576":
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
    je "_L_921577"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921577":
   movl %eax,  -32(%esp)  # stash funcall-oper in closure slot
# emit-expr ": "
# string literal
    jmp _L_921579
    .align 8,0x90
_L_921578 :
    .int 8
    .ascii ": "
_L_921579:
    movl $_L_921578, %eax
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
    je "_L_921580"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921580":
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
    jmp _L_921582
    .align 8,0x90
_L_921581 :
    .int 4
    .ascii "\n"
_L_921582:
    movl $_L_921581, %eax
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
_L_921571:
    movl %eax, -4(%esp)  # stack save
# emit-expr (closure (f111040 f111041) (f111035) (let ((f111040 f111040) (f111041 f111041)) (begin (f111035 f111040 f111041) (foreign-call "s_exit" 1))))
# emit-closure
# si = -8
# env = ((f111035 . -4) (f111026 . 0))
# expr = (closure (f111040 f111041) (f111035) (let ((f111040 f111040) (f111041 f111041)) (begin (f111035 f111040 f111041) (foreign-call "s_exit" 1))))
    movl $_L_921583, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f111035 . -4) (f111026 . 0))
# var=f111035
    movl -4(%esp), %eax  # stack load f111035
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f111035
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_921584            # jump around closure body
_L_921583:
# check argument count
    cmp $8,%eax
    je _L_921585
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_921585:
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
    je "_L_921586"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921586":
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
_L_921584:
     movl %eax, error
# == explicit-begins  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fxremainder) p)) (set! p (cons (quote fxquotient) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == eliminate-let*  ==>
# (let ((p (quote ()))) (begin (set! p (cons (quote procedure?) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote symbol-value) p)) (set! p (cons (quote symbol->string) p)) (set! p (cons (quote make-symbol) p)) (set! p (cons (quote symbol?) p)) (set! p (cons (quote string-set!) p)) (set! p (cons (quote string-ref) p)) (set! p (cons (quote string-length) p)) (set! p (cons (quote string?) p)) (set! p (cons (quote make-string) p)) (set! p (cons (quote vector-ref) p)) (set! p (cons (quote vector-set!) p)) (set! p (cons (quote vector-length) p)) (set! p (cons (quote make-vector) p)) (set! p (cons (quote vector?) p)) (set! p (cons (quote set-cdr!) p)) (set! p (cons (quote set-car!) p)) (set! p (cons (quote cdr) p)) (set! p (cons (quote car) p)) (set! p (cons (quote cons) p)) (set! p (cons (quote pair?) p)) (set! p (cons (quote fxremainder) p)) (set! p (cons (quote fxquotient) p)) (set! p (cons (quote fx*) p)) (set! p (cons (quote fx-) p)) (set! p (cons (quote fx+) p)) (set! p (cons (quote fx>=) p)) (set! p (cons (quote fx>) p)) (set! p (cons (quote fx<=) p)) (set! p (cons (quote fx<) p)) (set! p (cons (quote fx=) p)) (set! p (cons (quote fxzero?) p)) (set! p (cons (quote fxsub1) p)) (set! p (cons (quote fxadd1) p)) (set! p (cons (quote fxlogor) p)) (set! p (cons (quote fxlogand) p)) (set! p (cons (quote fxlognot) p)) (set! p (cons (quote char=?) p)) (set! p (cons (quote eq?) p)) (set! p (cons (quote not) p)) (set! p (cons (quote boolean?) p)) (set! p (cons (quote fixnum?) p)) (set! p (cons (quote char?) p)) (set! p (cons (quote null?) p)) (set! p (cons (quote char->fixnum) p)) (set! p (cons (quote fixnum->char) p)) (lambda () p)))
# == uniquify-variables  ==>
# (let ((f111042 (quote ()))) (begin (set! f111042 (cons (quote procedure?) f111042)) (set! f111042 (cons (quote cdr) f111042)) (set! f111042 (cons (quote car) f111042)) (set! f111042 (cons (quote symbol-value) f111042)) (set! f111042 (cons (quote symbol->string) f111042)) (set! f111042 (cons (quote make-symbol) f111042)) (set! f111042 (cons (quote symbol?) f111042)) (set! f111042 (cons (quote string-set!) f111042)) (set! f111042 (cons (quote string-ref) f111042)) (set! f111042 (cons (quote string-length) f111042)) (set! f111042 (cons (quote string?) f111042)) (set! f111042 (cons (quote make-string) f111042)) (set! f111042 (cons (quote vector-ref) f111042)) (set! f111042 (cons (quote vector-set!) f111042)) (set! f111042 (cons (quote vector-length) f111042)) (set! f111042 (cons (quote make-vector) f111042)) (set! f111042 (cons (quote vector?) f111042)) (set! f111042 (cons (quote set-cdr!) f111042)) (set! f111042 (cons (quote set-car!) f111042)) (set! f111042 (cons (quote cdr) f111042)) (set! f111042 (cons (quote car) f111042)) (set! f111042 (cons (quote cons) f111042)) (set! f111042 (cons (quote pair?) f111042)) (set! f111042 (cons (quote fxremainder) f111042)) (set! f111042 (cons (quote fxquotient) f111042)) (set! f111042 (cons (quote fx*) f111042)) (set! f111042 (cons (quote fx-) f111042)) (set! f111042 (cons (quote fx+) f111042)) (set! f111042 (cons (quote fx>=) f111042)) (set! f111042 (cons (quote fx>) f111042)) (set! f111042 (cons (quote fx<=) f111042)) (set! f111042 (cons (quote fx<) f111042)) (set! f111042 (cons (quote fx=) f111042)) (set! f111042 (cons (quote fxzero?) f111042)) (set! f111042 (cons (quote fxsub1) f111042)) (set! f111042 (cons (quote fxadd1) f111042)) (set! f111042 (cons (quote fxlogor) f111042)) (set! f111042 (cons (quote fxlogand) f111042)) (set! f111042 (cons (quote fxlognot) f111042)) (set! f111042 (cons (quote char=?) f111042)) (set! f111042 (cons (quote eq?) f111042)) (set! f111042 (cons (quote not) f111042)) (set! f111042 (cons (quote boolean?) f111042)) (set! f111042 (cons (quote fixnum?) f111042)) (set! f111042 (cons (quote char?) f111042)) (set! f111042 (cons (quote null?) f111042)) (set! f111042 (cons (quote char->fixnum) f111042)) (set! f111042 (cons (quote fixnum->char) f111042)) (lambda () f111042)))
# == vectorize-letrec  ==>
# (let ((f111042 (quote ()))) (begin (set! f111042 (cons (quote procedure?) f111042)) (set! f111042 (cons (quote cdr) f111042)) (set! f111042 (cons (quote car) f111042)) (set! f111042 (cons (quote symbol-value) f111042)) (set! f111042 (cons (quote symbol->string) f111042)) (set! f111042 (cons (quote make-symbol) f111042)) (set! f111042 (cons (quote symbol?) f111042)) (set! f111042 (cons (quote string-set!) f111042)) (set! f111042 (cons (quote string-ref) f111042)) (set! f111042 (cons (quote string-length) f111042)) (set! f111042 (cons (quote string?) f111042)) (set! f111042 (cons (quote make-string) f111042)) (set! f111042 (cons (quote vector-ref) f111042)) (set! f111042 (cons (quote vector-set!) f111042)) (set! f111042 (cons (quote vector-length) f111042)) (set! f111042 (cons (quote make-vector) f111042)) (set! f111042 (cons (quote vector?) f111042)) (set! f111042 (cons (quote set-cdr!) f111042)) (set! f111042 (cons (quote set-car!) f111042)) (set! f111042 (cons (quote cdr) f111042)) (set! f111042 (cons (quote car) f111042)) (set! f111042 (cons (quote cons) f111042)) (set! f111042 (cons (quote pair?) f111042)) (set! f111042 (cons (quote fxremainder) f111042)) (set! f111042 (cons (quote fxquotient) f111042)) (set! f111042 (cons (quote fx*) f111042)) (set! f111042 (cons (quote fx-) f111042)) (set! f111042 (cons (quote fx+) f111042)) (set! f111042 (cons (quote fx>=) f111042)) (set! f111042 (cons (quote fx>) f111042)) (set! f111042 (cons (quote fx<=) f111042)) (set! f111042 (cons (quote fx<) f111042)) (set! f111042 (cons (quote fx=) f111042)) (set! f111042 (cons (quote fxzero?) f111042)) (set! f111042 (cons (quote fxsub1) f111042)) (set! f111042 (cons (quote fxadd1) f111042)) (set! f111042 (cons (quote fxlogor) f111042)) (set! f111042 (cons (quote fxlogand) f111042)) (set! f111042 (cons (quote fxlognot) f111042)) (set! f111042 (cons (quote char=?) f111042)) (set! f111042 (cons (quote eq?) f111042)) (set! f111042 (cons (quote not) f111042)) (set! f111042 (cons (quote boolean?) f111042)) (set! f111042 (cons (quote fixnum?) f111042)) (set! f111042 (cons (quote char?) f111042)) (set! f111042 (cons (quote null?) f111042)) (set! f111042 (cons (quote char->fixnum) f111042)) (set! f111042 (cons (quote fixnum->char) f111042)) (lambda () f111042)))
# == eliminate-set!  ==>
# (let ((f111042 (vector (quote ())))) (begin (vector-set! f111042 0 (cons (quote procedure?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote cdr) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote car) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote symbol-value) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote symbol->string) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote make-symbol) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote symbol?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote string-set!) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote string-ref) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote string-length) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote string?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote make-string) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote vector-ref) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote vector-set!) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote vector-length) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote make-vector) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote vector?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote set-cdr!) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote set-car!) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote cdr) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote car) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote cons) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote pair?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fxremainder) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fxquotient) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx*) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx-) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx+) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx>=) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx>) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx<=) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx<) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx=) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fxzero?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fxsub1) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fxadd1) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fxlogor) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fxlogand) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fxlognot) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote char=?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote eq?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote not) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote boolean?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fixnum?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote char?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote null?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote char->fixnum) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fixnum->char) (vector-ref f111042 0))) (lambda () (let () (vector-ref f111042 0)))))
# == close-free-variables  ==>
# (let ((f111042 (vector (quote ())))) (begin (vector-set! f111042 0 (cons (quote procedure?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote cdr) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote car) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote symbol-value) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote symbol->string) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote make-symbol) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote symbol?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote string-set!) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote string-ref) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote string-length) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote string?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote make-string) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote vector-ref) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote vector-set!) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote vector-length) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote make-vector) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote vector?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote set-cdr!) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote set-car!) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote cdr) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote car) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote cons) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote pair?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fxremainder) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fxquotient) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx*) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx-) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx+) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx>=) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx>) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx<=) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx<) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fx=) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fxzero?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fxsub1) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fxadd1) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fxlogor) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fxlogand) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fxlognot) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote char=?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote eq?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote not) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote boolean?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fixnum?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote char?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote null?) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote char->fixnum) (vector-ref f111042 0))) (vector-set! f111042 0 (cons (quote fixnum->char) (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0)))))
# == eliminate-quote  ==>
# (let ((f111042 (vector ()))) (begin (vector-set! f111042 0 (cons (string->symbol "procedure?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "symbol-value") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0)))))
# == eliminate-when/unless  ==>
# (let ((f111042 (vector ()))) (begin (vector-set! f111042 0 (cons (string->symbol "procedure?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "symbol-value") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0)))))
# == eliminate-cond  ==>
# (let ((f111042 (vector ()))) (begin (vector-set! f111042 0 (cons (string->symbol "procedure?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "symbol-value") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons (string->symbol "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0)))))
# == external-symbols  ==>
# (let ((f111042 ((primitive-ref vector) ()))) (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0)))))
# emit-expr (let ((f111042 ((primitive-ref vector) ()))) (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0)))))
# emit-let
#  si   = 0
#  env  = ()
#  bindings = ((f111042 ((primitive-ref vector) ())))
#  body = (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
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
    je "_L_921587"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921587":
   movl %eax,  -8(%esp)  # stash funcall-oper in closure slot
# emit-expr ()
    movl $63, %eax     # immed ()
    mov %eax, -12(%esp)  # arg ()
    movl -8(%esp), %edi   # load new closure to %edi
    movl $4,%eax   # save arg count
    call *-2(%edi)        # call thru closure ptr
    movl -4(%esp), %edi   # restore closure frame ptr
    movl %eax, 0(%esp)  # stack save
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "procedure?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
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
    je _L_921588
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921588:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921589"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921589:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921591
    cmp  $0,%eax
    jge _L_921590
_L_921591:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921590:
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
    je "_L_921592"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921592":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "procedure?"
# string literal
    jmp _L_921594
    .align 8,0x90
_L_921593 :
    .int 40
    .ascii "procedure?"
_L_921594:
    movl $_L_921593, %eax
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
    je _L_921595
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921595:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921596"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921596:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921598
    cmp  $0,%eax
    jge _L_921597
_L_921598:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921597:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
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
    je _L_921599
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921599:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921600"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921600:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921602
    cmp  $0,%eax
    jge _L_921601
_L_921602:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921601:
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
    je "_L_921603"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921603":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_921605
    .align 8,0x90
_L_921604 :
    .int 12
    .ascii "cdr"
_L_921605:
    movl $_L_921604, %eax
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
    je _L_921606
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921606:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921607"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921607:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921609
    cmp  $0,%eax
    jge _L_921608
_L_921609:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921608:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
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
    je _L_921610
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921610:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921611"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921611:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921613
    cmp  $0,%eax
    jge _L_921612
_L_921613:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921612:
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
    je "_L_921614"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921614":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_921616
    .align 8,0x90
_L_921615 :
    .int 12
    .ascii "car"
_L_921616:
    movl $_L_921615, %eax
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
    je _L_921617
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921617:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921618"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921618:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921620
    cmp  $0,%eax
    jge _L_921619
_L_921620:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921619:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol-value") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
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
    je _L_921621
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921621:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921622"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921622:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921624
    cmp  $0,%eax
    jge _L_921623
_L_921624:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921623:
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
    je "_L_921625"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921625":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol-value"
# string literal
    jmp _L_921627
    .align 8,0x90
_L_921626 :
    .int 48
    .ascii "symbol-value"
_L_921627:
    movl $_L_921626, %eax
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
    je _L_921628
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921628:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921629"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921629:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921631
    cmp  $0,%eax
    jge _L_921630
_L_921631:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921630:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol->string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
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
    je _L_921632
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921632:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921633"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921633:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921635
    cmp  $0,%eax
    jge _L_921634
_L_921635:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921634:
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
    je "_L_921636"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921636":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol->string"
# string literal
    jmp _L_921638
    .align 8,0x90
_L_921637 :
    .int 56
    .ascii "symbol->string"
_L_921638:
    movl $_L_921637, %eax
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
    je _L_921639
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921639:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921640"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921640:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921642
    cmp  $0,%eax
    jge _L_921641
_L_921642:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921641:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-symbol") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
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
    je _L_921643
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921643:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921644"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921644:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921646
    cmp  $0,%eax
    jge _L_921645
_L_921646:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921645:
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
    je "_L_921647"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921647":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-symbol"
# string literal
    jmp _L_921649
    .align 8,0x90
_L_921648 :
    .int 44
    .ascii "make-symbol"
_L_921649:
    movl $_L_921648, %eax
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
    je _L_921650
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921650:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921651"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921651:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921653
    cmp  $0,%eax
    jge _L_921652
_L_921653:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921652:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "symbol?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
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
    je _L_921654
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921654:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921655"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921655:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921657
    cmp  $0,%eax
    jge _L_921656
_L_921657:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921656:
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
    je "_L_921658"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921658":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "symbol?"
# string literal
    jmp _L_921660
    .align 8,0x90
_L_921659 :
    .int 28
    .ascii "symbol?"
_L_921660:
    movl $_L_921659, %eax
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
    je _L_921661
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921661:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921662"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921662:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921664
    cmp  $0,%eax
    jge _L_921663
_L_921664:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921663:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
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
    je _L_921665
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921665:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921666"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921666:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921668
    cmp  $0,%eax
    jge _L_921667
_L_921668:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921667:
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
    je "_L_921669"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921669":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-set!"
# string literal
    jmp _L_921671
    .align 8,0x90
_L_921670 :
    .int 44
    .ascii "string-set!"
_L_921671:
    movl $_L_921670, %eax
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
    je _L_921672
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921672:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921673"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921673:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921675
    cmp  $0,%eax
    jge _L_921674
_L_921675:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921674:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
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
    je _L_921676
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921676:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921677"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921677:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921679
    cmp  $0,%eax
    jge _L_921678
_L_921679:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921678:
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
    je "_L_921680"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921680":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-ref"
# string literal
    jmp _L_921682
    .align 8,0x90
_L_921681 :
    .int 40
    .ascii "string-ref"
_L_921682:
    movl $_L_921681, %eax
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
    je _L_921683
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921683:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921684"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921684:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921686
    cmp  $0,%eax
    jge _L_921685
_L_921686:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921685:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
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
    je _L_921687
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921687:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921688"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921688:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921690
    cmp  $0,%eax
    jge _L_921689
_L_921690:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921689:
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
    je "_L_921691"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921691":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string-length"
# string literal
    jmp _L_921693
    .align 8,0x90
_L_921692 :
    .int 52
    .ascii "string-length"
_L_921693:
    movl $_L_921692, %eax
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
    je _L_921694
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921694:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921695"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921695:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921697
    cmp  $0,%eax
    jge _L_921696
_L_921697:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921696:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "string?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
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
    je _L_921698
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921698:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921699"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921699:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921701
    cmp  $0,%eax
    jge _L_921700
_L_921701:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921700:
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
    je "_L_921702"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921702":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "string?"
# string literal
    jmp _L_921704
    .align 8,0x90
_L_921703 :
    .int 28
    .ascii "string?"
_L_921704:
    movl $_L_921703, %eax
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
    je _L_921705
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921705:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921706"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921706:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921708
    cmp  $0,%eax
    jge _L_921707
_L_921708:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921707:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-string") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
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
    je _L_921709
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921709:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921710"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921710:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921712
    cmp  $0,%eax
    jge _L_921711
_L_921712:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921711:
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
    je "_L_921713"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921713":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-string"
# string literal
    jmp _L_921715
    .align 8,0x90
_L_921714 :
    .int 44
    .ascii "make-string"
_L_921715:
    movl $_L_921714, %eax
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
    je _L_921716
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921716:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921717"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921717:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921719
    cmp  $0,%eax
    jge _L_921718
_L_921719:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921718:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-ref") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
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
    je _L_921720
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921720:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921721"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921721:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921723
    cmp  $0,%eax
    jge _L_921722
_L_921723:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921722:
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
    je "_L_921724"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921724":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-ref"
# string literal
    jmp _L_921726
    .align 8,0x90
_L_921725 :
    .int 40
    .ascii "vector-ref"
_L_921726:
    movl $_L_921725, %eax
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
    je _L_921727
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921727:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921728"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921728:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921730
    cmp  $0,%eax
    jge _L_921729
_L_921730:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921729:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-set!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
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
    je _L_921731
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921731:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921732"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921732:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921734
    cmp  $0,%eax
    jge _L_921733
_L_921734:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921733:
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
    je "_L_921735"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921735":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-set!"
# string literal
    jmp _L_921737
    .align 8,0x90
_L_921736 :
    .int 44
    .ascii "vector-set!"
_L_921737:
    movl $_L_921736, %eax
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
    je _L_921738
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921738:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921739"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921739:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921741
    cmp  $0,%eax
    jge _L_921740
_L_921741:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921740:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector-length") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
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
    je _L_921742
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921742:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921743"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921743:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921745
    cmp  $0,%eax
    jge _L_921744
_L_921745:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921744:
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
    je "_L_921746"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921746":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector-length"
# string literal
    jmp _L_921748
    .align 8,0x90
_L_921747 :
    .int 52
    .ascii "vector-length"
_L_921748:
    movl $_L_921747, %eax
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
    je _L_921749
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921749:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921750"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921750:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921752
    cmp  $0,%eax
    jge _L_921751
_L_921752:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921751:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "make-vector") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
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
    je _L_921753
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921753:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921754"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921754:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921756
    cmp  $0,%eax
    jge _L_921755
_L_921756:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921755:
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
    je "_L_921757"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921757":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "make-vector"
# string literal
    jmp _L_921759
    .align 8,0x90
_L_921758 :
    .int 44
    .ascii "make-vector"
_L_921759:
    movl $_L_921758, %eax
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
    je _L_921760
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921760:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921761"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921761:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921763
    cmp  $0,%eax
    jge _L_921762
_L_921763:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921762:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "vector?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
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
    je _L_921764
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921764:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921765"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921765:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921767
    cmp  $0,%eax
    jge _L_921766
_L_921767:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921766:
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
    je "_L_921768"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921768":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "vector?"
# string literal
    jmp _L_921770
    .align 8,0x90
_L_921769 :
    .int 28
    .ascii "vector?"
_L_921770:
    movl $_L_921769, %eax
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
    je _L_921771
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921771:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921772"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921772:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921774
    cmp  $0,%eax
    jge _L_921773
_L_921774:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921773:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-cdr!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
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
    je _L_921775
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921775:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921776"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921776:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921778
    cmp  $0,%eax
    jge _L_921777
_L_921778:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921777:
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
    je "_L_921779"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921779":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-cdr!"
# string literal
    jmp _L_921781
    .align 8,0x90
_L_921780 :
    .int 32
    .ascii "set-cdr!"
_L_921781:
    movl $_L_921780, %eax
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
    je _L_921782
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921782:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921783"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921783:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921785
    cmp  $0,%eax
    jge _L_921784
_L_921785:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921784:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "set-car!") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
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
    je _L_921786
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921786:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921787"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921787:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921789
    cmp  $0,%eax
    jge _L_921788
_L_921789:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921788:
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
    je "_L_921790"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921790":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "set-car!"
# string literal
    jmp _L_921792
    .align 8,0x90
_L_921791 :
    .int 32
    .ascii "set-car!"
_L_921792:
    movl $_L_921791, %eax
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
    je _L_921793
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921793:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921794"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921794:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921796
    cmp  $0,%eax
    jge _L_921795
_L_921796:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921795:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cdr") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
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
    je _L_921797
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921797:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921798"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921798:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921800
    cmp  $0,%eax
    jge _L_921799
_L_921800:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921799:
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
    je "_L_921801"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921801":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cdr"
# string literal
    jmp _L_921803
    .align 8,0x90
_L_921802 :
    .int 12
    .ascii "cdr"
_L_921803:
    movl $_L_921802, %eax
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
    je _L_921804
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921804:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921805"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921805:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921807
    cmp  $0,%eax
    jge _L_921806
_L_921807:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921806:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "car") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
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
    je _L_921808
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921808:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921809"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921809:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921811
    cmp  $0,%eax
    jge _L_921810
_L_921811:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921810:
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
    je "_L_921812"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921812":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "car"
# string literal
    jmp _L_921814
    .align 8,0x90
_L_921813 :
    .int 12
    .ascii "car"
_L_921814:
    movl $_L_921813, %eax
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
    je _L_921815
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921815:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921816"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921816:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921818
    cmp  $0,%eax
    jge _L_921817
_L_921818:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921817:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "cons") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
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
    je _L_921819
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921819:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921820"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921820:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921822
    cmp  $0,%eax
    jge _L_921821
_L_921822:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921821:
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
    je "_L_921823"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921823":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "cons"
# string literal
    jmp _L_921825
    .align 8,0x90
_L_921824 :
    .int 16
    .ascii "cons"
_L_921825:
    movl $_L_921824, %eax
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
    je _L_921826
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921826:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921827"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921827:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921829
    cmp  $0,%eax
    jge _L_921828
_L_921829:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921828:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "pair?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
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
    je _L_921830
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921830:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921831"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921831:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921833
    cmp  $0,%eax
    jge _L_921832
_L_921833:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921832:
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
    je "_L_921834"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921834":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "pair?"
# string literal
    jmp _L_921836
    .align 8,0x90
_L_921835 :
    .int 20
    .ascii "pair?"
_L_921836:
    movl $_L_921835, %eax
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
    je _L_921837
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921837:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921838"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921838:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921840
    cmp  $0,%eax
    jge _L_921839
_L_921840:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921839:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0)))
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
    je _L_921841
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921841:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921842"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921842:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921844
    cmp  $0,%eax
    jge _L_921843
_L_921844:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921843:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxremainder") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "fxremainder") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "fxremainder")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxremainder")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_921845"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921845":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxremainder"
# string literal
    jmp _L_921847
    .align 8,0x90
_L_921846 :
    .int 44
    .ascii "fxremainder"
_L_921847:
    movl $_L_921846, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxremainder
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
    je _L_921848
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921848:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921849"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921849:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921851
    cmp  $0,%eax
    jge _L_921850
_L_921851:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921850:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
    movl -12(%esp), %eax
    movl %eax, 0(%ebp)
    movl %ebp, %eax
    or   $1, %al
    add  $8, %ebp
# cons end
    movl -4(%esp), %ebx
    movl -8(%esp), %esi
    movl %eax, -1(%ebx,%esi)
# emit-expr (begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
# emit-begin
#   expr=(begin (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx*") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx-") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx+") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx>") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx<") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fx=") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxzero?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxsub1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxadd1") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogor") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlogand") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxlognot") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char=?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "eq?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "not") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "boolean?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "null?") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "char->fixnum") (vector-ref f111042 0))) (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fixnum->char") (vector-ref f111042 0))) (closure () (f111042) (let () (vector-ref f111042 0))))
#   env=((f111042 . 0))
# emit-expr (vector-set! f111042 0 (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0)))
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
    je _L_921852
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921852:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921853"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921853:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921855
    cmp  $0,%eax
    jge _L_921854
_L_921855:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921854:
    movl %eax, -8(%esp)
# emit-expr (cons ((primitive-ref string->symbol) "fxquotient") (vector-ref f111042 0))
# cons arg1=((primitive-ref string->symbol) "fxquotient") arg2=(vector-ref f111042 0)
# emit-expr ((primitive-ref string->symbol) "fxquotient")
# funcall
#    si   =-12
#    env  = ((f111042 . 0))
#    expr = (funcall (primitive-ref string->symbol) "fxquotient")
# emit-expr (primitive-ref string->symbol)
    .extern string$m$gsymbol
    movl string$m$gsymbol,%eax
# check the funcall op is a procedure
    movl %eax,%ebx
    and $7, %bl
    cmp $2, %bl
    je "_L_921856"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921856":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxquotient"
# string literal
    jmp _L_921858
    .align 8,0x90
_L_921857 :
    .int 40
    .ascii "fxquotient"
_L_921858:
    movl $_L_921857, %eax
    orl $6, %eax
    mov %eax, -24(%esp)  # arg fxquotient
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
    je _L_921859
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921859:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921860"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921860:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921862
    cmp  $0,%eax
    jge _L_921861
_L_921862:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921861:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
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
    je _L_921863
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921863:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921864"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921864:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921866
    cmp  $0,%eax
    jge _L_921865
_L_921866:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921865:
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
    je "_L_921867"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921867":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx*"
# string literal
    jmp _L_921869
    .align 8,0x90
_L_921868 :
    .int 12
    .ascii "fx*"
_L_921869:
    movl $_L_921868, %eax
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
    je _L_921870
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921870:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921871"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921871:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921873
    cmp  $0,%eax
    jge _L_921872
_L_921873:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921872:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
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
    je _L_921874
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921874:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921875"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921875:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921877
    cmp  $0,%eax
    jge _L_921876
_L_921877:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921876:
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
    je "_L_921878"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921878":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx-"
# string literal
    jmp _L_921880
    .align 8,0x90
_L_921879 :
    .int 12
    .ascii "fx-"
_L_921880:
    movl $_L_921879, %eax
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
    je _L_921881
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921881:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921882"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921882:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921884
    cmp  $0,%eax
    jge _L_921883
_L_921884:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921883:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
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
    je _L_921885
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921885:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921886"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921886:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921888
    cmp  $0,%eax
    jge _L_921887
_L_921888:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921887:
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
    je "_L_921889"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921889":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx+"
# string literal
    jmp _L_921891
    .align 8,0x90
_L_921890 :
    .int 12
    .ascii "fx+"
_L_921891:
    movl $_L_921890, %eax
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
    je _L_921892
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921892:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921893"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921893:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921895
    cmp  $0,%eax
    jge _L_921894
_L_921895:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921894:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
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
    je _L_921896
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921896:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921897"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921897:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921899
    cmp  $0,%eax
    jge _L_921898
_L_921899:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921898:
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
    je "_L_921900"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921900":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>="
# string literal
    jmp _L_921902
    .align 8,0x90
_L_921901 :
    .int 16
    .ascii "fx>="
_L_921902:
    movl $_L_921901, %eax
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
    je _L_921903
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921903:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921904"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921904:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921906
    cmp  $0,%eax
    jge _L_921905
_L_921906:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921905:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
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
    je _L_921907
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921907:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921908"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921908:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921910
    cmp  $0,%eax
    jge _L_921909
_L_921910:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921909:
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
    je "_L_921911"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921911":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx>"
# string literal
    jmp _L_921913
    .align 8,0x90
_L_921912 :
    .int 12
    .ascii "fx>"
_L_921913:
    movl $_L_921912, %eax
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
    je _L_921914
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921914:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921915"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921915:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921917
    cmp  $0,%eax
    jge _L_921916
_L_921917:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921916:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
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
    je _L_921918
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921918:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921919"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921919:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921921
    cmp  $0,%eax
    jge _L_921920
_L_921921:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921920:
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
    je "_L_921922"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921922":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<="
# string literal
    jmp _L_921924
    .align 8,0x90
_L_921923 :
    .int 16
    .ascii "fx<="
_L_921924:
    movl $_L_921923, %eax
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
    je _L_921925
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921925:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921926"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921926:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921928
    cmp  $0,%eax
    jge _L_921927
_L_921928:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921927:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
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
    je _L_921929
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921929:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921930"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921930:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921932
    cmp  $0,%eax
    jge _L_921931
_L_921932:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921931:
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
    je "_L_921933"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921933":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx<"
# string literal
    jmp _L_921935
    .align 8,0x90
_L_921934 :
    .int 12
    .ascii "fx<"
_L_921935:
    movl $_L_921934, %eax
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
    je _L_921936
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921936:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921937"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921937:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921939
    cmp  $0,%eax
    jge _L_921938
_L_921939:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921938:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
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
    je _L_921940
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921940:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921941"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921941:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921943
    cmp  $0,%eax
    jge _L_921942
_L_921943:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921942:
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
    je "_L_921944"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921944":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fx="
# string literal
    jmp _L_921946
    .align 8,0x90
_L_921945 :
    .int 12
    .ascii "fx="
_L_921946:
    movl $_L_921945, %eax
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
    je _L_921947
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921947:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921948"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921948:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921950
    cmp  $0,%eax
    jge _L_921949
_L_921950:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921949:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
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
    je _L_921951
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921951:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921952"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921952:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921954
    cmp  $0,%eax
    jge _L_921953
_L_921954:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921953:
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
    je "_L_921955"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921955":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxzero?"
# string literal
    jmp _L_921957
    .align 8,0x90
_L_921956 :
    .int 28
    .ascii "fxzero?"
_L_921957:
    movl $_L_921956, %eax
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
    je _L_921958
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921958:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921959"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921959:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921961
    cmp  $0,%eax
    jge _L_921960
_L_921961:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921960:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
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
    je _L_921962
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921962:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921963"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921963:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921965
    cmp  $0,%eax
    jge _L_921964
_L_921965:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921964:
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
    je "_L_921966"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921966":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxsub1"
# string literal
    jmp _L_921968
    .align 8,0x90
_L_921967 :
    .int 24
    .ascii "fxsub1"
_L_921968:
    movl $_L_921967, %eax
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
    je _L_921969
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921969:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921970"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921970:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921972
    cmp  $0,%eax
    jge _L_921971
_L_921972:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921971:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
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
    je _L_921973
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921973:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921974"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921974:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921976
    cmp  $0,%eax
    jge _L_921975
_L_921976:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921975:
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
    je "_L_921977"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921977":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxadd1"
# string literal
    jmp _L_921979
    .align 8,0x90
_L_921978 :
    .int 24
    .ascii "fxadd1"
_L_921979:
    movl $_L_921978, %eax
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
    je _L_921980
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921980:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921981"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921981:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921983
    cmp  $0,%eax
    jge _L_921982
_L_921983:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921982:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
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
    je _L_921984
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921984:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921985"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921985:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921987
    cmp  $0,%eax
    jge _L_921986
_L_921987:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921986:
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
    je "_L_921988"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921988":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogor"
# string literal
    jmp _L_921990
    .align 8,0x90
_L_921989 :
    .int 28
    .ascii "fxlogor"
_L_921990:
    movl $_L_921989, %eax
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
    je _L_921991
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921991:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921992"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921992:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921994
    cmp  $0,%eax
    jge _L_921993
_L_921994:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921993:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
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
    je _L_921995
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921995:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_921996"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_921996:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_921998
    cmp  $0,%eax
    jge _L_921997
_L_921998:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_921997:
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
    je "_L_921999"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_921999":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlogand"
# string literal
    jmp _L_922001
    .align 8,0x90
_L_922000 :
    .int 32
    .ascii "fxlogand"
_L_922001:
    movl $_L_922000, %eax
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
    je _L_922002
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922002:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_922003"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922003:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_922005
    cmp  $0,%eax
    jge _L_922004
_L_922005:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_922004:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
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
    je _L_922006
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922006:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_922007"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922007:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_922009
    cmp  $0,%eax
    jge _L_922008
_L_922009:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_922008:
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
    je "_L_922010"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_922010":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fxlognot"
# string literal
    jmp _L_922012
    .align 8,0x90
_L_922011 :
    .int 32
    .ascii "fxlognot"
_L_922012:
    movl $_L_922011, %eax
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
    je _L_922013
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922013:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_922014"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922014:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_922016
    cmp  $0,%eax
    jge _L_922015
_L_922016:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_922015:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
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
    je _L_922017
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922017:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_922018"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922018:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_922020
    cmp  $0,%eax
    jge _L_922019
_L_922020:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_922019:
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
    je "_L_922021"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_922021":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char=?"
# string literal
    jmp _L_922023
    .align 8,0x90
_L_922022 :
    .int 24
    .ascii "char=?"
_L_922023:
    movl $_L_922022, %eax
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
    je _L_922024
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922024:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_922025"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922025:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_922027
    cmp  $0,%eax
    jge _L_922026
_L_922027:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_922026:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
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
    je _L_922028
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922028:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_922029"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922029:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_922031
    cmp  $0,%eax
    jge _L_922030
_L_922031:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_922030:
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
    je "_L_922032"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_922032":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "eq?"
# string literal
    jmp _L_922034
    .align 8,0x90
_L_922033 :
    .int 12
    .ascii "eq?"
_L_922034:
    movl $_L_922033, %eax
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
    je _L_922035
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922035:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_922036"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922036:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_922038
    cmp  $0,%eax
    jge _L_922037
_L_922038:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_922037:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
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
    je _L_922039
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922039:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_922040"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922040:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_922042
    cmp  $0,%eax
    jge _L_922041
_L_922042:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_922041:
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
    je "_L_922043"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_922043":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "not"
# string literal
    jmp _L_922045
    .align 8,0x90
_L_922044 :
    .int 12
    .ascii "not"
_L_922045:
    movl $_L_922044, %eax
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
    je _L_922046
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922046:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_922047"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922047:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_922049
    cmp  $0,%eax
    jge _L_922048
_L_922049:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_922048:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
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
    je _L_922050
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922050:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_922051"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922051:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_922053
    cmp  $0,%eax
    jge _L_922052
_L_922053:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_922052:
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
    je "_L_922054"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_922054":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "boolean?"
# string literal
    jmp _L_922056
    .align 8,0x90
_L_922055 :
    .int 32
    .ascii "boolean?"
_L_922056:
    movl $_L_922055, %eax
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
    je _L_922057
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922057:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_922058"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922058:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_922060
    cmp  $0,%eax
    jge _L_922059
_L_922060:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_922059:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
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
    je _L_922061
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922061:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_922062"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922062:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_922064
    cmp  $0,%eax
    jge _L_922063
_L_922064:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_922063:
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
    je "_L_922065"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_922065":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum?"
# string literal
    jmp _L_922067
    .align 8,0x90
_L_922066 :
    .int 28
    .ascii "fixnum?"
_L_922067:
    movl $_L_922066, %eax
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
    je _L_922068
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922068:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_922069"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922069:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_922071
    cmp  $0,%eax
    jge _L_922070
_L_922071:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_922070:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
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
    je _L_922072
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922072:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_922073"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922073:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_922075
    cmp  $0,%eax
    jge _L_922074
_L_922075:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_922074:
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
    je "_L_922076"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_922076":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char?"
# string literal
    jmp _L_922078
    .align 8,0x90
_L_922077 :
    .int 20
    .ascii "char?"
_L_922078:
    movl $_L_922077, %eax
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
    je _L_922079
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922079:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_922080"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922080:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_922082
    cmp  $0,%eax
    jge _L_922081
_L_922082:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_922081:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
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
    je _L_922083
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922083:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_922084"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922084:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_922086
    cmp  $0,%eax
    jge _L_922085
_L_922086:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_922085:
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
    je "_L_922087"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_922087":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "null?"
# string literal
    jmp _L_922089
    .align 8,0x90
_L_922088 :
    .int 20
    .ascii "null?"
_L_922089:
    movl $_L_922088, %eax
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
    je _L_922090
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922090:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_922091"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922091:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_922093
    cmp  $0,%eax
    jge _L_922092
_L_922093:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_922092:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
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
    je _L_922094
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922094:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_922095"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922095:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_922097
    cmp  $0,%eax
    jge _L_922096
_L_922097:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_922096:
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
    je "_L_922098"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_922098":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "char->fixnum"
# string literal
    jmp _L_922100
    .align 8,0x90
_L_922099 :
    .int 48
    .ascii "char->fixnum"
_L_922100:
    movl $_L_922099, %eax
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
    je _L_922101
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922101:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_922102"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922102:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_922104
    cmp  $0,%eax
    jge _L_922103
_L_922104:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_922103:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
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
    je _L_922105
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922105:
    movl %eax, -4(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_922106"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922106:
# check bounds on vector index
    movl -4(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_922108
    cmp  $0,%eax
    jge _L_922107
_L_922108:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $136,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_922107:
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
    je "_L_922109"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_922109":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "fixnum->char"
# string literal
    jmp _L_922111
    .align 8,0x90
_L_922110 :
    .int 48
    .ascii "fixnum->char"
_L_922111:
    movl $_L_922110, %eax
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
    je _L_922112
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922112:
    movl %eax, -16(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_922113"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922113:
# check bounds on vector index
    movl -16(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_922115
    cmp  $0,%eax
    jge _L_922114
_L_922115:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_922114:
    movl -16(%esp), %esi
    movl -1(%eax,%esi), %eax
    movl %eax, 4(%ebp)
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
    movl $_L_922116, 0(%ebp)  # closure label
# emit-variable-ref
# env=((f111042 . 0))
# var=f111042
    movl 0(%esp), %eax  # stack load f111042
# end emit-variable-ref
   movl  %eax, 4(%ebp)  # f111042
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $8, %ebp     # bump ebp
    jmp _L_922117            # jump around closure body
_L_922116:
# check argument count
    cmp $0,%eax
    je _L_922118
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_922118:
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
    je _L_922119
# invoke error handler eh_vector
    .extern eh$uvector
    movl eh$uvector, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922119:
    movl %eax, -8(%esp)
# emit-expr 0
    movl $0, %eax     # immed 0
# check the argument is a fixnum
    movl %eax,%ebx
    and $3, %bl
    cmp $0, %bl
    je "_L_922120"
# error handler eh_fixnum
    .extern eh$ufixnum
    movl eh$ufixnum, %edi  # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to the handler
_L_922120:
# check bounds on vector index
    movl -8(%esp), %ebx
    cmp  %eax,-5(%ebx) 
    jle _L_922122
    cmp  $0,%eax
    jge _L_922121
_L_922122:
# invoke error handler eh_vector_index
    .extern eh$uvector$uindex
    movl eh$uvector$uindex,%edi   # load handler
    movl $4, %eax  # set arg count
    movl $140,-8(%esp)
    jmp *-2(%edi)  # jump to handler
_L_922121:
    movl -8(%esp), %esi
    movl -1(%eax,%esi), %eax
#return from tail (vector-ref f111042 0)
    ret
    .align 4,0x90
_L_922117:
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
    movl $_L_922123, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_922124            # jump around closure body
_L_922123:
# check argument count
    cmp $0,%eax
    je _L_922125
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_922125:
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
    je "_L_922126"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_922126":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_922128
    .align 8,0x90
_L_922127 :
    .int 28
    .ascii "funcall"
_L_922128:
    movl $_L_922127, %eax
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
    jmp _L_922130
    .align 8,0x90
_L_922129 :
    .int 100
    .ascii "arg 1 must be a procedure"
_L_922130:
    movl $_L_922129, %eax
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
_L_922124:
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
    movl $_L_922131, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_922132            # jump around closure body
_L_922131:
# check argument count
    cmp $0,%eax
    je _L_922133
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_922133:
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
    je "_L_922134"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_922134":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_922136
    .align 8,0x90
_L_922135 :
    .int 28
    .ascii "funcall"
_L_922136:
    movl $_L_922135, %eax
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
    jmp _L_922138
    .align 8,0x90
_L_922137 :
    .int 80
    .ascii "wrong number of args"
_L_922138:
    movl $_L_922137, %eax
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
_L_922132:
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
    movl $_L_922139, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var funcall not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_922140            # jump around closure body
_L_922139:
# check argument count
    cmp $0,%eax
    je _L_922141
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_922141:
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
    je "_L_922142"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_922142":
   movl %eax,  -20(%esp)  # stash funcall-oper in closure slot
# emit-expr "funcall"
# string literal
    jmp _L_922144
    .align 8,0x90
_L_922143 :
    .int 28
    .ascii "funcall"
_L_922144:
    movl $_L_922143, %eax
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
    jmp _L_922146
    .align 8,0x90
_L_922145 :
    .int 48
    .ascii "too few args"
_L_922146:
    movl $_L_922145, %eax
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
_L_922140:
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
    movl $_L_922147, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_922148            # jump around closure body
_L_922147:
# check argument count
    cmp $4,%eax
    je _L_922149
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_922149:
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
    je "_L_922150"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_922150":
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
    je "_L_922151"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_922151":
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
    jmp _L_922153
    .align 8,0x90
_L_922152 :
    .int 80
    .ascii "arg must be a fixnum"
_L_922153:
    movl $_L_922152, %eax
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
_L_922148:
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
    movl $_L_922154, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_922155            # jump around closure body
_L_922154:
# check argument count
    cmp $4,%eax
    je _L_922156
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_922156:
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
    je "_L_922157"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_922157":
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
    je "_L_922158"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_922158":
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
    jmp _L_922160
    .align 8,0x90
_L_922159 :
    .int 80
    .ascii "arg must be a string"
_L_922160:
    movl $_L_922159, %eax
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
_L_922155:
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
    movl $_L_922161, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_922162            # jump around closure body
_L_922161:
# check argument count
    cmp $4,%eax
    je _L_922163
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_922163:
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
    je "_L_922164"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_922164":
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
    je "_L_922165"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_922165":
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
    jmp _L_922167
    .align 8,0x90
_L_922166 :
    .int 92
    .ascii "arg must be a character"
_L_922167:
    movl $_L_922166, %eax
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
_L_922162:
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
    movl $_L_922168, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_922169            # jump around closure body
_L_922168:
# check argument count
    cmp $4,%eax
    je _L_922170
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_922170:
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
    je "_L_922171"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_922171":
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
    je "_L_922172"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_922172":
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
    jmp _L_922174
    .align 8,0x90
_L_922173 :
    .int 72
    .ascii "arg must be a pair"
_L_922174:
    movl $_L_922173, %eax
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
_L_922169:
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
    movl $_L_922175, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_922176            # jump around closure body
_L_922175:
# check argument count
    cmp $4,%eax
    je _L_922177
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_922177:
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
    je "_L_922178"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_922178":
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
    je "_L_922179"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_922179":
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
    jmp _L_922181
    .align 8,0x90
_L_922180 :
    .int 80
    .ascii "arg must be a vector"
_L_922181:
    movl $_L_922180, %eax
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
_L_922176:
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
    movl $_L_922182, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_922183            # jump around closure body
_L_922182:
# check argument count
    cmp $4,%eax
    je _L_922184
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_922184:
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
    je "_L_922185"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_922185":
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
    je "_L_922186"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_922186":
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
    jmp _L_922188
    .align 8,0x90
_L_922187 :
    .int 112
    .ascii "length must be a fixnum >= 0"
_L_922188:
    movl $_L_922187, %eax
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
_L_922183:
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
    movl $_L_922189, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_922190            # jump around closure body
_L_922189:
# check argument count
    cmp $4,%eax
    je _L_922191
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_922191:
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
    je "_L_922192"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_922192":
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
    je "_L_922193"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_922193":
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
    jmp _L_922195
    .align 8,0x90
_L_922194 :
    .int 76
    .ascii "index out of bounds"
_L_922195:
    movl $_L_922194, %eax
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
_L_922190:
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
    movl $_L_922196, 0(%ebp)  # closure label
# WARNING: free var (primitive-ref error) not defined in the environmnet
# WARNING: free var (primitive-ref list-ref) not defined in the environmnet
# WARNING: free var (primitive-ref primitives) not defined in the environmnet
    movl %ebp, %eax   # get the base ptr
    add $2, %eax     # add the closure tag
    add $16, %ebp     # bump ebp
    jmp _L_922197            # jump around closure body
_L_922196:
# check argument count
    cmp $4,%eax
    je _L_922198
# invoke error handler eh_argcount
    .extern eh$uargcount
    movl eh$uargcount, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to handler
_L_922198:
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
    je "_L_922199"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_922199":
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
    je "_L_922200"
# invoke error handler funcall_non_procedure
    .extern eh$uprocedure
    movl eh$uprocedure, %edi  # load handler
    movl $0, %eax  # set arg count
    jmp *-2(%edi)  # jump to the handler
"_L_922200":
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
    jmp _L_922202
    .align 8,0x90
_L_922201 :
    .int 76
    .ascii "index out of bounds"
_L_922202:
    movl $_L_922201, %eax
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
_L_922197:
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
